#!/bin/bash

set -o allexport
. ./.env

# CLONE Repo
git clone --depth 1 --single-branch https://github.com/clockworksoul/docker-gc-cron build
# Replace Docker file with updated version (adds multi-platform support PR#12 https://github.com/clockworksoul/docker-gc-cron/pull/12)
cp -rvf ./Dockerfile ./build/

# BUILD - DOCKER HUB
docker login
docker buildx build --platform "linux/amd64,linux/arm64" -t jackietreehorn/${STACK_NAME}:latest --push -f ./build/Dockerfile ./build