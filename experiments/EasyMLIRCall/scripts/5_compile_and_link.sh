#!/bin/bash

# 指定文件夹路径
rootfolder=$(pwd)
asmfolder="$rootfolder/5_asms"
tarfolder="/home/tianyi/chipyard/generators/fdra/software/tests/bareMetalC"
tempfolder="$rootfolder/tempfiles"
kernel_basename="forward_kernel"
top_call_name="forward"

if [ ! -d "$tarfolder" ]; then
  mkdir -p "$tarfolder"
  echo mkdir -p "$tarfolder"
fi
if [ ! -d "$tempfolder" ]; then
  mkdir -p "$tempfolder"
  echo mkdir -p "$tempfolder"
fi
# cd $tempfolder
# if [[ "$(pwd)" == "$tempfolder" ]]; then
#   find "$tempfolder" -name "*.dot" -type f -delete
#   find "$tempfolder" -name "*.text" -type f -delete
#   cd -
# fi


# asm to object
# asm_files=$(find "$asmfolder" -name "*.s" -type f)
# cnt=0

# sed -i -E 's/^(\s*)(\.file|\.loc)/\1#&/' $asmfolder/"$top_call_name.s"

# for file in ${asm_files[@]}; do
#     # 检查文件是否为普通文件
#     filename=$(basename "$file" .s)
#     echo "$filename"
#     if [[ -f "$file" ]]; then
#       echo $cnt
#       ((cnt++))

#       # gcc .c to .asm
#       echo  riscv64-unknown-elf-as -march=rv64gc \
#           $file -o $asmfolder/$filename.o 

#       riscv64-unknown-elf-as -march=rv64gc \
#           $file -o $asmfolder/$filename.o 
#     fi
# done
# cnt=0

# link objects
object_files=$(find "$asmfolder" -name "*.s" -type f)


riscv64-unknown-elf-gcc \
 -DPREALLOCATE=1 -DMULTITHREAD=1 -mcmodel=medany \
 -std=gnu99 -O0 -ffast-math -fno-common -fno-builtin-printf \
 -fno-tree-loop-distribute-patterns -march=rv64gc -Wa,-march=rv64gc12 \
  -lm -lgcc \
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/benchmarks/common \
 -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests \
 -I/home/tianyi/chipyard/generators/fdra/software/tests/ \
 -T/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/benchmarks/common/my_test.ld \
 -DID_STRING= -nostartfiles -static \
 -DBAREMETAL=1 -DDEFINE_MALLOC -e _start -g  \
 -o /home/tianyi/chipyard/generators/fdra/software/tests/build/bareMetalC/forward-baremetal \
 /home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/debug/programs/tiny-malloc.c \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall/main.c \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/Demo1/5_asms/syscalls.s \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/Demo1/5_asms/crt.s \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall/5_asms/forward_kernel_0.s \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall/5_asms/forward.s



#  "$asmfolder"/forward_kernel_1.s \
#  "$asmfolder"/forward_kernel_0.s \
#  "$asmfolder"/syscalls.s \
#  "$asmfolder"/crt.s \
#  "$asmfolder"/forward_kernel_2.s\
#  "$asmfolder"/forward.s \