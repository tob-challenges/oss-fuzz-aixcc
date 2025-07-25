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

RUN apt-get update && apt-get install -y \
  make \
  autoconf \
  automake \
  libtool \
  pkg-config \
  libxml2-utils \
  libxml2-dev \
  xsltproc \
  libprotobuf-dev \
  protobuf-compiler \
  libdbus-1-dev \
  libdbus-glib-1-dev \
  libgio2.0-cil-dev \
  libgcrypt20-dev \
  libpolkit-gobject-1-dev \
  libseccomp-dev \
  libcap-ng-dev

RUN git clone https://github.com/ClusterLabs/libqb && cd libqb && \
    ./autogen.sh && ./configure && make && make install

RUN git clone --recurse-submodules --depth 1 \
  https://github.com/USBGuard/usbguard usbguard
WORKDIR usbguard
COPY build.sh $SRC
