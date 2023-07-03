#set = affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>
  func.func @conv_kernel_0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: memref<1xi32>, %arg3: memref<1x3x222x1xi32>) attributes {Kernel, conv_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %true = arith.constant true
    %c224_i32 = arith.constant 224 : i32
    %c0_i32 = arith.constant 0 : i32
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c2147483647_i64 = arith.constant 2147483647 : i64
    %c-2147483648_i64 = arith.constant -2147483648 : i64
    affine.for %arg5 = 0 to 3 {
      %v_arg2 = affine.load %arg2[0] : memref<1xi32>
      %0 = arith.index_cast %arg5 : index to i32
      affine.for %arg6 = 0 to 222 {
        %1 = arith.index_cast %arg6 : index to i32
        %2 = affine.for %arg7 = 0 to 3 iter_args(%arg8 = %c0_i32) -> (i32) {
          %7 = arith.index_cast %arg7 : index to i32
          %8 = arith.addi %0, %7 : i32
          %9 = affine.if #set(%arg5, %arg7) -> i1 {
            affine.yield %true : i1
          } else {
            %11 = arith.cmpi sge, %8, %c224_i32 : i32
            affine.yield %11 : i1
          }
          %10 = affine.for %arg9 = 0 to 3 iter_args(%arg10 = %arg8) -> (i32) {
            %11 = arith.index_cast %arg9 : index to i32
            %12 = arith.addi %1, %11 : i32
            %13 = scf.if %9 -> (i1) {
              scf.yield %true : i1
            } else {
              %16 = arith.cmpi slt, %12, %c0_i32 : i32
              scf.yield %16 : i1
            }
            %14 = scf.if %13 -> (i1) {
              scf.yield %true : i1
            } else {
              %16 = arith.cmpi sge, %12, %c224_i32 : i32
              scf.yield %16 : i1
            }
            %15 = affine.for %arg11 = 0 to 3 iter_args(%arg12 = %arg10) -> (i32) {
              %16 = scf.if %14 -> (i32) {
                scf.yield %c0_i32 : i32
              } else {
                %20 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %arg9, %arg11] : memref<1x5x224x3xi32>
                scf.yield %20 : i32
              }
              %17 = affine.load %arg1[0, %arg7, %arg9, %arg11] : memref<1x3x3x3xi32>
              %18 = arith.muli %17, %16 : i32
              %19 = arith.addi %arg12, %18 : i32
              affine.yield %19 : i32
            }
            affine.yield %15 : i32
          }
          affine.yield %10 : i32
        }
        %3 = arith.addi %2, %v_arg2 : i32
        %4 = arith.cmpi sgt, %3, %c2147483647_i32 : i32
        %5 = scf.if %4 -> (i64) {
          scf.yield %c2147483647_i64 : i64
        } else {
          %7 = arith.extsi %3 : i32 to i64
          %8 = arith.cmpi slt, %7, %c-2147483648_i64 : i64
          %9 = arith.select %8, %c-2147483648_i64, %7 : i64
          scf.yield %9 : i64
        }
        %6 = arith.trunci %5 : i64 to i32
        affine.store %6, %arg3[0, %arg5, %arg6, 0] : memref<1x3x222x1xi32>
      }
    }
    return
  }