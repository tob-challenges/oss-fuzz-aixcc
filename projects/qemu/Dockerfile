# Copyright 2020 Google Inc.
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
ARG glib_tag=2.78.4
RUN apt-get update && apt-get install -y make autoconf automake libtool ninja-build  \
    libfdt-dev libpixman-1-dev zlib1g-dev libslirp-dev patchelf wget \
    libattr1 libattr1-dev libcap-ng-dev pkg-config
RUN git clone --depth 1 --branch $glib_tag https://gitlab.gnome.org/GNOME/glib
RUN git clone --depth 1 https://git.qemu.org/git/qemu.git qemu
WORKDIR qemu
COPY build.sh $SRC/
