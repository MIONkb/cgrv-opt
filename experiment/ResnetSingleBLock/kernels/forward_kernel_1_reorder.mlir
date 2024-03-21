module {
  func.func @forward_kernel_1(%arg0: memref<1x64x112x112xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>, %arg3: memref<64xf32>, %arg4: memref<64xf32>, %arg5: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 1.000000e-05 : f64
    affine.for %arg6 = 0 to 1 {
      affine.for %arg7 = 0 to 64 {
        affine.for %arg8 = 0 to 112 {
          affine.for %arg9 = 0 to 112 {
            %0 = affine.load %arg0[%arg6, %arg7, %arg8, %arg9] : memref<1x64x112x112xf32>
            %1 = affine.load %arg1[%arg7] : memref<64xf32>
            %2 = affine.load %arg2[%arg7] : memref<64xf32>
            %3 = affine.load %arg3[%arg7] : memref<64xf32>
            %4 = affine.load %arg4[%arg7] : memref<64xf32>
            %5 = arith.truncf %cst : f64 to f32
            %6 = arith.addf %4, %5 : f32
            %7 = math.rsqrt %6 : f32
            %8 = arith.subf %0, %3 : f32
            %9 = arith.mulf %8, %7 : f32
            %10 = arith.mulf %9, %1 : f32
            %11 = arith.addf %10, %2 : f32
            affine.store %11, %arg5[%arg6, %arg7, %arg8, %arg9] : memref<1x64x112x112xf32>
          }
        }
      }
    }
    return
  }
}

