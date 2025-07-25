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
RUN apt-get update && apt-get install -y nasm pkg-config rsync autoconf libtool gperf
RUN curl -LO https://mirrors.kernel.org/ubuntu/pool/main/a/automake-1.16/automake_1.16.5-1.3_all.deb && \
    apt install ./automake_1.16.5-1.3_all.deb
RUN python3 -m pip install --upgrade pip && python3 -m pip install -U meson ninja

RUN git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg

RUN curl -O https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.12.tar.bz2
RUN git clone --depth 1 https://github.com/mstorsjo/fdk-aac.git
RUN git clone --depth 1 https://gitlab.freedesktop.org/fontconfig/fontconfig.git
RUN git clone --depth 1 https://gitlab.freedesktop.org/freetype/freetype.git
RUN git clone --depth 1 https://github.com/fribidi/fribidi
RUN git clone --depth 1 https://github.com/harfbuzz/harfbuzz
RUN git clone --depth 1 https://github.com/libass/libass
RUN git clone --depth 1 https://github.com/madler/zlib
RUN git clone --depth 1 https://gitlab.com/federicomenaquintero/bzip2
RUN git clone --depth 1 https://chromium.googlesource.com/webm/libvpx
RUN git clone --depth 1 https://gitlab.xiph.org/xiph/ogg.git
RUN git clone --depth 1 https://gitlab.xiph.org/xiph/opus.git
RUN git clone --depth 1 https://gitlab.xiph.org/xiph/theora.git
RUN git clone --depth 1 https://gitlab.xiph.org/xiph/vorbis.git
RUN git clone --depth 1 https://gitlab.gnome.org/GNOME/libxml2.git

COPY build.sh group_seed_corpus.py $SRC/
