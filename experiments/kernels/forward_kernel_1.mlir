"func.func"() ({
^bb0(%arg0: memref<2x3xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0.000000e+00 : f32} : () -> f32
  "affine.for"() ({
  ^bb0(%arg1: index):
    "affine.for"() ({
    ^bb0(%arg2: index):
      "affine.store"(%0, %arg0, %arg1, %arg2) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<2x3xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (2)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_1, function_type = (memref<2x3xf32>) -> (), sym_name = "forward_kernel_1"} : () -> ()