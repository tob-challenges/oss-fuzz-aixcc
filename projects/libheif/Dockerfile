# Copyright 2019 Google Inc.
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


RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    build-essential \
    cmake \
    libbrotli-dev \
    libtool \
    make \
    mercurial \
    pkg-config \
    yasm \
    zlib1g-dev

RUN git clone \
    --depth 1 \
    --branch master \
    https://github.com/strukturag/libde265.git \
    libde265

RUN git clone \
    https://bitbucket.org/multicoreware/x265_git/src/stable/ \
    x265

RUN git clone \
    --depth 1 \
    --branch master \
    https://aomedia.googlesource.com/aom \
    aom

RUN git clone \
    --depth 1 \
    --branch master \
    https://github.com/strukturag/libheif.git \
    libheif

WORKDIR libheif

COPY build.sh $SRC/
