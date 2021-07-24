#!/bin/bash

set -euo pipefail

docker login

docker buildx build --platform linux/amd64,linux/arm/v7 \
--push -t gridcoincommunity/grc-dev:bullseye .

# Note: Due to a clash between a new bash release in bullseye and qemu, it is not possible to build arm64 containers with qemu < v5.0, which was officially released into Ubuntu 20.10. It has now been backported to 20.04 at this PPA:

# https://launchpad.net/~ci-train-ppa-service/+archive/ubuntu/4535/+packages

# See:

#  https://bugs.launchpad.net/qemu/+bug/1749393

#docker buildx build --platform linux/arm64 -t gridcoincommunity/grc-dev:bullseye .

# docker run -it --rm debian:testing@sha256:69a6cf06364cd3158463da3080c28525b024aa3128c25f832d8e73d2f9cf61bd /bin/bash


