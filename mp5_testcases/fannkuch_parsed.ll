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
  %7 = call noalias ptr @calloc(i64 noundef %5, i64 noundef 4) #3
  %8 = call noalias ptr @calloc(i64 noundef %5, i64 noundef 4) #3
  %9 = getelementptr inbounds i32, ptr %7, i64 0
  %10 = sext i32 %2 to i64
  %11 = getelementptr inbounds i32, ptr %7, i64 %10
  br label %12

12:                                               ; preds = %14, %4
  %.04 = phi i32 [ 0, %4 ], [ %17, %14 ]
  %13 = icmp slt i32 %.04, %0
  br i1 %13, label %14, label %.preheader3

14:                                               ; preds = %12
  %15 = sext i32 %.04 to i64
  %16 = getelementptr inbounds i32, ptr %7, i64 %15
  store i32 %.04, ptr %16, align 4
  %17 = add nsw i32 %.04, 1
  br label %12, !llvm.loop !6

.preheader3:                                      ; preds = %88, %12
  %.010 = phi i32 [ %0, %12 ], [ %.212, %88 ]
  %.07 = phi i64 [ 0, %12 ], [ %.29, %88 ]
  %.02 = phi i32 [ 0, %12 ], [ %.1, %88 ]
  %18 = icmp slt i32 %.02, 30
  br i1 %18, label %.preheader2, label %30

.preheader2:                                      ; preds = %.preheader3, %20
  %.15 = phi i32 [ %26, %20 ], [ 0, %.preheader3 ]
  %19 = icmp slt i32 %.15, %0
  br i1 %19, label %20, label %27

20:                                               ; preds = %.preheader2
  %21 = sext i32 %.15 to i64
  %22 = getelementptr inbounds i32, ptr %7, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 1, %23
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %24)
  %26 = add nsw i32 %.15, 1
  br label %.preheader2, !llvm.loop !8

27:                                               ; preds = %.preheader2
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %29 = add nsw i32 %.02, 1
  br label %30

30:                                               ; preds = %27, %.preheader3
  %.1 = phi i32 [ %29, %27 ], [ %.02, %.preheader3 ]
  br label %31

31:                                               ; preds = %33, %30
  %.111 = phi i32 [ %.010, %30 ], [ %37, %33 ]
  %32 = icmp ne i32 %.111, 1
  br i1 %32, label %33, label %38

33:                                               ; preds = %31
  %34 = sub nsw i32 %.111, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr %8, i64 %35
  store i32 %.111, ptr %36, align 4
  %37 = add nsw i32 %.111, -1
  br label %31, !llvm.loop !9

38:                                               ; preds = %31
  %39 = load i32, ptr %9, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %74, label %41

41:                                               ; preds = %38
  %42 = load i32, ptr %11, align 4
  %43 = icmp eq i32 %42, %2
  br i1 %43, label %74, label %.preheader

.preheader:                                       ; preds = %41, %45
  %.2 = phi i32 [ %50, %45 ], [ 1, %41 ]
  %44 = icmp slt i32 %.2, %0
  br i1 %44, label %45, label %51

45:                                               ; preds = %.preheader
  %46 = sext i32 %.2 to i64
  %47 = getelementptr inbounds i32, ptr %7, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = getelementptr inbounds i32, ptr %6, i64 %46
  store i32 %48, ptr %49, align 4
  %50 = add nsw i32 %.2, 1
  br label %.preheader, !llvm.loop !10

51:                                               ; preds = %.preheader
  %52 = load i32, ptr %9, align 4
  br label %53

53:                                               ; preds = %66, %51
  %.06 = phi i64 [ 0, %51 ], [ %67, %66 ]
  %.03 = phi i32 [ %52, %51 ], [ %70, %66 ]
  %54 = sub nsw i32 %.03, 1
  br label %55

55:                                               ; preds = %57, %53
  %.3 = phi i32 [ 1, %53 ], [ %64, %57 ]
  %.01 = phi i32 [ %54, %53 ], [ %65, %57 ]
  %56 = icmp slt i32 %.3, %.01
  br i1 %56, label %57, label %66

57:                                               ; preds = %55
  %58 = sext i32 %.3 to i64
  %59 = getelementptr inbounds i32, ptr %6, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = sext i32 %.01 to i64
  %62 = getelementptr inbounds i32, ptr %6, i64 %61
  %63 = load i32, ptr %62, align 4
  store i32 %63, ptr %59, align 4
  store i32 %60, ptr %62, align 4
  %64 = add nsw i32 %.3, 1
  %65 = add nsw i32 %.01, -1
  br label %55, !llvm.loop !11

66:                                               ; preds = %55
  %67 = add nsw i64 %.06, 1
  %68 = sext i32 %.03 to i64
  %69 = getelementptr inbounds i32, ptr %6, i64 %68
  %70 = load i32, ptr %69, align 4
  store i32 %.03, ptr %69, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %53, label %72, !llvm.loop !12

72:                                               ; preds = %66
  %73 = icmp slt i64 %.07, %67
  %spec.select = select i1 %73, i64 %67, i64 %.07
  br label %74

74:                                               ; preds = %72, %41, %38
  %.29 = phi i64 [ %.07, %38 ], [ %.07, %41 ], [ %spec.select, %72 ]
  br label %75

75:                                               ; preds = %95, %74
  %.212 = phi i32 [ %.111, %74 ], [ %96, %95 ]
  %76 = icmp eq i32 %.212, %0
  br i1 %76, label %.loopexit, label %77

77:                                               ; preds = %75
  %78 = load i32, ptr %9, align 4
  br label %79

79:                                               ; preds = %81, %77
  %.4 = phi i32 [ 0, %77 ], [ %82, %81 ]
  %80 = icmp slt i32 %.4, %.212
  br i1 %80, label %81, label %88

81:                                               ; preds = %79
  %82 = add nsw i32 %.4, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, ptr %7, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = sext i32 %.4 to i64
  %87 = getelementptr inbounds i32, ptr %7, i64 %86
  store i32 %85, ptr %87, align 4
  br label %79, !llvm.loop !13

88:                                               ; preds = %79
  %89 = sext i32 %.212 to i64
  %90 = getelementptr inbounds i32, ptr %7, i64 %89
  store i32 %78, ptr %90, align 4
  %91 = getelementptr inbounds i32, ptr %8, i64 %89
  %92 = load i32, ptr %91, align 4
  %93 = sub nsw i32 %92, 1
  store i32 %93, ptr %91, align 4
  %94 = icmp sgt i32 %93, 0
  br i1 %94, label %.preheader3, label %95

95:                                               ; preds = %88
  %96 = add nsw i32 %.212, 1
  br label %75

.loopexit:                                        ; preds = %75, %1
  %.0 = phi i64 [ 0, %1 ], [ %.29, %75 ]
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
