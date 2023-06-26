cgra-opt -promote-buffers-to-stack --arith-expand --memref-expand  \
 -normalize-memrefs --affine-simplify-structures \
 -lower-affine --scf-for-loop-canonicalization  -convert-scf-to-cf\
 --convert-math-to-llvm --convert-math-to-libm\
 --convert-arith-to-llvm \
 -convert-func-to-llvm=use-bare-ptr-memref-call-conv \
 -convert-memref-to-llvm \
 --reconcile-unrealized-casts \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall/easy_affine.mlir \
 -o "easy_llvm.mlir" 

mlir-translate  --mlir-to-llvmir "easy_llvm.mlir"  > easy.ll


opt -O3 easy.ll  -o easy.bc

llc -O3 easy.bc \
  -I /home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include\
  -march=riscv64 -mtriple=riscv64-unknown-elf-gnu -mcpu=rocket-rv64 \
  -mattr=+c,+d,+relax  \
  --relocation-model=pic \
  -float-abi=hard \
  -code-model=small \
  -o easy.s

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
 -DBAREMETAL=1 -DDEFINE_MALLOC -e _start -g \
 -o /home/tianyi/chipyard/generators/fdra/software/tests/build/bareMetalC/easy-baremetal \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/LinearModel/5_asms/syscalls.o \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/LinearModel/5_asms/crt.o \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall/easy.s \
 /home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/debug/programs/tiny-malloc.c \
 /home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall/main.c


##### add kernel call
cgra-opt --affine-loop-fusion  --arith-expand --memref-expand -reconcile-unrealized-casts \
 --fdra-extract-kernel-to-function='/home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall kernel-explicit-datablock-trans=false' \
 easy_affine.mlir > 2_host.mlir