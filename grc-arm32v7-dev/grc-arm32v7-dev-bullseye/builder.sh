#!/bin/bash

set -euo pipefail

docker login
docker pull arm32v7/debian:bullseye-slim

# build the build-deps stage:
docker build --rm \
    --target grc-arm32v7-build-deps-bullseye \
    --cache-from=grc-arm32v7-build-deps-bullseye \
    --tag grc-arm32v7-build-deps-bullseye .

# build the devtime stage, using cached build-deps stage:
docker build --rm \
    --target grcarm32v7devbullseye \
    --cache-from=grc-arm32v7-build-deps-bullseye \
    --tag gridcoincommunity/grc-arm32v7-dev:bullseye .

# push the new version:
docker push gridcoincommunity/grc-arm32v7-dev:bullseye
