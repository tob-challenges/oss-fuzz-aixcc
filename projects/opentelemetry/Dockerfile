# Copyright 2024 Google LLC
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

FROM ghcr.io/aixcc-finals/base-builder-go:v1.3.0
RUN git clone --depth 1 https://github.com/open-telemetry/opentelemetry-collector
RUN git clone --depth=1 --branch=include-all-test-files https://github.com/AdamKorcz/go-118-fuzz-build $SRC/go-118-fuzz-build
RUN git clone --depth=1 https://github.com/dvyukov/go-fuzz-corpus
RUN git clone --depth 1 https://github.com/AdamKorcz/opentelemetry-collector-contrib --branch=fuzz
WORKDIR opentelemetry-collector
COPY build.sh dict $SRC/
