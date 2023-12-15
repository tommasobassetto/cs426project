; ModuleID = 'mp5_testcases/matmul_c.ll'
source_filename = "mp5_testcases/matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = zext i32 %1 to i64
  %8 = zext i32 %2 to i64
  br label %9

9:                                                ; preds = %37, %6
  %.02 = phi i32 [ 0, %6 ], [ %38, %37 ]
  %10 = icmp slt i32 %.02, %0
  br i1 %10, label %11, label %39

11:                                               ; preds = %9, %35
  %.01 = phi i32 [ %36, %35 ], [ 0, %9 ]
  %12 = icmp slt i32 %.01, %2
  br i1 %12, label %13, label %37

13:                                               ; preds = %11
  %14 = sext i32 %.02 to i64
  %15 = mul nsw i64 %14, %8
  %16 = getelementptr inbounds i32, ptr %5, i64 %15
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds i32, ptr %16, i64 %17
  store i32 0, ptr %18, align 4
  br label %19

19:                                               ; preds = %21, %13
  %.0 = phi i32 [ 0, %13 ], [ %34, %21 ]
  %20 = icmp slt i32 %.0, %1
  br i1 %20, label %21, label %35

21:                                               ; preds = %19
  %22 = mul nsw i64 %14, %7
  %23 = getelementptr inbounds i32, ptr %3, i64 %22
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds i32, ptr %23, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i64 %24, %8
  %28 = getelementptr inbounds i32, ptr %4, i64 %27
  %29 = getelementptr inbounds i32, ptr %28, i64 %17
  %30 = load i32, ptr %29, align 4
  %31 = mul nsw i32 %26, %30
  %32 = load i32, ptr %18, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %18, align 4
  %34 = add nsw i32 %.0, 1
  br label %19, !llvm.loop !6

35:                                               ; preds = %19
  %36 = add nsw i32 %.01, 1
  br label %11, !llvm.loop !8

37:                                               ; preds = %11
  %38 = add nsw i32 %.02, 1
  br label %9, !llvm.loop !9

39:                                               ; preds = %9
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
