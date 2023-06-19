module {
  func.func @three_mm_32(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>, %arg3: memref<32x32xf32>, %arg4: memref<32x32xf32>, %arg5: memref<32x32xf32>, %arg6: memref<32x32xf32>) {
    FDRA.kernel {
      affine.for %arg7 = 0 to 1 {
        affine.for %arg8 = 0 to 32 {
          affine.for %arg9 = 0 to 32 {
            %cst = arith.constant 0.000000e+00 : f32
            affine.store %cst, %arg0[%arg8, %arg9] : memref<32x32xf32>
            affine.for %arg10 = 0 to 32 {
              %0 = affine.load %arg1[%arg8, %arg10] : memref<32x32xf32>
              %1 = affine.load %arg2[%arg10, %arg9] : memref<32x32xf32>
              %2 = affine.load %arg0[%arg8, %arg9] : memref<32x32xf32>
              %3 = arith.mulf %0, %1 : f32
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg0[%arg8, %arg9] : memref<32x32xf32>
            }
          }
        }
        affine.for %arg8 = 0 to 32 {
          affine.for %arg9 = 0 to 32 {
            %cst = arith.constant 0.000000e+00 : f32
            affine.store %cst, %arg3[%arg8, %arg9] : memref<32x32xf32>
            affine.for %arg10 = 0 to 32 {
              %0 = affine.load %arg4[%arg8, %arg10] : memref<32x32xf32>
              %1 = affine.load %arg5[%arg10, %arg9] : memref<32x32xf32>
              %2 = affine.load %arg3[%arg8, %arg9] : memref<32x32xf32>
              %3 = arith.mulf %0, %1 : f32
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg3[%arg8, %arg9] : memref<32x32xf32>
            }
          }
        }
        affine.for %arg8 = 0 to 32 {
          affine.for %arg9 = 0 to 32 {
            %cst = arith.constant 0.000000e+00 : f32
            affine.store %cst, %arg6[%arg8, %arg9] : memref<32x32xf32>
            affine.for %arg10 = 0 to 32 {
              %0 = affine.load %arg0[%arg8, %arg10] : memref<32x32xf32>
              %1 = affine.load %arg3[%arg10, %arg9] : memref<32x32xf32>
              %2 = affine.load %arg6[%arg8, %arg9] : memref<32x32xf32>
              %3 = arith.mulf %0, %1 : f32
              %4 = arith.addf %2, %3 : f32
              affine.store %4, %arg6[%arg8, %arg9] : memref<32x32xf32>
            }
          }
        }
      }
      FDRA.terminator
    }
    return
  }
}

