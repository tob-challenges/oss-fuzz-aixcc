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

FROM ghcr.io/aixcc-finals/base-builder:v1.3.0
RUN apt-get update && apt-get install -y make autoconf automake \
    libtool python python3-pip \
    libz-dev libssl-dev libssl1.1 wget
RUN pip3 install six
RUN git clone --depth 1 https://github.com/openvswitch/ovs.git openvswitch
RUN git clone --depth 1 https://github.com/openvswitch/ovs-fuzzing-corpus.git \
    ovs-fuzzing-corpus
WORKDIR openvswitch
COPY build.sh $SRC/
