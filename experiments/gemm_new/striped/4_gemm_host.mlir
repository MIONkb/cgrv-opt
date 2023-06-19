#map = affine_map<(d0) -> (d0 + 1)>
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
      %3 = FDRA.BlockLoad %0 [%arg0 * 32] : memref<1024xi32> -> memref<255xi32> {"gemm_kernel_0"}
      %4 = FDRA.BlockLoad %1 [0] : memref<1024xi32> -> memref<992xi32> {"gemm_kernel_0"}
      %5 = FDRA.BlockLoad %0 [%arg0 * 32 + 1] : memref<1024xi32> -> memref<255xi32> {"gemm_kernel_0"}
      %6 = FDRA.BlockLoad %1 [32] : memref<1024xi32> -> memref<992xi32> {"gemm_kernel_0"}
      %7 = FDRA.BlockLoad %2 [%arg0 * 32] : memref<1024xi32> -> memref<256xi32> {"gemm_kernel_0"}
      FDRA.KernelCall @gemm_kernel_0(%3, %4, %5, %6, %7) : (memref<255xi32>, memref<992xi32>, memref<255xi32>, memref<992xi32>, memref<256xi32>) -> ()
      FDRA.BlockStore %7,  %2 [%arg0 * 32] : memref<256xi32> -> memref<1024xi32> {"gemm_kernel_0"}
    }
    return
  }
  func.func @gemm_kernel_0(%arg0: memref<255xi32>, %arg1: memref<992xi32>, %arg2: memref<255xi32>, %arg3: memref<992xi32>, %arg4: memref<256xi32>) attributes {gemm_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg5 = 0 to 8 {
      affine.for %arg6 = 0 to 32 {
        %0 = affine.for %arg7 = 0 to 32 step 2 iter_args(%arg8 = %c0_i32) -> (i32) {
          %1 = affine.load %arg0[%arg7 + %arg5 * 32] : memref<255xi32>
          %2 = affine.load %arg1[%arg6 + %arg7 * 32] : memref<992xi32>
          %3 = arith.muli %1, %2 : i32
          %4 = arith.addi %arg8, %3 : i32
          %5 = affine.apply #map(%arg7)
          %6 = affine.load %arg2[%5 + %arg5 * 32] : memref<255xi32>
          %7 = affine.load %arg3[%arg6 + %5 * 32 - 32] : memref<992xi32>
          %8 = arith.muli %6, %7 : i32
          %9 = arith.addi %4, %8 : i32
          affine.yield %9 : i32
        }
        affine.store %0, %arg4[%arg6 + %arg5 * 32] : memref<256xi32>
      }
    }
    return
  }
}

