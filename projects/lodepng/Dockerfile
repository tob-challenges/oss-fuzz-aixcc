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
RUN apt-get update && apt-get install -y make autoconf automake libtool
RUN git clone --depth 1 https://github.com/lvandeve/lodepng.git lodepng     # or use other version control
WORKDIR lodepng
ADD http://oss-fuzz-corpus.storage.googleapis.com/lodepng/lodepng_fuzzer_seed_corpus.zip $SRC/
ADD https://raw.githubusercontent.com/google/AFL/master/dictionaries/png.dict $SRC/lodepng_fuzzer.dict
COPY build.sh $SRC/
