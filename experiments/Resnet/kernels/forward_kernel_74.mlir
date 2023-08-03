"func.func"() ({
^bb0(%arg0: memref<1x512x1x1xf32>, %arg1: memref<1x512x7x7xf32>):
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
          %0 = "affine.load"(%arg0, %arg2, %arg3, %arg4, %arg5) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<1x512x1x1xf32>, index, index, index, index) -> f32
          %1 = "affine.for"(%0) ({
          ^bb0(%arg6: index, %arg7: f32):
            %2 = "affine.for"(%arg7) ({
            ^bb0(%arg8: index, %arg9: f32):
              %3 = "affine.load"(%arg1, %arg2, %arg3, %arg4, %arg6, %arg5, %arg8) {map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 + d3, d4 + d5)>} : (memref<1x512x7x7xf32>, index, index, index, index, index, index) -> f32
              %4 = "arith.addf"(%arg9, %3) : (f32, f32) -> f32
              "affine.yield"(%4) : (f32) -> ()
            }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (7)>} : (f32) -> f32
            "affine.yield"(%2) : (f32) -> ()
          }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (7)>} : (f32) -> f32
          "affine.store"(%1, %arg0, %arg2, %arg3, %arg4, %arg5) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<1x512x1x1xf32>, index, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (512)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_74, function_type = (memref<1x512x1x1xf32>, memref<1x512x7x7xf32>) -> (), sym_name = "forward_kernel_74"} : () -> ()