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

RUN apt-get update && apt-get install -y libssl-dev ninja-build libc6-dev:i386

RUN git clone --depth 1 https://github.com/AFLplusplus/AFLplusplus.git myaflplusplus && \
    cp -r myaflplusplus/dictionaries afldictionaries && \
    cp -r myaflplusplus/testcases afltestcases && \
    rm -rf myaflplusplus

# Simulate a classic Qt folder structure
RUN mkdir qt
WORKDIR $SRC/qt

RUN git clone --branch dev --depth 1 git://code.qt.io/qt/qt5.git && \
    cp -r qt5/cmake . && \
    rm -rf qt5
RUN git clone --branch dev --depth 5000 git://code.qt.io/qt/qtbase.git
RUN git clone --branch dev --depth 1 git://code.qt.io/qt/qtimageformats.git
RUN git clone --branch dev --depth 1 git://code.qt.io/qt/qtsvg.git
RUN cmake -DSYNC_TO_MODULE=qtsvg -DSYNC_TO_BRANCH=dev -P cmake/QtSynchronizeRepo.cmake
RUN git clone --branch dev --depth 1 git://code.qt.io/qt/qtqa.git
RUN cp qtqa/fuzzing/oss-fuzz/build.sh $SRC/
