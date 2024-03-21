## cgra-opt : MLIR project for FDRA (TRAM SoC)

=======================

Directories:

1. tools: cpp of cgra-opt

2. include/lib: c++ header/source for cgra-opt 

## Build 

Change your llvm install path in build_forwardopt.sh and CMakeList.txt, and run build_cgraopt.sh (recommemd to run it through ctrl+C/ctrl+v line-by-line).

##### LLVM-18
Cunrrent LLVM version Commit: 4553dc46a05ec6f1e2aebcde1ce185772a26780b

Please download it from

https://github.com/llvm/llvm-project/tree/4553dc46a05ec6f1e2aebcde1ce185772a26780b

Install it with ./bash_tools/build_llvm.sh

## Other dependencies
##### Newest torch-mlir 

Please download it from

https://github.com/segmentKOBE/torch-mlir-forward


##### FDRA project:
To run a model on CPU + CGRA SoC with VERILATOR or VCS, install chipyard and fdra. 
Please follow: https://github.com/MIONkb/FDRA

## run
Pytorch to mlir needs torch-mlir python package.