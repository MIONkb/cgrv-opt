cgra-opt : MLIR project for FDRA (TRAM SoC)

=======================

Directories:

1. tools: cpp of forward-opt

2. include/lib: c++ header/source for forwar-opt 

## Build 

Change your llvm install path in build_forwardopt.sh and CMakeList.txt, and run build_forwardopt.sh (recommemd to run it through ctrl+C/ctrl+v line-by-line).

## Run

Change your llvm install path in env.sh, and source env.sh.

Then run the model transforming following scripts in ./models.(eg. ./models/simplr/scripts.sh). 

Pytorch to mlir needs torch-mlir python package.

### Dependencies
##### LLVM-17
Maybe we need a new version of llvm. Commit: 4553dc46a05ec6f1e2aebcde1ce185772a26780b

Please download it from

https://github.com/llvm/llvm-project/tree/4553dc46a05ec6f1e2aebcde1ce185772a26780b

Install it with ./bash_tools/build_llvm.sh

##### Pybind11

##### Newest torch-mlir 

Please download it from

https://github.com/segmentKOBE/torch-mlir-forward

