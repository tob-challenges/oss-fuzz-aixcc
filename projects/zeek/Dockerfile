# Copyright 2020 Google Inc.
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

RUN apt-get update && apt-get install -y --no-install-recommends \
        patchelf \
        cmake \
        ninja-build \
        flex \
        bison \
        libfl-dev \
        libpcap-dev \
        libssl-dev \
        libmaxminddb-dev \
        libkrb5-dev \
        zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --recursive https://github.com/zeek/zeek zeek
WORKDIR zeek
COPY build.sh $SRC/
