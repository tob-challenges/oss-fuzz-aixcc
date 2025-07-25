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
RUN apt-get update && apt-get install -y wget

# Get Wuffs' first-party code.

RUN git clone --depth 1 https://github.com/google/wuffs.git

# Get third-party test corpora.

RUN git clone --depth 1 https://github.com/nst/JSONTestSuite.git
RUN rm -rf JSONTestSuite/.git

RUN wget -O bmpsuite.zip https://entropymine.com/jason/bmpsuite/releases/bmpsuite-2.6.zip
RUN mkdir bmpsuite_corpus
RUN unzip -j bmpsuite.zip -d bmpsuite_corpus
RUN rm bmpsuite.zip

RUN mkdir libjpeg_turbo_corpus && \
    git clone --depth=1 https://github.com/libjpeg-turbo/seed-corpora && \
    mv ./seed-corpora/afl-testcases/jpeg_turbo/full/images/*.jpg ./libjpeg_turbo_corpus && \
    rm -rf seed-corpora

RUN mkdir pngsuite_corpus && \
    git clone --depth=1 https://github.com/nigeltao/mozsec-fuzzdata && \
    mv ./mozsec-fuzzdata/samples/png/common/*.png ./pngsuite_corpus && \
    rm -rf mozsec-fuzzdata

RUN git clone --depth 1 https://github.com/minio/simdjson-fuzz
RUN mv simdjson-fuzz/corpus/corpus simdjson_corpus
RUN rm -rf simdjson-fuzz

RUN git clone --depth 1 https://github.com/webmproject/libwebp-test-data.git webp_corpus
RUN rm -rf webp_corpus/.git

RUN git clone --depth 1 https://github.com/nigeltao/xz-tests-files
RUN rm -rf xz-tests-files/.git
RUN mv xz-tests-files xz_corpus

# Finish.

WORKDIR wuffs
COPY build.sh $SRC/
