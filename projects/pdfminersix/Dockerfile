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
RUN pip3 install --upgrade pip
RUN mkdir $SRC/corpus
RUN git clone --depth 1 https://github.com/pdfminer/pdfminer.six.git pdfminer.six \
        && cp pdfminer.six/fuzzing/build.sh $SRC/ \
	&& mkdir -p $SRC/corpus \
	&& find "pdfminer.six/samples/" -type f -exec cp {} "$SRC/corpus" \;
WORKDIR $SRC/pdfminer.six

