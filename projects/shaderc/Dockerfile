# Copyright 2024 Google LLC
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
RUN apt-get update && apt-get install -y build-essential make cmake ninja-build


RUN git clone https://github.com/KhronosGroup/glslang && \
    mkdir -p $SRC/glsl_seed && \
    cp $SRC/glslang/Test/*.frag $SRC/glsl_seed
RUN git clone https://github.com/google/shaderc shaderc
WORKDIR $SRC/shaderc

COPY *.cc *.sh $SRC/
