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

FROM ghcr.io/aixcc-finals/base-builder-jvm:v1.2.1

RUN apt-get update && apt-get install -y make autoconf automake libtool wget openjdk-17-jdk

RUN curl -L https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.zip -o maven.zip && \
    unzip maven.zip -d $SRC/maven && \
    rm -rf maven.zip

RUN curl -L https://repo1.maven.org/maven2/io/dropwizard/metrics/metrics-core/4.2.30/metrics-core-4.2.30.jar -o $SRC/metrics-core.jar

ENV MVN $SRC/maven/apache-maven-3.9.5/bin/mvn

# RUN git clone --depth 1 https://github.com/apache/zookeeper.git zookeeper

WORKDIR $SRC
COPY pkgs/zookeeper.tar.gz $SRC/zookeeper.tar.gz
RUN tar -zxf $SRC/zookeeper.tar.gz && rm $SRC/zookeeper.tar.gz

COPY build.sh $SRC/
COPY logback.xml $SRC/
COPY *.java $SRC/
WORKDIR $SRC/zookeeper
