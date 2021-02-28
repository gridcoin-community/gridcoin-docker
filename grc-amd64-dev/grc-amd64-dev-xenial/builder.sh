#!/bin/bash

set -euo pipefail

docker login
docker pull ubuntu:xenial

# build the build-deps stage:
docker build --target grc-amd64-build-deps-xenial \
    --cache-from=grc-amd64-build-deps-xenial \
    --tag grc-amd64-build-deps-xenial .

# build the devtime stage, using cached build-deps stage:
docker build --target grc-amd64-dev-xenial \
    --cache-from=grc-amd64-build-deps-xenial \
    --tag gridcoincommunity/grc-amd64-dev:xenial .

docker image prune -f --filter="label=stage=grc-amd64-dev-xenial"

# push the new version:
#docker push gridcoincommunity/grc-amd64-dev:xenial
