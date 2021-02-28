#!/bin/bash

set -euo pipefail

docker login
docker pull debian:stretch

# build the build-deps stage:
docker build --target grc-amd64-build-deps-stretch \
    --cache-from=grc-amd64-build-deps-stretch \
    --tag grc-amd64-build-deps-stretch .

# build the devtime stage, using cached build-deps stage:
docker build --target grc-amd64-dev-stretch \
    --cache-from=grc-amd64-build-deps-stretch \
    --tag gridcoincommunity/grc-amd64-dev:stretch .

docker image prune -f --filter="label=stage=grc-amd64-dev-stretch"

# push the new version:
#docker push gridcoincommunity/grc-amd64-dev:stretch
