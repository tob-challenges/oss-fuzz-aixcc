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
RUN apt-get update && apt-get install --yes cmake make autoconf automake autopoint libtool wget po4a ninja-build pkgconf
RUN git clone --depth 1 https://github.com/madler/zlib.git
RUN git clone --depth 1 https://github.com/facebook/zstd.git
RUN git clone --depth 1 https://github.com/nih-at/libzip.git
RUN wget https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz
RUN git clone https://github.com/tukaani-project/xz.git
RUN git clone --depth 1 --branch=dev git://code.qt.io/qt/qtbase.git
RUN git clone --depth 1 -b master https://invent.kde.org/frameworks/extra-cmake-modules.git
RUN git clone --depth 1 -b master https://invent.kde.org/frameworks/karchive.git
COPY build.sh $SRC
COPY karchive_fuzzer.cc $SRC
WORKDIR karchive
