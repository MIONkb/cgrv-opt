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
  tail call void @loop_begin() #2
  %arrayidx30.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 0, i32 0, i32 1
  %arrayidx30.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 0, i32 0, i32 2
  %arrayidx30.1100 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 0, i32 1, i32 0
  %arrayidx30.1.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 0, i32 1, i32 1
  %arrayidx30.2.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 0, i32 1, i32 2
  %arrayidx30.2107 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 0, i32 2, i32 0
  %arrayidx30.1.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 0, i32 2, i32 1
  %arrayidx30.2.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 0, i32 2, i32 2
  %arrayidx30.1115 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 0, i32 0
  %arrayidx30.1.1122 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 0, i32 1
  %arrayidx30.2.1129 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 0, i32 2
  %arrayidx30.1100.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 1, i32 0
  %arrayidx30.1.1.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 1, i32 1
  %arrayidx30.2.1.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 1, i32 2
  %arrayidx30.2107.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 2, i32 0
  %arrayidx30.1.2.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 2, i32 1
  %arrayidx30.2.2.1 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 1, i32 2, i32 2
  %arrayidx30.2137 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 0, i32 0
  %arrayidx30.1.2144 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 0, i32 1
  %arrayidx30.2.2151 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 0, i32 2
  %arrayidx30.1100.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 1, i32 0
  %arrayidx30.1.1.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 1, i32 1
  %arrayidx30.2.1.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 1, i32 2
  %arrayidx30.2107.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 2, i32 0
  %arrayidx30.1.2.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 2, i32 1
  %arrayidx30.2.2.2 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr %weights, i32 0, i32 2, i32 2, i32 2
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %entry
  %orow.096 = phi i32 [ 0, %entry ], [ %add.1, %for.cond.cleanup3 ]
  %add.1 = add nuw nsw i32 %orow.096, 1
  %add.2 = add nuw nsw i32 %orow.096, 2
  br label %cond.end.2.2.2

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  tail call void @loop_end() #2
  ret void

for.cond.cleanup3:                                ; preds = %cond.end.2.2.2
  %exitcond155.not = icmp eq i32 %add.1, 3
  br i1 %exitcond155.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !6

cond.end.2.2.2:                                   ; preds = %cond.end.2.2.2, %for.cond1.preheader
  %ocol.095 = phi i32 [ 0, %for.cond1.preheader ], [ %add17.1, %cond.end.2.2.2 ]
  %arrayidx26 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %ocol.095, i32 0
  %0 = load i32, ptr %arrayidx26, align 4, !tbaa !9
  %1 = load i32, ptr %weights, align 4, !tbaa !9
  %mul = mul nsw i32 %1, %0
  %arrayidx26.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %ocol.095, i32 1
  %2 = load i32, ptr %arrayidx26.1, align 4, !tbaa !9
  %3 = load i32, ptr %arrayidx30.1, align 4, !tbaa !9
  %mul.1 = mul nsw i32 %3, %2
  %add31.1 = add nsw i32 %mul.1, %mul
  %arrayidx26.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %ocol.095, i32 2
  %4 = load i32, ptr %arrayidx26.2, align 4, !tbaa !9
  %5 = load i32, ptr %arrayidx30.2, align 4, !tbaa !9
  %mul.2 = mul nsw i32 %5, %4
  %add31.2 = add nsw i32 %mul.2, %add31.1
  %add17.1 = add nuw nsw i32 %ocol.095, 1
  %arrayidx26.197 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %add17.1, i32 0
  %6 = load i32, ptr %arrayidx26.197, align 4, !tbaa !9
  %7 = load i32, ptr %arrayidx30.1100, align 4, !tbaa !9
  %mul.1101 = mul nsw i32 %7, %6
  %add31.1102 = add nsw i32 %mul.1101, %add31.2
  %arrayidx26.1.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %add17.1, i32 1
  %8 = load i32, ptr %arrayidx26.1.1, align 4, !tbaa !9
  %9 = load i32, ptr %arrayidx30.1.1, align 4, !tbaa !9
  %mul.1.1 = mul nsw i32 %9, %8
  %add31.1.1 = add nsw i32 %mul.1.1, %add31.1102
  %arrayidx26.2.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %add17.1, i32 2
  %10 = load i32, ptr %arrayidx26.2.1, align 4, !tbaa !9
  %11 = load i32, ptr %arrayidx30.2.1, align 4, !tbaa !9
  %mul.2.1 = mul nsw i32 %11, %10
  %add31.2.1 = add nsw i32 %mul.2.1, %add31.1.1
  %add17.2 = add nuw nsw i32 %ocol.095, 2
  %arrayidx26.2104 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %add17.2, i32 0
  %12 = load i32, ptr %arrayidx26.2104, align 4, !tbaa !9
  %13 = load i32, ptr %arrayidx30.2107, align 4, !tbaa !9
  %mul.2108 = mul nsw i32 %13, %12
  %add31.2109 = add nsw i32 %mul.2108, %add31.2.1
  %arrayidx26.1.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %add17.2, i32 1
  %14 = load i32, ptr %arrayidx26.1.2, align 4, !tbaa !9
  %15 = load i32, ptr %arrayidx30.1.2, align 4, !tbaa !9
  %mul.1.2 = mul nsw i32 %15, %14
  %add31.1.2 = add nsw i32 %mul.1.2, %add31.2109
  %arrayidx26.2.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %orow.096, i32 %add17.2, i32 2
  %16 = load i32, ptr %arrayidx26.2.2, align 4, !tbaa !9
  %17 = load i32, ptr %arrayidx30.2.2, align 4, !tbaa !9
  %mul.2.2 = mul nsw i32 %17, %16
  %add31.2.2 = add nsw i32 %mul.2.2, %add31.1.2
  %arrayidx26.1112 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %ocol.095, i32 0
  %18 = load i32, ptr %arrayidx26.1112, align 4, !tbaa !9
  %19 = load i32, ptr %arrayidx30.1115, align 4, !tbaa !9
  %mul.1116 = mul nsw i32 %19, %18
  %add31.1117 = add nsw i32 %mul.1116, %add31.2.2
  %arrayidx26.1.1119 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %ocol.095, i32 1
  %20 = load i32, ptr %arrayidx26.1.1119, align 4, !tbaa !9
  %21 = load i32, ptr %arrayidx30.1.1122, align 4, !tbaa !9
  %mul.1.1123 = mul nsw i32 %21, %20
  %add31.1.1124 = add nsw i32 %mul.1.1123, %add31.1117
  %arrayidx26.2.1126 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %ocol.095, i32 2
  %22 = load i32, ptr %arrayidx26.2.1126, align 4, !tbaa !9
  %23 = load i32, ptr %arrayidx30.2.1129, align 4, !tbaa !9
  %mul.2.1130 = mul nsw i32 %23, %22
  %add31.2.1131 = add nsw i32 %mul.2.1130, %add31.1.1124
  %arrayidx26.197.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %add17.1, i32 0
  %24 = load i32, ptr %arrayidx26.197.1, align 4, !tbaa !9
  %25 = load i32, ptr %arrayidx30.1100.1, align 4, !tbaa !9
  %mul.1101.1 = mul nsw i32 %25, %24
  %add31.1102.1 = add nsw i32 %mul.1101.1, %add31.2.1131
  %arrayidx26.1.1.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %add17.1, i32 1
  %26 = load i32, ptr %arrayidx26.1.1.1, align 4, !tbaa !9
  %27 = load i32, ptr %arrayidx30.1.1.1, align 4, !tbaa !9
  %mul.1.1.1 = mul nsw i32 %27, %26
  %add31.1.1.1 = add nsw i32 %mul.1.1.1, %add31.1102.1
  %arrayidx26.2.1.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %add17.1, i32 2
  %28 = load i32, ptr %arrayidx26.2.1.1, align 4, !tbaa !9
  %29 = load i32, ptr %arrayidx30.2.1.1, align 4, !tbaa !9
  %mul.2.1.1 = mul nsw i32 %29, %28
  %add31.2.1.1 = add nsw i32 %mul.2.1.1, %add31.1.1.1
  %arrayidx26.2104.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %add17.2, i32 0
  %30 = load i32, ptr %arrayidx26.2104.1, align 4, !tbaa !9
  %31 = load i32, ptr %arrayidx30.2107.1, align 4, !tbaa !9
  %mul.2108.1 = mul nsw i32 %31, %30
  %add31.2109.1 = add nsw i32 %mul.2108.1, %add31.2.1.1
  %arrayidx26.1.2.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %add17.2, i32 1
  %32 = load i32, ptr %arrayidx26.1.2.1, align 4, !tbaa !9
  %33 = load i32, ptr %arrayidx30.1.2.1, align 4, !tbaa !9
  %mul.1.2.1 = mul nsw i32 %33, %32
  %add31.1.2.1 = add nsw i32 %mul.1.2.1, %add31.2109.1
  %arrayidx26.2.2.1 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.1, i32 %add17.2, i32 2
  %34 = load i32, ptr %arrayidx26.2.2.1, align 4, !tbaa !9
  %35 = load i32, ptr %arrayidx30.2.2.1, align 4, !tbaa !9
  %mul.2.2.1 = mul nsw i32 %35, %34
  %add31.2.2.1 = add nsw i32 %mul.2.2.1, %add31.1.2.1
  %arrayidx26.2134 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %ocol.095, i32 0
  %36 = load i32, ptr %arrayidx26.2134, align 4, !tbaa !9
  %37 = load i32, ptr %arrayidx30.2137, align 4, !tbaa !9
  %mul.2138 = mul nsw i32 %37, %36
  %add31.2139 = add nsw i32 %mul.2138, %add31.2.2.1
  %arrayidx26.1.2141 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %ocol.095, i32 1
  %38 = load i32, ptr %arrayidx26.1.2141, align 4, !tbaa !9
  %39 = load i32, ptr %arrayidx30.1.2144, align 4, !tbaa !9
  %mul.1.2145 = mul nsw i32 %39, %38
  %add31.1.2146 = add nsw i32 %mul.1.2145, %add31.2139
  %arrayidx26.2.2148 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %ocol.095, i32 2
  %40 = load i32, ptr %arrayidx26.2.2148, align 4, !tbaa !9
  %41 = load i32, ptr %arrayidx30.2.2151, align 4, !tbaa !9
  %mul.2.2152 = mul nsw i32 %41, %40
  %add31.2.2153 = add nsw i32 %mul.2.2152, %add31.1.2146
  %arrayidx26.197.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %add17.1, i32 0
  %42 = load i32, ptr %arrayidx26.197.2, align 4, !tbaa !9
  %43 = load i32, ptr %arrayidx30.1100.2, align 4, !tbaa !9
  %mul.1101.2 = mul nsw i32 %43, %42
  %add31.1102.2 = add nsw i32 %mul.1101.2, %add31.2.2153
  %arrayidx26.1.1.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %add17.1, i32 1
  %44 = load i32, ptr %arrayidx26.1.1.2, align 4, !tbaa !9
  %45 = load i32, ptr %arrayidx30.1.1.2, align 4, !tbaa !9
  %mul.1.1.2 = mul nsw i32 %45, %44
  %add31.1.1.2 = add nsw i32 %mul.1.1.2, %add31.1102.2
  %arrayidx26.2.1.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %add17.1, i32 2
  %46 = load i32, ptr %arrayidx26.2.1.2, align 4, !tbaa !9
  %47 = load i32, ptr %arrayidx30.2.1.2, align 4, !tbaa !9
  %mul.2.1.2 = mul nsw i32 %47, %46
  %add31.2.1.2 = add nsw i32 %mul.2.1.2, %add31.1.1.2
  %arrayidx26.2104.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %add17.2, i32 0
  %48 = load i32, ptr %arrayidx26.2104.2, align 4, !tbaa !9
  %49 = load i32, ptr %arrayidx30.2107.2, align 4, !tbaa !9
  %mul.2108.2 = mul nsw i32 %49, %48
  %add31.2109.2 = add nsw i32 %mul.2108.2, %add31.2.1.2
  %arrayidx26.1.2.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %add17.2, i32 1
  %50 = load i32, ptr %arrayidx26.1.2.2, align 4, !tbaa !9
  %51 = load i32, ptr %arrayidx30.1.2.2, align 4, !tbaa !9
  %mul.1.2.2 = mul nsw i32 %51, %50
  %add31.1.2.2 = add nsw i32 %mul.1.2.2, %add31.2109.2
  %arrayidx26.2.2.2 = getelementptr inbounds [5 x [224 x [3 x i32]]], ptr %input, i32 0, i32 %add.2, i32 %add17.2, i32 2
  %52 = load i32, ptr %arrayidx26.2.2.2, align 4, !tbaa !9
  %53 = load i32, ptr %arrayidx30.2.2.2, align 4, !tbaa !9
  %mul.2.2.2 = mul nsw i32 %53, %52
  %add31.2.2.2 = add nsw i32 %mul.2.2.2, %add31.1.2.2
  %54 = load i32, ptr %bias, align 4, !tbaa !9
  %add39 = add nsw i32 %54, %add31.2.2.2
  %arrayidx55 = getelementptr inbounds [3 x [222 x [32 x i32]]], ptr %output, i32 0, i32 %orow.096, i32 %ocol.095
  store i32 %add39, ptr %arrayidx55, align 4, !tbaa !9
  %exitcond.not = icmp eq i32 %add17.1, 222
  br i1 %exitcond.not, label %for.cond.cleanup3, label %cond.end.2.2.2, !llvm.loop !13
}

declare void @loop_begin(...) local_unnamed_addr #1

declare void @loop_end(...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @conv() local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %entry
  %b.045 = phi i32 [ 0, %entry ], [ %inc31, %for.cond.cleanup3 ]
  %mul10 = mul nuw nsw i32 %b.045, 150528
  %add.ptr = getelementptr inbounds [224 x [224 x [3 x i32]]], ptr @input, i32 %mul10
  %mul21 = mul nuw nsw i32 %b.045, 1577088
  %add.ptr22 = getelementptr inbounds [222 x [222 x [32 x i32]]], ptr @output, i32 %mul21
  br label %for.cond5.preheader

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  ret void

for.cond5.preheader:                              ; preds = %for.cond.cleanup7, %for.cond1.preheader
  %och.044 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %for.cond.cleanup7 ]
  %mul16 = mul nuw nsw i32 %och.044, 27
  %add.ptr17 = getelementptr inbounds [3 x [3 x [3 x i32]]], ptr @weights, i32 %mul16
  %add.ptr18 = getelementptr inbounds i32, ptr @bias, i32 %och.044
  %add.ptr2546 = getelementptr inbounds [222 x [222 x [32 x i32]]], ptr %add.ptr22, i32 %och.044
  br label %for.body8

for.cond.cleanup3:                                ; preds = %for.cond.cleanup7
  %inc31 = add nuw nsw i32 %b.045, 1
  %exitcond47.not = icmp eq i32 %inc31, 4
  br i1 %exitcond47.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !14

for.cond.cleanup7:                                ; preds = %for.body8
  %inc = add nuw nsw i32 %och.044, 1
  %exitcond.not = icmp eq i32 %inc, 32
  br i1 %exitcond.not, label %for.cond.cleanup3, label %for.cond5.preheader, !llvm.loop !15

for.body8:                                        ; preds = %for.body8, %for.cond5.preheader
  %orow_out.043 = phi i32 [ 0, %for.cond5.preheader ], [ %add, %for.body8 ]
  %mul12 = mul nuw nsw i32 %orow_out.043, 672
  %add.ptr13 = getelementptr inbounds [224 x [224 x [3 x i32]]], ptr %add.ptr, i32 %mul12
  %mul24 = mul nuw nsw i32 %orow_out.043, 7104
  %add.ptr27 = getelementptr inbounds [222 x [222 x [32 x i32]]], ptr %add.ptr2546, i32 %mul24
  tail call void @conv_kernel(ptr noundef nonnull %add.ptr13, ptr noundef nonnull %add.ptr17, ptr noundef nonnull %add.ptr18, ptr noundef nonnull %add.ptr27)
  %add = add nuw nsw i32 %orow_out.043, 3
  %cmp6 = icmp ult i32 %orow_out.043, 219
  br i1 %cmp6, label %for.body8, label %for.cond.cleanup7, !llvm.loop !16
}

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

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
