#!/bin/bash

set -o allexport
. ./.env


# CLONE Repo
git clone --depth 1 --branch release-2.0.0-beta.2 --single-branch https://github.com/louislam/uptime-kuma build

# BUILD - DOCKER HUB
docker login
docker buildx build --platform "linux/amd64,linux/arm64" -t jackietreehorn/${STACK_NAME}:latest --push -f ./build/docker/dockerfile ./build
