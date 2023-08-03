"func.func"() ({
^bb0(%arg0: memref<1x128x30x30xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0.000000e+00 : f32} : () -> f32
  "affine.for"() ({
  ^bb0(%arg1: index):
    "affine.for"() ({
    ^bb0(%arg2: index):
      "affine.for"() ({
      ^bb0(%arg3: index):
        "affine.for"() ({
        ^bb0(%arg4: index):
          "affine.store"(%0, %arg0, %arg1, %arg2, %arg3, %arg4) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<1x128x30x30xf32>, index, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (30)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (30)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (128)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_35, function_type = (memref<1x128x30x30xf32>) -> (), sym_name = "forward_kernel_35"} : () -> ()