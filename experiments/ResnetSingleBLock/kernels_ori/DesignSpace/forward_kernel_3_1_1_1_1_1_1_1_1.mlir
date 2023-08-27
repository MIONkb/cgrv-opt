module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 56 {
        %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
          %2 = affine.for %arg7 = 0 to 3 iter_args(%arg8 = %arg6) -> (f32) {
            %3 = affine.load %arg1[0, 0, %arg3 * 2 + %arg5, %arg4 * 2 + %arg7] : memref<1x64x114x114xf32>
            %4 = arith.cmpf ugt, %arg8, %3 : f32
            %5 = arith.select %4, %arg8, %3 : f32
            affine.yield %5 : f32
          }
          affine.yield %2 : f32
        }
        affine.store %1, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}
