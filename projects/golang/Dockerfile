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

FROM ghcr.io/aixcc-finals/base-builder-go:v1.3.0

RUN git clone --depth 1 https://github.com/dvyukov/go-fuzz-corpus golang
RUN git clone --depth 1 https://github.com/golang/go
RUN git clone --depth 1 https://github.com/golang/net
RUN git clone --depth 1 https://github.com/golang/image
RUN git clone --depth 1 https://github.com/golang/crypto
RUN git clone --depth 1 https://github.com/golang/text
RUN git clone --depth 1 https://github.com/AdamKorcz/instrumentation
RUN git clone --depth=1 https://github.com/AdamKorcz/go-118-fuzz-build --branch=november-backup
RUN wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz \
    && mkdir temp-go \
    && rm -rf /root/.go/* \
    && tar -C temp-go/ -xzf go1.23.4.linux-amd64.tar.gz \
    && mv temp-go/go/* /root/.go/
COPY build.sh text_fuzzer.go \
     math_big_fuzzer.go \
     fuzz_tar_reader.go \
     fuzz_tar_reader.options \
     regexp_fuzzer.go \
     language_fuzzer.go \
     unicode_fuzzer.go \
     x509_fuzzer.go \
     ecdsa_fuzzer.go \
     dsa_fuzzer.go \
     aes_fuzzer.go \
     h2c_fuzzer.go \
     fuzz_x_h2c.options \
     elf_fuzzer.go \
     tiff_fuzzer.go \
     fuzz_tiff_decode.options \
     openpgp_fuzzer.go \
     webp_fuzzer.go \
     filepath_fuzzer.go \
     strings_fuzzer.go \
     multipart_fuzzer.go \
     encoding_fuzzer.go \
     glob_fuzzer.options $SRC/

WORKDIR $SRC/golang
