#map0 = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 8)>
#map2 = affine_map<(d0) -> (d0 + 1)>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  memref.global @prod : memref<1024xi32> = uninitialized
  memref.global @m2 : memref<1024xi32> = uninitialized
  memref.global @m1 : memref<1024xi32> = uninitialized
  func.func @gemm() attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @m1 : memref<1024xi32>
    %1 = memref.get_global @m2 : memref<1024xi32>
    %2 = memref.get_global @prod : memref<1024xi32>
    affine.for %arg0 = 0 to 32 step 8 {
      FDRA.kernel {
        affine.for %arg1 = #map0(%arg0) to #map1(%arg0) {
          affine.for %arg2 = 0 to 32 {
            %3 = affine.for %arg3 = 0 to 32 step 2 iter_args(%arg4 = %c0_i32) -> (i32) {
              %4 = affine.load %0[%arg3 + %arg1 * 32] : memref<1024xi32>
              %5 = affine.load %1[%arg2 + %arg3 * 32] : memref<1024xi32>
              %6 = arith.muli %4, %5 : i32
              %7 = arith.addi %arg4, %6 : i32
              %8 = affine.apply #map2(%arg3)
              %9 = affine.load %0[%8 + %arg1 * 32] : memref<1024xi32>
              %10 = affine.load %1[%arg2 + %8 * 32] : memref<1024xi32>
              %11 = arith.muli %9, %10 : i32
              %12 = arith.addi %7, %11 : i32
              affine.yield %12 : i32
            }
            affine.store %3, %2[%arg2 + %arg1 * 32] : memref<1024xi32>
          }
        }
        FDRA.terminator
      }
    }
    return
  }
}
