#!/bin/bash

set -o allexport
. ./.env


# Docker
export PUID=$(id -u)
export PGID=$(id -g)
# Create Network (customize)
docker network create -d overlay --subnet=10.0.13.0/24 --gateway=10.0.13.1 ${BACKEND_NETWORK_NAME}
# Deploy
docker login
docker stack deploy -c docker-stack-compose.yml ${STACK_NAME}