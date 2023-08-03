#!/usr/bin/env bash

######
#  Torch mlir to affine
######
rootfolder=$(pwd)
# /home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt \
#   --convert-torch-to-linalg --convert-torch-to-arith  \
#   --convert-torch-to-tmtensor \
#   --torch-func-backend-type-conversion  \
#   --torch-finalizing-backend-type-conversion  \
#   --convert-tensor-to-linalg --allow-unregistered-dialect\
#   TORCH.mlir > LinalgTensorArith.mlir 
#   # --mlir-print-ir-after-all

/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt  \
 --func-bufferize --arith-bufferize --linalg-bufferize\
 --refback-generalize-tensor-pad \
 --bufferization-bufferize \
 --empty-tensor-to-alloc-tensor  --convert-tensor-to-linalg \
 --linalg-bufferize --tensor-bufferize -finalizing-bufferize --promote-buffers-to-stack \
 --convert-linalg-to-affine-loops  \
 --canonicalize \
 LINALG_TENSOR.mlir -o 0_all_Affine.mlir \
 --mlir-print-ir-after-all 2>&1 | cat > 0_intermediate_before_affine.mlir

/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt  \
 --convert-bufferization-to-memref \
 0_all_Affine.mlir -o 0_all_Affine_2.mlir \
 --mlir-print-ir-after-all 2>&1 | cat > 0_intermediate_before_affine_2.mlir

cgra-opt  --fdra-extract-affine-for-to-kernel  0_all_Affine.mlir > 1_kernel.mlir

cgra-opt --affine-loop-fusion  --arith-expand --memref-expand -reconcile-unrealized-casts \
 --fdra-hoist-loadstore \
 --fdra-extract-kernel-to-function="kernel-gen-dir=$rootfolder kernel-explicit-datablock-trans=false" \
 1_kernel.mlir > 2_host.mlir
