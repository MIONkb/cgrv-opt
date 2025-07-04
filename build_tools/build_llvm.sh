#!/bin/bash
# Copyright 2020 The TensorFlow Authors. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script was modified from:
# https://raw.githubusercontent.com/tensorflow/mlir-hlo/master/build_tools/build_mlir.sh

set -e

if [[ $# -ne 3 ]] ; then
  echo "Usage: $0 <path/to/llvm> <build_dir> <install_dir>"
  exit 1
fi

# LLVM source
LLVM_SRC_DIR="$1"
build_dir="$2"
install_dir="$3"

if ! [ -f "$LLVM_SRC_DIR/llvm/CMakeLists.txt" ]; then
  echo "Expected the path to LLVM to be set correctly (got '$LLVM_SRC_DIR'): can't find CMakeLists.txt"
  exit 1
fi
echo "Using LLVM source dir: $LLVM_SRC_DIR"

# Setup directories.
echo "Building MLIR in $build_dir"
mkdir -p "$build_dir"
echo "Creating directory to install: $install_dir"
mkdir -p "$install_dir"

echo "Beginning build (commands will echo)"
set -x


LLVM_SRC_DIR=/home/tianyi/Tools/llvm-18/
build_dir=$LLVM_SRC_DIR/build
install_dir=$LLVM_SRC_DIR/build

cmake -GNinja \
  "-H$LLVM_SRC_DIR/llvm" \
  "-B$build_dir" \
  -DCMAKE_INSTALL_PREFIX=$install_dir  \
  -DLLVM_INSTALL_UTILS=ON   \
  -DLLVM_ENABLE_LLD=ON   \
  -DLLVM_ENABLE_PROJECTS="mlir"   \
  -DLLVM_TARGETS_TO_BUILD="host;RISCV"   \
  -DLLVM_INCLUDE_TOOLS=ON   \
  -DLLVM_BUILD_TOOLS=ON   \
  -DLLVM_INCLUDE_TESTS=ON   \
  -DMLIR_INCLUDE_TESTS=ON   \
  -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DLLVM_ENABLE_ASSERTIONS=On \
  -DLLVM_BUILD_EXAMPLES=OFF 

 # TODO check what these options do :
 # -DLLVM_OPTIMIZED_TABLEGEN=ON -DLLVM_ENABLE_OCAMLDOC=OFF -DLLVM_ENABLE_BINDINGS=OFF 

cmake --build "$build_dir" --target opt mlir-opt mlir-translate mlir-cpu-runner install
ninja -j 7 install 