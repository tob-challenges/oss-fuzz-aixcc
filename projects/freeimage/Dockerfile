# Copyright 2018 Google Inc.
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
RUN apt-get update && apt-get install -y make autoconf automake libtool wget dos2unix
RUN svn checkout https://svn.code.sf.net/p/freeimage/svn/ freeimage-svn
WORKDIR $SRC/freeimage-svn/FreeImage/trunk/
RUN wget "https://salsa.debian.org/debian-phototools-team/jxrlib/-/raw/7e12ab1185b347c0edfd893471c055e3ae7830b5/debian/patches/082bb032be1f6c75173bf603252e4f37bfded9fa.patch" --output-document=$SRC/jxrlib_tmpnam.patch
COPY build.sh $SRC/
COPY load_from_memory_fuzzer.cc $SRC/
