"func.func"() ({
^bb0(%arg0: memref<4xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0.000000e+00 : f32} : () -> f32
  "affine.for"() ({
  ^bb0(%arg1: index):
    "affine.store"(%0, %arg0, %arg1) {map = affine_map<(d0) -> (d0)>} : (f32, memref<4xf32>, index) -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, function_type = (memref<4xf32>) -> (), main_kernel_19, sym_name = "main_kernel_19"} : () -> ()