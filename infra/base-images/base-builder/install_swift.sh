#!/bin/bash -eux
# Copyright 2021 Google LLC
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


SWIFT_PACKAGES="wget \
          binutils \
          git \
          gnupg2 \
          libc6-dev \
          libcurl4 \
          libedit2 \
          libgcc-9-dev \
          libpython2.7 \
          libsqlite3-0 \
          libstdc++-9-dev \
          libxml2 \
          libz3-dev \
          pkg-config \
          tzdata \
          zlib1g-dev"
SWIFT_SYMBOLIZER_PACKAGES="build-essential make cmake ninja-build git python3 binutils-dev zlib1g-dev"

UNAME_OUTPUT=$(uname -m)
if [[ "${UNAME_OUTPUT}" == "aarch64" ]] ; then
  SWIFT_TARBALL_NAME="swift-5.10.1-RELEASE-amazonlinux2-aarch64"
  SWIFT_TARBALL_URL="https://download.swift.org/swift-5.10.1-release/amazonlinux2-aarch64/swift-5.10.1-RELEASE/${SWIFT_TARBALL_NAME}.tar.gz"

  LLVM_TARGETS_TO_BUILD="AArch64"

else
  SWIFT_TARBALL_NAME="swift-5.10.1-RELEASE-ubuntu20.04"
  SWIFT_TARBALL_URL="https://download.swift.org/swift-5.10.1-release/ubuntu2004/swift-5.10.1-RELEASE/${SWIFT_TARBALL_NAME}.tar.gz"

  SWIFT_SYMBOLIZER_PACKAGES="${SWIFT_SYMBOLIZER_PACKAGES} g++-multilib"
  LLVM_TARGETS_TO_BUILD="X86"
fi

apt-get update && apt install -y $SWIFT_PACKAGES && \
  apt install -y $SWIFT_SYMBOLIZER_PACKAGES --no-install-recommends

wget -q "${SWIFT_TARBALL_URL}"
tar xzf "${SWIFT_TARBALL_NAME}.tar.gz"

cp -r ${SWIFT_TARBALL_NAME}/usr/* /usr/
rm -rf ${SWIFT_TARBALL_NAME}.tar.gz ${SWIFT_TARBALL_NAME}/

# TODO: Move to a separate work dir
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
git checkout 63bf228450b8403e0c5e828d276be47ffbcd00d0 # TODO: Keep in sync with base-clang.
git apply ../llvmsymbol.diff --verbose
cmake -G "Ninja" \
    -DLIBCXX_ENABLE_SHARED=OFF \
    -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \
    -DLIBCXXABI_ENABLE_SHARED=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD=${LLVM_TARGETS_TO_BUILD} \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_BUILD_TESTS=OFF \
    -DLLVM_INCLUDE_TESTS=OFF llvm
ninja -j$(nproc) llvm-symbolizer
cp bin/llvm-symbolizer /usr/local/bin/llvm-symbolizer-swift

cd $SRC
rm -rf llvm-project llvmsymbol.diff

# TODO: Cleanup packages
apt-get remove --purge -y wget zlib1g-dev
apt-get autoremove -y
