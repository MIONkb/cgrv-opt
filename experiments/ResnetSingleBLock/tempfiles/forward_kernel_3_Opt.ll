; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/2_kernels_llvm/forward_kernel_3.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @forward_kernel_3(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture readonly %3, ptr nocapture readonly %4, ptr nocapture writeonly %5) local_unnamed_addr #0 {
.preheader2:
  br label %6

6:                                                ; preds = %.preheader2, %38
  %7 = phi i64 [ 0, %.preheader2 ], [ %39, %38 ]
  %8 = getelementptr float, ptr %0, i64 %7
  %9 = load float, ptr %8, align 4
  %10 = getelementptr float, ptr %1, i64 %7
  %11 = load float, ptr %10, align 4
  %12 = getelementptr float, ptr %2, i64 %7
  %13 = load float, ptr %12, align 4
  %14 = getelementptr float, ptr %3, i64 %7
  %15 = load float, ptr %14, align 4
  %16 = mul nuw nsw i64 %7, 12544
  %17 = fadd float %15, 0x3EE4F8B580000000
  %18 = tail call float @llvm.sqrt.f32(float %17)
  %19 = fdiv float 1.000000e+00, %18
  br label %.preheader

.preheader:                                       ; preds = %6, %35
  %20 = phi i64 [ 0, %6 ], [ %36, %35 ]
  %21 = mul nuw nsw i64 %20, 112
  %22 = add nuw nsw i64 %16, %21
  br label %23

23:                                               ; preds = %.preheader, %23
  %24 = phi i64 [ 0, %.preheader ], [ %33, %23 ]
  %25 = add nuw nsw i64 %22, %24
  %26 = getelementptr float, ptr %4, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = fsub float %27, %13
  %29 = fmul float %19, %28
  %30 = fmul float %9, %29
  %31 = fadd float %11, %30
  %32 = getelementptr float, ptr %5, i64 %25
  store float %31, ptr %32, align 4
  %33 = add nuw nsw i64 %24, 1
  %34 = icmp ult i64 %24, 111
  br i1 %34, label %23, label %35

35:                                               ; preds = %23
  %36 = add nuw nsw i64 %20, 1
  %37 = icmp ult i64 %20, 111
  br i1 %37, label %.preheader, label %38

38:                                               ; preds = %35
  %39 = add nuw nsw i64 %7, 1
  %40 = icmp ult i64 %7, 63
  br i1 %40, label %6, label %41

41:                                               ; preds = %38
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #1

attributes #0 = { nofree nosync nounwind memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
