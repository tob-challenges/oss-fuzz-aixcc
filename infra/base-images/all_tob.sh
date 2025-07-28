#!/bin/bash -eux
# Copyright 2016 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

docker build --pull -t ghcr.io/tob-challenges/base-image "$@" infra/base-images/base-image
docker build --pull -t ghcr.io/tob-challenges/base-clang "$@" infra/base-images/base-clang
docker build --pull -t ghcr.io/tob-challenges/base-builder "$@" infra/base-images/base-builder
docker build --pull -t ghcr.io/tob-challenges/base-builder-go "$@" infra/base-images/base-builder-go
docker build --pull -t ghcr.io/tob-challenges/base-builder-jvm "$@" infra/base-images/base-builder-jvm
docker build --pull -t ghcr.io/tob-challenges/base-builder-python "$@" infra/base-images/base-builder-python
docker build --pull -t ghcr.io/tob-challenges/base-builder-rust "$@" infra/base-images/base-builder-rust
docker build --pull -t ghcr.io/tob-challenges/base-builder-ruby "$@" infra/base-images/base-builder-ruby
docker build --pull -t ghcr.io/tob-challenges/base-builder-swift "$@" infra/base-images/base-builder-swift

#   docker build -t ghcr.io/tob-challenges/base-runner "$@" infra/base-images/base-runner
#   docker build -t ghcr.io/tob-challenges/base-runner-debug "$@" infra/base-images/base-runner-debug
