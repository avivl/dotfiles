# Copyright 2015 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START app]
import base64
import geoip2.database
import json
import logging
import os

from flask import current_app, Flask, request
from google.cloud import pubsub_v1

# from google.cloud import storage

app = Flask(__name__)

# Configure the following environment variables via app.yaml
# This is used in the push request handler to veirfy that the request came from
# pubsub and originated from a trusted source.
app.config['PUBSUB_VERIFICATION_TOKEN'] = \
    os.environ['PUBSUB_VERIFICATION_TOKEN']
app.config['PUBSUB_TOPIC'] = os.environ['PUBSUB_TOPIC']
app.config['TEST_TOPIC'] = os.environ['TEST_TOPIC']
app.config['PROJECT'] = os.environ['GOOGLE_CLOUD_PROJECT']

BASE_PROPERTIES = ['event_id',
                   'user_id',
                   'device_id',
                   'event_type',
                   'time',
                   'event_properties',
                   'user_properties',
                   'app_version',
                   'platform',
                   'os_name',
                   'os_version',
                   'device_brand',
                   'device_manufacturer',
                   'carrier',
                   'ip']

ECOSYS_PROPERTIES = ['event_id',
                     'event_name',
                     'user_id',
                     'event_type',
                     'timestamp',
                     'ingest_timestamp',
                     'os',
                     'version',
                     'platform',
                     'device_id',
                     'device_type',
                     'device_manufacturer',
                     'device_model',
                     'carrier',
                     'ip_address',
                     'country',
                     'city',
                     'region',
                     'latitude',
                     'longitude',
                     'language',
                     'action',
                     'item_type',
                     'item_name',
                     'parent_type',
                     'parent_name']

TEST_PROPERTIES = ['event_name',
                   'event_type',
                   'public_address',
                   'timestamp',
                   'sdk_level',
                   'device_manufacturer',
                   'device_model',
                   'payload']

# gcs_client = storage.Client(project='kin-bi')
# bucket = gcs_client.get_bucket('kin-bi')
# blob = bucket.blob('GeoIP2-City.mmdb')
# blob.download_to_filename('temp.mmd')
# reader = geoip2.database.Reader('temp.mmd')
reader = geoip2.database.Reader('./GeoIP2-City.mmdb')


def is_json(payload):
    try:
        json.loads(payload)
    except ValueError:
        return False
    return True


def json_arr(payload):
    json_object = json.loads(payload)
    if not isinstance(json_object, list):
        json_object = [json_object]
    return json_object


def clean_events(events, properties=ECOSYS_PROPERTIES):
    cleansed_events = [{key: value for key, value in event.items() if key in properties} for event in events]
    return cleansed_events


def enrich_events(events):
    for event in events:
        if event.get('ip'):
            geo = get_geo_from_ip(event['ip'])
            event.update(geo)
        if event.get('event_properties'):
            event['event_properties'] = json.dumps(event['event_properties'])
        if event.get('user_properties'):
            event['user_properties'] = json.dumps(event['user_properties'])
        if 'payload' in event:
            if event.get('payload'):
                event['payload'] = json.dumps(event['payload'])
            else:
                del event['payload']

    return events


def get_geo_from_ip(ip_address):
    geo = {}
    try:
        response = reader.city(ip_address)
        geo[u'country'] = response.country.name
        geo[u'region'] = response.subdivisions[0].name
        geo[u'city'] = response.city.name
        geo[u'location_lat'] = response.location.latitude
        geo[u'location_lng'] = response.location.longitude
    except Exception as e:
        pass
    return geo


# [START push_amp]
@app.route('/push_amp', methods=['POST'])
def pubsub_push_from_amp_client():
    if (request.args.get('token', '') !=
            current_app.config['PUBSUB_VERIFICATION_TOKEN']):
        return 'Invalid request', 400

    if not request.form or 'e' not in request.form:
        return 'Invalid request', 400

    payload = request.form['e'].encode('utf-8')

    batch_settings = pubsub_v1.types.BatchSettings(
        max_bytes=1024 * 4,  # Four kilobytes
        max_latency=5,  # Five seconds
    )
    publisher = pubsub_v1.PublisherClient(batch_settings)
    topic_path = publisher.topic_path(
        current_app.config['PROJECT'],
        current_app.config['PUBSUB_TOPIC'])

    publisher.publish(topic_path, data=payload)

    # Returning any 2xx status indicates successful receipt of the message.
    return 'Success', 200


# [END push_amp]


# [START push]
@app.route('/push', methods=['POST'])
def pubsub_push():
    if (request.args.get('token', '') !=
            current_app.config['PUBSUB_VERIFICATION_TOKEN']):
        return 'Invalid request', 400

    payload = base64.b64decode(request.data)

    batch_settings = pubsub_v1.types.BatchSettings(
        max_bytes=1024 * 4,  # Four kilobytes
        max_latency=5,  # Five seconds
    )
    publisher = pubsub_v1.PublisherClient(batch_settings)
    topic_path = publisher.topic_path(
        current_app.config['PROJECT'],
        current_app.config['PUBSUB_TOPIC'])

    publisher.publish(topic_path, data=payload)

    # Returning any 2xx status indicates successful receipt of the message.
    return 'OK', 200


# [END push]


# [START push_]
@app.route('/eco_', methods=['POST'])
def pubsub_push_():
    # if (request.args.get('token', '') !=
    #         current_app.config['PUBSUB_VERIFICATION_TOKEN']):
    #     return 'Invalid request', 400

    payload = request.data

    if not is_json(payload):
        return 'Invalid json', 400

    events = json_arr(payload)
    enriched_events = enrich_events(clean_events(events))

    batch_settings = pubsub_v1.types.BatchSettings(
        max_messages=100,
        max_bytes=1024 * 10,  # Four kilobytes
        max_latency=2,  # two seconds
    )
    publisher = pubsub_v1.PublisherClient(batch_settings)
    topic_path = publisher.topic_path(
        current_app.config['PROJECT'],
        current_app.config['PUBSUB_TOPIC'])

    for enriched_event in enriched_events:
        publisher.publish(topic_path, data=json.dumps(enriched_event).encode('utf-8'))

    # Returning any 2xx status indicates successful receipt of the message.
    return 'OK', 200


# [END push_]


# [START push_]
@app.route('/stest_', methods=['POST'])
def pubsub_stest_():
    # if (request.args.get('token', '') !=
    #         current_app.config['PUBSUB_VERIFICATION_TOKEN']):
    #     return 'Invalid request', 400

    payload = request.data

    if not is_json(payload):
        return 'Invalid json', 400

    events = json_arr(payload)
    enriched_events = enrich_events(clean_events(events, properties=TEST_PROPERTIES))

    batch_settings = pubsub_v1.types.BatchSettings(
        max_messages=100,
        max_bytes=1024 * 10,  # Four kilobytes
        max_latency=5,  # Five seconds
    )
    publisher = pubsub_v1.PublisherClient(batch_settings)
    topic_path = publisher.topic_path(
        current_app.config['PROJECT'],
        current_app.config['TEST_TOPIC'])

    for enriched_event in enriched_events:
        publisher.publish(topic_path, data=json.dumps(enriched_event).encode('utf-8'))

    # Returning any 2xx status indicates successful receipt of the message.
    return 'OK', 200


# [END stest_]


@app.route('/', methods=['GET'])
def is_up():
    return 'OK', 200


@app.errorhandler(500)
def server_error(e):
    logging.exception('An error occurred during a request.')
    return """
    An internal error occurred: <pre>{}</pre>
    See logs for full stacktrace.
    """.format(e), 500


if __name__ == '__main__':
    # This is used when running locally. Gunicorn is used to run the
    # application on Google App Engine. See entrypoint in app.yaml.
    app.run(host='127.0.0.1', port=8080, debug=True)
# [END app]
