module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%a: memref<10xf32>, %b: memref<10xf32>) -> memref<10xf32> {
    %c = memref.alloc() {alignment = 64 : i64} : memref<10xf32> 
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %a[%arg0] : memref<10xf32>
      %1 = affine.load %b[%arg0] : memref<10xf32>
      %2 = arith.addf %0, %1 : f32
      affine.store  %2, %c[%arg0] : memref<10xf32>
    }
    return  %c : memref<10xf32>
  }
}

