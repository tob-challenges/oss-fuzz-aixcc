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
RUN apt-get update && apt-get install -y ffmpeg python3-pip gtk-doc-tools libffi-dev
RUN pip3 install meson==0.55.3 ninja

RUN git clone --depth 1 https://gitlab.gnome.org/GNOME/gdk-pixbuf.git
ADD https://ftp.gnome.org/pub/gnome/sources/glib/2.64/glib-2.64.2.tar.xz $SRC
RUN tar xvJf $SRC/glib-2.64.2.tar.xz

RUN python3 -m pip install --upgrade pip && python3 -m pip install corpus-replicator
RUN corpus-replicator -o corpus image_gif_gif_ffmpeg.yml image_jpg_jpg_ffmpeg.yml image_png_png_ffmpeg.yml image
RUN git clone --depth 1 https://github.com/glennrp/libpng.git && \
    find $SRC/gdk-pixbuf/tests/ \( -name '*.jpeg' -o -name '*.jpg' -o -name '*.png' \) -exec cp -v '{}' corpus/ ';' && \
    find $SRC/libpng -name "*.png" | grep -v crashers | xargs cp -t corpus/ && \
    zip -q $SRC/gdk-pixbuf_seed_corpus.zip corpus/* && \
    rm -rf libpng corpus

ADD https://raw.githubusercontent.com/google/fuzzing/master/dictionaries/png.dict $SRC/png.dict
ADD https://raw.githubusercontent.com/google/fuzzing/master/dictionaries/jpeg.dict $SRC/jpeg.dict
ADD https://raw.githubusercontent.com/google/fuzzing/master/dictionaries/gif.dict $SRC/gif.dict
RUN awk 1 $SRC/*.dict > $SRC/gdk-pixbuf.dict && \
    rm -f $SRC/png.dict $SRC/jpeg.dict $SRC/gif.dict

WORKDIR $SRC/gdk-pixbuf
COPY targets $SRC/fuzz
COPY build.sh $SRC/
