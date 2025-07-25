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
RUN apt-get update && \
    apt-get install -y python3-pip gtk-doc-tools libffi-dev autotools-dev libtool gperf
RUN pip3 install -U meson==1.4.0 ninja packaging

RUN git clone --depth 1 git://git.sv.nongnu.org/freetype/freetype2.git
RUN git clone --depth 1 https://gitlab.gnome.org/GNOME/glib
RUN git clone --depth 1 https://gitlab.freedesktop.org/cairo/cairo.git && \
    zip -q $SRC/cairo_seed_corpus.zip $SRC/cairo/test/reference/* && \
    zip -q $SRC/svg-render-fuzzer_seed_corpus.zip $SRC/cairo/test/svg/*.svg

ADD https://raw.githubusercontent.com/google/fuzzing/master/dictionaries/png.dict $SRC/cairo.dict
ADD https://raw.githubusercontent.com/google/fuzzing/master/dictionaries/svg.dict $SRC/svg-render-fuzzer.dict

WORKDIR $SRC/cairo
COPY targets $SRC/fuzz
COPY build.sh $SRC/
