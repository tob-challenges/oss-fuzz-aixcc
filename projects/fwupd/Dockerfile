# Copyright 2020 Google LLC
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
RUN apt-get update && apt-get install -y pkg-config zlib1g-dev libffi-dev liblzma-dev libcbor-dev
RUN python3 -m pip install -U jinja2 packaging meson ninja
RUN git clone --depth 1 https://github.com/fwupd/fwupd.git fwupd
WORKDIR .
COPY build.sh $SRC/
