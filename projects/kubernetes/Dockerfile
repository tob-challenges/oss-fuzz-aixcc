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

FROM ghcr.io/aixcc-finals/base-builder-go:v1.3.0

RUN git clone --depth 1 https://github.com/kubernetes/kubernetes.git
RUN git clone --depth 1 https://github.com/google/AFL
RUN git clone --depth 1 https://github.com/dvyukov/go-fuzz-corpus
RUN git clone --depth 1 https://github.com/kubernetes/kops
RUN git clone --depth 1 https://github.com/cncf/cncf-fuzzing
RUN git clone --depth 1 https://github.com/AdamKorcz/instrumentation
RUN git clone --depth 1 https://github.com/AdamKorcz/go-118-fuzz-build --branch=november-backup
RUN wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz \
    && mkdir temp-go \
    && rm -rf /root/.go/* \
    && tar -C temp-go/ -xzf go1.23.4.linux-amd64.tar.gz \
    && mv temp-go/go/* /root/.go/
WORKDIR $SRC/
COPY build.sh $SRC/
