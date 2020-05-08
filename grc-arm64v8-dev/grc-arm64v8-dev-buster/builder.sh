#!/bin/bash

set -euo pipefail

docker login
docker pull arm64v8/debian:buster-slim

# build the build-deps stage:
docker build --rm \
    --target grc-arm64v8-build-deps-buster \
    --cache-from=grc-arm64v8-build-deps-buster \
    --tag grc-arm64v8-build-deps-buster .

# build the devtime stage, using cached build-deps stage:
docker build --rm \
    --target grcarm64v8devbuster \
    --cache-from=grc-arm64v8-build-deps-buster \
    --tag gridcoincommunity/grc-arm64v8-dev:buster .

# push the new version:
docker push gridcoincommunity/grc-arm64v8-dev:buster
