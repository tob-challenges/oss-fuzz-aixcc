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

FROM ghcr.io/aixcc-finals/base-builder-go:v1.3.0

RUN apt-get update && apt-get install -y protobuf-compiler libprotobuf-dev binutils cmake \
   ninja-build liblzma-dev libz-dev pkg-config autoconf libtool
RUN git clone --depth 1 https://github.com/google/libprotobuf-mutator.git
RUN mkdir LPM; \
  cd LPM; \
  cmake $SRC/libprotobuf-mutator -GNinja -DLIB_PROTO_MUTATOR_DOWNLOAD_PROTOBUF=ON -DLIB_PROTO_MUTATOR_TESTING=OFF -DCMAKE_BUILD_TYPE=Release; \
  ninja;

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

RUN git clone --depth 1 https://go.googlesource.com/go goroot
RUN git clone --depth 1 https://github.com/catenacyber/ngolo-fuzzing.git

RUN mkdir $SRC/x
RUN git clone --depth 1 https://github.com/golang/net x/net
RUN git clone --depth 1 https://github.com/golang/image x/image
RUN git clone --depth 1 https://github.com/golang/crypto x/crypto
RUN git clone --depth 1 https://github.com/golang/text x/text

COPY build.sh $SRC/
WORKDIR $SRC/ngolo-fuzzing
