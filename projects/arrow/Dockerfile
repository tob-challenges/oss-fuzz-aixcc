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

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y -q && \
    apt-get install -y -q --no-install-recommends \
        bison \
        build-essential \
        cmake \
        flex \
        ninja-build \
        python3
RUN wget https://archives.boost.io/release/1.85.0/source/boost_1_85_0.tar.bz2  # Temporarily use manual installation over the outdated libboost-dev package

RUN git clone --depth=1 --recurse-submodules \
    https://github.com/apache/arrow.git $SRC/arrow

COPY build.sh $SRC/
