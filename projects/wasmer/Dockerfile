# Copyright 2022 Google LLC
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

FROM ghcr.io/aixcc-finals/base-builder-rust:v1.3.0

RUN apt-get update && apt-get install -y make autoconf automake libtool \
	zlib1g-dev libffi-dev build-essential libxml2-dev

RUN git clone --depth 1 https://github.com/wasmerio/wasmer wasmer

RUN mkdir -p $SRC/.llvm && curl --proto '=https' --tlsv1.2 -sSf \
    https://github.com/wasmerio/llvm-custom-builds/releases/download/18.x/llvm-linux-amd64.tar.xz -L -o -| \
    tar xJv -C $SRC/.llvm

WORKDIR wasmer

# dead code warnings with nightly-2024-07-12
ENV RUSTUP_TOOLCHAIN nightly-2024-10-10

COPY build.sh default.options $SRC/
