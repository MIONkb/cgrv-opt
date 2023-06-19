module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  llvm.mlir.global external @prod() : !llvm.array<1024 x i32> {
    %0 = llvm.mlir.undef : !llvm.array<1024 x i32>
    llvm.return %0 : !llvm.array<1024 x i32>
  }
  llvm.mlir.global external @m2() : !llvm.array<1024 x i32> {
    %0 = llvm.mlir.undef : !llvm.array<1024 x i32>
    llvm.return %0 : !llvm.array<1024 x i32>
  }
  llvm.mlir.global external @m1() : !llvm.array<1024 x i32> {
    %0 = llvm.mlir.undef : !llvm.array<1024 x i32>
    llvm.return %0 : !llvm.array<1024 x i32>
  }
  llvm.func @gemm() {
    %0 = llvm.mlir.constant(1024 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.null : !llvm.ptr<i32>
    %3 = llvm.getelementptr %2[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %4 = llvm.ptrtoint %3 : !llvm.ptr<i32> to i64
    %5 = llvm.mlir.addressof @m1 : !llvm.ptr<array<1024 x i32>>
    %6 = llvm.getelementptr %5[0, 0] : (!llvm.ptr<array<1024 x i32>>) -> !llvm.ptr<i32>
    %7 = llvm.mlir.constant(3735928559 : index) : i64
    %8 = llvm.inttoptr %7 : i64 to !llvm.ptr<i32>
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %8, %9[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %6, %10[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.insertvalue %0, %13[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.insertvalue %1, %14[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1024 : index) : i64
    %17 = llvm.mlir.constant(1 : index) : i64
    %18 = llvm.mlir.null : !llvm.ptr<i32>
    %19 = llvm.getelementptr %18[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %20 = llvm.ptrtoint %19 : !llvm.ptr<i32> to i64
    %21 = llvm.mlir.addressof @m2 : !llvm.ptr<array<1024 x i32>>
    %22 = llvm.getelementptr %21[0, 0] : (!llvm.ptr<array<1024 x i32>>) -> !llvm.ptr<i32>
    %23 = llvm.mlir.constant(3735928559 : index) : i64
    %24 = llvm.inttoptr %23 : i64 to !llvm.ptr<i32>
    %25 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %26 = llvm.insertvalue %24, %25[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.insertvalue %22, %26[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.mlir.constant(0 : index) : i64
    %29 = llvm.insertvalue %28, %27[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.insertvalue %16, %29[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %31 = llvm.insertvalue %17, %30[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.mlir.constant(1024 : index) : i64
    %33 = llvm.mlir.constant(1 : index) : i64
    %34 = llvm.mlir.null : !llvm.ptr<i32>
    %35 = llvm.getelementptr %34[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %36 = llvm.ptrtoint %35 : !llvm.ptr<i32> to i64
    %37 = llvm.mlir.addressof @prod : !llvm.ptr<array<1024 x i32>>
    %38 = llvm.getelementptr %37[0, 0] : (!llvm.ptr<array<1024 x i32>>) -> !llvm.ptr<i32>
    %39 = llvm.mlir.constant(3735928559 : index) : i64
    %40 = llvm.inttoptr %39 : i64 to !llvm.ptr<i32>
    %41 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %42 = llvm.insertvalue %40, %41[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %43 = llvm.insertvalue %38, %42[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %44 = llvm.mlir.constant(0 : index) : i64
    %45 = llvm.insertvalue %44, %43[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %46 = llvm.insertvalue %32, %45[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %47 = llvm.insertvalue %33, %46[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @gemm_kernel_0(%6, %22, %38) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    llvm.return
  }
  llvm.func @gemm_kernel_0(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>, %arg2: !llvm.ptr<i32>) attributes {gemm_kernel_0} 
}

