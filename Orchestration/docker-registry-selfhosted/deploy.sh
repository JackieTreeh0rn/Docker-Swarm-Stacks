#!/bin/bash

set -o allexport
. ./.env


# Docker
export PUID=$(id -u)
export PGID=$(id -g)
# Create Network (customize)
docker network create -d overlay --subnet=10.0.11.0/24 --gateway=10.0.11.1 ${BACKEND_NETWORK_NAME}
# Docker Secrets
htpasswd -nbB "$HTTP_USERNAME" "$HTTP_PASSWORD" | tr -d '\n' | docker secret create registry_auth_creds -


# Deploy
docker stack deploy -c docker-stack-compose.yml ${STACK_NAME}