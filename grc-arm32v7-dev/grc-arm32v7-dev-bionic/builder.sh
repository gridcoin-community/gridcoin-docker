#!/bin/bash

set -euo pipefail

# pull the latest version of the image, in order to
# populate the build cache:
#docker pull gridcoincommunity/grc-arm32v7-dev:bionic        || true

# build the build-deps stage:
docker build --target grc-bionic-arm32v7-build-deps \
       --cache-from=grc-bionic-arm32v7-build-deps \
       --tag grc-bionic-arm32v7-build-deps .

# build the devtime stage, using cached build-deps stage:
docker build --target grcbionicarm32v7dev \
       --cache-from=grc-bionic-arm32v7-build-deps \
       --cache-from=gridcoincommunity/grc-arm32v7-dev:bionic \
       --tag gridcoincommunity/grc-arm32v7-dev:bionic .

# push the new version:
#docker push gridcoincommunity/grc-arm32v7-dev:bionic
