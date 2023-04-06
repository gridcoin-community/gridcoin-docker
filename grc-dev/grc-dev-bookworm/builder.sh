#!/bin/bash

set -euo pipefail

docker login

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/386 \
--push -t gridcoincommunity/grc-dev:bookworm .



