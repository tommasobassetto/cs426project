; ModuleID = 'mp5_testcases/matmul_c.ll'
source_filename = "mp5_testcases/matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = zext i32 %1 to i64
  %8 = zext i32 %2 to i64
  %9 = zext i32 %2 to i64
  br label %10

10:                                               ; preds = %45, %6
  %.02 = phi i32 [ 0, %6 ], [ %46, %45 ]
  %11 = icmp slt i32 %.02, %0
  br i1 %11, label %.preheader, label %47

.preheader:                                       ; preds = %10, %43
  %.01 = phi i32 [ %44, %43 ], [ 0, %10 ]
  %12 = icmp slt i32 %.01, %2
  br i1 %12, label %13, label %45

13:                                               ; preds = %.preheader
  %14 = sext i32 %.02 to i64
  %15 = mul nsw i64 %14, %9
  %16 = getelementptr inbounds i32, ptr %5, i64 %15
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds i32, ptr %16, i64 %17
  store i32 0, ptr %18, align 4
  br label %19

19:                                               ; preds = %21, %13
  %.0 = phi i32 [ 0, %13 ], [ %42, %21 ]
  %20 = icmp slt i32 %.0, %1
  br i1 %20, label %21, label %43

21:                                               ; preds = %19
  %22 = sext i32 %.02 to i64
  %23 = mul nsw i64 %22, %7
  %24 = getelementptr inbounds i32, ptr %3, i64 %23
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds i32, ptr %24, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = sext i32 %.0 to i64
  %29 = mul nsw i64 %28, %8
  %30 = getelementptr inbounds i32, ptr %4, i64 %29
  %31 = sext i32 %.01 to i64
  %32 = getelementptr inbounds i32, ptr %30, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = mul nsw i32 %27, %33
  %35 = sext i32 %.02 to i64
  %36 = mul nsw i64 %35, %9
  %37 = getelementptr inbounds i32, ptr %5, i64 %36
  %38 = sext i32 %.01 to i64
  %39 = getelementptr inbounds i32, ptr %37, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = add nsw i32 %40, %34
  store i32 %41, ptr %39, align 4
  %42 = add nsw i32 %.0, 1
  br label %19, !llvm.loop !6

43:                                               ; preds = %19
  %44 = add nsw i32 %.01, 1
  br label %.preheader, !llvm.loop !8

45:                                               ; preds = %.preheader
  %46 = add nsw i32 %.02, 1
  br label %10, !llvm.loop !9

47:                                               ; preds = %10
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
