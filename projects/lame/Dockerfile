# Copyright 2019 Google Inc.
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
RUN apt-get update && apt-get install -y make autoconf automake libtool subversion pkg-config wget

# ubuntu apt has not recent enough mpg123
RUN wget https://www.mpg123.de/snapshot
RUN tar -xvf snapshot
RUN mv mpg123* mpg123

RUN git clone --depth 1 https://github.com/guidovranken/LAME-fuzzers
RUN svn checkout https://svn.code.sf.net/p/lame/svn/trunk/lame $SRC/lame
COPY build.sh $SRC/
