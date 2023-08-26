//===-- Passes.td - FDRA pass definition file --------------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// Defines the FDRA Passes
//
//===----------------------------------------------------------------------===//
#ifndef FDRA_DIALECT_PASSES
#define FDRA_DIALECT_PASSES
include "RAAA/Dialect/FDRA/IR/FDRABase.td"
include "mlir/Pass/PassBase.td"
include "mlir/IR/BuiltinDialect.td"
include "mlir/Dialect/SCF/IR/SCFOps.td"
include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.td"
include "mlir/Dialect/Affine/IR/AffineOps.td"

//===----------------------------------------------------------------------===//
// CDFGgen for FDRA
//===----------------------------------------------------------------------===//
def FDRALoopCdfgGen : Pass<"fdra-loop-dfg-gen", ""> {
  let summary = "Generate cdfg of FDRA from a for-loop";
  let constructor = "mlir::FDRA::createFDRALoopCdfgGenPass()";
  let dependentDialects = [
    "arith::ArithDialect",
    "::mlir::FDRA::FDRADialect",
    "::mlir::scf::SCFDialect"
  ];
}

//===----------------------------------------------------------------------===//
// Affine To kernel
//===----------------------------------------------------------------------===//

def ExtractAffineForToKernel : Pass<"fdra-extract-affine-for-to-kernel", "func::FuncOp"> {
  let summary = "Extract all AffineFor in a FuncOp to a FDRA.KernelOp";
  let constructor = "mlir::FDRA::createExtractAffineForToKernelPass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect"
    // "arith::AffineDialect"
  ];
}

//===----------------------------------------------------------------------===//
// Loop unroll to achieve highest utilization
//===----------------------------------------------------------------------===//
def FDRAAffineLoopUnroll : Pass<"fdra-affine-loop-unroll", "ModuleOp"> {
  let summary = "apply loop unroll to kernel function to achieve highest cgra utilization";
  let description = [{
    CGRAOPT applies loop unrolling to the innermost 2-level loop of a kernel function,
    aiming to achieve enhanced instruction-level parallelism (ILP) and
    better utilization of hardware resources. To determine the optimal
    unroll factor (UF) for the kernel, the "-cgra-affine-loop-unroll" pass
    generates a data-flow graph (DFG) for each available UF. The pass
    calculates the utilization of these DFGs using the formula:
    Util = min(#L/S Nodes / #I/O Units, #Computing Nodes / #ALUs)
    where #L/S Nodes represent the number of Load/Store nodes,
    #I/O Units represent the number of I/O units, and #Computing Nodes
    represent the number of computing nodes. #ALUs represent the number
    of Arithmetic Logic Units.
    The overall utilization in the formula depends on the smaller value
    between the utilization of Input/Output blocks and that of ALUs.
  }];  
  let constructor = "mlir::FDRA::createFDRAAffineLoopUnrollPass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect",
    "::mlir::affine::AffineDialect"
  ];
  let options = [
    // Option<"outputPath", "output-path", "std::string",
    //        /*default=*/"\"./\"",
    //        "File path: the path for dumping the MLIR of pareto design points">,
    // Option<"csvPath", "csv-path", "std::string",
    //        /*default=*/"\"./\"",
    //        "File path: the path for dumping the CSV of design spaces">,

    Option<"CGRAadg", "cgra-adg", "std::string",
           /*default=*/"\"notdefined\"",
           "File path: target cgra backend ADG(Architecture Description Graph)">,
    Option<"llvmCDFGPass", "cdfg-pass-so", "std::string",
           /*default=*/"\"notdefined\"",
           "File path: the llvm shared library(.so) of DFG generator(app-compiler)">
  ];
}

//===----------------------------------------------------------------------===//
// Adjust(Partition) Kernel according to a customized Cachesize
//===----------------------------------------------------------------------===//
def AdjustKernelMemoryFootprint : Pass<"fdra-adjust-kernel-mem-footprint", "ModuleOp"> {
  let summary = "Adjust(partition) kernels' memory footprint to apply to customized cachesize";
  let constructor = "mlir::FDRA::createAdjustKernelMemoryFootprintPass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect"
    // "arith::AffineDialect"
  ];
  let options = [
    Option<"Cachesize_Kib", "cachesize", "unsigned", /*default=*/"512",
           "Set a cachesize(Kib) for kernel to be iterated(default to be 512Kib)">,
    Option<"SingleArray_Size", "singlearraysize", "unsigned", /*default=*/"0",
           "Set a cachesize(Kib) constrain for a single array or tensor in a kernel(default to be the same with Cachesize_Kib)">,
    Option<"AffineAccessPattern", "access-pattern", "bool", /*default=*/"false",
           "Set the memory access method to affine pattern(default: general pattern)">,
    Option<"DisableRemainderBlock", "disable-remainder-block", "bool", /*default=*/"false",
           "Disable make remainder during loop strip-mining">,
  ];
}

//===----------------------------------------------------------------------===//
// Kernel to independent mlir Func
//===----------------------------------------------------------------------===//
def ExtractKernelToFunc : Pass<"fdra-extract-kernel-to-function", "ModuleOp"> {
  let summary = "Extract all FDRA.KernelOp and its region to a single func with explicit arguments";
  
  let description = [{
  Following 2 examples shows what is Explicit Data Trans
  example 1:
  Initial:
  "
  #map0 = affine_map<(d0) -> (d0)>
  #map1 = affine_map<(d0) -> (d0 + 2)>
  Host:
  %c0_i32 = arith.constant 0 : i32
  %0 = memref.get_global @m1 : memref<1024xi32>
  %1 = memref.get_global @m2 : memref<1024xi32>
  %2 = memref.get_global @prod : memref<1024xi32>
  affine.for %arg0 = 0 to 32 step 2 {
    func.call @gemm_kernel_0(%0, %1, %2, %arg0) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, index) -> ()
  }

  Kernel:
  func.func @gemm_kernel_0(%arg0: memref<1024xi32>, %arg1: memref<1024xi32>, %arg2: memref<1024xi32>, %arg3: index) attributes {gemm_kernel_0} {
    cf.br ^bb1
    ^bb1:  // pred: ^bb0
      %c0_i32 = arith.constant 0 : i32
      affine.for %arg4 = #map0(%arg3) to #map1(%arg3) {
        affine.for %arg5 = 0 to 32 {
          %0 = affine.for %arg6 = 0 to 32 iter_args(%arg7 = %c0_i32) -> (i32) {
            %1 = affine.load %arg0[%arg6 + %arg4 * 32] : memref<1024xi32>
            %2 = affine.load %arg1[%arg5 + %arg6 * 32] : memref<1024xi32>
            %3 = arith.muli %1, %2 : i32
            %4 = arith.addi %arg7, %3 : i32
            affine.yield %4 : i32
          }
          affine.store %0, %arg2[%arg5 + %arg4 * 32] : memref<1024xi32>
        }
      }
      return
    }
  }
  "
  
  Converted to:
  "
  Host:

    #map0 = affine_map<(d0) -> (d0 * 2)>
    #map1 = affine_map<(d0)[s0] -> (d0 + s0)>
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @m1 : memref<1024xi32>
    %1 = memref.get_global @m2 : memref<1024xi32>
    %2 = memref.get_global @prod : memref<1024xi32>
    affine.for %arg0 = 0 to 32 step 8 {
      %3 = FDRA.DataBLock_Load %0[%arg0], 256 : memref<256xi32> attributes {gemm_kernel_0}
      %4 = FDRA.DataBLock_Load %1[%cst_0], 1024 : memref<1024xi32> attributes {gemm_kernel_0}
      %5 = FDRA.DataBLock_Load %2[%arg0], 256 : memref<256xi32> attributes {gemm_kernel_0}
      FDRA.func @gemm_kernel_0(%3, %4, %5) : (memref<256xi32>, memref<1024xi32>, memref<256xi32>) -> ()
      %5 = FDRA.DataBLock_Store %2[%arg0], %5, 256 : memref<256xi32> attributes {gemm_kernel_0}
    }

  func.func @gemm_kernel_0(%arg0: memref<256xi32>, %arg1: memref<1024xi32>, %arg2: memref<256xi32>,) attributes {gemm_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 32 {
        %1 = affine.for %arg6 = 0 to 32 iter_args(%arg7 = %c0_i32) -> (i32) {
          %2 = affine.load %arg0[%arg6 + %0 * 32] : memref<1024xi32>
          %3 = affine.load %arg1[%arg5 + %arg6 * 32] : memref<1024xi32>
          %4 = arith.muli %2, %3 : i32
          %5 = arith.addi %arg7, %4 : i32
          affine.yield %5 : i32
        }
        affine.store %1, %arg2[%arg5 + %0 * 32] : memref<1024xi32>
      }
    }
    return
  } 
  "
  '''

  example 2:
  Initial:
  #map0 = affine_map<(d0) -> (d0)>
  #map1 = affine_map<(d0) -> (d0 + 8)> 
  func.func @gemm() attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @m1 : memref<1024xi32>
    %1 = memref.get_global @m2 : memref<1024xi32>
    %2 = memref.get_global @prod : memref<1024xi32>
    affine.for %arg0 = 0 to 32 step 8 {
      FDRA.kernel {
        affine.for %arg1 = #map0(%arg0) to #map1(%arg0) {
          affine.for %arg2 = 0 to 32 {
            %3 = affine.for %arg3 = 0 to 32 iter_args(%arg4 = %c0_i32) -> (i32) {
              %4 = affine.load %0[%arg3 + %arg1 * 32] : memref<1024xi32>
              %5 = affine.load %1[%arg2 + %arg3 * 32] : memref<1024xi32>
              %6 = arith.muli %4, %5 : i32
              %7 = arith.addi %arg4, %6 : i32
              affine.yield %7 : i32
            }
            affine.store %3, %2[%arg2 + %arg1 * 32] : memref<1024xi32>
          }
        }
        FDRA.terminator
      }
    }
    return
  }

  Converted to:

  #map0 = affine_map<(d0) -> (d0)>
  #map1 = affine_map<(d0) -> (d0 + 8)> 
  func.func @gemm() attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @m1 : memref<1024xi32>
    %1 = memref.get_global @m2 : memref<1024xi32>
    %2 = memref.get_global @prod : memref<1024xi32>
    affine.for %arg0 = 0 to 32 step 8 {
      %new_0 = FDRA.DataBLock_Load %0 [%arg0 * 32] : memref<256xi32> attributes {gemm_kernel_0}
      %new_1 = FDRA.DataBLock_Load %1 [%cst_0 * 32] : memref<1024xi32> attributes {gemm_kernel_0}
      %new_2 = FDRA.DataBLock_Load %2 [%arg0 * 32] : memref<256xi32> attributes {gemm_kernel_0}
      FDRA.kernel {
        affine.for %arg1 = 0 to 8 {
          affine.for %arg2 = 0 to 32 {
            %3 = affine.for %arg3 = 0 to 32 iter_args(%arg4 = %c0_i32) -> (i32) {
              %4 = affine.load %new_0[%arg3 + %arg1 * 32] : memref<1024xi32>
              %5 = affine.load %new_1[%arg2 + %arg3 * 32] : memref<1024xi32>
              %6 = arith.muli %4, %5 : i32
              %7 = arith.addi %arg4, %6 : i32
              affine.yield %7 : i32
            }
            affine.store %3, %new_2[%arg2 + %arg1 * 32] : memref<1024xi32>
          }
        }
        FDRA.terminator
      }
      FDRA.DataBLock_Store %new_2, %2[%arg0 * 32]: memref<256xi32> -> memref<1024xi32>  {gemm_kernel_0}
    }
    return
  }
  '''
  }];  

  let constructor = "mlir::FDRA::createExtractKernelToFuncPass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect",
    "::mlir::cf::ControlFlowDialect"
    // "arith::AffineDialect"
  ];
  let options = [
    Option<"KernelGenDir", "kernel-gen-dir", "std::string", /*default=*/"",
           "Kernels will not be generated unless the dir path is set">,
    Option<"ExplicitDataTrans", "kernel-explicit-datablock-trans", "bool", /*default=*/"true",
           "This Option (Default:Ture) will generate explict data block loads/stores ,and interface of Kernel Func won't contain affine-transformed loop Index arguments.">,
  ];
}

//===----------------------------------------------------------------------===//
// Hoist Load/Store Operation In Loop-Nest
//===----------------------------------------------------------------------===//
def HoistLoadStoreInLoopNest : Pass<"fdra-hoist-loadstore", "func::FuncOp"> {
  let summary = "Hoist inner affine.load/store operations to outer level to decrease memmory accesses";
  let description = [{
    This Pass will hoist repetitive affine.load/store operations which access 
    the same position in inner loop to outer level of loop so that memmory 
    accesses can be decreased.
    The optimization technique of moving memory accesses from the inner loop 
    to the outer loop is commonly known as "loop hoisting" or 
    "loop-invariant code motion" (LICM). The goal of this optimization 
    is to move invariant code from the inner loop to the outer loop, 
    reducing redundant computations and memory accesses, and thereby 
    improving the performance of the program.
    Loop hoisting effectively reduces the number of computations and memory 
    accesses within the loop, avoids redundant operations, and decreases the 
    number of iterations in the loop, resulting in improved program efficiency. 
    This optimization is typically performed automatically by the compiler's 
    optimizer, but it can also be manually applied to enhance code performance.
    '''
  }];  
  let constructor = "mlir::FDRA::createHoistLoadStoreInLoopNestPass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect",
    "::mlir::affine::AffineDialect"
  ];
  let options = [
    // Option<"outputPath", "output-path", "std::string",
    //        /*default=*/"\"./\"",
    //        "File path: the path for dumping the MLIR of pareto design points">,
    // Option<"targetSpec", "target-spec", "std::string",
    //        /*default=*/"\"./config.json\"",
    //        "File path: target backend specifications and configurations">
  ];
}



//===----------------------------------------------------------------------===//
// Frontend Design Space Exploration
//===----------------------------------------------------------------------===//
def AutoDesignSpaceExplore : Pass<"fdra-auto-dse", "ModuleOp"> {
  let summary = "design space explore for application frontend optimization";
  let description = [{
    This pass will automatically conduct design space exploration (DSE)
    for frontend optimization of riscV + coarsed-grained reconfigurable 
    array (CGRA) heterogeneous architeture. The frontend optimization DSE 
    is alike to optimization DSE in HLS of FPGA(like scalehls and comba) . 
    It takes in information about the hardware architecture(like array size,
    op types, etc.), includes loop SW/HW partition, loop tiles, loop unrolls ,etc. 
    and achieve architeture-independent optimization towards application code.
    This dse process is able to improve the performance of a application code
    when running on a heterogeneous architeture.
  }];  
  let constructor = "mlir::FDRA::createAutoDesignSpaceExplorePass()";
  let dependentDialects = [
    "::mlir::FDRA::FDRADialect"
    // "arith::AffineDialect"
  ];
  let options = [
    // Option<"outputPath", "output-path", "std::string",
    //        /*default=*/"\"./\"",
    //        "File path: the path for dumping the MLIR of pareto design points">,
    // Option<"csvPath", "csv-path", "std::string",
    //        /*default=*/"\"./\"",
    //        "File path: the path for dumping the CSV of design spaces">,

    Option<"CGRAadg", "cgra-adg", "std::string",
           /*default=*/"\"notdefined\"",
           "File path: target cgra backend ADG(Architecture Description Graph)">,
    Option<"llvmCDFGPass", "cdfg-pass-so", "std::string",
           /*default=*/"\"notdefined\"",
           "File path: the llvm shared library(.so) of DFG generator(app-compiler)">
  ];
}

#endif // FDRA_DIALECT_PASSES
