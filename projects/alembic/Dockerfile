
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
RUN apt-get update && apt-get install -y build-essential zlib1g-dev zlib1g-dev:i386 python make automake

RUN git clone --depth 1 https://github.com/alembic/alembic

# Ubuntu's libilmbase-dev package doesn't include static libraries, so we have
# to build OpenEXR from source.
RUN git clone -b v2.5.9 --depth 1 https://github.com/AcademySoftwareFoundation/openexr

COPY build.sh *.h *.cc $SRC/
WORKDIR $WORK/
