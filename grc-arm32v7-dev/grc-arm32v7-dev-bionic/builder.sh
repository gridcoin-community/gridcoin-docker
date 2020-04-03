#!/bin/bash

set -euo pipefail

docker login

# build the build-deps stage:
docker build --rm \
    --target grc-arm32v7-build-deps-bionic \
    --cache-from=grc-arm32v7-build-deps-bionic \
    --tag grc-arm32v7-build-deps-bionic .

# build the devtime stage, using cached build-deps stage:
docker build --rm \
    --target grcbionicarm32v7dev \
    --cache-from=grc-arm32v7-build-deps-bionic \
    --tag gridcoincommunity/grc-arm32v7-dev:bionic .

# push the new version:
docker push gridcoincommunity/grc-arm32v7-dev:bionic
