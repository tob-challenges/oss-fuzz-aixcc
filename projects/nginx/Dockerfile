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

RUN apt-get update && apt-get install -y libpcre3-dev zlib1g-dev mercurial ninja-build cmake liblzma-dev libz-dev binutils libtool
RUN hg clone http://hg.nginx.org/nginx/
RUN git clone --depth 1 https://github.com/google/libprotobuf-mutator.git
RUN git clone --depth 1 https://github.com/google/fuzzer-test-suite
RUN (mkdir LPM && cd LPM && cmake ../libprotobuf-mutator -GNinja -DLIB_PROTO_MUTATOR_DOWNLOAD_PROTOBUF=ON -DLIB_PROTO_MUTATOR_TESTING=OFF -DCMAKE_BUILD_TYPE=Release && ninja)

WORKDIR nginx
COPY fuzz $SRC/fuzz
COPY build.sh add_fuzzers.diff make_fuzzers  $SRC/
