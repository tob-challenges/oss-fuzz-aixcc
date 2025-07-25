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

FROM ghcr.io/aixcc-finals/base-builder-python:v1.3.0
# Numpy requires python3.11+
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y python3.11 python3.11-dev && \
    update-alternatives --install /usr/local/bin/python3 python $(which python3.11) 5
# Install Python dependencies for python 3.11
RUN curl -LO https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    python3 -m pip install --root-user-action=ignore atheris pyinstaller
RUN git clone https://github.com/numpy/numpy && cd numpy && git submodule update --init
WORKDIR $SRC
COPY *.options *.py build.sh $SRC/
