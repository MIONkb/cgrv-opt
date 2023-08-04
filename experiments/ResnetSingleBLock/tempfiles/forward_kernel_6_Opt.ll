; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/2_kernels_llvm/forward_kernel_6.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define void @forward_kernel_6(ptr nocapture writeonly %0) local_unnamed_addr #0 {
.preheader2:
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader2, %15
  %1 = phi i64 [ 0, %.preheader2 ], [ %16, %15 ]
  %2 = mul nuw nsw i64 %1, 3136
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %12
  %3 = phi i64 [ 0, %.preheader1 ], [ %13, %12 ]
  %4 = mul nuw nsw i64 %3, 56
  %5 = add nuw nsw i64 %2, %4
  br label %6

6:                                                ; preds = %.preheader, %6
  %7 = phi i64 [ 0, %.preheader ], [ %10, %6 ]
  %8 = add nuw nsw i64 %5, %7
  %9 = getelementptr float, ptr %0, i64 %8
  store float 0xFFF0000000000000, ptr %9, align 4
  %10 = add nuw nsw i64 %7, 1
  %11 = icmp ult i64 %7, 55
  br i1 %11, label %6, label %12

12:                                               ; preds = %6
  %13 = add nuw nsw i64 %3, 1
  %14 = icmp ult i64 %3, 55
  br i1 %14, label %.preheader, label %15

15:                                               ; preds = %12
  %16 = add nuw nsw i64 %1, 1
  %17 = icmp ult i64 %1, 63
  br i1 %17, label %.preheader1, label %18

18:                                               ; preds = %15
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: write) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
