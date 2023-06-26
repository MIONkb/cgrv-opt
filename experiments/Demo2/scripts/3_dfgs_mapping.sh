#!/bin/bash

# 指定文件夹路径
rootfolder=$(pwd)
srcfolder="$rootfolder/3_dfgs"
tarfolder="$rootfolder/4_mappings"
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
  rm *.dot *.ll
  cd -
fi
cd $tarfolder
if [[ "$(pwd)" == "$tarfolder" ]]; then
  rm *.c
  cd -
fi

cnt=0
cd $tempfolder
for file in "$srcfolder"/*; do
    # 检查文件是否为普通文件
    filename=$(basename "$file" .dot)
    echo "$filename"
    if [[ -f "$file" ]]; then
      echo $cnt
      ((cnt++))

      # convert .dot to .json
      dot $file -Tdot_json -o "$tempfolder/$filename.json"

      # mapping and get config information
      echo /home/tianyi/chipyard/generators/fdra/cgra-compiler/build/cgra-compiler SPDLOG_LEVEL=off \
	      -c true -m true -o true -t 3600000 -i 2000 \
	      -p "/home/tianyi/chipyard/generators/fdra/cgra-mg/src/main/resources/operations.json" \
	      -a "/home/tianyi/chipyard/generators/fdra/cgra-mg/src/main/resources/cgra_adg.json" \
	      -d "$tempfolder/$filename.json"

      /home/tianyi/chipyard/generators/fdra/cgra-compiler/build/cgra-compiler SPDLOG_LEVEL=off \
	      -c true -m true -o true -t 3600000 -i 2000 \
	      -p "/home/tianyi/chipyard/generators/fdra/cgra-mg/src/main/resources/operations.json" \
	      -a "/home/tianyi/chipyard/generators/fdra/cgra-mg/src/main/resources/cgra_adg.json" \
	      -d "$tempfolder/$filename.json"

      # if [ $? -eq 0 ]; then
      #   echo "Mapping for $filename.json failed !"
      #   exit 1
      # fi
      if [[ -f "$tempfolder/cgra_execute.c" ]]; then
        cp "$tempfolder/cgra_execute.c" $tarfolder/$filename.c
        rm "$tempfolder/cgra_execute.c"
      else
        echo "Mapping for $filename.json failed !"
        exit 0
      fi
    fi
done
cnt=0
cd -
# cd $tempfolder

# gvn_ll_list=()
# for file in "$tempfolder"/*; do
#     echo $cnt:$file
#     gvn_ll_list+=("$file")
#     ((cnt++))
# done
# totalcnt=$cnt
# cnt=0
# for file in "${gvn_ll_list[@]}"; do
#     # 检查文件是否为普通文件
#     filename=$(basename "$file" _gvn.ll)
#     echo $cnt ":" "$filename"
#     ((cnt++))
#     if [[ -f "$file" ]]; then
#         # 运行指令，替换下面的 command with your command
#         opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so\
#          "-mapping-all=true" --cdfg $file -S -o $tempfolder/"$filename"_cdfg.ll \
#          -enable-new-pm=0
#         dot="affine.dot"
        
#         if [[ -f "$dot" ]]; then
#             cp $dot "$tarfolder"/"$filename".dot
#         fi

#         rm $dot
#     fi
# done
# opt -load /home/tianyi/new_fdra/fdra/app-compiler/build/llvm-pass/libCDFGPass.so\
#     -mapping-all=true --cdfg \
#     main_kernel_6_gvn.ll -S -o $tarfolder/main_kernel_6_cdfg.ll \
#     -enable-new-pm=0