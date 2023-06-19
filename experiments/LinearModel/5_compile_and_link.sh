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


# get main.s
riscv64-unknown-elf-gcc \
 -DPREALLOCATE=1 -DMULTITHREAD=1 -mcmodel=medany \
 -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf \
 -fno-tree-loop-distribute-patterns -march=rv64gc -Wa,-march=rv64gc12 \
 -lm -lgcc \
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests \
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/env \
 -I/home/tianyi/chipyard/generators/fdra/software/tests/ \
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/benchmarks/common \
 -DID_STRING=  -nostdlib -nostartfiles -static \
 -T /home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/benchmarks/common/test.ld \
 -DBAREMETAL=1 \
 -S -o $asmfolder/main.s \
 ./main.c

# asm to object
asm_files=$(find "$asmfolder" -name "*.s" -type f)
cnt=0

sed -i -E 's/^(\s*)(\.file|\.loc)/\1#&/' $asmfolder/"$top_call_name.s"

for file in ${asm_files[@]}; do
    # 检查文件是否为普通文件
    filename=$(basename "$file" .s)
    echo "$filename"
    if [[ -f "$file" ]]; then
      echo $cnt
      ((cnt++))

      # gcc .c to .asm
      echo  riscv64-unknown-elf-as -march=rv64gc \
          $file -o $asmfolder/$filename.o 

      riscv64-unknown-elf-as -march=rv64gc \
          $file -o $asmfolder/$filename.o 
    fi
done
cnt=0

# link objects
object_files=$(find "$asmfolder" -name "*.o" -type f)
echo riscv64-unknown-elf-ld -melf64lriscv \
 -T/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/benchmarks/common/test.ld \
 -e _start \
 -o /home/tianyi/chipyard/generators/fdra/software/tests/build/bareMetalC/gemm-baremetal \
 $object_files
 
echo riscv64-unknown-elf-ld -march=elf64lriscv\
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests \
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/env \
 -I/home/tianyi/chipyard/generators/fdra/software/tests/ \
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/benchmarks/common \
 -T/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/benchmarks/common/test.ld \
  -DID_STRING=  -nostartfiles -static \
 -e _start --verbose\
 -o /home/tianyi/chipyard/generators/fdra/software/tests/build/bareMetalC/${top_call_name}-baremetal \
 $object_files

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
 -DBAREMETAL=1 -DDEFINE_MALLOC -e _start -g --verbose \
 -o /home/tianyi/chipyard/generators/fdra/software/tests/build/bareMetalC/forward-baremetal \
 /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/5_asms/forward_kernel_1.s \
 /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/5_asms/forward_kernel_0.s \
 /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/5_asms/syscalls.o \
 /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/5_asms/crt.o \
 /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/5_asms/forward_kernel_2.s\
 /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/5_asms/forward.s \
 /home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/debug/programs/tiny-malloc.c \
 /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c



 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/env \

echo riscv64-unknown-elf-ld -melf64lriscv \
 -I/home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include\
 -T/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/benchmarks/common/test.ld \
 -e _start --verbose\
 -o /home/tianyi/chipyard/generators/fdra/software/tests/build/bareMetalC/${top_call_name}-baremetal \
 $object_files


riscv64-unknown-elf-gcc \
 -DPREALLOCATE=1 -DMULTITHREAD=1 -mcmodel=medany \
 -std=gnu99 -O1 -ffast-math -fno-common -fno-builtin-printf \
 -fno-tree-loop-distribute-patterns -march=rv64gc -Wa,-march=rv64gc12 \
  -lm -lgcc \
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/benchmarks/common \
 -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests \
 -I/home/tianyi/chipyard/generators/fdra/software/tests/ \
 -T/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/benchmarks/common/my_test.ld \
 -DID_STRING= -nostartfiles -static \
 -DBAREMETAL=1  -g --verbose \
 -S -o /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.s \
 /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c 




riscv64-unknown-elf-gcc \
 -DPREALLOCATE=1 -DMULTITHREAD=1 -mcmodel=medany \
 -std=gnu99 -O1 -ffast-math -fno-common -fno-builtin-printf \
 -fno-tree-loop-distribute-patterns -march=rv64gc -Wa,-march=rv64gc12 \
  -lm -lgcc \
 -I/home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/benchmarks/common \
 -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests \
 -I/home/tianyi/chipyard/generators/fdra/software/tests/ \
 -T/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/benchmarks/common/my_test.ld \
 -DID_STRING= -nostartfiles -static \
 -DBAREMETAL=1 -DDEFINE_MALLOC  -g \
 -S -o /home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/5_asms/malloc.s \
 /home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/debug/programs/tiny-malloc.c