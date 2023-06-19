"func.func"() ({
^bb0(%arg0: memref<4x16x16x1xf32>, %arg1: memref<4x16x16x1xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0.000000e+00 : f32} : () -> f32
  "affine.for"() ({
  ^bb0(%arg2: index):
    "affine.for"() ({
    ^bb0(%arg3: index):
      "affine.for"() ({
      ^bb0(%arg4: index):
        "affine.for"() ({
        ^bb0(%arg5: index):
          %1 = "affine.load"(%arg0, %arg2, %arg3, %arg4, %arg5) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<4x16x16x1xf32>, index, index, index, index) -> f32
          %2 = "arith.addf"(%1, %0) : (f32, f32) -> f32
          "affine.store"(%2, %arg1, %arg2, %arg3, %arg4, %arg5) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<4x16x16x1xf32>, index, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (16)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (16)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
  "func.return"() : () -> ()
}) {function_type = (memref<4x16x16x1xf32>, memref<4x16x16x1xf32>) -> (), main_kernel_5, sym_name = "main_kernel_5"} : () -> ()