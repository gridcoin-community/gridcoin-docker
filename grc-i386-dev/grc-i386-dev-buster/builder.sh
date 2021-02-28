#!/bin/bash

set -euo pipefail

docker login
docker pull i386/debian:buster-slim

# build the build-deps stage:
docker build --target grc-i386-build-deps-buster \
    --cache-from=grc-i386-build-deps-buster \
    --tag grc-i386-build-deps-buster .

# build the devtime stage, using cached build-deps stage:
docker build --target grci386devbuster \
    --cache-from=grc-i386-build-deps-buster \
    --tag gridcoincommunity/grc-i386-dev:buster .

docker image prune -f --filter="label=stage=grci386devbuster"

# push the new version:
docker push gridcoincommunity/grc-i386-dev:buster
