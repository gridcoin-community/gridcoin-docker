#!/bin/bash

set -euo pipefail

docker login
docker pull ubuntu:hirsute

# build the build-deps stage:
docker build --target grc-amd64-build-deps-hirsute \
    --cache-from=grc-amd64-build-deps-hirsute \
    --tag grc-amd64-build-deps-hirsute .

# build the devtime stage, using cached build-deps stage:
docker build --target grcamd64devhirsute \
    --cache-from=grc-amd64-build-deps-hirsute \
    --tag gridcoincommunity/grc-amd64-dev:hirsute .

docker image prune -f --filter="label=stage=grcamd64devhirsute"

# push the new version:
#docker push gridcoincommunity/grc-amd64-dev:hirsute
