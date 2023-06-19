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
    %16 = builtin.unrealized_conversion_cast %15 : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> to memref<1024xi32>
    %17 = llvm.mlir.constant(1024 : index) : i64
    %18 = llvm.mlir.constant(1 : index) : i64
    %19 = llvm.mlir.null : !llvm.ptr<i32>
    %20 = llvm.getelementptr %19[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %21 = llvm.ptrtoint %20 : !llvm.ptr<i32> to i64
    %22 = llvm.mlir.addressof @m2 : !llvm.ptr<array<1024 x i32>>
    %23 = llvm.getelementptr %22[0, 0] : (!llvm.ptr<array<1024 x i32>>) -> !llvm.ptr<i32>
    %24 = llvm.mlir.constant(3735928559 : index) : i64
    %25 = llvm.inttoptr %24 : i64 to !llvm.ptr<i32>
    %26 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %27 = llvm.insertvalue %25, %26[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.insertvalue %23, %27[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.insertvalue %29, %28[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %31 = llvm.insertvalue %17, %30[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.insertvalue %18, %31[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %33 = builtin.unrealized_conversion_cast %32 : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> to memref<1024xi32>
    %34 = llvm.mlir.constant(1024 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    %36 = llvm.mlir.null : !llvm.ptr<i32>
    %37 = llvm.getelementptr %36[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %38 = llvm.ptrtoint %37 : !llvm.ptr<i32> to i64
    %39 = llvm.mlir.addressof @prod : !llvm.ptr<array<1024 x i32>>
    %40 = llvm.getelementptr %39[0, 0] : (!llvm.ptr<array<1024 x i32>>) -> !llvm.ptr<i32>
    %41 = llvm.mlir.constant(3735928559 : index) : i64
    %42 = llvm.inttoptr %41 : i64 to !llvm.ptr<i32>
    %43 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %44 = llvm.insertvalue %42, %43[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %45 = llvm.insertvalue %40, %44[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %46 = llvm.mlir.constant(0 : index) : i64
    %47 = llvm.insertvalue %46, %45[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %48 = llvm.insertvalue %34, %47[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %49 = llvm.insertvalue %35, %48[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = builtin.unrealized_conversion_cast %49 : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> to memref<1024xi32>
    FDRA.KernelCall @gemm_kernel_0(%16, %33, %50) : (memref<1024xi32>, memref<1024xi32>, memref<1024xi32>) -> ()
    llvm.return
  }
}

