#!/bin/bash

# 指定文件夹路径

rootfolder=$(pwd)
srcfolder="$rootfolder/kernels"
tarfolder="$rootfolder/1_kernels_llvmmlir"
tempfolder="$rootfolder/tempfiles"
echo "current path:$rootfolder"

if [ ! -d "$tarfolder" ]; then
  echo mkdir -p "$tarfolder"
  mkdir -p "$tarfolder"
fi

cd $tarfolder
if [[ "$(pwd)" == "$tarfolder" ]]; then
  rm *.mlir
else
  echo "error: Not in target folder!"
fi

# 遍历文件夹中的所有文件
cnt=0

cd $srcfolder
for file in "$srcfolder"/*.mlir; do
    # 检查文件是否为普通文件
    filename=$(basename "$file" .mlir)
    echo "$filename"
    if [[ -f "$file" ]]; then
        # 运行指令，替换下面的 command with your command
      cgra-opt\
        --arith-expand --memref-expand\
        --affine-simplify-structures\
        -lower-affine --scf-for-loop-canonicalization  -convert-scf-to-cf\
        --finalize-memref-to-llvm=use-opaque-pointers  --convert-math-to-llvm --convert-math-to-libm\
        --convert-arith-to-llvm\
        -convert-func-to-llvm=use-bare-ptr-memref-call-conv\
        -reconcile-unrealized-casts \
        --canonicalize \
        $file -o "$tarfolder"/"$filename"_llvm.mlir \
        -mlir-print-ir-after-all 2>&1 | cat > "$tempfolder"/intermediate_"$filename".mlir
        # --fdra-affine-loop-unroll="cdfg-pass-so=/home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so cgra-adg=/home/tianyi/new_fdra/fdra/cgra-mg/src/main/resources/cgra_adg.json"\

      ((cnt++))
      echo $cnt
    fi
done

cd $rootfolder