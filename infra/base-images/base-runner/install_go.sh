#!/bin/bash -eux
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

# Download and install Go 1.19.
case $(uname -m) in
    x86_64)
      wget -q https://storage.googleapis.com/golang/getgo/installer_linux -O $SRC/installer_linux
      chmod +x $SRC/installer_linux
      SHELL="bash" $SRC/installer_linux -version 1.19
      rm $SRC/installer_linux
      ;;
    aarch64)
      wget -q https://dl.google.com/go/go1.19.linux-arm64.tar.gz -O $SRC/go.tar.gz
      ( cd /tmp && tar xzf $SRC/go.tar.gz && mv go /root/.go )
      ;;
    *)
      echo "Error: unsupported architecture: $(uname -m)"
      exit 1
      ;;
esac

# Set up Golang coverage modules.
printf $(find . -name gocoverage)
cd $GOPATH/gocoverage && /root/.go/bin/go install ./...
cd convertcorpus && /root/.go/bin/go install .
cd /root/.go/src/cmd/cover && /root/.go/bin/go build && mv cover $GOPATH/bin/gotoolcover
