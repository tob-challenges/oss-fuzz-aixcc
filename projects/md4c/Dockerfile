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
RUN apt-get update && apt-get install -y make cmake
RUN git clone https://github.com/mity/md4c

# Dictionaries:
RUN git clone --depth 1 https://github.com/google/fuzzing && \
    mv fuzzing/dictionaries/markdown.dict $SRC/fuzz-mdhtml.dict && \
    rm -rf fuzzing

# Seed corpus:
RUN zip -j $SRC/fuzz-mdhtml_seed_corpus.zip $SRC/md4c/test/fuzzers/seed-corpus/*

WORKDIR $SRC/md4c
COPY build.sh $SRC/
