######
#  Torch mlir to affine
######
/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt \
  --convert-torch-to-linalg --convert-torch-to-arith  \
  --convert-torch-to-tosa --convert-torch-to-tmtensor \
  --torch-func-backend-type-conversion  \
  --torch-finalizing-backend-type-conversion  \
  --convert-tensor-to-linalg \
  Linear_TORCH.mlir > LinalgTensorArith.mlir \
  --mlir-print-ir-after-all

/home/tianyi/Torchmlir/torch-mlir-main/build/bin/torch-mlir-opt  \
 --empty-tensor-to-alloc-tensor --linalg-bufferize \
 --tensor-bufferize --func-bufferize --arith-bufferize --bufferization-bufferize \
 --convert-linalg-to-affine-loops \
 LinalgTensorArith.mlir > 0_all_Affine.mlir \
 --mlir-print-ir-after-all

cgra-opt  --fdra-extract-affine-for-to-kernel  0_all_Affine.mlir > 1_kernel.mlir

cgra-opt \
 --fdra-extract-kernel-to-function=\
 "kernel-gen-dir=/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel \
 kernel-explicit-datablock-trans=false" \
 1_kernel.mlir

