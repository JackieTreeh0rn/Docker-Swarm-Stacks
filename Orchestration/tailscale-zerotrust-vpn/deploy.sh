#!/bin/bash

set -o allexport
. ./.env


# Docker
export PUID=$(id -u)
export PGID=$(id -g)

# Deploy
docker stack deploy -c docker-stack-compose.yml ${STACK_NAME}