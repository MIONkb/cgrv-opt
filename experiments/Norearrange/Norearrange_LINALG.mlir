#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, 0)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<32x8xf32>) -> tensor<32x3xf32> {
    %c0_i64 = arith.constant 0 : i64
    %cst = arith.constant dense<[[-0.449171543, 0.455696881, 0.17025353], [0.242329478, 0.377554417, 0.501691937], [0.170462072, -0.409929156, 0.209289446]]> : tensor<3x3xf32>
    %cst_0 = arith.constant dense<1.000000e+00> : tensor<3xf32>
    %cst_1 = arith.constant dense<0.000000e+00> : tensor<3xf32>
    %cst_2 = arith.constant dense<[[0.00190132856, 0.12818782, -0.13007845, 0.260871589, -0.275066853, -0.228428081, 0.147990435, 0.204926863], [0.0595240369, 0.161283046, 0.0919029266, -0.110820077, -3.351550e-01, 0.187621325, -0.0460146219, -0.171391174], [-0.117879637, 0.125070855, -0.0755143389, 0.163461789, 0.287518084, -0.00780922081, 0.00631018402, 0.0010862085]]> : tensor<3x8xf32>
    %cst_3 = arith.constant dense<[0.0523872264, -0.112191662, -0.328343242]> : tensor<3xf32>
    %cst_4 = arith.constant dense<1.000000e+00> : tensor<8xf32>
    %cst_5 = arith.constant dense<0.000000e+00> : tensor<8xf32>
    %cst_6 = arith.constant 0.000000e+00 : f32
    %cst_7 = arith.constant 1.000000e+00 : f32
    %cst_8 = arith.constant 1.41421354 : f32
    %cst_9 = arith.constant 5.000000e-01 : f32
    %cst_10 = arith.constant 0xFF800000 : f32
    %cst_11 = arith.constant 1.000000e-05 : f64
    %cst_12 = arith.constant 8.000000e+00 : f32
    %cst_13 = arith.constant 3.000000e+00 : f32
    %0 = tensor.empty() : tensor<32x1xf32>
    %1 = linalg.fill ins(%cst_6 : f32) outs(%0 : tensor<32x1xf32>) -> tensor<32x1xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<32x8xf32>) outs(%1 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.addf %in, %out : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %3 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%2 : tensor<32x1xf32>) outs(%0 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.divf %in, %cst_12 : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %4 = tensor.empty() : tensor<32x8xf32>
    %5 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%3 : tensor<32x1xf32>) outs(%4 : tensor<32x8xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x8xf32>
    %6 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %5 : tensor<32x8xf32>, tensor<32x8xf32>) outs(%4 : tensor<32x8xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.subf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x8xf32>
    %7 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%6, %6 : tensor<32x8xf32>, tensor<32x8xf32>) outs(%4 : tensor<32x8xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.mulf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x8xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%7 : tensor<32x8xf32>) outs(%1 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.addf %in, %out : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %9 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%8 : tensor<32x1xf32>) outs(%0 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.divf %in, %cst_12 : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %10 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%9 : tensor<32x1xf32>) outs(%0 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.truncf %cst_11 : f64 to f32
      %48 = arith.addf %in, %47 : f32
      linalg.yield %48 : f32
    } -> tensor<32x1xf32>
    %11 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%10 : tensor<32x1xf32>) outs(%0 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = math.rsqrt %in : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %12 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%11 : tensor<32x1xf32>) outs(%4 : tensor<32x8xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x8xf32>
    %13 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%6, %12 : tensor<32x8xf32>, tensor<32x8xf32>) outs(%4 : tensor<32x8xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.mulf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x8xf32>
    %14 = linalg.generic {indexing_maps = [#map, #map2, #map], iterator_types = ["parallel", "parallel"]} ins(%13, %cst_4 : tensor<32x8xf32>, tensor<8xf32>) outs(%4 : tensor<32x8xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.mulf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x8xf32>
    %15 = linalg.generic {indexing_maps = [#map, #map2, #map], iterator_types = ["parallel", "parallel"]} ins(%14, %cst_5 : tensor<32x8xf32>, tensor<8xf32>) outs(%4 : tensor<32x8xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.addf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x8xf32>
    %16 = tensor.empty() : tensor<8x3xf32>
    %17 = linalg.generic {indexing_maps = [#map, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst_2 : tensor<3x8xf32>) outs(%16 : tensor<8x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<8x3xf32>
    %18 = tensor.empty() : tensor<32x3xf32>
    %19 = linalg.fill ins(%cst_6 : f32) outs(%18 : tensor<32x3xf32>) -> tensor<32x3xf32>
    %20 = linalg.matmul ins(%15, %17 : tensor<32x8xf32>, tensor<8x3xf32>) outs(%19 : tensor<32x3xf32>) -> tensor<32x3xf32>
    %21 = linalg.generic {indexing_maps = [#map, #map2, #map], iterator_types = ["parallel", "parallel"]} ins(%20, %cst_3 : tensor<32x3xf32>, tensor<3xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.addf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    %22 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%21 : tensor<32x3xf32>) outs(%1 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.addf %in, %out : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %23 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%22 : tensor<32x1xf32>) outs(%0 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.divf %in, %cst_13 : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %24 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%23 : tensor<32x1xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x3xf32>
    %25 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%21, %24 : tensor<32x3xf32>, tensor<32x3xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.subf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    %26 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%25, %25 : tensor<32x3xf32>, tensor<32x3xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.mulf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    %27 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%26 : tensor<32x3xf32>) outs(%1 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.addf %in, %out : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %28 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%27 : tensor<32x1xf32>) outs(%0 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.divf %in, %cst_13 : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %29 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%28 : tensor<32x1xf32>) outs(%0 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.truncf %cst_11 : f64 to f32
      %48 = arith.addf %in, %47 : f32
      linalg.yield %48 : f32
    } -> tensor<32x1xf32>
    %30 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%29 : tensor<32x1xf32>) outs(%0 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = math.rsqrt %in : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %31 = linalg.generic {indexing_maps = [#map1, #map], iterator_types = ["parallel", "parallel"]} ins(%30 : tensor<32x1xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<32x3xf32>
    %32 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%25, %31 : tensor<32x3xf32>, tensor<32x3xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.mulf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    %33 = linalg.generic {indexing_maps = [#map, #map2, #map], iterator_types = ["parallel", "parallel"]} ins(%32, %cst_0 : tensor<32x3xf32>, tensor<3xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.mulf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    %34 = linalg.generic {indexing_maps = [#map, #map2, #map], iterator_types = ["parallel", "parallel"]} ins(%33, %cst_1 : tensor<32x3xf32>, tensor<3xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.addf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    %35 = tensor.empty() : tensor<3x3xf32>
    %36 = linalg.generic {indexing_maps = [#map, #map3], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<3x3xf32>) outs(%35 : tensor<3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x3xf32>
    %37 = linalg.matmul ins(%34, %36 : tensor<32x3xf32>, tensor<3x3xf32>) outs(%19 : tensor<32x3xf32>) -> tensor<32x3xf32>
    %38 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%37 : tensor<32x3xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.divf %in, %cst_8 : f32
      %48 = math.erf %47 : f32
      %49 = arith.addf %48, %cst_7 : f32
      %50 = arith.mulf %49, %cst_9 : f32
      %51 = arith.mulf %in, %50 : f32
      linalg.yield %51 : f32
    } -> tensor<32x3xf32>
    %39 = tensor.empty() : tensor<32x1xi64>
    %40 = linalg.fill ins(%c0_i64 : i64) outs(%39 : tensor<32x1xi64>) -> tensor<32x1xi64>
    %41 = linalg.fill ins(%cst_10 : f32) outs(%0 : tensor<32x1xf32>) -> tensor<32x1xf32>
    %42:2 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "reduction"]} ins(%38 : tensor<32x3xf32>) outs(%41, %40 : tensor<32x1xf32>, tensor<32x1xi64>) {
    ^bb0(%in: f32, %out: f32, %out_14: i64):
      %47 = linalg.index 1 : index
      %48 = arith.index_cast %47 : index to i64
      %49 = arith.maxf %in, %out : f32
      %50 = arith.cmpf ogt, %in, %out : f32
      %51 = arith.select %50, %48, %out_14 : i64
      linalg.yield %49, %51 : f32, i64
    } -> (tensor<32x1xf32>, tensor<32x1xi64>)
    %43 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%38, %42#0 : tensor<32x3xf32>, tensor<32x1xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.subf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    %44 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%43 : tensor<32x3xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = math.exp %in : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    %45 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%44 : tensor<32x3xf32>) outs(%1 : tensor<32x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %47 = arith.addf %in, %out : f32
      linalg.yield %47 : f32
    } -> tensor<32x1xf32>
    %46 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%44, %45 : tensor<32x3xf32>, tensor<32x1xf32>) outs(%18 : tensor<32x3xf32>) {
    ^bb0(%in: f32, %in_14: f32, %out: f32):
      %47 = arith.divf %in, %in_14 : f32
      linalg.yield %47 : f32
    } -> tensor<32x3xf32>
    return %46 : tensor<32x3xf32>
  }
}