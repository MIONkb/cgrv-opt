"func.func"() <{function_type = (memref<1x64x112x112xf32>, index, index, index, memref<1x3x230x230xf32>, memref<64x3x7x7xf32>, index) -> (), sym_name = "forward_kernel_2"}> ({
^bb0(%arg0: memref<1x64x112x112xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<1x3x230x230xf32>, %arg5: memref<64x3x7x7xf32>, %arg6: index):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"(%arg6, %arg6) ({
  ^bb0(%arg7: index):
    %0 = "affine.load"(%arg0, %arg1, %arg2, %arg3, %arg7) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<1x64x112x112xf32>, index, index, index, index) -> f32
    %1 = "affine.for"(%0) ({
    ^bb0(%arg8: index, %arg9: f32):
      %2 = "affine.for"(%arg9) ({
      ^bb0(%arg10: index, %arg11: f32):
        %3 = "affine.for"(%arg11) ({
        ^bb0(%arg12: index, %arg13: f32):
          %4 = "affine.load"(%arg4, %arg1, %arg8, %arg3, %arg10, %arg7, %arg12) {map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 * 2 + d3, d4 * 2 + d5)>} : (memref<1x3x230x230xf32>, index, index, index, index, index, index) -> f32
          %5 = "affine.load"(%arg5, %arg2, %arg8, %arg10, %arg12) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<64x3x7x7xf32>, index, index, index, index) -> f32
          %6 = "arith.mulf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %7 = "arith.addf"(%arg13, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"(%7) : (f32) -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (7)>} : (f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (7)>} : (f32) -> f32
      "affine.yield"(%2) : (f32) -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (f32) -> f32
    "affine.store"(%1, %arg0, %arg1, %arg2, %arg3, %arg7) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<1x64x112x112xf32>, index, index, index, index) -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<(d0) -> (d0)>, step = 1 : index, upper_bound = affine_map<(d0) -> (d0 + 8)>} : (index, index) -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_2} : () -> ()