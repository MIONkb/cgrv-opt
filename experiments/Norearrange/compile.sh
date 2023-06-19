# ./compile.sh c-file-name function-name

# -fno-inline -fno-unroll-loops
export LLVM_HOME=/home/tianyi/MLIRCGRA/llvm-project/build/bin
export PATH=$LLVM_HOME:$PATH

filename=Norearrange_TOSA
func=forward
########
#### option1: cgiest c/c++->mlir
########
cgeist "$filename".c -function=$func\
        --inbounds-gep  -S -O2 -memref-fullrank -raise-scf-to-affine \
        > 0_"$filename".mlir

cgeist 

########
#### option1: MLIR optimization
########
# perform operation fusion
mlir-opt --linalg-fuse-elementwise-ops 0_"$filename".mlir > 1_fused_"$filename".mlir

# perform finalization
mlir-opt --canonicalize -convert-tensor-to-linalg -linalg-init-tensor-to-alloc-tensor \
        -eliminate-alloc-tensors   -linalg-bufferize -arith-bufferize \
        -tensor-bufferize -func-bufferize   -finalizing-bufferize \
        -buffer-deallocation   --buffer-results-to-out-params --canonicalize -cse \
         1_fused_"$filename".mlir -o 2_finalized_"$filename".mlir\
         --mlir-print-ir-after-change 2>&1 | cat > 2_intermediate_"$filename".mlir

########
#### option1: lower to llvm_dialect & mlir-translate mlir->llvm ir
########
# lower to llvm mlir
mlir-opt -lower-affine --scf-for-loop-canonicalization  -convert-scf-to-cf\
        --arith-expand --memref-expand\
        -convert-memref-to-llvm  --convert-math-to-llvm --convert-math-to-libm\
        --convert-arith-to-llvm\
        --affine-simplify-structures\
        -convert-func-to-llvm=use-bare-ptr-memref-call-conv\
        -reconcile-unrealized-casts \
        2_finalized_"$filename".mlir -o 4_llvm_"$filename".mlir\
        -mlir-print-ir-before-all 2>&1 | cat > 3_intermediate_"$filename".mlir

mlir-opt --affine-simplify-structures \
        -lower-affine -convert-scf-to-cf\
        --loop-restructure\
        --convert-memref-to-llvm 2_finalized_"$filename".mlir -o try.mlir \
        -mlir-print-ir-before-all 2>&1 | cat > try_intermediate_"$filename".mlir

mlir-translate --mlir-to-llvmir 4_llvm_"$filename".mlir > "$filename".ll

cgeist --emit-llvm \
         --enable-loop-simplifycfg-term-folding \
         2_finalized_"$filename".mlir -o try.mlir \
        -mlir-print-ir-before-all 2>&1 | cat > try_intermediate_"$filename".mlir
########
#### option2: clang c->llvm ir
########
clang -I /home/tallanlong/app-compiler-decouple/app-compiler-pattern/applications/MachSuite/common\
          -D CGRA_COMPILER -target i386-unknown-linux-gnu -c -emit-llvm \
         -O2 -fno-tree-vectorize -fno-unroll-loops "$filename".c -S -o "$filename".ll
# clang -D CGRA_COMPILER -target i386-unknown-linux-gnu -c --mmlir "$filename".c  -o "$filename".mlir

filename=gemm_kernel_0
func=gemm_kernel_0
########
#### option1 & 2 all comes to following script: clang c->llvm ir
########
# llvm-opt pre-processing
opt -gvn -mem2reg -memdep -memcpyopt -lcssa -loop-simplify\
         -licm -loop-deletion -indvars -simplifycfg\
         -mergereturn -indvars \
         $filename.ll -S -o "$filename"_gvn.ll

# llvm-opt + libCDFGPass.so llvm ir->dfg.dot
opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so\
         "-fn=$func  -mapping-all=true" -cdfg \
         "$filename"_gvn.ll -S -o "$filename"_cdfg.ll \
         -enable-new-pm=0

opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so\
         "-fn gemm_kernel_0 -mapping-all true" -cdfg\
         gemm_kernel_0_gvn.ll -S -o gemm_kernel_0_cdfg.ll \
         -enable-new-pm=0

# llvm-opt llvm ir->cdfg
opt  --dot-cfg "$filename"_gvn.ll -S -o "$filename"_cdfg.ll -enable-new-pm=0
mv ./."$func".dot ./"$func"_init_cdfg.dot

# opt -load /home/tianyi/fdra/app-compiler/build/llvm-pass/libCDFGPass.so -fn $cfunc -cdfg $cfile_gvn.ll -S -o $cfile_cdfg.ll 

mlir-translate stencil.ll -mlir-conv-eir-to-llvm | mlir-opt -convert-llvm-to-mlir > stencil.mlir


# host: mlir to llvm.ir
cgra-opt 5_gemm_only_host.mlir \
 -convert-memref-to-llvm  --convert-math-to-llvm --convert-math-to-libm\
 --convert-arith-to-llvm