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
RUN apt-get update && apt-get install -y make autoconf automake libtool pkg-config libfontconfig1-dev libfreetype-dev libfribidi-dev python3-pip && \
    pip3 install meson==0.55.0 ninja

RUN git clone --depth 1 https://github.com/libass/libass.git
RUN git clone --depth 1 https://github.com/harfbuzz/harfbuzz.git

COPY build.sh *.options $SRC/
