#!/bin/bash

set -o allexport
. ./.env


# Docker
export PUID=$(id -u)
export PGID=$(id -g)
# Deploy # NON STACK
docker compose up -d