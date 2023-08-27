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
#   Linear_TORCH.mlir > LinalgTensorArith.mlir \
#   --mlir-print-ir-after-all



/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt  \
 --convert-tensor-to-linalg  -empty-tensor-to-alloc-tensor \
 --eliminate-empty-tensors  -linalg-bufferize \
 -buffer-results-to-out-params --cse --canonicalize \
 -linalg-generalize-named-ops \
 -arith-bufferize -func-bufferize  -tensor-bufferize \
 -convert-linalg-to-affine-loops -fold-memref-alias-ops --canonicalize \
 LINALG_TENSOR.mlir -o 0_all_Affine.mlir \
 --mlir-print-ir-after-all 2>&1 | cat > 0_intermediate_before_affine.mlir

cgra-opt --affine-loop-fusion \
 --fdra-approximate-math \
 --fdra-hoist-loadstore \
 --fdra-extract-affine-for-to-kernel \
 --fdra-adjust-kernel-mem-footprint="cachesize=8 singlearraysize=8 access-pattern disable-remainder-block" \
 0_all_Affine.mlir -o 1_kernel.mlir

cgra-opt  --arith-expand --memref-expand -reconcile-unrealized-casts \
 --fdra-extract-kernel-to-function="kernel-gen-dir=$rootfolder kernel-explicit-datablock-trans=true" \
 --canonicalize \
 1_kernel.mlir -o 2_host.mlir \
 --mlir-print-ir-after-all 2>&1 | cat > 2_intermediate_before_host.mlir
