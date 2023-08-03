"func.func"() ({
^bb0(%arg0: memref<1x256x14x14xf32>, %arg1: memref<1x256x16x16xf32>, %arg2: memref<256x256x3x3xf32>):
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
          %0 = "affine.load"(%arg0, %arg3, %arg4, %arg5, %arg6) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<1x256x14x14xf32>, index, index, index, index) -> f32
          %1 = "affine.for"(%0) ({
          ^bb0(%arg7: index, %arg8: f32):
            %2 = "affine.for"(%arg8) ({
            ^bb0(%arg9: index, %arg10: f32):
              %3 = "affine.for"(%arg10) ({
              ^bb0(%arg11: index, %arg12: f32):
                %4 = "affine.load"(%arg1, %arg3, %arg7, %arg5, %arg9, %arg6, %arg11) {map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 + d3, d4 + d5)>} : (memref<1x256x16x16xf32>, index, index, index, index, index, index) -> f32
                %5 = "affine.load"(%arg2, %arg4, %arg7, %arg9, %arg11) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<256x256x3x3xf32>, index, index, index, index) -> f32
                %6 = "arith.mulf"(%4, %5) : (f32, f32) -> f32
                %7 = "arith.addf"(%arg12, %6) : (f32, f32) -> f32
                "affine.yield"(%7) : (f32) -> ()
              }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (f32) -> f32
              "affine.yield"(%3) : (f32) -> ()
            }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (f32) -> f32
            "affine.yield"(%2) : (f32) -> ()
          }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (256)>} : (f32) -> f32
          "affine.store"(%1, %arg0, %arg3, %arg4, %arg5, %arg6) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<1x256x14x14xf32>, index, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (14)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (14)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (256)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_53, function_type = (memref<1x256x14x14xf32>, memref<1x256x16x16xf32>, memref<256x256x3x3xf32>) -> (), sym_name = "forward_kernel_53"} : () -> ()