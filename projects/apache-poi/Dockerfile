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
unzip maven.zip -d $SRC/maven-3.6.3 && \
rm -rf maven.zip

ENV MVN $SRC/maven-3.6.3/apache-maven-3.6.3/bin/mvn
ENV TARGET_PACKAGE_PREFIX org.apache.poi.*:org.apache.xmlbeans.*

# Newer JDK releases are listed at https://github.com/adoptium/temurin8-binaries/releases/
RUN curl -L https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u432-b06/OpenJDK8U-jdk_x64_linux_hotspot_8u432b06.tar.gz -o OpenJDK8U-jdk_x64_linux_hotspot_8u432b06.tar.gz && \
  tar xvf OpenJDK8U-jdk_x64_linux_hotspot_8u432b06.tar.gz && \
  rm -rf OpenJDK8U-jdk_x64_linux_hotspot_8u432b06.tar.gz

ENV JAVA_HOME_8 $SRC/jdk8u432-b06

# Newer JDK releases are listed at https://github.com/adoptium/temurin11-binaries/releases/
RUN curl -L https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.25%2B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.25_9.tar.gz -o OpenJDK11U-jdk_x64_linux_hotspot_11.0.25_9.tar.gz && \
  tar xvf OpenJDK11U-jdk_x64_linux_hotspot_11.0.25_9.tar.gz && \
  rm -rf OpenJDK11U-jdk_x64_linux_hotspot_11.0.25_9.tar.gz

ENV JAVA_HOME_11 $SRC/jdk-11.0.25+9

WORKDIR ${SRC}
#
# clone repository
#
RUN git clone --depth 1 https://github.com/apache/poi.git

# install packages required for font-handling and other code in java.awt.*
RUN apt-get update && apt-get install -y libxext6 libx11-6 libxrender1 libxtst6 libxi6 libxcb1 libxau6 libxdmcp6 \
&& apt-get clean autoclean \
&& apt-get autoremove --yes \
&& rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD pom.xml build.sh ${SRC}/
ADD src/ ${SRC}/src/
WORKDIR ${SRC}/poi
