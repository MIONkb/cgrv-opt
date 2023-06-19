// -----// IR Dump After AffineLoopNormalize (affine-loop-normalize) //----- //
func.func @gemm() attributes {llvm.linkage = #llvm.linkage<external>} {
  %c0_i32 = arith.constant 0 : i32
  %0 = memref.get_global @m1 : memref<1024xi32>
  %1 = memref.get_global @m2 : memref<1024xi32>
  %2 = memref.get_global @prod : memref<1024xi32>
  affine.for %arg0 = 0 to 16 {
    %3 = affine.apply affine_map<(d0) -> (d0 * 2)>(%arg0)
    func.call @gemm_kernel_0(%0, %1, %2, %3) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, index) -> ()
  }
  return
}

// -----// IR Dump After AffineScalarReplacement (affine-scalrep) //----- //
func.func @gemm() attributes {llvm.linkage = #llvm.linkage<external>} {
  %c0_i32 = arith.constant 0 : i32
  %0 = memref.get_global @m1 : memref<1024xi32>
  %1 = memref.get_global @m2 : memref<1024xi32>
  %2 = memref.get_global @prod : memref<1024xi32>
  affine.for %arg0 = 0 to 16 {
    %3 = affine.apply affine_map<(d0) -> (d0 * 2)>(%arg0)
    func.call @gemm_kernel_0(%0, %1, %2, %3) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, index) -> ()
  }
  return
}

// -----// IR Dump After AffineLoopNormalize (affine-loop-normalize) //----- //
func.func @gemm_kernel_0(%arg0: memref<1024xi32>, %arg1: memref<1024xi32>, %arg2: memref<1024xi32>, %arg3: index) attributes {gemm_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %c0_i32 = arith.constant 0 : i32
  affine.for %arg4 = 0 to 8 {
    %0 = affine.apply affine_map<(d0)[s0] -> (d0 + s0)>(%arg4)[%arg3]
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

// -----// IR Dump After AffineScalarReplacement (affine-scalrep) //----- //
func.func @gemm_kernel_0(%arg0: memref<1024xi32>, %arg1: memref<1024xi32>, %arg2: memref<1024xi32>, %arg3: index) attributes {gemm_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %c0_i32 = arith.constant 0 : i32
  affine.for %arg4 = 0 to 8 {
    %0 = affine.apply affine_map<(d0)[s0] -> (d0 + s0)>(%arg4)[%arg3]
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

