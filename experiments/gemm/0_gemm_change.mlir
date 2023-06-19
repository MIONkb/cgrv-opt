module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  memref.global @prod : memref<1024xi32> = uninitialized
  memref.global @m2 : memref<1024xi32> = uninitialized
  memref.global @m1 : memref<1024xi32> = uninitialized
  func.func @gemm() attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @m1 : memref<1024xi32>
    %1 = memref.get_global @m2 : memref<1024xi32>
    %2 = memref.get_global @prod : memref<1024xi32>
    affine.for %arg0 = 5 to 29 {
      affine.for %arg1 = 0 to 32 {
        %3 = affine.for %arg2 = 0 to 32 iter_args(%arg3 = %c0_i32) -> (i32) {
          %4 = affine.load %0[%arg2 + %arg0 * 32] : memref<1024xi32>
          %5 = affine.load %1[%arg1 + %arg2 * 32] : memref<1024xi32>
          %6 = arith.muli %4, %5 : i32
          %7 = arith.addi %arg3, %6 : i32
          affine.yield %7 : i32
        }
        affine.store %3, %2[%arg1 + %arg0 * 32] : memref<1024xi32>
      }
    }
    
    return
  }
}
