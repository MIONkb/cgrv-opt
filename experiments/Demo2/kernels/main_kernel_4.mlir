"func.func"() ({
^bb0(%arg0: memref<4x35x35x1xf32>, %arg1: memref<5x5x1x1xf32>, %arg2: memref<4x16x16x1xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      "affine.for"() ({
      ^bb0(%arg5: index):
        "affine.for"() ({
        ^bb0(%arg6: index):
          "affine.for"() ({
          ^bb0(%arg7: index):
            "affine.for"() ({
            ^bb0(%arg8: index):
              "affine.for"() ({
              ^bb0(%arg9: index):
                %0 = "affine.load"(%arg0, %arg3, %arg4, %arg7, %arg5, %arg8, %arg9) {map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d2, d3 * 2 + d4, d5)>} : (memref<4x35x35x1xf32>, index, index, index, index, index, index) -> f32
                %1 = "affine.load"(%arg1, %arg7, %arg8, %arg9, %arg6) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<5x5x1x1xf32>, index, index, index, index) -> f32
                %2 = "affine.load"(%arg2, %arg3, %arg4, %arg5, %arg6) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<4x16x16x1xf32>, index, index, index, index) -> f32
                %3 = "arith.mulf"(%0, %1) : (f32, f32) -> f32
                %4 = "arith.addf"(%2, %3) : (f32, f32) -> f32
                "affine.store"(%4, %arg2, %arg3, %arg4, %arg5, %arg6) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<4x16x16x1xf32>, index, index, index, index) -> ()
                "affine.yield"() : () -> ()
              }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
              "affine.yield"() : () -> ()
            }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (5)>} : () -> ()
            "affine.yield"() : () -> ()
          }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (5)>} : () -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (16)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (16)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, function_type = (memref<4x35x35x1xf32>, memref<5x5x1x1xf32>, memref<4x16x16x1xf32>) -> (), main_kernel_4, sym_name = "main_kernel_4"} : () -> ()