func.func @forward_kernel_0(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 1 {
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 112 {
        affine.for %arg6 = 0 to 112 {
          affine.for %arg7 = 0 to 3 {
            affine.for %arg8 = 0 to 7 {
              affine.for %arg9 = 0 to 7 {
                %0 = affine.load %arg0[%arg3, %arg7, %arg5 * 2 + %arg8, %arg6 * 2 + %arg9] : memref<1x3x230x230xf32>
                %1 = affine.load %arg1[%arg4, %arg7, %arg8, %arg9] : memref<64x3x7x7xf32>
                %2 = affine.load %arg2[%arg3, %arg4, %arg5, %arg6] : memref<1x64x112x112xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg2[%arg3, %arg4, %arg5, %arg6] : memref<1x64x112x112xf32>
              }
            }
          }
        }
      }
    }
  }
  return
}

// func.func @forward_kernel_0(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
//   cf.br ^bb1
// ^bb1:  // pred: ^bb0
//   affine.for %arg3 = 0 to 1 {
//     affine.for %arg4 = 0 to 64 {
//       affine.for %arg7 = 0 to 3 {
        
//           affine.for %arg5 = 0 to 112 {
//             affine.for %arg8 = 0 to 7 {
            
//               affine.for %arg6 = 0 to 112 {
//               affine.for %arg9 = 0 to 7 {
//                 %0 = affine.load %arg0[%arg3, %arg7, %arg5 * 2 + %arg8, %arg6 * 2 + %arg9] : memref<1x3x230x230xf32>
//                 %1 = affine.load %arg1[%arg4, %arg7, %arg8, %arg9] : memref<64x3x7x7xf32>
//                 %2 = affine.load %arg2[%arg3, %arg4, %arg5, %arg6] : memref<1x64x112x112xf32>
//                 %3 = arith.mulf %0, %1 : f32
//                 %4 = arith.addf %2, %3 : f32
//                 affine.store %4, %arg2[%arg3, %arg4, %arg5, %arg6] : memref<1x64x112x112xf32>
//               }
//             }
//           }
//         }
//       }
//     }
//   }
//   return
// }

//   affine.for %arg3 = 0 to 1 {
//     affine.for %arg4 = 0 to 64 {
//       affine.for %arg7 = 0 to 3 {
//         affine.for %arg8 = 0 to 7 {
//           affine.for %arg5 = 0 to 112 {
//             affine.for %arg9 = 0 to 7 {
//               affine.for %arg6 = 0 to 112 step 7 { // 16 
//               {
//                 ...
//                 %0 = affine.load %arg0[%arg3, %arg7, %arg5 * 2 + %arg8, %arg6 * 2 + %arg9] : memref<1x3x230x230xf32>
//                 %1 = affine.load %arg1[%arg4, %arg7, %arg8, %arg9] : memref<64x3x7x7xf32>
//                 %2 = affine.load %arg2[%arg3, %arg4, %arg5, %arg6] : memref<1x64x112x112xf32>
//                 %3 = arith.mulf %0, %1 : f32
//                 %4 = arith.addf %2, %3 : f32
//                 affine.store %4, %arg2[%arg3, %arg4, %arg5, %arg6] : memref<1x64x112x112xf32>
//                 ...
//               }
//               }
//             }
//           }
//         }
//       }
//     }
//   }