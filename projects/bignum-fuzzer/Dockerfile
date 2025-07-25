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
# ! Project pinned after a clang update and an afl link error. Log: https://oss-fuzz-gcb-logs.storage.googleapis.com/log-6083635a-3f72-444d-80ef-3a0a26670cf7.txt
RUN apt-get update && apt-get install -y software-properties-common curl sudo mercurial autoconf bison texinfo libboost-all-dev cmake wget lzip
RUN wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz && ldconfig
ENV PATH=$PATH:/usr/local/go/bin

RUN apt-get update && apt-get install -y \
    python-all-dev \
    python3-all-dev \
    python3-pip
# mbedtls needs jsonschema which needs rpds-py which needs pip>=20
# or a Rust toolchain.
RUN pip3 install 'pip>=20'

RUN git clone --depth 1 --recurse-submodules -b mbedtls-3.6 https://github.com/Mbed-TLS/mbedtls
# Install Python packages from PyPI
RUN pip3 install -r $SRC/mbedtls/scripts/basic.requirements.txt

RUN wget https://www.bytereef.org/software/mpdecimal/releases/mpdecimal-4.0.0.tar.gz
RUN git clone --depth 1 https://github.com/guidovranken/bignum-fuzzer
RUN git clone --depth 1 https://github.com/openssl/openssl
RUN git clone https://boringssl.googlesource.com/boringssl
RUN hg clone https://gmplib.org/repo/gmp/ libgmp/ || \
    (wget 'https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.lz' && tar xf gmp-6.2.1.tar.lz && mv $SRC/gmp-6.2.1/ $SRC/libgmp/)

COPY build.sh $SRC/
