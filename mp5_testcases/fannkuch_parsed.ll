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
  br i1 %3, label %112, label %4

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
  br i1 %12, label %13, label %17

13:                                               ; preds = %11
  %14 = sext i32 %.04 to i64
  %15 = getelementptr inbounds i32, ptr %8, i64 %14
  store i32 %.04, ptr %15, align 4
  %16 = add nsw i32 %.04, 1
  br label %11, !llvm.loop !6

17:                                               ; preds = %102, %11
  %.010 = phi i32 [ %0, %11 ], [ %.212, %102 ]
  %.07 = phi i64 [ 0, %11 ], [ %.29, %102 ]
  %.02 = phi i32 [ 0, %11 ], [ %.1, %102 ]
  %18 = icmp slt i32 %.02, 30
  br i1 %18, label %19, label %31

19:                                               ; preds = %17, %21
  %.15 = phi i32 [ %27, %21 ], [ 0, %17 ]
  %20 = icmp slt i32 %.15, %0
  br i1 %20, label %21, label %28

21:                                               ; preds = %19
  %22 = sext i32 %.15 to i64
  %23 = getelementptr inbounds i32, ptr %8, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = add nsw i32 1, %24
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %25)
  %27 = add nsw i32 %.15, 1
  br label %19, !llvm.loop !8

28:                                               ; preds = %19
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %30 = add nsw i32 %.02, 1
  br label %31

31:                                               ; preds = %28, %17
  %.1 = phi i32 [ %30, %28 ], [ %.02, %17 ]
  br label %32

32:                                               ; preds = %34, %31
  %.111 = phi i32 [ %.010, %31 ], [ %38, %34 ]
  %33 = icmp ne i32 %.111, 1
  br i1 %33, label %34, label %39

34:                                               ; preds = %32
  %35 = sub nsw i32 %.111, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr %10, i64 %36
  store i32 %.111, ptr %37, align 4
  %38 = add nsw i32 %.111, -1
  br label %32, !llvm.loop !9

39:                                               ; preds = %32
  %40 = getelementptr inbounds i32, ptr %8, i64 0
  %41 = load i32, ptr %40, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %87, label %43

43:                                               ; preds = %39
  %44 = sext i32 %2 to i64
  %45 = getelementptr inbounds i32, ptr %8, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = icmp eq i32 %46, %2
  br i1 %47, label %87, label %48

48:                                               ; preds = %43, %50
  %.2 = phi i32 [ %56, %50 ], [ 1, %43 ]
  %49 = icmp slt i32 %.2, %0
  br i1 %49, label %50, label %57

50:                                               ; preds = %48
  %51 = sext i32 %.2 to i64
  %52 = getelementptr inbounds i32, ptr %8, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = sext i32 %.2 to i64
  %55 = getelementptr inbounds i32, ptr %6, i64 %54
  store i32 %53, ptr %55, align 4
  %56 = add nsw i32 %.2, 1
  br label %48, !llvm.loop !10

57:                                               ; preds = %48
  %58 = getelementptr inbounds i32, ptr %8, i64 0
  %59 = load i32, ptr %58, align 4
  br label %60

60:                                               ; preds = %77, %57
  %.06 = phi i64 [ 0, %57 ], [ %78, %77 ]
  %.03 = phi i32 [ %59, %57 ], [ %81, %77 ]
  %61 = sub nsw i32 %.03, 1
  br label %62

62:                                               ; preds = %64, %60
  %.3 = phi i32 [ 1, %60 ], [ %75, %64 ]
  %.01 = phi i32 [ %61, %60 ], [ %76, %64 ]
  %63 = icmp slt i32 %.3, %.01
  br i1 %63, label %64, label %77

64:                                               ; preds = %62
  %65 = sext i32 %.3 to i64
  %66 = getelementptr inbounds i32, ptr %6, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = sext i32 %.01 to i64
  %69 = getelementptr inbounds i32, ptr %6, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = sext i32 %.3 to i64
  %72 = getelementptr inbounds i32, ptr %6, i64 %71
  store i32 %70, ptr %72, align 4
  %73 = sext i32 %.01 to i64
  %74 = getelementptr inbounds i32, ptr %6, i64 %73
  store i32 %67, ptr %74, align 4
  %75 = add nsw i32 %.3, 1
  %76 = add nsw i32 %.01, -1
  br label %62, !llvm.loop !11

77:                                               ; preds = %62
  %78 = add nsw i64 %.06, 1
  %79 = sext i32 %.03 to i64
  %80 = getelementptr inbounds i32, ptr %6, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = sext i32 %.03 to i64
  %83 = getelementptr inbounds i32, ptr %6, i64 %82
  store i32 %.03, ptr %83, align 4
  %84 = icmp ne i32 %81, 0
  br i1 %84, label %60, label %85, !llvm.loop !12

85:                                               ; preds = %77
  %86 = icmp slt i64 %.07, %78
  %spec.select = select i1 %86, i64 %78, i64 %.07
  br label %87

87:                                               ; preds = %85, %43, %39
  %.29 = phi i64 [ %.07, %39 ], [ %.07, %43 ], [ %spec.select, %85 ]
  br label %88

88:                                               ; preds = %110, %87
  %.212 = phi i32 [ %.111, %87 ], [ %111, %110 ]
  %89 = icmp eq i32 %.212, %0
  br i1 %89, label %112, label %90

90:                                               ; preds = %88
  %91 = getelementptr inbounds i32, ptr %8, i64 0
  %92 = load i32, ptr %91, align 4
  br label %93

93:                                               ; preds = %95, %90
  %.4 = phi i32 [ 0, %90 ], [ %96, %95 ]
  %94 = icmp slt i32 %.4, %.212
  br i1 %94, label %95, label %102

95:                                               ; preds = %93
  %96 = add nsw i32 %.4, 1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, ptr %8, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = sext i32 %.4 to i64
  %101 = getelementptr inbounds i32, ptr %8, i64 %100
  store i32 %99, ptr %101, align 4
  br label %93, !llvm.loop !13

102:                                              ; preds = %93
  %103 = sext i32 %.212 to i64
  %104 = getelementptr inbounds i32, ptr %8, i64 %103
  store i32 %92, ptr %104, align 4
  %105 = sext i32 %.212 to i64
  %106 = getelementptr inbounds i32, ptr %10, i64 %105
  %107 = load i32, ptr %106, align 4
  %108 = sub nsw i32 %107, 1
  store i32 %108, ptr %106, align 4
  %109 = icmp sgt i32 %108, 0
  br i1 %109, label %17, label %110

110:                                              ; preds = %102
  %111 = add nsw i32 %.212, 1
  br label %88

112:                                              ; preds = %88, %1
  %.0 = phi i64 [ 0, %1 ], [ %.29, %88 ]
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
