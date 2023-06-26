#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
    %c0_i64 = arith.constant 0 : i64
    %c1_i64 = arith.constant 1 : i64
    %cst = arith.constant dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]> : tensor<3x12xf32>
    %cst_0 = arith.constant dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]> : tensor<12x3xf32>
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %0 = tensor.empty() : tensor<3x12xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst_0 : tensor<12x3xf32>) outs(%0 : tensor<3x12xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x12xf32>
    %cast = tensor.cast %1 : tensor<3x12xf32> to tensor<3x12xf32>
    %c0_1 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0_1 : tensor<4x3xf32>
    %c1_2 = arith.constant 1 : index
    %dim_3 = tensor.dim %arg0, %c1_2 : tensor<4x3xf32>
    %c0_4 = arith.constant 0 : index
    %dim_5 = tensor.dim %cast, %c0_4 : tensor<3x12xf32>
    %c1_6 = arith.constant 1 : index
    %dim_7 = tensor.dim %cast, %c1_6 : tensor<3x12xf32>
    %2 = arith.cmpi eq, %dim_3, %dim_5 : index
    cf.assert %2, "mismatching contracting dimension for torch.aten.mm"
    %3 = tensor.empty(%dim, %dim_7) : tensor<?x?xf32>
    %cst_8 = arith.constant 0.000000e+00 : f32
    %4 = linalg.fill ins(%cst_8 : f32) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = linalg.matmul ins(%arg0, %cast : tensor<4x3xf32>, tensor<3x12xf32>) outs(%4 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast_9 = tensor.cast %5 : tensor<?x?xf32> to tensor<4x12xf32>
    %c0_10 = arith.constant 0 : index
    %c3_11 = arith.constant 3 : index
    %c1_12 = arith.constant 1 : index
    %c12_13 = arith.constant 12 : index
    %6 = tensor.empty() : tensor<12x3xf32>
    %7 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<3x12xf32>) outs(%6 : tensor<12x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<12x3xf32>
    %cast_14 = tensor.cast %7 : tensor<12x3xf32> to tensor<12x3xf32>
    %c0_15 = arith.constant 0 : index
    %dim_16 = tensor.dim %cast_9, %c0_15 : tensor<4x12xf32>
    %c1_17 = arith.constant 1 : index
    %dim_18 = tensor.dim %cast_9, %c1_17 : tensor<4x12xf32>
    %c0_19 = arith.constant 0 : index
    %dim_20 = tensor.dim %cast_14, %c0_19 : tensor<12x3xf32>
    %c1_21 = arith.constant 1 : index
    %dim_22 = tensor.dim %cast_14, %c1_21 : tensor<12x3xf32>
    %8 = arith.cmpi eq, %dim_18, %dim_20 : index
    cf.assert %8, "mismatching contracting dimension for torch.aten.mm"
    %9 = tensor.empty(%dim_16, %dim_22) : tensor<?x?xf32>
    %cst_23 = arith.constant 0.000000e+00 : f32
    %10 = linalg.fill ins(%cst_23 : f32) outs(%9 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %11 = linalg.matmul ins(%cast_9, %cast_14 : tensor<4x12xf32>, tensor<12x3xf32>) outs(%10 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast_24 = tensor.cast %11 : tensor<?x?xf32> to tensor<4x3xf32>
    return %cast_24 : tensor<4x3xf32>
  }
}

