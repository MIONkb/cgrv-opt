#!/bin/bash

# 指定文件夹路径

rootfolder=$(pwd)
srcfolder="$rootfolder/kernels"
tarfolder="$rootfolder/1_kernels_llvmmlir"
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

for file in "$srcfolder"/*.mlir; do
    # 检查文件是否为普通文件
    filename=$(basename "$file" .mlir)
    echo "$filename"
    if [[ -f "$file" ]]; then
        # 运行指令，替换下面的 command with your command
      cgra-opt --arith-expand --memref-expand\
        -lower-affine --scf-for-loop-canonicalization  -convert-scf-to-cf\
        -convert-memref-to-llvm  --convert-math-to-llvm --convert-math-to-libm\
        --convert-arith-to-llvm\
        --affine-simplify-structures\
        -convert-func-to-llvm=use-bare-ptr-memref-call-conv\
        -reconcile-unrealized-casts \
        $file -o "$tarfolder"/"$filename"_llvm.mlir
        # -mlir-print-ir-after-all 2>&1 | cat > "$tarfolder"/1_intermediate_main_kernel_"$cnt".mlir
      ((cnt++))
      echo $cnt
    fi
done


