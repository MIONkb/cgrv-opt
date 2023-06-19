#!/bin/bash

# 指定文件夹路径
srcfolder="/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/1_kernels_llvmmlir"
tarfolder="/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/2_kernels_llvm"
cd $tarfolder
rm *.ll
cd -
# 遍历文件夹中的所有文件
cnt=0

for file in "$srcfolder"/*; do
    # 检查文件是否为普通文件
    filename=$(basename "$file" _llvm.mlir)
    echo "$filename"
    if [[ -f "$file" ]]; then
        # 运行指令，替换下面的 command with your command
       mlir-translate --mlir-to-llvmir "$file" -o $tarfolder/"$filename".ll
      ((cnt++))
      echo $cnt
    fi
done

