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
RUN apt-get update && apt-get install -y \
	build-essential cmake make coreutils sed lld \
	autoconf automake libtool zlib1g-dev \
	libreadline-dev libncurses5-dev libssl-dev \
	libunwind-dev luajit wget ninja-build \
	libzstd-dev libyaml-dev libcurl4-openssl-dev

RUN git clone --jobs $(nproc) --recursive https://github.com/tarantool/tarantool
WORKDIR $SRC/tarantool

# Download a seed corpus.
RUN rm -rf test/static
RUN git clone https://github.com/ligurio/tarantool-corpus test/static

COPY build.sh $SRC/
