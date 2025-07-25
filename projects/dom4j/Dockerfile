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

ENV JAVA_HOME $JAVA_15_HOME
ENV JVM_LD_LIBRARY_PATH $JAVA_HOME/lib/server
ENV PATH $JAVA_HOME/bin:$PATH

RUN git clone --depth 1 https://github.com/google/fuzzing && \
    mv fuzzing/dictionaries/xml.dict $SRC/xml.dict && \
    rm -rf fuzzing

RUN git clone --depth 1 https://github.com/dvyukov/go-fuzz-corpus && \
    zip -j $SRC/DOMReaderFuzzer_seed_corpus.zip go-fuzz-corpus/xml/corpus/* && \
    rm -rf go-fuzz-corpus

RUN git clone --depth 1 https://github.com/dom4j/dom4j.git

COPY build.sh $SRC/
COPY *Fuzzer.java $SRC/
WORKDIR $SRC/dom4j
