; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/2_kernels_llvm/forward_kernel_7.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define void @forward_kernel_7(ptr nocapture %0, ptr nocapture readonly %1) local_unnamed_addr #0 {
.preheader4:
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader4, %41
  %2 = phi i64 [ 0, %.preheader4 ], [ %42, %41 ]
  %3 = mul nuw nsw i64 %2, 3136
  %4 = mul nuw nsw i64 %2, 12996
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader3, %38
  %5 = phi i64 [ 0, %.preheader3 ], [ %39, %38 ]
  %6 = mul nuw nsw i64 %5, 56
  %7 = add nuw nsw i64 %3, %6
  %8 = shl nuw nsw i64 %5, 1
  br label %9

9:                                                ; preds = %.preheader2, %35
  %10 = phi i64 [ 0, %.preheader2 ], [ %36, %35 ]
  %11 = add nuw nsw i64 %7, %10
  %12 = getelementptr float, ptr %0, i64 %11
  %13 = load float, ptr %12, align 4
  %14 = shl nuw nsw i64 %10, 1
  %15 = add nuw nsw i64 %4, %14
  br label %.preheader

.preheader:                                       ; preds = %9, %32
  %16 = phi float [ %13, %9 ], [ %29, %32 ]
  %17 = phi i64 [ 0, %9 ], [ %33, %32 ]
  %18 = add nuw nsw i64 %17, %8
  %19 = mul nuw nsw i64 %18, 114
  %20 = add nuw nsw i64 %15, %19
  br label %21

21:                                               ; preds = %.preheader, %21
  %22 = phi float [ %16, %.preheader ], [ %29, %21 ]
  %23 = phi i64 [ 0, %.preheader ], [ %30, %21 ]
  %24 = add nuw nsw i64 %20, %23
  %25 = getelementptr float, ptr %1, i64 %24
  %26 = load float, ptr %25, align 4
  %.inv = fcmp ole float %22, %26
  %27 = fcmp uno float %26, 0.000000e+00
  %28 = select i1 %27, i1 true, i1 %.inv
  %29 = select i1 %28, float %26, float %22
  %30 = add nuw nsw i64 %23, 1
  %31 = icmp ult i64 %23, 2
  br i1 %31, label %21, label %32

32:                                               ; preds = %21
  %33 = add nuw nsw i64 %17, 1
  %34 = icmp ult i64 %17, 2
  br i1 %34, label %.preheader, label %35

35:                                               ; preds = %32
  store float %29, ptr %12, align 4
  %36 = add nuw nsw i64 %10, 1
  %37 = icmp ult i64 %10, 55
  br i1 %37, label %9, label %38

38:                                               ; preds = %35
  %39 = add nuw nsw i64 %5, 1
  %40 = icmp ult i64 %5, 55
  br i1 %40, label %.preheader2, label %41

41:                                               ; preds = %38
  %42 = add nuw nsw i64 %2, 1
  %43 = icmp ult i64 %2, 63
  br i1 %43, label %.preheader3, label %44

44:                                               ; preds = %41
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
