"func.func"() ({
^bb0(%arg0: memref<1024xi32>, %arg1: memref<1024xi32>, %arg2: memref<1024xi32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0 : i32} : () -> i32
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      %1 = "affine.for"(%0) ({
      ^bb0(%arg5: index, %arg6: i32):
        %2 = "affine.load"(%arg0, %arg5, %arg3) {map = affine_map<(d0, d1) -> (d0 + d1 * 32)>} : (memref<1024xi32>, index, index) -> i32
        %3 = "affine.load"(%arg1, %arg4, %arg5) {map = affine_map<(d0, d1) -> (d0 + d1 * 32)>} : (memref<1024xi32>, index, index) -> i32
        %4 = "arith.muli"(%2, %3) : (i32, i32) -> i32
        %5 = "arith.addi"(%arg6, %4) : (i32, i32) -> i32
        "affine.yield"(%5) : (i32) -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (32)>} : (i32) -> i32
      "affine.store"(%1, %arg2, %arg4, %arg3) {map = affine_map<(d0, d1) -> (d0 + d1 * 32)>} : (i32, memref<1024xi32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (32)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (32)>} : () -> ()
  "func.return"() : () -> ()
}) {function_type = (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> (), gemm_kernel_0, sym_name = "gemm_kernel_0"} : () -> ()