"func.func"() <{function_type = (memref<1x3x230x230xf32>, memref<64x3x7x7xf32>, memref<1x64x112x112xf32>, memref<1x64x112x112xf32>) -> (), sym_name = "forward_kernel_2"}> ({
^bb0(%arg0: memref<1x3x230x230xf32>, %arg1: memref<64x3x7x7xf32>, %arg2: memref<1x64x112x112xf32>, %arg3: memref<1x64x112x112xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg4: index):
    "affine.for"() ({
    ^bb0(%arg5: index):
      "affine.for"() ({
      ^bb0(%arg6: index):
        "affine.for"() ({
        ^bb0(%arg7: index):
          %0 = "affine.load"(%arg0, %arg5, %arg6, %arg4, %arg7) {map = affine_map<(d0, d1, d2, d3) -> (0, d0, d1, d2 * 2 + d3)>} : (memref<1x3x230x230xf32>, index, index, index, index) -> f32
          %1 = "affine.load"(%arg1, %arg5, %arg6, %arg7) {map = affine_map<(d0, d1, d2) -> (0, d0, d1, d2)>} : (memref<64x3x7x7xf32>, index, index, index) -> f32
          %2 = "affine.load"(%arg2, %arg4) {map = affine_map<(d0) -> (0, 0, 0, d0)>} : (memref<1x64x112x112xf32>, index) -> f32
          %3 = "arith.mulf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.store"(%4, %arg3, %arg4) {map = affine_map<(d0) -> (0, 0, 0, d0)>} : (f32, memref<1x64x112x112xf32>, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (7)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (7)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (8)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_2} : () -> ()