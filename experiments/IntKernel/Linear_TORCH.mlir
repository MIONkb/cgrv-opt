module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: !torch.vtensor<[2,3],f32>) -> !torch.vtensor<[2,3],f32> {
    %int0 = torch.constant.int 0
    %int1 = torch.constant.int 1
    %0 = torch.vtensor.literal(dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]> : tensor<3x3xf32>) : !torch.vtensor<[3,3],f32>
    %1 = torch.aten.transpose.int %0, %int0, %int1 : !torch.vtensor<[3,3],f32>, !torch.int, !torch.int -> !torch.vtensor<[3,3],f32>
    %2 = torch.aten.mm %arg0, %1 : !torch.vtensor<[2,3],f32>, !torch.vtensor<[3,3],f32> -> !torch.vtensor<[2,3],f32>
    return %2 : !torch.vtensor<[2,3],f32>
  }
}

