# Copyright 2017 Google Inc.
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
RUN apt-get update -y && \
    apt-get install -y autoconf automake libtool curl make g++ unzip wget git \
    binutils liblzma-dev libz-dev python-all cmake ninja-build subversion \
    pkg-config

RUN git clone --depth 1 https://github.com/llvm/llvm-project.git

RUN git clone --depth 1 https://github.com/AdaLogics/ada-fuzzers && \
    $SRC/ada-fuzzers/projects/llvm/copy-over.sh

COPY build.sh *.py $SRC/
