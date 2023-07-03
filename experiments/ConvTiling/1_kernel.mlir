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
    FDRA.kernel {
      affine.for %arg0 = 0 to 4 {
        affine.for %arg1 = 0 to 32 {
          %4 = affine.load %2[%arg1] : memref<32xi32>
          affine.for %arg2 = 0 to 222 {
            %5 = arith.index_cast %arg2 : index to i32
            affine.for %arg3 = 0 to 222 {
              %6 = arith.index_cast %arg3 : index to i32
              %7 = affine.for %arg4 = 0 to 3 iter_args(%arg5 = %c0_i32) -> (i32) {
                %12 = arith.index_cast %arg4 : index to i32
                %13 = arith.addi %5, %12 : i32
                %14 = affine.if #set(%arg2, %arg4) -> i1 {
                  affine.yield %true : i1
                } else {
                  %16 = arith.cmpi sge, %13, %c224_i32 : i32
                  affine.yield %16 : i1
                }
                %15 = affine.for %arg6 = 0 to 3 iter_args(%arg7 = %arg5) -> (i32) {
                  %16 = arith.index_cast %arg6 : index to i32
                  %17 = arith.addi %6, %16 : i32
                  %18 = scf.if %14 -> (i1) {
                    scf.yield %true : i1
                  } else {
                    %21 = arith.cmpi slt, %17, %c0_i32 : i32
                    scf.yield %21 : i1
                  }
                  %19 = scf.if %18 -> (i1) {
                    scf.yield %true : i1
                  } else {
                    %21 = arith.cmpi sge, %17, %c224_i32 : i32
                    scf.yield %21 : i1
                  }
                  %20 = affine.for %arg8 = 0 to 3 iter_args(%arg9 = %arg7) -> (i32) {
                    %21 = scf.if %19 -> (i32) {
                      scf.yield %c0_i32 : i32
                    } else {
                      %25 = affine.load %1[%arg0, %arg2 + %arg4, %arg3 + %arg6, %arg8] : memref<4x224x224x3xi32>
                      scf.yield %25 : i32
                    }
                    %22 = affine.load %0[%arg1, %arg4, %arg6, %arg8] : memref<32x3x3x3xi32>
                    %23 = arith.muli %22, %21 : i32
                    %24 = arith.addi %arg9, %23 : i32
                    affine.yield %24 : i32
                  }
                  affine.yield %20 : i32
                }
                affine.yield %15 : i32
              }
              %8 = arith.addi %7, %4 : i32
              %9 = arith.cmpi sgt, %8, %c2147483647_i32 : i32
              %10 = scf.if %9 -> (i64) {
                scf.yield %c2147483647_i64 : i64
              } else {
                %12 = arith.extsi %8 : i32 to i64
                %13 = arith.cmpi slt, %12, %c-2147483648_i64 : i64
                %14 = arith.select %13, %c-2147483648_i64, %12 : i64
                scf.yield %14 : i64
              }
              %11 = arith.trunci %10 : i64 to i32
              affine.store %11, %3[%arg0, %arg2, %arg3, %arg1] : memref<4x222x222x32xi32>
            }
          }
        }
      }
      FDRA.terminator
    }
    return
  }
}

