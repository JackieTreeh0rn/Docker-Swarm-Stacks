#!/bin/bash

set -o allexport
. ./.env


# CLONE Repo
git clone --depth 1 --single-branch https://github.com/JackieTreeh0rn/it-tools build

# BUILD - DOCKER HUB
docker login
docker buildx build --platform "linux/amd64,linux/arm64" -t jackietreehorn/${STACK_NAME}:latest --push -f ./build/Dockerfile ./build
