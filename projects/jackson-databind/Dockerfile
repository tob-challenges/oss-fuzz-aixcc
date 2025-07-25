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

RUN curl -L https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip -o maven.zip && \
    unzip maven.zip -d $SRC/maven && \
    rm -rf maven.zip

RUN git clone --depth 1 https://github.com/google/fuzzing && \
    cp fuzzing/dictionaries/json.dict $SRC/ObjectReaderFuzzer.dict && \
    cp fuzzing/dictionaries/json.dict $SRC/ObjectWriterFuzzer.dict && \
    rm -rf fuzzing

RUN git clone --depth 1 https://github.com/dvyukov/go-fuzz-corpus && \
    zip -q $SRC/ObjectReaderFuzzer_seed_corpus.zip go-fuzz-corpus/json/corpus/* && \
    zip -q $SRC/ObjectWriterFuzzer_seed_corpus.zip go-fuzz-corpus/json/corpus/* && \
    rm -rf go-fuzz-corpus

RUN git clone --depth 1 https://github.com/FasterXML/jackson-databind

RUN git clone --depth 1 https://github.com/javaparser/javaparser

# Seed files
RUN git clone --depth 1 https://github.com/AdamKorcz/github-samples

ENV MVN $SRC/maven/apache-maven-3.6.3/bin/mvn

WORKDIR jackson-databind

RUN git clone --depth 1 https://github.com/FasterXML/jackson-annotations
RUN git clone --depth 1 https://github.com/FasterXML/jackson-core

COPY build.sh $SRC/
COPY *Fuzzer.java $SRC/
