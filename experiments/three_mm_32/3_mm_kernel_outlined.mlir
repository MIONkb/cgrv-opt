#map0 = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @three_mm_32(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>, %arg3: memref<32x32xf32>, %arg4: memref<32x32xf32>, %arg5: memref<32x32xf32>, %arg6: memref<32x32xf32>) {
    affine.for %arg7 = 0 to 1 {
      affine.for %arg8 = 0 to 32 step 4 {
        affine.for %arg9 = #map0(%arg8) to #map1(%arg8) {
          affine.for %arg10 = 0 to 32 step 16 {
            %0 = FDRA.BlockLoad %arg1 [%arg9, 0] : memref<32x32xf32> -> memref<1x32xf32> {three_mm_32_kernel_0}
            %1 = FDRA.BlockLoad %arg2 [0, %arg10] : memref<32x32xf32> -> memref<32x16xf32> {three_mm_32_kernel_0}
            %2 = FDRA.BlockLoad %arg0 [%arg9, %arg10] : memref<32x32xf32> -> memref<1x16xf32> {three_mm_32_kernel_0}
            func.call @three_mm_32_kernel_0(%arg0, %arg9, %0, %1, %2) : (memref<32x32xf32>, index, memref<1x32xf32>, memref<32x16xf32>, memref<1x16xf32>) -> ()
          }
        }
      }
    }
    return
  }
  func.func @three_mm_32_kernel_0(%arg0: memref<32x32xf32>, %arg1: index, %arg2: memref<1x32xf32>, %arg3: memref<32x16xf32>, %arg4: memref<1x16xf32>) attributes {three_mm_32_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg5 = 0 to 16 {
      %cst = arith.constant 0.000000e+00 : f32
      affine.store %cst, %arg0[%arg1, %arg5] : memref<32x32xf32>
      affine.for %arg6 = 0 to 32 {
        %0 = affine.load %arg2[%arg1, %arg6] : memref<1x32xf32>
        %1 = affine.load %arg3[%arg6, %arg5] : memref<32x16xf32>
        %2 = affine.load %arg4[%arg1, %arg5] : memref<1x16xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %arg0[%arg1, %arg5] : memref<32x32xf32>
      }
    }
    return
  }
}

