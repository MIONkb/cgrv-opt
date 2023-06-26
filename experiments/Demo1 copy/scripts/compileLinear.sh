######
#  Torch mlir to affine
######
/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt \
  --convert-torch-to-linalg --convert-torch-to-arith  \
  --convert-torch-to-tmtensor \
  --torch-func-backend-type-conversion  \
  --torch-finalizing-backend-type-conversion  \
  --convert-tensor-to-linalg --allow-unregistered-dialect\
  Linear_TORCH.mlir > LinalgTensorArith.mlir \
  --mlir-print-ir-after-all

/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt  \
 --empty-tensor-to-alloc-tensor  --promote-buffers-to-stack --linalg-bufferize \
 --tensor-bufferize --func-bufferize --arith-bufferize --bufferization-bufferize \
 --convert-linalg-to-affine-loops  --promote-buffers-to-stack --canonicalize\
 LinalgTensorArith.mlir -o 0_all_Affine.mlir \
 --mlir-print-ir-after-all 2>&1 | cat > 0_intermediate_before_affine.mlir

cgra-opt  --fdra-extract-affine-for-to-kernel  0_all_Affine.mlir > 1_kernel.mlir

cgra-opt --affine-loop-fusion  --arith-expand --memref-expand -reconcile-unrealized-casts \
 --fdra-extract-kernel-to-function='kernel-gen-dir=/home/tianyi/fdra/app-compiler/cgra-opt/experiments/Demo1 kernel-explicit-datablock-trans=false' \
 1_kernel.mlir > 2_host.mlir
