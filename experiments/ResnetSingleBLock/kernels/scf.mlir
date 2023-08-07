module {
  func.func @forward_kernel_2(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    scf.for %arg4 = %c0 to %c8 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c1_1 = arith.constant 1 : index
      scf.for %arg5 = %c0_0 to %c3 step %c1_1 {
        %c0_2 = arith.constant 0 : index
        %c7 = arith.constant 7 : index
        %c1_3 = arith.constant 1 : index
        scf.for %arg6 = %c0_2 to %c7 step %c1_3 {
          %c0_4 = arith.constant 0 : index
          %c7_5 = arith.constant 7 : index
          %c1_6 = arith.constant 1 : index
          scf.for %arg7 = %c0_4 to %c7_5 step %c1_6 {
            %c0_7 = arith.constant 0 : index
            %c2 = arith.constant 2 : index
            %0 = arith.muli %arg4, %c2 : index
            %1 = arith.addi %0, %arg7 : index
            %2 = memref.load %arg0[%c0_7, %arg5, %arg6, %1] : memref<1x3x230x230xf32>
            %c0_8 = arith.constant 0 : index
            %3 = memref.load %arg1[%c0_8, %arg5, %arg6, %arg7] : memref<64x3x7x7xf32>
            %c0_9 = arith.constant 0 : index
            %c0_10 = arith.constant 0 : index
            %c0_11 = arith.constant 0 : index
            %4 = memref.load %arg2[%c0_9, %c0_10, %c0_11, %arg4] : memref<1x64x112x112xf32>
            %5 = arith.mulf %2, %3 : f32
            %6 = arith.addf %4, %5 : f32
            %c0_12 = arith.constant 0 : index
            %c0_13 = arith.constant 0 : index
            %c0_14 = arith.constant 0 : index
            memref.store %6, %arg3[%c0_12, %c0_13, %c0_14, %arg4] : memref<1x64x112x112xf32>
          }
        }
      }
    }
    return
  }
}

