#!/usr/bin/python3
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
FROM ghcr.io/aixcc-finals/base-builder-python:v1.3.0
RUN git clone https://github.com/googleapis/python-bigquery-storage python-bigquery-storage
RUN python3 -m pip install --upgrade pip mock google-api-core google-cloud-core fastavro
COPY *.sh *py $SRC/
WORKDIR $SRC/python-bigquery-storage
