module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: !torch.vtensor<[4,3],f32>) -> !torch.vtensor<[4,3],f32> {
    %int0 = torch.constant.int 0
    %int1 = torch.constant.int 1
    %0 = torch.vtensor.literal(dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>) : !torch.vtensor<[3,3],f32>
    %1 = torch.aten.transpose.int %0, %int0, %int1 : !torch.vtensor<[3,3],f32>, !torch.int, !torch.int -> !torch.vtensor<[3,3],f32>
    %2 = torch.aten.mm %arg0, %1 : !torch.vtensor<[4,3],f32>, !torch.vtensor<[3,3],f32> -> !torch.vtensor<[4,3],f32>
    return %2 : !torch.vtensor<[4,3],f32>
  }
}