#!/bin/bash

set -euo pipefail

docker login
docker pull arm64v8/ubuntu:bionic

# build the build-deps stage:
docker build --rm \
    --target grc-arm64v8-build-deps-bionic \
    --cache-from=grc-arm64v8-build-deps-bionic \
    --tag grc-arm64v8-build-deps-bionic .

# build the devtime stage, using cached build-deps stage:
docker build --rm \
    --target grcarm64v8devbionic \
    --cache-from=grc-arm64v8-build-deps-bionic \
    --tag gridcoincommunity/grc-arm64v8-dev:bionic .

docker image prune -f --filter="label=stage=grcarm64v8devbionic"

# push the new version:
#docker push gridcoincommunity/grc-arm64v8-dev:bionic
