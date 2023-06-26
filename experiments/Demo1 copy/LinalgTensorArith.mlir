#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
    %c0_i64 = arith.constant 0 : i64
    %c1_i64 = arith.constant 1 : i64
    %cst = arith.constant dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>
    %cst_0 = arith.constant dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>
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

