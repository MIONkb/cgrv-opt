#map0 = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 8)>
#map2 = affine_map<(d0) -> (d0 + 2)>
module {
  func.func @three_mm_32(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>, %arg3: memref<32x32xf32>, %arg4: memref<32x32xf32>, %arg5: memref<32x32xf32>, %arg6: memref<32x32xf32>) {
    affine.for %arg7 = 0 to 1 {
      affine.for %arg8 = 0 to 32 step 8 {
        affine.for %arg9 = #map0(%arg8) to #map1(%arg8) step 2 {
          affine.for %arg10 = #map0(%arg9) to #map2(%arg9) {
            affine.for %arg11 = 0 to 32 step 8 {
              FDRA.kernel {
                affine.for %arg12 = #map0(%arg11) to #map1(%arg11) {
                  %cst = arith.constant 0.000000e+00 : f32
                  affine.store %cst, %arg0[%arg10, %arg12] : memref<32x32xf32>
                  affine.for %arg13 = 0 to 32 {
                    %0 = affine.load %arg1[%arg10, %arg13] : memref<32x32xf32>
                    %1 = affine.load %arg2[%arg13, %arg12] : memref<32x32xf32>
                    %2 = affine.load %arg0[%arg10, %arg12] : memref<32x32xf32>
                    %3 = arith.mulf %0, %1 : f32
                    %4 = arith.addf %2, %3 : f32
                    affine.store %4, %arg0[%arg10, %arg12] : memref<32x32xf32>
                  }
                }
                FDRA.terminator
              }
            }
          }
        }
      }
      affine.for %arg8 = 0 to 32 step 8 {
        affine.for %arg9 = #map0(%arg8) to #map1(%arg8) step 2 {
          affine.for %arg10 = #map0(%arg9) to #map2(%arg9) {
            affine.for %arg11 = 0 to 32 step 8 {
              FDRA.kernel {
                affine.for %arg12 = #map0(%arg11) to #map1(%arg11) {
                  %cst = arith.constant 0.000000e+00 : f32
                  affine.store %cst, %arg3[%arg10, %arg12] : memref<32x32xf32>
                  affine.for %arg13 = 0 to 32 {
                    %0 = affine.load %arg4[%arg10, %arg13] : memref<32x32xf32>
                    %1 = affine.load %arg5[%arg13, %arg12] : memref<32x32xf32>
                    %2 = affine.load %arg3[%arg10, %arg12] : memref<32x32xf32>
                    %3 = arith.mulf %0, %1 : f32
                    %4 = arith.addf %2, %3 : f32
                    affine.store %4, %arg3[%arg10, %arg12] : memref<32x32xf32>
                  }
                }
                FDRA.terminator
              }
            }
          }
        }
      }
      affine.for %arg8 = 0 to 32 step 8 {
        affine.for %arg9 = #map0(%arg8) to #map1(%arg8) step 2 {
          affine.for %arg10 = #map0(%arg9) to #map2(%arg9) {
            affine.for %arg11 = 0 to 32 step 8 {
              FDRA.kernel {
                affine.for %arg12 = #map0(%arg11) to #map1(%arg11) {
                  %cst = arith.constant 0.000000e+00 : f32
                  affine.store %cst, %arg6[%arg10, %arg12] : memref<32x32xf32>
                  affine.for %arg13 = 0 to 32 {
                    %0 = affine.load %arg0[%arg10, %arg13] : memref<32x32xf32>
                    %1 = affine.load %arg3[%arg13, %arg12] : memref<32x32xf32>
                    %2 = affine.load %arg6[%arg10, %arg12] : memref<32x32xf32>
                    %3 = arith.mulf %0, %1 : f32
                    %4 = arith.addf %2, %3 : f32
                    affine.store %4, %arg6[%arg10, %arg12] : memref<32x32xf32>
                  }
                }
                FDRA.terminator
              }
            }
          }
        }
      }
    }
    return
  }
}

