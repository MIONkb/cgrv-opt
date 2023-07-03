; ModuleID = 'myconv_simplified.ll'
source_filename = "myconv_simplified.c"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@input = dso_local global [4 x [224 x [224 x [3 x i32]]]] zeroinitializer, align 4
@weights = dso_local global [32 x [3 x [3 x [3 x i32]]]] zeroinitializer, align 4
@bias = dso_local global [32 x i32] zeroinitializer, align 4
@output = dso_local global [4 x [222 x [222 x [32 x i32]]]] zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define dso_local void @conv_kernel(ptr nocapture noundef readonly %input, ptr nocapture noundef readonly %weights, ptr nocapture noundef readonly %bias, ptr nocapture noundef writeonly %output) local_unnamed_addr #0 {
entry:
  tail call void @loop_begin() #3
  %arrayidx38 = getelementptr inbounds i32, ptr %bias, i32 1
  %arrayidx30 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 1, i32 0, i32 0, i32 0
  %arrayidx30.1.2.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 1, i32 1, i32 2, i32 1
  %arrayidx30.2107.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 1, i32 2, i32 2, i32 0
  %arrayidx30.1.2.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 1, i32 2, i32 2, i32 1
  %arrayidx30.2.2.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 1, i32 2, i32 2, i32 2
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %entry
  %orow.096 = phi i32 [ 0, %entry ], [ %add.1, %for.cond.cleanup3 ]
  %add.1 = add nuw nsw i32 %orow.096, 1
  %add.2 = add nuw nsw i32 %orow.096, 2
  br label %cond.end.2.2.2

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  tail call void @loop_end() #3
  ret void

for.cond.cleanup3:                                ; preds = %cond.end.2.2.2
  %exitcond155.not = icmp eq i32 %add.1, 3
  br i1 %exitcond155.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !6

cond.end.2.2.2:                                   ; preds = %cond.end.2.2.2, %for.cond1.preheader
  %ocol.095 = phi i32 [ 0, %for.cond1.preheader ], [ %add17.1, %cond.end.2.2.2 ]
  %arrayidx26 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %orow.096, i32 %ocol.095, i32 0
  %add17.1 = add nuw nsw i32 %ocol.095, 1
  %add17.2 = add nuw nsw i32 %ocol.095, 2
  %arrayidx26.2.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %orow.096, i32 %add17.2, i32 2
  %arrayidx26.1112 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.1, i32 %ocol.095, i32 0
  %arrayidx26.1.1.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.1, i32 %add17.1, i32 1
  %arrayidx26.2.1.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.1, i32 %add17.1, i32 2
  %0 = load <8 x i32>, ptr %arrayidx26, align 4, !tbaa !9
  %.i0 = extractelement <8 x i32> %0, i32 0
  %.i1 = extractelement <8 x i32> %0, i32 1
  %.i2 = extractelement <8 x i32> %0, i32 2
  %.i3 = extractelement <8 x i32> %0, i32 3
  %.i4 = extractelement <8 x i32> %0, i32 4
  %.i5 = extractelement <8 x i32> %0, i32 5
  %.i6 = extractelement <8 x i32> %0, i32 6
  %.i7 = extractelement <8 x i32> %0, i32 7
  %1 = load i32, ptr %arrayidx26.2.2, align 4, !tbaa !9
  %2 = load <4 x i32>, ptr %arrayidx26.1112, align 4, !tbaa !9
  %.i01 = extractelement <4 x i32> %2, i32 0
  %.i12 = extractelement <4 x i32> %2, i32 1
  %.i23 = extractelement <4 x i32> %2, i32 2
  %.i34 = extractelement <4 x i32> %2, i32 3
  %3 = load i32, ptr %arrayidx26.1.1.1, align 4, !tbaa !9
  %4 = load <2 x i32>, ptr %arrayidx26.2.1.1, align 4, !tbaa !9
  %.i05 = extractelement <2 x i32> %4, i32 0
  %.i16 = extractelement <2 x i32> %4, i32 1
  %5 = load <16 x i32>, ptr %arrayidx30, align 4, !tbaa !9
  %.i07 = extractelement <16 x i32> %5, i32 0
  %.i19 = extractelement <16 x i32> %5, i32 1
  %.i211 = extractelement <16 x i32> %5, i32 2
  %.i313 = extractelement <16 x i32> %5, i32 3
  %.i415 = extractelement <16 x i32> %5, i32 4
  %.i517 = extractelement <16 x i32> %5, i32 5
  %.i619 = extractelement <16 x i32> %5, i32 6
  %.i721 = extractelement <16 x i32> %5, i32 7
  %.i8 = extractelement <16 x i32> %5, i32 8
  %.i9 = extractelement <16 x i32> %5, i32 9
  %.i10 = extractelement <16 x i32> %5, i32 10
  %.i11 = extractelement <16 x i32> %5, i32 11
  %.i1227 = extractelement <16 x i32> %5, i32 12
  %.i13 = extractelement <16 x i32> %5, i32 13
  %.i14 = extractelement <16 x i32> %5, i32 14
  %.i15 = extractelement <16 x i32> %5, i32 15
  %.i08 = mul nsw i32 %.i07, %.i0
  %.i110 = mul nsw i32 %.i19, %.i1
  %.i212 = mul nsw i32 %.i211, %.i2
  %.i314 = mul nsw i32 %.i313, %.i3
  %.i416 = mul nsw i32 %.i415, %.i4
  %.i518 = mul nsw i32 %.i517, %.i5
  %.i620 = mul nsw i32 %.i619, %.i6
  %.i722 = mul nsw i32 %.i721, %.i7
  %.i823 = mul nsw i32 %.i8, %1
  %.i924 = mul nsw i32 %.i9, %.i01
  %.i1025 = mul nsw i32 %.i10, %.i12
  %.i1126 = mul nsw i32 %.i11, %.i23
  %.i1228 = mul nsw i32 %.i1227, %.i34
  %.i1329 = mul nsw i32 %.i13, %3
  %.i1430 = mul nsw i32 %.i14, %.i05
  %.i1531 = mul nsw i32 %.i15, %.i16
  %.upto0146 = insertelement <16 x i32> poison, i32 %.i08, i32 0
  %.upto1147 = insertelement <16 x i32> %.upto0146, i32 %.i110, i32 1
  %.upto2148 = insertelement <16 x i32> %.upto1147, i32 %.i212, i32 2
  %.upto3149 = insertelement <16 x i32> %.upto2148, i32 %.i314, i32 3
  %.upto4150 = insertelement <16 x i32> %.upto3149, i32 %.i416, i32 4
  %.upto5151 = insertelement <16 x i32> %.upto4150, i32 %.i518, i32 5
  %.upto6152 = insertelement <16 x i32> %.upto5151, i32 %.i620, i32 6
  %.upto7153 = insertelement <16 x i32> %.upto6152, i32 %.i722, i32 7
  %.upto8154 = insertelement <16 x i32> %.upto7153, i32 %.i823, i32 8
  %.upto9155 = insertelement <16 x i32> %.upto8154, i32 %.i924, i32 9
  %.upto10156 = insertelement <16 x i32> %.upto9155, i32 %.i1025, i32 10
  %.upto11157 = insertelement <16 x i32> %.upto10156, i32 %.i1126, i32 11
  %.upto12158 = insertelement <16 x i32> %.upto11157, i32 %.i1228, i32 12
  %.upto13159 = insertelement <16 x i32> %.upto12158, i32 %.i1329, i32 13
  %.upto14160 = insertelement <16 x i32> %.upto13159, i32 %.i1430, i32 14
  %6 = insertelement <16 x i32> %.upto14160, i32 %.i1531, i32 15
  %arrayidx26.1.2.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.1, i32 %add17.2, i32 1
  %arrayidx26.2134 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.2, i32 %ocol.095, i32 0
  %arrayidx26.1.1.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.2, i32 %add17.1, i32 1
  %7 = load <2 x i32>, ptr %arrayidx26.1.2.1, align 4, !tbaa !9
  %.i032 = extractelement <2 x i32> %7, i32 0
  %.i133 = extractelement <2 x i32> %7, i32 1
  %8 = load <4 x i32>, ptr %arrayidx26.2134, align 4, !tbaa !9
  %.i034 = extractelement <4 x i32> %8, i32 0
  %.i135 = extractelement <4 x i32> %8, i32 1
  %.i236 = extractelement <4 x i32> %8, i32 2
  %.i337 = extractelement <4 x i32> %8, i32 3
  %9 = load <2 x i32>, ptr %arrayidx26.1.1.2, align 4, !tbaa !9
  %.i038 = extractelement <2 x i32> %9, i32 0
  %.i139 = extractelement <2 x i32> %9, i32 1
  %10 = load <8 x i32>, ptr %arrayidx30.1.2.1, align 4, !tbaa !9
  %.i040 = extractelement <8 x i32> %10, i32 0
  %.i142 = extractelement <8 x i32> %10, i32 1
  %.i244 = extractelement <8 x i32> %10, i32 2
  %.i346 = extractelement <8 x i32> %10, i32 3
  %.i448 = extractelement <8 x i32> %10, i32 4
  %.i550 = extractelement <8 x i32> %10, i32 5
  %.i652 = extractelement <8 x i32> %10, i32 6
  %.i754 = extractelement <8 x i32> %10, i32 7
  %.i041 = mul nsw i32 %.i040, %.i032
  %.i143 = mul nsw i32 %.i142, %.i133
  %.i245 = mul nsw i32 %.i244, %.i034
  %.i347 = mul nsw i32 %.i346, %.i135
  %.i449 = mul nsw i32 %.i448, %.i236
  %.i551 = mul nsw i32 %.i550, %.i337
  %.i653 = mul nsw i32 %.i652, %.i038
  %.i755 = mul nsw i32 %.i754, %.i139
  %.upto0201 = insertelement <8 x i32> poison, i32 %.i041, i32 0
  %.upto1202 = insertelement <8 x i32> %.upto0201, i32 %.i143, i32 1
  %.upto2203 = insertelement <8 x i32> %.upto1202, i32 %.i245, i32 2
  %.upto3204 = insertelement <8 x i32> %.upto2203, i32 %.i347, i32 3
  %.upto4205 = insertelement <8 x i32> %.upto3204, i32 %.i449, i32 4
  %.upto5206 = insertelement <8 x i32> %.upto4205, i32 %.i551, i32 5
  %.upto6207 = insertelement <8 x i32> %.upto5206, i32 %.i653, i32 6
  %11 = insertelement <8 x i32> %.upto6207, i32 %.i755, i32 7
  %arrayidx26.2104.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.2, i32 %add17.2, i32 0
  %12 = load i32, ptr %arrayidx26.2104.2, align 4, !tbaa !9
  %13 = load i32, ptr %arrayidx30.2107.2, align 4, !tbaa !9
  %mul.2108.2 = mul nsw i32 %13, %12
  %arrayidx26.1.2.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.2, i32 %add17.2, i32 1
  %14 = load i32, ptr %arrayidx26.1.2.2, align 4, !tbaa !9
  %15 = load i32, ptr %arrayidx30.1.2.2, align 4, !tbaa !9
  %mul.1.2.2 = mul nsw i32 %15, %14
  %arrayidx26.2.2.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 1, i32 %add.2, i32 %add17.2, i32 2
  %16 = load i32, ptr %arrayidx26.2.2.2, align 4, !tbaa !9
  %17 = load i32, ptr %arrayidx30.2.2.2, align 4, !tbaa !9
  %mul.2.2.2 = mul nsw i32 %17, %16
  %18 = load i32, ptr %arrayidx38, align 4, !tbaa !9
  %19 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %6)
  %20 = tail call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %11)
  %op.rdx = add i32 %19, %20
  %op.rdx156 = add i32 %mul.2108.2, %mul.1.2.2
  %op.rdx157 = add i32 %mul.2.2.2, %18
  %op.rdx158 = add i32 %op.rdx156, %op.rdx157
  %op.rdx159 = add i32 %op.rdx, %op.rdx158
  %arrayidx56 = getelementptr inbounds [3 x [222 x [32 x i32]]], ptr %output, i32 1, i32 %orow.096, i32 %ocol.095, i32 1
  store i32 %op.rdx159, ptr %arrayidx56, align 4, !tbaa !9
  %exitcond.not = icmp eq i32 %add17.1, 222
  br i1 %exitcond.not, label %for.cond.cleanup3, label %cond.end.2.2.2, !llvm.loop !13
}

declare void @loop_begin(...) local_unnamed_addr #1

declare void @loop_end(...) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind readnone willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{!"clang version 16.0.0"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = distinct !{!13, !7, !8}
!14 = distinct !{!14, !7, !8}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
