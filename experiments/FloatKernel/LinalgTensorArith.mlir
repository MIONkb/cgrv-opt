#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
    %c0_i64 = arith.constant 0 : i64
    %c1_i64 = arith.constant 1 : i64
    %cst = arith.constant dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]> : tensor<3x3xf32>
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c3_0 = arith.constant 3 : index
    %0 = tensor.empty() : tensor<3x3xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<3x3xf32>) outs(%0 : tensor<3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x3xf32>
    %cast = tensor.cast %1 : tensor<3x3xf32> to tensor<3x3xf32>
    %c0_1 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0_1 : tensor<2x3xf32>
    %c1_2 = arith.constant 1 : index
    %dim_3 = tensor.dim %arg0, %c1_2 : tensor<2x3xf32>
    %c0_4 = arith.constant 0 : index
    %dim_5 = tensor.dim %cast, %c0_4 : tensor<3x3xf32>
    %c1_6 = arith.constant 1 : index
    %dim_7 = tensor.dim %cast, %c1_6 : tensor<3x3xf32>
    %2 = arith.cmpi eq, %dim_3, %dim_5 : index
    cf.assert %2, "mismatching contracting dimension for torch.aten.mm"
    %3 = tensor.empty(%dim, %dim_7) : tensor<?x?xf32>
    %cst_8 = arith.constant 0.000000e+00 : f32
    %4 = linalg.fill ins(%cst_8 : f32) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = linalg.matmul ins(%arg0, %cast : tensor<2x3xf32>, tensor<3x3xf32>) outs(%4 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast_9 = tensor.cast %5 : tensor<?x?xf32> to tensor<2x3xf32>
    return %cast_9 : tensor<2x3xf32>
  }
}

