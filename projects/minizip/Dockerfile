# Copyright 2018 Google Inc.
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

FROM ghcr.io/aixcc-finals/base-builder:v1.3.0
RUN apt-get update && apt-get install -y make cmake pkg-config libssl-dev:i386 \
    zlib1g-dev:i386 libbz2-dev:i386 liblzma-dev:i386 libzstd-dev:i386

RUN git clone -b develop https://github.com/zlib-ng/minizip-ng
WORKDIR minizip-ng
COPY build.sh $SRC/
