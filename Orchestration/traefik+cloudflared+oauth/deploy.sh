#!/bin/bash

set -o allexport
. ./.env


# Docker
export PUID=$(id -u)
export PGID=$(id -g)
# Create Network (customize)
docker network create -d overlay --subnet=10.0.6.0/24 --gateway=10.0.6.1 traefik-public
docker network create -d overlay --subnet=10.0.8.0/24 --gateway=10.0.8.1 ${BACKEND_NETWORK_NAME}
docker network create --opt encrypted -d overlay --subnet=10.0.9.0/24 --gateway=10.0.9.1 traefik-socket


# Docker Secrets
echo $CF_ZONE_TOKEN | docker secret create cf_token -
# Using HTPASSWD utility, without the -c flag to avoid creating file, and output from console to docker secret directly
htpasswd -nbB "$HTTP_USERNAME" "$HTTP_PASSWORD" | docker secret create basic_auth_creds -


# Deploy
docker stack deploy -c docker-stack-compose.yml ${STACK_NAME}
docker stack deploy -c internal-app.yml internal-app # example app - accessed internally
docker stack deploy -c external-app.yml external-app # example app - accessed externally via cloudflare tunnel + OAuth