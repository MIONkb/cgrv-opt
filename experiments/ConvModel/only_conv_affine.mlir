#map = affine_map<(d0, d1) -> (d0 * 2 + d1)>
module attributes {soda.bambu.container_module, soda.container_module, tf.versions = {bad_consumers = [], min_consumer = 0 : i32, producer = 1087 : i32}} {
  func.func @main_kernel(%arg0: memref<4x35x35x1xf32> {llvm.noalias}, %arg1: memref<5x5x1x1xf32> {llvm.noalias}, %arg2: memref<4x16x16x1xf32> {llvm.noalias}) {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to 16 {
          affine.for %arg6 = 0 to 1 {
            affine.for %arg7 = 0 to 5 {
              affine.for %arg8 = 0 to 5 {
                affine.for %arg9 = 0 to 1 {
                  %0 = affine.apply #map(%arg4, %arg7)
                  %1 = affine.apply #map(%arg5, %arg8)
                  %2 = affine.load %arg0[%arg3, %0, %1, %arg9] : memref<4x35x35x1xf32>
                  %3 = affine.load %arg1[%arg7, %arg8, %arg9, %arg6] : memref<5x5x1x1xf32>
                  %4 = affine.load %arg2[%arg3, %arg4, %arg5, %arg6] : memref<4x16x16x1xf32>
                  %5 = arith.mulf %2, %3 : f32
                  %6 = arith.addf %4, %5 : f32
                  affine.store %6, %arg2[%arg3, %arg4, %arg5, %arg6] : memref<4x16x16x1xf32>
                }
              }
            }
          }
        }
      }
    }
    return
  }
}

