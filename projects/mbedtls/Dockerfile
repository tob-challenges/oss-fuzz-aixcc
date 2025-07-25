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
RUN apt-get update && apt-get install -y make cmake
RUN apt-get update && apt-get install -y \
    python-all-dev \
    python3-all-dev \
    python3-pip
# mbedtls needs jsonschema which needs rpds-py which needs pip>=20
# or a Rust toolchain.
RUN pip3 install 'pip>=20'

RUN git clone --recursive --depth 1 -b mbedtls-3.6 https://github.com/Mbed-TLS/mbedtls.git mbedtls
RUN pip3 install -r $SRC/mbedtls/scripts/basic.requirements.txt

RUN git clone --depth 1 https://github.com/google/boringssl.git boringssl
RUN git clone --depth 1 https://github.com/openssl/openssl.git openssl && \
    cd openssl && \
    git submodule update --init fuzz/corpora
WORKDIR mbedtls
COPY build.sh $SRC/
