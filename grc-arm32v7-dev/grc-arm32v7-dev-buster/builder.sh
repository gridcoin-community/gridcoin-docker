#!/bin/bash

set -euo pipefail

docker login

# build the build-deps stage:
docker build --rm \
    --target grc-arm32v7-build-deps-buster \
    --cache-from=grc-arm32v7-build-deps-buster \
    --tag grc-arm32v7-build-deps-buster .

# build the devtime stage, using cached build-deps stage:
docker build --rm \
    --target grcarm32v7devbuster \
    --cache-from=grc-arm32v7-build-deps-buster \
    --tag gridcoincommunity/grc-arm32v7-dev:buster .

# push the new version:
docker push gridcoincommunity/grc-arm32v7-dev:buster
