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

RUN curl -L https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.7%2B7/OpenJDK17U-jdk_x64_linux_hotspot_17.0.7_7.tar.gz -o jdk.tar.gz && \
tar xvf jdk.tar.gz && \
rm -rf jdk.tar.gz

ENV MVN $SRC/maven/apache-maven-3.6.3/bin/mvn

RUN git clone https://github.com/spring-cloud/spring-cloud-netflix.git
RUN cd spring-cloud-netflix && git checkout 5ec430efb

ADD pom.xml build.sh ${SRC}/
ADD src/ ${SRC}/src/
WORKDIR ${SRC}/spring-cloud-netflix