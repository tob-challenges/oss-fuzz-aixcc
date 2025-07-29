#!/usr/bin/env bash

REGISTRY_URL="ghcr.io/tob-challenges"
BASE_IMAGES_PATH="infra/base-images"

IMAGE_VERSION="v1.2.0"
PUSH_IMAGES=1

IMAGE_NAME_LIST=(
  "base-image"
  "base-clang"
  "base-builder"
  "base-builder-go"
  "base-builder-jvm"
  "base-builder-python"
  "base-builder-rust"
  "base-builder-ruby"
  "base-builder-swift"
)

main() {
  for image in "${IMAGE_NAME_LIST[@]}"; do
    echo -e "#\n# Building: ${image}\n#\n"

    if ! docker \
            build \
            --pull \
            -t "${REGISTRY_URL}/${image}" \
            "${BASE_IMAGES_PATH}/${image}" ; then
      return 1
    fi

    if [[ ${PUSH_IMAGES} == 1 ]] ; then
      echo -e "\n#\n# Pushing: ${image}\n#\n"

      if ! docker_push "${REGISTRY_URL}/${image}" "${IMAGE_VERSION}" ; then
        return 1
      fi
    fi

    echo -e "\n====\n"
  done

  return 0
}

docker_push() {
  if [[ $# != 2 ]] ; then
    echo "Usage:\n\tdocker_push <image_name> <tag>\n"
    return 1
  fi

  local image="$1"
  local tag="$2"

  if ! docker tag "${image}" "${image}:${tag}" ; then
    echo "Docker tag has failed"
    return 1
  fi

  if ! docker push "${image}:${tag}" ; then
    echo "Docker push ${image}:${tag} has failed"
    return 1
  fi

  if ! docker push "${image}:latest" ; then
    echo "Docker push ${image}:latest has failed"
    return 1
  fi

  return 0
}

main "$@"
exit $?
