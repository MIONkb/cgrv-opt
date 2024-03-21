module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: !torch.vtensor<[3,3],f32>) -> !torch.vtensor<[3,3],f32> {
    %int0 = torch.constant.int 0
    %int1 = torch.constant.int 1
    %0 = torch.vtensor.literal(dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]> : tensor<3x3xf32>) : !torch.vtensor<[3,3],f32>
    %1 = torch.aten.transpose.int %0, %int0, %int1 : !torch.vtensor<[3,3],f32>, !torch.int, !torch.int -> !torch.vtensor<[3,3],f32>
    %2 = torch.aten.mm %arg0, %1 : !torch.vtensor<[3,3],f32>, !torch.vtensor<[3,3],f32> -> !torch.vtensor<[3,3],f32>
    return %2 : !torch.vtensor<[3,3],f32>
  }
}

