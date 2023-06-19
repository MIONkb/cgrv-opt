#map0 = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 2)>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  memref.global @prod : memref<1024xi32> = uninitialized
  memref.global @m2 : memref<1024xi32> = uninitialized
  memref.global @m1 : memref<1024xi32> = uninitialized
  func.func @gemm() attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @m1 : memref<1024xi32>
    %1 = memref.get_global @m2 : memref<1024xi32>
    %2 = memref.get_global @prod : memref<1024xi32>
    affine.for %arg0 = 0 to 32 step 2 {
      func.call @gemm_kernel_0(%0, %1, %2, %arg0) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>, index) -> ()
    }
    return
  }
  func.func @gemm_kernel_0(%arg0: memref<1024xi32>, %arg1: memref<1024xi32>, %arg2: memref<1024xi32>, %arg3: index) attributes {gemm_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg4 = #map0(%arg3) to #map1(%arg3) {
      affine.for %arg5 = 0 to 32 {
        %0 = affine.for %arg6 = 0 to 32 iter_args(%arg7 = %c0_i32) -> (i32) {
          %1 = affine.load %arg0[%arg6 + %arg4 * 32] : memref<1024xi32>
          %2 = affine.load %arg1[%arg5 + %arg6 * 32] : memref<1024xi32>
          %3 = arith.muli %1, %2 : i32
          %4 = arith.addi %arg7, %3 : i32
          affine.yield %4 : i32
        }
        affine.store %0, %arg2[%arg5 + %arg4 * 32] : memref<1024xi32>
      }
    }
    return
  }
}
