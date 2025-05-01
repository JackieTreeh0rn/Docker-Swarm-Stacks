#!/bin/bash

# set -o allexport
# . ./.env

# Traefik
export ROUTER_NAME="bigagi"
export ROUTER_NAME_PUBLIC="bigagi-pub"
export ROOT_DOMAIN="your-domain.co"

# Docker
export STACK_NAME="big-agi"
export BACKEND_NETWORK_NAME=${STACK_NAME}_backend
export PUID=$(id -u)
export PGID=$(id -g)
# Create Network (customize)
docker network create -d overlay --subnet=10.0.10.0/24 --gateway=10.0.10.1 ${BACKEND_NETWORK_NAME}
# Deploy
docker login
docker pull jackietreehorn/${STACK_NAME}:latest
docker stack deploy -c docker-stack-compose.yml ${STACK_NAME}
