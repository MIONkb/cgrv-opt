#!/bin/bash

# 指定文件夹路径
rootfolder=$(pwd)
srcfolder="$rootfolder/2_kernels_llvm"
tarfolder="$rootfolder/3_dfgs"
tempfolder="$rootfolder/tempfiles"
kernel_basename="forward_kernel"

if [ ! -d "$tarfolder" ]; then
  mkdir -p "$tarfolder"
  echo mkdir -p "$tarfolder"
fi
if [ ! -d "$tempfolder" ]; then
  mkdir -p "$tempfolder"
  echo mkdir -p "$tempfolder"
fi
cd $tempfolder
if [[ "$(pwd)" == "$tempfolder" ]]; then
  rm *.dot *.ll *.json *.txt
  cd -
fi

cd $tarfolder
if [[ "$(pwd)" == "$tarfolder" ]]; then
  rm *.dot
  cd -
fi

cd $rootfolder
# 遍历文件夹中的所有文件
cnt=0

cd $tempfolder
for file in "$srcfolder"/*.ll; do
    # 检查文件是否为普通文件
    filename=$(basename "$file" .ll)
    echo "$filename"
    if [[ -f "$file" ]]; then
        # 运行指令，替换下面的 command with your command
      # opt  --disable-loop-unrolling \
      #    $file -S -o "$tempfolder"/"$filename"_Opt.ll

      opt  --loop-rotate -gvn -mem2reg -memdep -memcpyopt -lcssa -loop-simplify \
         -licm -loop-deletion -indvars -simplifycfg\
         -mergereturn -indvars -instnamer \
         $file \
         -S -o "$tempfolder"/"$filename"_gvn.ll

      opt  --dot-cfg "$tempfolder"/"$filename"_gvn.ll -S -o "$tempfolder"/"$filename"_cdfg.ll -enable-new-pm=0
      
      mv ./."$filename".dot ./"$filename"_init_cdfg.dot

      ((cnt++))
      echo $cnt
    fi
done
cnt=0
cd -

cd $tempfolder

gvn_ll_list=()
for file in "$tempfolder"/*_gvn.ll; do
    echo $cnt:$file
    gvn_ll_list+=("$file")
    ((cnt++))
done
totalcnt=$cnt
cnt=0
for file in "${gvn_ll_list[@]}"; do
    # 检查文件是否为普通文件
    filename=$(basename "$file" _gvn.ll)
    echo $cnt ":" "$filename"
    ((cnt++))
    if [[ -f "$file" ]]; then
        # 运行指令，替换下面的 command with your command
        echo opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so\
         "-mapping-all=true" --cdfg $file -S -o $tempfolder/"$filename"_cdfg.ll \
         -enable-new-pm=0

        opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so\
         "-mapping-all=true" --cdfg $file -S -o $tempfolder/"$filename"_cdfg.ll \
         -enable-new-pm=0

        dot="affine.dot"
        
        if [[ -f "$dot" ]]; then
            cp $tempfolder/$dot "$tarfolder"/"$filename".dot
        fi

        rm $dot
    fi
done
# opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so\
#     -mapping-all=true --cdfg \
#     main_kernel_6_gvn.ll -S -o $tarfolder/main_kernel_6_cdfg.ll \
#     -enable-new-pm=0

cd -
# opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so\
#          "-mapping-all=true" -cdfg\
#          main_kernel_2_gvn.ll -S -o main_kernel_2_cdfg.ll \
#          -enable-new-pm=0
#     opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so "-fn=main_kernel_3 -mapping-all=true" -cdfg\
#          /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/tempfiles/main_kernel_3_gvn.ll -S -o $tarfolder/main_kernel_3_cdfg.ll \
#          -enable-new-pm=0
# opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so \
#    /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/tempfiles/main_kernel_3_gvn.ll -S \
#    -o $tarfolder/main_kernel_3_cdfg.ll 
