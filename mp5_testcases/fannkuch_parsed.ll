; ModuleID = 'mp5_testcases/fannkuch_c.ll'
source_filename = "mp5_testcases/fannkuch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @fannkuch(i32 noundef 11)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 11, i64 noundef %3)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i64 @fannkuch(i32 noundef %0) #0 {
  %2 = sub nsw i32 %0, 1
  %3 = icmp slt i32 %0, 1
  br i1 %3, label %100, label %4

4:                                                ; preds = %1
  %5 = sext i32 %0 to i64
  %6 = call noalias ptr @calloc(i64 noundef %5, i64 noundef 4) #3
  %7 = call noalias ptr @calloc(i64 noundef %5, i64 noundef 4) #3
  %8 = call noalias ptr @calloc(i64 noundef %5, i64 noundef 4) #3
  br label %9

9:                                                ; preds = %11, %4
  %.04 = phi i32 [ 0, %4 ], [ %14, %11 ]
  %10 = icmp slt i32 %.04, %0
  br i1 %10, label %11, label %15

11:                                               ; preds = %9
  %12 = sext i32 %.04 to i64
  %13 = getelementptr inbounds i32, ptr %7, i64 %12
  store i32 %.04, ptr %13, align 4
  %14 = add nsw i32 %.04, 1
  br label %9, !llvm.loop !6

15:                                               ; preds = %91, %9
  %.010 = phi i32 [ %0, %9 ], [ %.212, %91 ]
  %.07 = phi i64 [ 0, %9 ], [ %.29, %91 ]
  %.02 = phi i32 [ 0, %9 ], [ %.1, %91 ]
  %16 = icmp slt i32 %.02, 30
  br i1 %16, label %17, label %29

17:                                               ; preds = %15, %19
  %.15 = phi i32 [ %25, %19 ], [ 0, %15 ]
  %18 = icmp slt i32 %.15, %0
  br i1 %18, label %19, label %26

19:                                               ; preds = %17
  %20 = sext i32 %.15 to i64
  %21 = getelementptr inbounds i32, ptr %7, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 1, %22
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %23)
  %25 = add nsw i32 %.15, 1
  br label %17, !llvm.loop !8

26:                                               ; preds = %17
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %28 = add nsw i32 %.02, 1
  br label %29

29:                                               ; preds = %26, %15
  %.1 = phi i32 [ %28, %26 ], [ %.02, %15 ]
  br label %30

30:                                               ; preds = %32, %29
  %.111 = phi i32 [ %.010, %29 ], [ %36, %32 ]
  %31 = icmp ne i32 %.111, 1
  br i1 %31, label %32, label %37

32:                                               ; preds = %30
  %33 = sub nsw i32 %.111, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr %8, i64 %34
  store i32 %.111, ptr %35, align 4
  %36 = add nsw i32 %.111, -1
  br label %30, !llvm.loop !9

37:                                               ; preds = %30
  %38 = getelementptr inbounds i32, ptr %7, i64 0
  %39 = load i32, ptr %38, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %77, label %41

41:                                               ; preds = %37
  %42 = sext i32 %2 to i64
  %43 = getelementptr inbounds i32, ptr %7, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = icmp eq i32 %44, %2
  br i1 %45, label %77, label %46

46:                                               ; preds = %41, %48
  %.2 = phi i32 [ %53, %48 ], [ 1, %41 ]
  %47 = icmp slt i32 %.2, %0
  br i1 %47, label %48, label %54

48:                                               ; preds = %46
  %49 = sext i32 %.2 to i64
  %50 = getelementptr inbounds i32, ptr %7, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = getelementptr inbounds i32, ptr %6, i64 %49
  store i32 %51, ptr %52, align 4
  %53 = add nsw i32 %.2, 1
  br label %46, !llvm.loop !10

54:                                               ; preds = %46
  %55 = load i32, ptr %38, align 4
  br label %56

56:                                               ; preds = %69, %54
  %.06 = phi i64 [ 0, %54 ], [ %70, %69 ]
  %.03 = phi i32 [ %55, %54 ], [ %73, %69 ]
  %57 = sub nsw i32 %.03, 1
  br label %58

58:                                               ; preds = %60, %56
  %.3 = phi i32 [ 1, %56 ], [ %67, %60 ]
  %.01 = phi i32 [ %57, %56 ], [ %68, %60 ]
  %59 = icmp slt i32 %.3, %.01
  br i1 %59, label %60, label %69

60:                                               ; preds = %58
  %61 = sext i32 %.3 to i64
  %62 = getelementptr inbounds i32, ptr %6, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = sext i32 %.01 to i64
  %65 = getelementptr inbounds i32, ptr %6, i64 %64
  %66 = load i32, ptr %65, align 4
  store i32 %66, ptr %62, align 4
  store i32 %63, ptr %65, align 4
  %67 = add nsw i32 %.3, 1
  %68 = add nsw i32 %.01, -1
  br label %58, !llvm.loop !11

69:                                               ; preds = %58
  %70 = add nsw i64 %.06, 1
  %71 = sext i32 %.03 to i64
  %72 = getelementptr inbounds i32, ptr %6, i64 %71
  %73 = load i32, ptr %72, align 4
  store i32 %.03, ptr %72, align 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %56, label %75, !llvm.loop !12

75:                                               ; preds = %69
  %76 = icmp slt i64 %.07, %70
  %spec.select = select i1 %76, i64 %70, i64 %.07
  br label %77

77:                                               ; preds = %75, %41, %37
  %.29 = phi i64 [ %.07, %37 ], [ %.07, %41 ], [ %spec.select, %75 ]
  br label %78

78:                                               ; preds = %98, %77
  %.212 = phi i32 [ %.111, %77 ], [ %99, %98 ]
  %79 = icmp eq i32 %.212, %0
  br i1 %79, label %100, label %80

80:                                               ; preds = %78
  %81 = load i32, ptr %38, align 4
  br label %82

82:                                               ; preds = %84, %80
  %.4 = phi i32 [ 0, %80 ], [ %85, %84 ]
  %83 = icmp slt i32 %.4, %.212
  br i1 %83, label %84, label %91

84:                                               ; preds = %82
  %85 = add nsw i32 %.4, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, ptr %7, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = sext i32 %.4 to i64
  %90 = getelementptr inbounds i32, ptr %7, i64 %89
  store i32 %88, ptr %90, align 4
  br label %82, !llvm.loop !13

91:                                               ; preds = %82
  %92 = sext i32 %.212 to i64
  %93 = getelementptr inbounds i32, ptr %7, i64 %92
  store i32 %81, ptr %93, align 4
  %94 = getelementptr inbounds i32, ptr %8, i64 %92
  %95 = load i32, ptr %94, align 4
  %96 = sub nsw i32 %95, 1
  store i32 %96, ptr %94, align 4
  %97 = icmp sgt i32 %96, 0
  br i1 %97, label %15, label %98

98:                                               ; preds = %91
  %99 = add nsw i32 %.212, 1
  br label %78

100:                                              ; preds = %78, %1
  %.0 = phi i64 [ 0, %1 ], [ %.29, %78 ]
  ret i64 %.0
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
