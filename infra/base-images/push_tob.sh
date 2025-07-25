#!/bin/bash -eux

# This script pushes images (packages) to GitHub's registry.
# Run `infra/base-images/all_tob.sh` before running this script.

push() {
    image="$1"
    tag="$2"
    docker tag "${image}" "${image}:${tag}"
    docker push "${image}:${tag}"
    docker push "${image}:latest"
}

version="v1.2.0"
push ghcr.io/tob-challenges/base-image "${version}"
push ghcr.io/tob-challenges/base-clang "${version}"
push ghcr.io/tob-challenges/base-builder "${version}"
push ghcr.io/tob-challenges/base-builder-go "${version}"
push ghcr.io/tob-challenges/base-builder-jvm "${version}"
push ghcr.io/tob-challenges/base-builder-python "${version}"
