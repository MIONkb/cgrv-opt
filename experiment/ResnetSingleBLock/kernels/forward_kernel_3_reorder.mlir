module {
  func.func @forward_kernel_3(%arg0: memref<1x64x114x114xf32>, %arg1: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 64 {
        affine.for %arg4 = 0 to 3 {
          affine.for %arg5 = 0 to 56 {
            affine.for %arg6 = 0 to 3 {
              affine.for %arg7 = 0 to 56 {
                %0 = affine.load %arg0[%arg2, %arg3, %arg5 * 2 + %arg4, %arg7 * 2 + %arg6] : memref<1x64x114x114xf32>
                %1 = affine.load %arg1[%arg2, %arg3, %arg5, %arg7] : memref<1x64x56x56xf32>
                %2 = arith.maxf %1, %0 : f32
                affine.store %2, %arg1[%arg2, %arg3, %arg5, %arg7] : memref<1x64x56x56xf32>
              }
            }
          }
        }
      }
    }
    return
  }
}

