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
RUN apt-get update && apt-get install -y autoconf make libgif-dev libjpeg-dev libpng-dev libtool zip
RUN git clone https://chromium.googlesource.com/webm/libwebp
RUN git clone https://chromium.googlesource.com/webm/libwebp-test-data
ADD https://storage.googleapis.com/downloads.webmproject.org/webp/testdata/fuzzer/fuzz_seed_corpus.zip $SRC/
RUN unzip fuzz_seed_corpus.zip -d libwebp-test-data/
RUN rm fuzz_seed_corpus.zip
COPY build.sh $SRC/
WORKDIR libwebp
