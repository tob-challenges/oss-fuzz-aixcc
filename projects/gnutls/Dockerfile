# Copyright 2016 Google Inc.
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
 pkg-config \
 autoconf \
 automake \
 autogen \
 autopoint \
 libtool \
 gperf \
 bison \
 texinfo \
 curl \
 gettext \
 gengetopt \
 wget \
 python \
 mercurial \
 gtk-doc-tools \
 libtasn1-bin \
 lzip

ENV GNULIB_TOOL $SRC/gnulib/gnulib-tool
RUN git clone --depth=1 git://git.savannah.gnu.org/gnulib.git
RUN git clone --depth=1 https://git.savannah.gnu.org/git/libunistring.git
RUN git clone --depth=1 https://gitlab.com/libidn/libidn2.git
RUN hg clone https://gmplib.org/repo/gmp/ gmp || \
    (wget 'https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.lz' && tar xf gmp-6.2.1.tar.lz && mv $SRC/gmp-6.2.1 $SRC/gmp)
RUN git clone https://gitlab.com/gnutls/libtasn1.git
RUN git clone --depth=1 https://git.lysator.liu.se/nettle/nettle.git

RUN git clone --depth=1 --recursive https://gitlab.com/gnutls/gnutls.git

WORKDIR gnutls
COPY build.sh $SRC/
