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

FROM ghcr.io/aixcc-finals/base-builder:v1.3.0

# Install prerequisite packages
# See connectedhomeip/docs/guides/BUILDING.md#prerequisites
RUN apt-get update && \
    apt-get install -y pkg-config libssl-dev libdbus-1-dev libglib2.0-dev \
        libavahi-client-dev ninja-build \
        unzip libgirepository1.0-dev libcairo2-dev libreadline-dev

# Installing Python3.10 and using it instead of the default Python taken from the base-builder image
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y pkg-config python3.10 python3.10-dev python3.10-venv && \
    ln --force -s /usr/bin/python3.10 /usr/bin/python3

# Ensure python that was just installed gets precedence over
# the one already installed in /usr/local/bin
ENV PATH="/usr/bin/:${PATH}"

RUN python3 -m ensurepip --upgrade

# PEP-517 needed for cryptography. Update pip
RUN python3 -m pip install --upgrade pip setuptools wheel

# Install Rust for building `cryptography` python package when bootstraping pigweed
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup install nightly
RUN rustup default nightly

RUN git clone --depth=1 https://github.com/project-chip/connectedhomeip.git connectedhomeip


# Ensure global python has access to build requirements
RUN pip3 install -r connectedhomeip/scripts/setup/requirements.build.txt

# checkout submodules required for linux
RUN cd $SRC/connectedhomeip && scripts/checkout_submodules.py --shallow --platform linux

# Bootstrap pigweed environment
SHELL ["/bin/bash", "-c"]
RUN cd $SRC/connectedhomeip && . scripts/bootstrap.sh

COPY build.sh $SRC/
