# Copyright 2023 Google LLC
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
RUN apt-get update && apt-get install -y make autoconf automake libtool cmake
RUN git clone https://github.com/upx/upx-testsuite.git testsuite
RUN git clone https://github.com/upx/upx-testsuite-v2.git testsuite2
RUN git clone https://github.com/MykolaMykhno/upx-testsuite-v3.git testsuite3
RUN git clone --depth 1 https://github.com/upx/upx.git upx

WORKDIR /src/upx
RUN git submodule update --init

COPY build.sh $SRC/
COPY fuzzers/ $SRC/upx/fuzzers/
