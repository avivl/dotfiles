function docker_machine_use() {
    eval $(docker-machine env "$*")
}

if [ -n "$DOCKER_MACHINE_DEFAULT" ]; then
    docker_machine_use $DOCKER_MACHINE_DEFAULT
fi

alias dmu=docker_machine_use
