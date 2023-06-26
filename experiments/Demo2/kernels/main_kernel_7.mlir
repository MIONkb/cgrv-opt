"func.func"() ({
^bb0(%arg0: memref<1x4x8xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0.000000e+00 : f32} : () -> f32
  "affine.for"() ({
  ^bb0(%arg1: index):
    "affine.for"() ({
    ^bb0(%arg2: index):
      "affine.for"() ({
      ^bb0(%arg3: index):
        "affine.store"(%0, %arg0, %arg1, %arg2, %arg3) {map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>} : (f32, memref<1x4x8xf32>, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (8)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, function_type = (memref<1x4x8xf32>) -> (), main_kernel_7, sym_name = "main_kernel_7"} : () -> ()