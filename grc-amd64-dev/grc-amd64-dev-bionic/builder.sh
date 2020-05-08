#!/bin/bash

set -euo pipefail

docker login
docker pull ubuntu:bionic

# build the build-deps stage:
docker build --target grc-amd64-build-deps-bionic \
    --cache-from=grc-amd64-build-deps-bionic \
    --tag grc-amd64-build-deps-bionic .

# build the devtime stage, using cached build-deps stage:
docker build --target grc-amd64-dev-bionic \
    --cache-from=grc-amd64-build-deps-bionic \
    --tag gridcoincommunity/grc-amd64-dev:bionic .

docker image prune -f --filter="label=stage=grc-amd64-dev-bionic"

# push the new version:
docker push gridcoincommunity/grc-amd64-dev:bionic
