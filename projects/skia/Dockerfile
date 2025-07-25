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

# Mesa,libz/zlib, and xcb needed to build swiftshader
RUN apt-get update && apt-get install -y python3 wget libglu1-mesa-dev cmake zlib1g-dev libxext-dev libxcb-shm0-dev

RUN git clone 'https://chromium.googlesource.com/chromium/tools/depot_tools.git' --depth 1
ENV PATH="${SRC}/depot_tools:${PATH}"

RUN git clone https://skia.googlesource.com/skia.git --depth 1

# current directory for build script
WORKDIR skia

ENV GIT_SYNC_DEPS_SKIP_EMSDK=1
ENV GIT_SYNC_DEPS_SHALLOW_CLONE=1
ENV GIT_SYNC_DEPS_QUIET=0
RUN python3 tools/git-sync-deps
RUN python3 bin/fetch-gn
RUN python3 bin/fetch-ninja

# Make a directory for fuzzing artifacts that won't be clobbered by CIFuzz.
RUN mkdir $SRC/skia_data

RUN wget -O $SRC/skia_data/image_filter_deserialize_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/image_filter_deserialize_seed_corpus.zip

RUN wget -O $SRC/skia_data/region_set_path_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/region_set_path_seed_corpus.zip

RUN wget -O $SRC/skia_data/textblob_deserialize_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/textblob_deserialize_seed_corpus.zip

RUN wget -O $SRC/skia_data/path_deserialize_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/path_deserialize_seed_corpus.zip

RUN wget -O $SRC/skia_data/image_decode_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/image_decode_seed_corpus.zip

RUN wget -O $SRC/skia_data/animated_image_decode_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/animated_image_decode_seed_corpus.zip

RUN wget -O $SRC/skia_data/api_draw_functions_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/api_draw_functions_seed_corpus.zip

RUN wget -O $SRC/skia_data/api_gradients_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/api_gradients_seed_corpus.zip

RUN wget -O $SRC/skia_data/api_image_filter_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/api_image_filter_seed_corpus.zip

RUN wget -O $SRC/skia_data/api_path_measure_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/api_path_measure_seed_corpus.zip

RUN wget -O $SRC/skia_data/api_pathop_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/api_pathop_seed_corpus.zip

RUN wget -O $SRC/skia_data/canvas_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/canvas_seed_corpus.zip

RUN wget -O $SRC/skia_data/encoder_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/encoder_seed_corpus.zip

RUN wget -O $SRC/skia_data/skottie_json_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/skottie_json_seed_corpus.zip

RUN wget -O $SRC/skia_data/skjson_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/skjson_seed_corpus.zip

RUN wget -O $SRC/skia_data/api_polyutils_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/api_polyutils_seed_corpus.zip

RUN wget -O $SRC/skia_data/sksl_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/sksl_seed_corpus.zip

RUN wget -O $SRC/skia_data/skmeshspecification_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/skmeshspecification_seed_corpus.zip

RUN wget -O $SRC/skia_data/svg_dom_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/svg_seed_corpus.zip

RUN wget -O $SRC/skia_data/skp_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/skp_seed_corpus.zip

RUN wget -O $SRC/skia_data/skdescriptor_deserialize_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/skdescriptor_deserialize_seed_corpus.zip

RUN wget -O $SRC/skia_data/colrv1_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/colrv1_seed_corpus.zip

RUN wget -O $SRC/skia_data/skcolorspace_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/skcolorspace_seed_corpus.zip

RUN wget -O $SRC/skia_data/parse_path_seed_corpus.zip https://storage.googleapis.com/skia-fuzzer/oss-fuzz/parse_path_corpus.zip

COPY image_filter_deserialize_width.options $SRC/skia_data/image_filter_deserialize_width.options

COPY json.dict $SRC/skia_data/json.dict

COPY sksl.dict $SRC/skia_data/sksl.dict

WORKDIR $SRC/skia

COPY build.sh $SRC/
