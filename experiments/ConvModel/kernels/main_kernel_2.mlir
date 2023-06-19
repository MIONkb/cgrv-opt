"func.func"() ({
^bb0(%arg0: memref<1x5x5x1xf32>, %arg1: memref<5x5x1x1xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg2: index):
    "affine.for"() ({
    ^bb0(%arg3: index):
      "affine.for"() ({
      ^bb0(%arg4: index):
        "affine.for"() ({
        ^bb0(%arg5: index):
          %0 = "affine.load"(%arg0, %arg5, %arg2, %arg3, %arg4) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<1x5x5x1xf32>, index, index, index, index) -> f32
          "affine.store"(%0, %arg1, %arg2, %arg3, %arg4, %arg5) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<5x5x1x1xf32>, index, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (5)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (5)>} : () -> ()
  "func.return"() : () -> ()
}) {function_type = (memref<1x5x5x1xf32>, memref<5x5x1x1xf32>) -> (), main_kernel_2, sym_name = "main_kernel_2"} : () -> ()