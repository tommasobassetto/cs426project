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
  br i1 %3, label %.loopexit, label %4

4:                                                ; preds = %1
  %5 = sext i32 %0 to i64
  %6 = call noalias ptr @calloc(i64 noundef %5, i64 noundef 4) #3
  %7 = sext i32 %0 to i64
  %8 = call noalias ptr @calloc(i64 noundef %7, i64 noundef 4) #3
  %9 = sext i32 %0 to i64
  %10 = call noalias ptr @calloc(i64 noundef %9, i64 noundef 4) #3
  br label %11

11:                                               ; preds = %13, %4
  %.04 = phi i32 [ 0, %4 ], [ %16, %13 ]
  %12 = icmp slt i32 %.04, %0
  br i1 %12, label %13, label %.preheader3

13:                                               ; preds = %11
  %14 = sext i32 %.04 to i64
  %15 = getelementptr inbounds i32, ptr %8, i64 %14
  store i32 %.04, ptr %15, align 4
  %16 = add nsw i32 %.04, 1
  br label %11, !llvm.loop !6

.preheader3:                                      ; preds = %99, %11
  %.010 = phi i32 [ %0, %11 ], [ %.212, %99 ]
  %.07 = phi i64 [ 0, %11 ], [ %.29, %99 ]
  %.02 = phi i32 [ 0, %11 ], [ %.1, %99 ]
  %17 = icmp slt i32 %.02, 30
  br i1 %17, label %.preheader2, label %29

.preheader2:                                      ; preds = %.preheader3, %19
  %.15 = phi i32 [ %25, %19 ], [ 0, %.preheader3 ]
  %18 = icmp slt i32 %.15, %0
  br i1 %18, label %19, label %26

19:                                               ; preds = %.preheader2
  %20 = sext i32 %.15 to i64
  %21 = getelementptr inbounds i32, ptr %8, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 1, %22
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %23)
  %25 = add nsw i32 %.15, 1
  br label %.preheader2, !llvm.loop !8

26:                                               ; preds = %.preheader2
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %28 = add nsw i32 %.02, 1
  br label %29

29:                                               ; preds = %26, %.preheader3
  %.1 = phi i32 [ %28, %26 ], [ %.02, %.preheader3 ]
  br label %30

30:                                               ; preds = %32, %29
  %.111 = phi i32 [ %.010, %29 ], [ %36, %32 ]
  %31 = icmp ne i32 %.111, 1
  br i1 %31, label %32, label %37

32:                                               ; preds = %30
  %33 = sub nsw i32 %.111, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr %10, i64 %34
  store i32 %.111, ptr %35, align 4
  %36 = add nsw i32 %.111, -1
  br label %30, !llvm.loop !9

37:                                               ; preds = %30
  %38 = getelementptr inbounds i32, ptr %8, i64 0
  %39 = load i32, ptr %38, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %84, label %41

41:                                               ; preds = %37
  %42 = sext i32 %2 to i64
  %43 = getelementptr inbounds i32, ptr %8, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = icmp eq i32 %44, %2
  br i1 %45, label %84, label %.preheader

.preheader:                                       ; preds = %41, %47
  %.2 = phi i32 [ %53, %47 ], [ 1, %41 ]
  %46 = icmp slt i32 %.2, %0
  br i1 %46, label %47, label %54

47:                                               ; preds = %.preheader
  %48 = sext i32 %.2 to i64
  %49 = getelementptr inbounds i32, ptr %8, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = sext i32 %.2 to i64
  %52 = getelementptr inbounds i32, ptr %6, i64 %51
  store i32 %50, ptr %52, align 4
  %53 = add nsw i32 %.2, 1
  br label %.preheader, !llvm.loop !10

54:                                               ; preds = %.preheader
  %55 = getelementptr inbounds i32, ptr %8, i64 0
  %56 = load i32, ptr %55, align 4
  br label %57

57:                                               ; preds = %74, %54
  %.06 = phi i64 [ 0, %54 ], [ %75, %74 ]
  %.03 = phi i32 [ %56, %54 ], [ %78, %74 ]
  %58 = sub nsw i32 %.03, 1
  br label %59

59:                                               ; preds = %61, %57
  %.3 = phi i32 [ 1, %57 ], [ %72, %61 ]
  %.01 = phi i32 [ %58, %57 ], [ %73, %61 ]
  %60 = icmp slt i32 %.3, %.01
  br i1 %60, label %61, label %74

61:                                               ; preds = %59
  %62 = sext i32 %.3 to i64
  %63 = getelementptr inbounds i32, ptr %6, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = sext i32 %.01 to i64
  %66 = getelementptr inbounds i32, ptr %6, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = sext i32 %.3 to i64
  %69 = getelementptr inbounds i32, ptr %6, i64 %68
  store i32 %67, ptr %69, align 4
  %70 = sext i32 %.01 to i64
  %71 = getelementptr inbounds i32, ptr %6, i64 %70
  store i32 %64, ptr %71, align 4
  %72 = add nsw i32 %.3, 1
  %73 = add nsw i32 %.01, -1
  br label %59, !llvm.loop !11

74:                                               ; preds = %59
  %75 = add nsw i64 %.06, 1
  %76 = sext i32 %.03 to i64
  %77 = getelementptr inbounds i32, ptr %6, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = sext i32 %.03 to i64
  %80 = getelementptr inbounds i32, ptr %6, i64 %79
  store i32 %.03, ptr %80, align 4
  %81 = icmp ne i32 %78, 0
  br i1 %81, label %57, label %82, !llvm.loop !12

82:                                               ; preds = %74
  %83 = icmp slt i64 %.07, %75
  %spec.select = select i1 %83, i64 %75, i64 %.07
  br label %84

84:                                               ; preds = %82, %41, %37
  %.29 = phi i64 [ %.07, %37 ], [ %.07, %41 ], [ %spec.select, %82 ]
  br label %85

85:                                               ; preds = %107, %84
  %.212 = phi i32 [ %.111, %84 ], [ %108, %107 ]
  %86 = icmp eq i32 %.212, %0
  br i1 %86, label %.loopexit, label %87

87:                                               ; preds = %85
  %88 = getelementptr inbounds i32, ptr %8, i64 0
  %89 = load i32, ptr %88, align 4
  br label %90

90:                                               ; preds = %92, %87
  %.4 = phi i32 [ 0, %87 ], [ %93, %92 ]
  %91 = icmp slt i32 %.4, %.212
  br i1 %91, label %92, label %99

92:                                               ; preds = %90
  %93 = add nsw i32 %.4, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, ptr %8, i64 %94
  %96 = load i32, ptr %95, align 4
  %97 = sext i32 %.4 to i64
  %98 = getelementptr inbounds i32, ptr %8, i64 %97
  store i32 %96, ptr %98, align 4
  br label %90, !llvm.loop !13

99:                                               ; preds = %90
  %100 = sext i32 %.212 to i64
  %101 = getelementptr inbounds i32, ptr %8, i64 %100
  store i32 %89, ptr %101, align 4
  %102 = sext i32 %.212 to i64
  %103 = getelementptr inbounds i32, ptr %10, i64 %102
  %104 = load i32, ptr %103, align 4
  %105 = sub nsw i32 %104, 1
  store i32 %105, ptr %103, align 4
  %106 = icmp sgt i32 %105, 0
  br i1 %106, label %.preheader3, label %107

107:                                              ; preds = %99
  %108 = add nsw i32 %.212, 1
  br label %85

.loopexit:                                        ; preds = %85, %1
  %.0 = phi i64 [ 0, %1 ], [ %.29, %85 ]
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
