#!/bin/bash

set -euo pipefail

docker login

# build the build-deps stage:
docker build --target grc-amd64-build-deps-bullseye \
    --cache-from=grc-amd64-build-deps-bullseye \
    --tag grc-amd64-build-deps-bullseye .

# build the devtime stage, using cached build-deps stage:
docker build --target grcamd64devbullseye \
    --cache-from=grc-amd64-build-deps-bullseye \
    --tag gridcoincommunity/grc-amd64-dev:bullseye .

docker image prune -f --filter="label=stage=grcamd64devbullseye"

# push the new version:
docker push gridcoincommunity/grc-amd64-dev:bullseye
