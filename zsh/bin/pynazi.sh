#!/bin/bash - 
#===============================================================================
#
#          FILE: pynazi.sh
# 
#         USAGE: ./pynazi.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/09/2014 11:12
#      REVISION:  ---
#===============================================================================


#!/bin/bash
pylint --rcfile=pylint_rcfile.txt -r n -f parseable --disable=E1101,E1103,W0312,F0401,R0201,R0903,W0232,W0703 "$1" 2>/dev/null
pyflakes "$1"
pep8 --ignore=E126,E221,E701,E202,W191,E101 --repeat "$1"
true
