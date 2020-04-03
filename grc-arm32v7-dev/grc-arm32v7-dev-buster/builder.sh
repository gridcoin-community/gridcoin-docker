#!/bin/bash

set -euo pipefail

# pull the latest version of the image, in order to
# populate the build cache:
docker pull gridcoincommunity/grc-arm32v7-dev:buster || true

# build the build-deps stage:
docker build --target grc-arm32v7-buster-build-deps \
       --cache-from=grc-bionic-arm32v7-build-deps \
       --tag grc-bionic-arm32v7-build-deps .

# build the devtime stage, using cached build-deps stage:
docker build --target grcarm32v7devbuster \
       --cache-from=grc-arm32v7-buster-build-deps \
       --cache-from=gridcoincommunity/grc-arm32v7-dev:buster \
       --tag gridcoincommunity/grc-arm32v7-dev:buster .

# push the new version:
#docker push gridcoincommunity/grc-arm32v7-dev:buster
