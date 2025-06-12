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

FROM ghcr.io/aixcc-finals/base-builder:v1.2.1
RUN apt-get update && apt-get install -y libz-dev autoconf 
#RUN hg clone https://hg.ucc.asn.au/dropbear-fuzzcorpus dropbear-corpus
#RUN git clone https://github.com/mkj/dropbear dropbear

WORKDIR $SRC
COPY pkgs/dropbear-corpus.tar.gz $SRC/dropbear-corpus.tar.gz
COPY pkgs/dropbear.tar.gz $SRC/dropbear.tar.gz
RUN tar -zxf $SRC/dropbear-corpus.tar.gz && rm $SRC/dropbear-corpus.tar.gz
RUN tar -zxf $SRC/dropbear.tar.gz && rm $SRC/dropbear.tar.gz

WORKDIR dropbear
COPY build.sh *.options $SRC/

