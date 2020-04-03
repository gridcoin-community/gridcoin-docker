#!/bin/bash

set -euo pipefail

# pull the latest version of the image, in order to
# populate the build cache:
docker pull gridcoincommunity/grc-arm32v7-dev:stretch || true

# build the build-deps stage:
docker build --target grc-arm32v7-stretch-build-deps \
       --cache-from=grc-stretch-arm32v7-build-deps \
       --tag grc-arm32v7-stretch-build-deps .

# build the devtime stage, using cached build-deps stage:
docker build --target grcarm32v7devstretch \
       --cache-from=grc-arm32v7-stretch-build-deps \
       --cache-from=gridcoincommunity/grc-arm32v7-dev:stretch \
       --tag gridcoincommunity/grc-arm32v7-dev:stretch .

# push the new version:
#docker push gridcoincommunity/grc-arm32v7-dev:stretch
