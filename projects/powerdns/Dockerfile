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

# base image with clang toolchain
FROM ghcr.io/aixcc-finals/base-builder:v1.3.0

# install required packages to build your project
RUN apt-get update && apt-get install -y autoconf automake bison dh-autoreconf flex libluajit-5.1-dev libedit-dev libprotobuf-dev libssl-dev libtool make pkg-config protobuf-compiler ragel
RUN wget https://archives.boost.io/release/1.84.0/source/boost_1_84_0.tar.bz2  # Temporarily use manual installation over the outdated libboost-dev package

# checkout all sources needed to build your project
RUN git clone https://github.com/PowerDNS/pdns.git pdns

# current directory for build script
WORKDIR pdns

# copy build script and other fuzzer files in src dir
COPY build.sh $SRC/
