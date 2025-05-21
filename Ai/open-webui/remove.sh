#!/bin/bash

# set -o allexport
# . ./.env


# Docker
export STACK_NAME="open-webui"
export BACKEND_NETWORK_NAME=${STACK_NAME}_backend


docker stack rm ${STACK_NAME}

