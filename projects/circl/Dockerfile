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

FROM ghcr.io/aixcc-finals/base-builder-go:v1.3.0

RUN apt-get update && apt-get install -y make autoconf automake libtool wget python
RUN git clone --depth 1 https://github.com/MozillaSecurity/cryptofuzz
RUN git clone --depth 1 https://github.com/randombit/botan.git
RUN git clone --depth 1 https://github.com/supranational/blst.git
RUN wget https://archives.boost.io/release/1.84.0/source/boost_1_84_0.tar.bz2
RUN wget https://storage.googleapis.com/pub/gsutil.tar.gz -O $SRC/gsutil.tar.gz
RUN tar zxf $SRC/gsutil.tar.gz
ENV PATH="${PATH}:$SRC/gsutil"
RUN gsutil cp gs://bls-signatures-backup.clusterfuzz-external.appspot.com/corpus/libFuzzer/bls-signatures_cryptofuzz-bls-signatures/public.zip $SRC/cryptofuzz_seed_corpus.zip

COPY build.sh $SRC/
