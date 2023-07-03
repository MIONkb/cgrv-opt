#set = affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  memref.global @output : memref<4x222x222x32xi32> = uninitialized
  memref.global @bias : memref<32xi32> = uninitialized
  memref.global @weights : memref<32x3x3x3xi32> = uninitialized
  memref.global @input : memref<4x224x224x3xi32> = uninitialized
  func.func @conv() attributes {llvm.linkage = #llvm.linkage<external>} {
    %true = arith.constant true
    %c-2147483648_i64 = arith.constant -2147483648 : i64
    %c2147483647_i64 = arith.constant 2147483647 : i64
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c224_i32 = arith.constant 224 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @weights : memref<32x3x3x3xi32>
    %1 = memref.get_global @input : memref<4x224x224x3xi32>
    %2 = memref.get_global @bias : memref<32xi32>
    %3 = memref.get_global @output : memref<4x222x222x32xi32>
    affine.for %arg0 = 0 to 4 {
      affine.for %arg1 = 0 to 32 {
        %4 = affine.load %2[%arg1] : memref<32xi32>
        affine.for %arg2 = 0 to 222 step 3 {
          %5 = FDRA.BlockLoad %1 [%arg0, %arg2, 0, 0] : memref<4x224x224x3xi32> -> memref<1x5x224x3xi32> {"conv_kernel_0"}
          %6 = FDRA.BlockLoad %0 [%arg1, 0, 0, 0] : memref<32x3x3x3xi32> -> memref<1x3x3x3xi32> {"conv_kernel_0"}
          %7 = FDRA.BlockLoad %3 [%arg0, %arg2, 0, %arg1] : memref<4x222x222x32xi32> -> memref<1x3x222x1xi32> {"conv_kernel_0"}
          FDRA.KernelCall @conv_kernel_0(%5, %6, %4, %7, %arg1) : (memref<1x5x224x3xi32>, memref<1x3x3x3xi32>, i32, memref<1x3x222x1xi32>, index) -> ()
          FDRA.BlockStore %7,  %3 [%arg0, %arg2, 0, %arg1] : memref<1x3x222x1xi32> -> memref<4x222x222x32xi32> {"conv_kernel_0"}
        }
      }
    }
    return
  }
  func.func @conv_kernel_0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: i32, %arg3: memref<1x3x222x1xi32>, %arg4: index) attributes {Kernel, conv_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %true = arith.constant true
    %c224_i32 = arith.constant 224 : i32
    %c0_i32 = arith.constant 0 : i32
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c2147483647_i64 = arith.constant 2147483647 : i64
    %c-2147483648_i64 = arith.constant -2147483648 : i64
    affine.for %arg5 = 0 to 3 {
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
        %3 = arith.addi %2, %arg2 : i32
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
        affine.store %6, %arg3[0, %arg5, %arg6, %arg4] : memref<1x3x222x1xi32>
      }
    }
    return
  }
}

