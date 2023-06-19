#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>
    %0 = bufferization.alloc_tensor() : tensor<3x3xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst_0 : tensor<3x3xf32>) outs(%0 : tensor<3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x3xf32>
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %2 = bufferization.alloc_tensor(%c4, %c3) : tensor<?x?xf32>
    %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = linalg.matmul ins(%arg0, %1 : tensor<4x3xf32>, tensor<3x3xf32>) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast = tensor.cast %4 : tensor<?x?xf32> to tensor<4x3xf32>
    return %cast : tensor<4x3xf32>
  }
}

