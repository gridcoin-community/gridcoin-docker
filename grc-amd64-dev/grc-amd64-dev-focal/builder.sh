#!/bin/bash

set -euo pipefail

docker login

# build the build-deps stage:
docker build --target grc-amd64-build-deps-focal \
    --cache-from=grc-amd64-build-deps-focal \
    --tag grc-amd64-build-deps-focal .

# build the devtime stage, using cached build-deps stage:
docker build --target grcamd64devfocal \
    --cache-from=grc-amd64-build-deps-focal \
    --tag gridcoincommunity/grc-amd64-dev:focal .

docker image prune -f --filter="label=stage=grcamd64devfocal"

# push the new version:
docker push gridcoincommunity/grc-amd64-dev:focal
