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

FROM ghcr.io/aixcc-finals/base-builder:v1.3.0
RUN apt-get update && apt-get install -y make
RUN git clone --depth 1 https://github.com/openssl/openssl.git
RUN cd $SRC/openssl/ && git submodule update --init fuzz/corpora
RUN git clone --depth 1 --branch openssl-3.0 https://github.com/openssl/openssl.git openssl30
RUN git clone --depth 1 --branch openssl-3.1 https://github.com/openssl/openssl.git openssl31
RUN git clone --depth 1 --branch openssl-3.2 https://github.com/openssl/openssl.git openssl32
RUN cd $SRC/openssl32/ && git submodule update --init fuzz/corpora
WORKDIR openssl
COPY build.sh *.options $SRC/
ENV AFL_SKIP_OSSFUZZ=1
ENV AFL_LLVM_MODE_WORKAROUND=0
