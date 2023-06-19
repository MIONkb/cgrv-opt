soda-opt \
    -soda-outline-bambu-code \
    -soda-generate-bambu-accelcode \
    -soda-opt-pipeline-for-bambu=use-bare-ptr-memref-call-conv \
    -mlir-print-ir-after-all \
    conv_soda.mlir \
    -o ./04optimized.mlir \
    2>&1 | cat > ./05intermediate-optimized.mlir
        
        
        -soda-extract-arguments-to-xml=using-bare-ptr \



soda-opt --convert-linalg-to-affine-loops linalg-buffers.mlir  > all_affine.mlir

soda-opt --affine-loop-fusion all_affine.mlir > fusion.mlir

soda-opt --convert-affine-for-to-soda   all_affine.mlir > affine_soda.mlir

soda-opt --lower-affine fusion.mlir > scf_loop.mlir

soda-opt -soda-outline-bambu-code  -soda-generate-bambu-accelcode conv_soda.mlir

cgra-opt \
 --fdra-extract-affine-for-to-kernel \
 all_affine.mlir > 1_kernel.mlir

cgra-opt \
--fdra-extract-kernel-to-function=\
"/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel \
kernel-explicit-datablock-trans=false "\
1_kernel.mlir


cgra-opt --arith-expand --memref-expand\
        -lower-affine --scf-for-loop-canonicalization  -convert-scf-to-cf\
        -convert-memref-to-llvm  --convert-math-to-llvm --convert-math-to-libm\
        --convert-arith-to-llvm\
        --affine-simplify-structures\
        -convert-func-to-llvm=use-bare-ptr-memref-call-conv\
        -reconcile-unrealized-casts \
        main_kernel_1.mlir -o 1_llvm_main_kernel_1.mlir\
        -mlir-print-ir-after-all 2>&1 | cat > 1_intermediate_main_kernel_1.mlir

--affine-scalrep
--mlir-print-ir-after-change   

soda-opt     -allow-unregistered-dialect\
    -mlir-print-ir-after-all \
    --convert-affine-for-to-soda\
    -soda-outline-bambu-code\
    -soda-generate-bambu-accelcode \
    0_gemm.mlir -o final_gemm_kernel.mlir\
     2>&1 | cat > intermediate_gemm_kernel.mlir
