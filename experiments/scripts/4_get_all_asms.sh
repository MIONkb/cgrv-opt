#!/bin/bash

# 指定文件夹路径
rootfolder=$(pwd)
srcfolder="$rootfolder/4_mappings"
tarfolder="$rootfolder/5_asms"
tempfolder="$rootfolder/tempfiles"
kernel_basename="forward_kernel"
func_name="forward"

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
  rm *.text
  cd -
fi
cd $tarfolder
if [[ "$(pwd)" == "$tarfolder" ]]; then
  rm *.s *.S
  cd -
fi

source /home/tianyi/chipyard/env.sh

# get syscalls.s crt.S
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
 -S -o $tarfolder/syscalls.s \
 /home/tianyi/chipyard/generators/fdra/software/tests//riscv-tests/benchmarks/common/syscalls.c

cp  /home/tianyi/chipyard/generators/fdra/software/tests/gemm/crt.S $tarfolder/crt.s

include_line="#include \"include/ISA.h\""
cnt=0
for file in "$srcfolder"/*.c; do
    # 检查文件是否为普通文件
    filename=$(basename "$file" .c)
    echo "$filename"
    if [[ -f "$file" ]]; then
      echo $cnt
      ((cnt++))

      if ! grep -q "$include_line" "$file"; then
            temp_file="${file}.temp"
            echo -e "$include_line\n$(cat "$file")" > "$temp_file"
            mv "$temp_file" "$file"
            echo "Added include directive to $file"
      fi

      # gcc .c to .asm
      echo  riscv64-unknown-elf-gcc \
        -DPREALLOCATE=1 -DMULTITHREAD=1 -mcmodel=medany \
        -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf \
        -fno-tree-loop-distribute-patterns -march=rv64gc -Wa,-march=rv64gc12 \
        -lm -lgcc \
        -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests \
        -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/env \
        -I/home/tianyi/chipyard/generators/fdra/software/tests/ \
        -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/benchmarks/common \
        -DID_STRING=  -nostdlib -nostartfiles -static \
        -DBAREMETAL=1 \
        "$file" \
        -S -o "$tarfolder/$filename.s"

      riscv64-unknown-elf-gcc \
        -DPREALLOCATE=1 -DMULTITHREAD=1 -mcmodel=medany \
        -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf \
        -fno-tree-loop-distribute-patterns -march=rv64gc -Wa,-march=rv64gc12 \
        -lm -lgcc \
        -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests \
        -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/env \
        -I/home/tianyi/chipyard/generators/fdra/software/tests/ \
        -I/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/benchmarks/common \
        -DID_STRING=  -nostdlib -nostartfiles -static \
        -DBAREMETAL=1 \
        "$file" \
        -S -o "$tarfolder/$filename.s"

      # if [[ -f "$tempfolder/cgra_execute.c" ]]; then
      #   cp "$tempfolder/cgra_execute.c" $tarfolder/$filename.c
      #   rm "$tempfolder/cgra_execute.c"
      # else
      #   echo "Mapping for $filename.json failed !"
      #   exit 0
      # fi
    fi
done
cnt=0



###
# Host code on cpu
###
# lowering only host to llvm
cgra-opt -promote-buffers-to-stack --arith-expand --memref-expand  \
 -normalize-memrefs --expand-strided-metadata  -lower-affine \
 --scf-for-loop-canonicalization -convert-scf-to-cf \
 --convert-math-to-llvm --convert-math-to-libm \
 --convert-arith-to-llvm --finalize-memref-to-llvm \
 --fdra-convert-kernelcall-to-llvm \
 -convert-func-to-llvm=use-bare-ptr-memref-call-conv \
 --finalize-memref-to-llvm  --cse --canonicalize \
 --reconcile-unrealized-casts \
 $rootfolder/2_host.mlir -o $rootfolder/"3_${func_name}_llvm.mlir" \
 --mlir-print-ir-after-all 2>&1 | cat > "3_intermediate_${func_name}_llvm.mlir"

mlir-translate  --mlir-to-llvmir $rootfolder/"3_${func_name}_llvm.mlir" > "$rootfolder/$func_name.ll"




# opt -memprof  "$rootfolder/$func_name.ll" -o "$rootfolder/$func_name.bc"
opt -O3 "$rootfolder/$func_name.ll" -o "$rootfolder/$func_name.bc"

echo llc -O3 "$rootfolder/$func_name.bc" \
  -I /home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include\
  -march=riscv64 -mtriple=riscv64-unknown-elf-gnu -mcpu=rocket-rv64 \
  -mattr=+c,+d,+relax  \
  --relocation-model=pic \
  -float-abi=hard \
  -code-model=small \
  -o "$tarfolder/$func_name.s"
llc -O3 "$rootfolder/$func_name.bc" \
  -I /home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include\
  -march=riscv64 -mtriple=riscv64-unknown-elf-gnu -mcpu=rocket-rv64 \
  -mattr=+c,+d,+relax  \
  --relocation-model=pic \
  -float-abi=hard \
  -code-model=small \
  -o "$tarfolder/$func_name.s"