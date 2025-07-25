# Copyright 2021 Google LLC
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

RUN apt-get update -y \
    && env DEBIAN_FRONTEND=noninteractive \
        apt-get install --yes --no-install-recommends \
            bash \
            wget \
            curl \
            ccache \
            expect \
            ninja-build \
            perl \
            pkg-config \
            python3 \
            python3-lxml \
            python3-requests \
            python3-termcolor \
            protobuf-compiler \
            libprotoc-dev \
            libgrpc++-dev \
            protobuf-compiler-grpc \
            libprotobuf-dev \
            sudo \
            tzdata \
            nasm

RUN git clone -j 8 --recursive https://github.com/ClickHouse/ClickHouse $SRC/ClickHouse
WORKDIR $SRC/ClickHouse

COPY build.sh $SRC/
