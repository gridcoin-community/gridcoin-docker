#!/bin/bash

set -euo pipefail

docker login

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/386 \
--push -t gridcoincommunity/grc-dev:bullseye .

# Note: Due to a clash between a new bash release in bullseye and qemu, it is not possible to build arm64 containers with qemu < v5.0, which was officially released into Ubuntu 20.10. It has now been backported to 20.04 at this PPA:

# https://launchpad.net/~ci-train-ppa-service/+archive/ubuntu/4535/+packages

# See:

#  https://bugs.launchpad.net/qemu/+bug/1749393



