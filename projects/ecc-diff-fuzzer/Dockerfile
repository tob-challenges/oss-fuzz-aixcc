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

FROM ghcr.io/aixcc-finals/base-builder-rust:v1.3.0
ENV GOPATH /root/go
ENV PATH $PATH:/root/.go/bin:$GOPATH/bin
RUN install_go.sh
RUN apt-get update && apt-get install -y make cmake bzip2 autoconf automake gettext libtool python curl
RUN rustup target add i686-unknown-linux-gnu
#use different package sources for recent npm
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install -y nodejs
RUN npm install -g browserify
RUN npm install elliptic
# mbedtls needs jsonschema which needs rpds-py which needs pip>=20
# or a Rust toolchain.
RUN pip3 install 'pip>=20'

RUN git clone --depth 1 https://github.com/bellard/quickjs quickjs
RUN git clone --depth 1 https://github.com/catenacyber/elliptic-curve-differential-fuzzer.git ecfuzzer
RUN git clone --recursive --depth 1 -b development https://github.com/Mbed-TLS/mbedtls.git mbedtls
# needed to compile mbedtls
RUN pip3 install -r $SRC/mbedtls/scripts/basic.requirements.txt
RUN git clone --depth 1 https://github.com/libecc/libecc.git libecc
RUN git clone --depth 1 https://github.com/openssl/openssl.git openssl
RUN git clone --depth 1 git://git.gnupg.org/libgpg-error.git libgpg-error
RUN git clone --depth 1 git://git.gnupg.org/libgcrypt.git gcrypt
RUN git clone --depth 1 https://github.com/weidai11/cryptopp cryptopp
ADD https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.bz2 gmp-6.2.1.tar.bz2
RUN git clone --depth 1 https://github.com/gnutls/nettle.git nettle
RUN git clone --depth 1 https://github.com/randombit/botan.git botan
WORKDIR $SRC/
COPY build.sh $SRC/
