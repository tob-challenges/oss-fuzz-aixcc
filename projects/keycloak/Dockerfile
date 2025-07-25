# Copyright 2023 Google LLC
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

RUN apt update && apt install openjdk-17-jdk libxext6 libxrender1 libxtst6 -y

RUN curl -L https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip -o maven.zip && \
    unzip maven.zip -d $SRC/maven && \
    rm -rf maven.zip

ENV MVN $SRC/maven/apache-maven-3.6.3/bin/mvn
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV TARGET_PACKAGE_PREFIX org.keycloak.*

RUN git clone --depth 1 https://github.com/cncf/cncf-fuzzing cncf-fuzzing
RUN git clone --depth 1 https://github.com/keycloak/keycloak keycloak

COPY build.sh $SRC/
WORKDIR $SRC/keycloak
