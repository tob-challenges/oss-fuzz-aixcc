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

FROM ghcr.io/aixcc-finals/base-builder-jvm:v1.3.0

RUN git clone https://github.com/apache/groovy.git
COPY *.diff $SRC/
RUN cd groovy && tr -d '\015' < $SRC/add-shadow-to-test.diff | git apply

COPY build.sh $SRC/
COPY *.java $SRC/
WORKDIR $SRC/groovy
