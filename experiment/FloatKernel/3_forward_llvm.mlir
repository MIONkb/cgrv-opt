module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]> : tensor<3x3xf32>) {addr_space = 0 : i32} : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %17 = llvm.mlir.constant(3 : index) : i64
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.constant(9 : index) : i64
    %21 = llvm.mlir.null : !llvm.ptr
    %22 = llvm.getelementptr %21[9] : (!llvm.ptr) -> !llvm.ptr, f32
    %23 = llvm.ptrtoint %22 : !llvm.ptr to i64
    %24 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr
    %25 = llvm.getelementptr %24[0, %19, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<3 x array<3 x f32>>
    %26 = llvm.mlir.constant(3735928559 : index) : i64
    %27 = llvm.inttoptr %26 : i64 to !llvm.ptr
    %28 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %27, %28[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %25, %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %17, %32[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %18, %33[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %18, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %19, %35[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(3 : index) : i64
    %38 = llvm.mlir.constant(3 : index) : i64
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.mlir.constant(9 : index) : i64
    %41 = llvm.alloca %40 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
    %42 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %43 = llvm.insertvalue %41, %42[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.insertvalue %41, %43[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %37, %46[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %38, %47[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %38, %48[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %39, %49[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.extractvalue %36[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.extractvalue %50[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%51, %52) : (!llvm.ptr, !llvm.ptr) -> ()
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.mlir.constant(3 : index) : i64
    %55 = llvm.mlir.constant(1 : index) : i64
    %56 = llvm.mlir.constant(9 : index) : i64
    %57 = llvm.alloca %56 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr
    %58 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %59 = llvm.insertvalue %57, %58[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %60 = llvm.insertvalue %57, %59[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %61 = llvm.mlir.constant(0 : index) : i64
    %62 = llvm.insertvalue %61, %60[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.insertvalue %53, %62[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.insertvalue %54, %63[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %65 = llvm.insertvalue %54, %64[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %55, %65[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%15 : i64)
  ^bb1(%67: i64):  // 2 preds: ^bb0, ^bb5
    %68 = llvm.icmp "slt" %67, %14 : i64
    llvm.cond_br %68, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%69: i64):  // 2 preds: ^bb2, ^bb4
    %70 = llvm.icmp "slt" %69, %14 : i64
    llvm.cond_br %70, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %71 = llvm.mlir.constant(3 : index) : i64
    %72 = llvm.mul %67, %71  : i64
    %73 = llvm.add %72, %69  : i64
    %74 = llvm.getelementptr %57[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %16, %74 : f32, !llvm.ptr
    %75 = llvm.add %69, %13  : i64
    llvm.br ^bb3(%75 : i64)
  ^bb5:  // pred: ^bb3
    %76 = llvm.add %67, %13  : i64
    llvm.br ^bb1(%76 : i64)
  ^bb6:  // pred: ^bb1
    %77 = llvm.mlir.constant(3 : index) : i64
    %78 = llvm.mlir.constant(3 : index) : i64
    %79 = llvm.mlir.constant(1 : index) : i64
    %80 = llvm.mlir.constant(9 : index) : i64
    %81 = llvm.mlir.null : !llvm.ptr
    %82 = llvm.getelementptr %81[9] : (!llvm.ptr) -> !llvm.ptr, f32
    %83 = llvm.ptrtoint %82 : !llvm.ptr to i64
    %84 = llvm.mlir.constant(64 : index) : i64
    %85 = llvm.add %83, %84  : i64
    %86 = llvm.call @malloc(%85) : (i64) -> !llvm.ptr
    %87 = llvm.ptrtoint %86 : !llvm.ptr to i64
    %88 = llvm.mlir.constant(1 : index) : i64
    %89 = llvm.sub %84, %88  : i64
    %90 = llvm.add %87, %89  : i64
    %91 = llvm.urem %90, %84  : i64
    %92 = llvm.sub %90, %91  : i64
    %93 = llvm.inttoptr %92 : i64 to !llvm.ptr
    %94 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %95 = llvm.insertvalue %86, %94[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %96 = llvm.insertvalue %93, %95[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %97 = llvm.mlir.constant(0 : index) : i64
    %98 = llvm.insertvalue %97, %96[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %99 = llvm.insertvalue %77, %98[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %100 = llvm.insertvalue %78, %99[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %101 = llvm.insertvalue %78, %100[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %102 = llvm.insertvalue %79, %101[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = llvm.mlir.constant(1 : index) : i64
    %104 = llvm.mul %53, %103  : i64
    %105 = llvm.mul %104, %54  : i64
    %106 = llvm.mlir.null : !llvm.ptr
    %107 = llvm.getelementptr %106[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %108 = llvm.ptrtoint %107 : !llvm.ptr to i64
    %109 = llvm.mul %105, %108  : i64
    %110 = llvm.getelementptr %57[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %111 = llvm.getelementptr %93[%97] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    "llvm.intr.memcpy"(%111, %110, %109) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %112 = llvm.extractvalue %102[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %113 = llvm.extractvalue %50[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%112, %arg0, %113) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %114 = llvm.extractvalue %102[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %114 : !llvm.ptr
  }
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(3 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(3 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.mlir.constant(3 : index) : i64
    %28 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%28 : i64)
  ^bb2(%29: i64):  // 2 preds: ^bb1, ^bb6
    %30 = llvm.icmp "slt" %29, %27 : i64
    llvm.cond_br %30, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%28 : i64)
  ^bb4(%31: i64):  // 2 preds: ^bb3, ^bb5
    %32 = llvm.icmp "slt" %31, %27 : i64
    llvm.cond_br %32, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.mul %29, %33  : i64
    %35 = llvm.add %34, %31  : i64
    %36 = llvm.getelementptr %arg0[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %37 = llvm.load %36 : !llvm.ptr -> f32
    %38 = llvm.mlir.constant(3 : index) : i64
    %39 = llvm.mul %31, %38  : i64
    %40 = llvm.add %39, %29  : i64
    %41 = llvm.getelementptr %arg1[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %37, %41 : f32, !llvm.ptr
    %42 = llvm.add %31, %26  : i64
    llvm.br ^bb4(%42 : i64)
  ^bb6:  // pred: ^bb4
    %43 = llvm.add %29, %26  : i64
    llvm.br ^bb2(%43 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(3 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(3 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %arg2, %26[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %arg2, %27[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.insertvalue %29, %28[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(3 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.mlir.constant(3 : index) : i64
    %41 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%41 : i64)
  ^bb2(%42: i64):  // 2 preds: ^bb1, ^bb9
    %43 = llvm.icmp "slt" %42, %40 : i64
    llvm.cond_br %43, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%41 : i64)
  ^bb4(%44: i64):  // 2 preds: ^bb3, ^bb8
    %45 = llvm.icmp "slt" %44, %40 : i64
    llvm.cond_br %45, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %46 = llvm.mlir.constant(3 : index) : i64
    %47 = llvm.mul %42, %46  : i64
    %48 = llvm.add %47, %44  : i64
    %49 = llvm.getelementptr %arg0[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %50 = llvm.load %49 : !llvm.ptr -> f32
    llvm.br ^bb6(%41, %50 : i64, f32)
  ^bb6(%51: i64, %52: f32):  // 2 preds: ^bb5, ^bb7
    %53 = llvm.icmp "slt" %51, %40 : i64
    llvm.cond_br %53, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %54 = llvm.mlir.constant(3 : index) : i64
    %55 = llvm.mul %42, %54  : i64
    %56 = llvm.add %55, %51  : i64
    %57 = llvm.getelementptr %arg1[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %58 = llvm.load %57 : !llvm.ptr -> f32
    %59 = llvm.mlir.constant(3 : index) : i64
    %60 = llvm.mul %51, %59  : i64
    %61 = llvm.add %60, %44  : i64
    %62 = llvm.getelementptr %arg2[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %63 = llvm.load %62 : !llvm.ptr -> f32
    %64 = llvm.fmul %58, %63  : f32
    %65 = llvm.fadd %52, %64  : f32
    %66 = llvm.add %51, %39  : i64
    llvm.br ^bb6(%66, %65 : i64, f32)
  ^bb8:  // pred: ^bb6
    %67 = llvm.mlir.constant(3 : index) : i64
    %68 = llvm.mul %42, %67  : i64
    %69 = llvm.add %68, %44  : i64
    %70 = llvm.getelementptr %arg0[%69] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %52, %70 : f32, !llvm.ptr
    %71 = llvm.add %44, %39  : i64
    llvm.br ^bb4(%71 : i64)
  ^bb9:  // pred: ^bb4
    %72 = llvm.add %42, %39  : i64
    llvm.br ^bb2(%72 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}

