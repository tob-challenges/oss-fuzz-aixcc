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

RUN apt-get update && \
    apt-get install -y build-essential libncursesw5-dev \
	libreadline-dev libssl-dev libgdbm-dev \
	libc6-dev libsqlite3-dev tk-dev libbz2-dev \
	zlib1g-dev libffi-dev

RUN git clone https://github.com/python/cpython.git cpython3
WORKDIR cpython3
COPY build.sh $SRC/
