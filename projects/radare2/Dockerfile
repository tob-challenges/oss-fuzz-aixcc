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
RUN apt-get update
RUN apt-get install -y pkg-config wget
RUN git clone https://github.com/radareorg/radare2 radare2
RUN git clone https://github.com/radareorg/radare2-fuzz radare2-fuzz
WORKDIR radare2
COPY build.sh $SRC/
COPY *.options $SRC/
