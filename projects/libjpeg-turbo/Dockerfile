# Copyright 2016 Google Inc.
# Copyright 2022-2023 D. R. Commander
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
RUN apt-get update && apt-get install -y make yasm cmake
RUN git clone --depth 1 https://github.com/libjpeg-turbo/fuzz && \
    cat fuzz/branches.txt | while read branch; do \
      git clone --depth 1 https://github.com/libjpeg-turbo/libjpeg-turbo -b $branch libjpeg-turbo.$branch; \
    done

RUN git clone --depth 1 https://github.com/libjpeg-turbo/seed-corpora
RUN cd seed-corpora && zip -r ../decompress_fuzzer_seed_corpus.zip afl-testcases/jpeg* bugs/decompress*
RUN cat fuzz/branches.txt | while read branch; do \
      zip -r decompress_fuzzer_seed_corpus.zip libjpeg-turbo.$branch/testimages/*.jpg; \
    done
RUN cd seed-corpora && zip -r ../compress_fuzzer_seed_corpus.zip afl-testcases/bmp afl-testcases/gif* afl-testcases/targa bugs/compress*
RUN cat fuzz/branches.txt | while read branch; do \
      zip -r compress_fuzzer_seed_corpus.zip libjpeg-turbo.$branch/testimages/*.bmp libjpeg-turbo.$branch/testimages/*.ppm; \
    done
RUN rm -rf seed-corpora

COPY build.sh $SRC/
