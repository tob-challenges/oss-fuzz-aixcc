# Copyright 2023 Google LLC
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

FROM ghcr.io/aixcc-finals/base-builder-python:v1.3.0

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends\
        cmake \
        make \
        pkg-config \
        clang \
        libjpeg-dev \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get purge -y gcc && apt-get autoremove -y && apt-get clean

RUN pip3 install --upgrade pip
RUN git clone --depth 1 https://github.com/pikepdf/pikepdf.git pikepdf \
        && cp pikepdf/fuzzing/build.sh $SRC/
RUN git clone --depth 1 https://github.com/qpdf/qpdf.git qpdf

WORKDIR pikepdf

