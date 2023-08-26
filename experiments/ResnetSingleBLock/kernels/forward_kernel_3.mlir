"func.func"() <{function_type = (memref<1x64x56x56xf32>, memref<1x64x114x114xf32>, memref<1x64x56x56xf32>) -> (), sym_name = "forward_kernel_3"}> ({
^bb0(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      %0 = "affine.load"(%arg0, %arg3, %arg4) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (memref<1x64x56x56xf32>, index, index) -> f32
      %1 = "affine.for"(%0) ({
      ^bb0(%arg5: index, %arg6: f32):
        %2 = "affine.for"(%arg6) ({
        ^bb0(%arg7: index, %arg8: f32):
          %3 = "affine.load"(%arg1, %arg3, %arg5, %arg4, %arg7) {map = affine_map<(d0, d1, d2, d3) -> (0, 0, d0 * 2 + d1, d2 * 2 + d3)>} : (memref<1x64x114x114xf32>, index, index, index, index) -> f32
          %4 = "arith.cmpf"(%arg8, %3) <{predicate = 9 : i64}> : (f32, f32) -> i1
          %5 = "arith.select"(%4, %arg8, %3) : (i1, f32, f32) -> f32
          "affine.yield"(%5) : (f32) -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (f32) -> f32
        "affine.yield"(%2) : (f32) -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (f32) -> f32
      "affine.store"(%1, %arg2, %arg3, %arg4) {map = affine_map<(d0, d1) -> (0, 0, d0, d1)>} : (f32, memref<1x64x56x56xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (56)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_3} : () -> ()