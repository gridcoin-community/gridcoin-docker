#!/bin/bash

set -euo pipefail

docker login
docker pull arm32v7/debian:stretch-slim

# build the build-deps stage:
docker build --rm \
    --target grc-arm32v7-build-deps-stretch \
    --cache-from=grc-arm32v7-build-deps-stretch \
    --tag grc-arm32v7-build-deps-stretch .

# build the devtime stage, using cached build-deps stage:
docker build --rm \
    --target grcarm32v7devstretch \
    --cache-from=grc-arm32v7-build-deps-stretch \
    --tag gridcoincommunity/grc-arm32v7-dev:stretch .

# push the new version:
docker push gridcoincommunity/grc-arm32v7-dev:stretch
