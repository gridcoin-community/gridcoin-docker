#!/bin/bash

set -euo pipefail

docker login
docker pull debian:buster-slim

# build the build-deps stage:
docker build --target grc-amd64-build-deps-buster \
    --cache-from=grc-amd64-build-deps-buster \
    --tag grc-amd64-build-deps-buster .

# build the devtime stage, using cached build-deps stage:
docker build --target grcamd64devbuster \
    --cache-from=grc-amd64-build-deps-buster \
    --tag gridcoincommunity/grc-amd64-dev:buster .

docker image prune -f --filter="label=stage=grcamd64devbuster"

# push the new version:
docker push gridcoincommunity/grc-amd64-dev:buster
