######
#  Torch mlir to affine
######
rootfolder=$(pwd)
/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt \
  --convert-torch-to-linalg --convert-torch-to-arith  \
  --convert-torch-to-tmtensor \
  --torch-func-backend-type-conversion  \
  --torch-finalizing-backend-type-conversion  \
  --convert-tensor-to-linalg --allow-unregistered-dialect\
  Linear_TORCH.mlir > LinalgTensorArith.mlir \
  --mlir-print-ir-after-all



/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt  \
 --convert-tensor-to-linalg  -empty-tensor-to-alloc-tensor \
 --eliminate-empty-tensors  -linalg-bufferize \
 -buffer-deallocation -buffer-results-to-out-params --cse --canonicalize \
 -linalg-generalize-named-ops \
 -arith-bufferize -func-bufferize  -tensor-bufferize \
 -convert-linalg-to-affine-loops -fold-memref-alias-ops --canonicalize \
 LinalgTensorArith.mlir -o 0_all_Affine.mlir \
 --mlir-print-ir-after-all 2>&1 | cat > 0_intermediate_before_affine.mlir

cgra-opt  --fdra-extract-affine-for-to-kernel  0_all_Affine.mlir > 1_kernel.mlir

cgra-opt --affine-loop-fusion  --arith-expand --memref-expand -reconcile-unrealized-casts \
 --fdra-hoist-loadstore \
 --fdra-extract-kernel-to-function="kernel-gen-dir=$rootfolder kernel-explicit-datablock-trans=false" \
 1_kernel.mlir > 2_host.mlir