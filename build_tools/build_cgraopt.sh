#!/bin/bash
LLVM_BUILD_DIR=/home/tianyi/Tools/llvm-18/build
LLVM_INSTALL_DIR=/home/tianyi/Tools/llvm-18/build

# ......................................................................
cmake -GNinja \
  ..\
  -DCMAKE_BUILD_TYPE=Debug \
  -DLLVM_EXTERNAL_LIT=$LLVM_BUILD_DIR/bin/llvm-lit \
  -DMLIR_DIR=$LLVM_INSTALL_DIR/lib/cmake/mlir \
  -DMLIR_ENABLE_BINDINGS_PYTHON=ON

cmake --build . --target cgra-opt
