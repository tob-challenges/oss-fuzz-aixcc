# Copyright 2022 Google LLC
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

FROM ghcr.io/aixcc-finals/base-builder-jvm:v1.3.0

RUN git clone --depth 1 https://github.com/google/fuzzing && \
    mv fuzzing/dictionaries/json.dict $SRC/BasicJsonParserFuzzer.dict && \
    rm -rf fuzzing

RUN git clone --depth 1 https://github.com/dvyukov/go-fuzz-corpus && \
    zip -j $SRC/BasicJsonParserFuzzer_seed_corpus.zip go-fuzz-corpus/json/corpus/* && \
    rm -rf go-fuzz-corpus

RUN apt update && apt install -y openjdk-17-jdk

RUN git clone --depth 1 https://github.com/spring-projects/spring-boot
RUN git clone --depth 1 https://github.com/spring-projects/spring-framework spring-boot/spring-framework

COPY . $SRC/

RUN cd spring-boot && (for i in ${SRC}/add-shadow*.diff; do tr -d '\015' < $i | git apply; done )

COPY build.sh $SRC/
COPY *Fuzzer.java $SRC/
WORKDIR $SRC/spring-boot
