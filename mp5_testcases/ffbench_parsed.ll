; ModuleID = 'mp5_testcases/ffbench_c.ll'
source_filename = "mp5_testcases/ffbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.nsize = internal global [3 x i32] zeroinitializer, align 4
@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [28 x i8] c"Can't allocate data array.\0A\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = mul nsw i32 256, 256
  %2 = sext i32 %1 to i64
  %3 = add nsw i64 %2, 1
  %4 = mul nsw i64 %3, 2
  %5 = mul i64 %4, 8
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 2), align 4
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 1), align 4
  %6 = call noalias ptr @malloc(i64 noundef %5) #7
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %0
  %9 = load ptr, ptr @stderr, align 8
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

11:                                               ; preds = %0
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 %5, i1 false)
  br label %12

12:                                               ; preds = %30, %11
  %.01 = phi i32 [ 0, %11 ], [ %31, %30 ]
  %13 = icmp slt i32 %.01, 256
  br i1 %13, label %14, label %32

14:                                               ; preds = %12, %28
  %.02 = phi i32 [ %29, %28 ], [ 0, %12 ]
  %15 = icmp slt i32 %.02, 256
  br i1 %15, label %16, label %30

16:                                               ; preds = %14
  %17 = and i32 %.01, 15
  %18 = icmp eq i32 %17, 8
  %19 = and i32 %.02, 15
  %20 = icmp eq i32 %19, 8
  %or.cond = select i1 %18, i1 true, i1 %20
  br i1 %or.cond, label %21, label %28

21:                                               ; preds = %16
  %22 = mul nsw i32 256, %.01
  %23 = add nsw i32 %22, %.02
  %24 = mul nsw i32 %23, 2
  %25 = add nsw i32 1, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, ptr %6, i64 %26
  store double 1.280000e+02, ptr %27, align 8
  br label %28

28:                                               ; preds = %21, %16
  %29 = add nsw i32 %.02, 1
  br label %14, !llvm.loop !6

30:                                               ; preds = %14
  %31 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !8

32:                                               ; preds = %12, %34
  %.1 = phi i32 [ %35, %34 ], [ 0, %12 ]
  %33 = icmp slt i32 %.1, 63
  br i1 %33, label %34, label %36

34:                                               ; preds = %32
  call void @fourn(ptr noundef %6, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %6, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  %35 = add nsw i32 %.1, 1
  br label %32, !llvm.loop !9

36:                                               ; preds = %32, %39
  %.011 = phi double [ %..011, %39 ], [ 1.000000e+10, %32 ]
  %.010 = phi double [ %44, %39 ], [ -1.000000e+10, %32 ]
  %.2 = phi i32 [ %45, %39 ], [ 1, %32 ]
  %37 = sext i32 %.2 to i64
  %38 = icmp sle i64 %37, %2
  br i1 %38, label %39, label %46

39:                                               ; preds = %36
  %40 = getelementptr inbounds double, ptr %6, i64 %37
  %41 = load double, ptr %40, align 8
  %42 = fcmp ole double %41, %.011
  %..011 = select i1 %42, double %41, double %.011
  %43 = fcmp ogt double %41, %.010
  %44 = select i1 %43, double %41, double %.010
  %45 = add nsw i32 %.2, 2
  br label %36, !llvm.loop !10

46:                                               ; preds = %36
  %47 = fsub double %.010, %.011
  %48 = fdiv double 2.550000e+02, %47
  br label %49

49:                                               ; preds = %77, %46
  %.06 = phi i32 [ 0, %46 ], [ %.17, %77 ]
  %.3 = phi i32 [ 0, %46 ], [ %78, %77 ]
  %50 = icmp slt i32 %.3, 256
  br i1 %50, label %51, label %79

51:                                               ; preds = %49, %75
  %.17 = phi i32 [ %.28, %75 ], [ %.06, %49 ]
  %.13 = phi i32 [ %76, %75 ], [ 0, %49 ]
  %52 = icmp slt i32 %.13, 256
  br i1 %52, label %53, label %77

53:                                               ; preds = %51
  %54 = mul nsw i32 256, %.3
  %55 = add nsw i32 %54, %.13
  %56 = mul nsw i32 %55, 2
  %57 = add nsw i32 1, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, ptr %6, i64 %58
  %60 = load double, ptr %59, align 8
  %61 = fsub double %60, %.011
  %62 = fmul double %61, %48
  %63 = fptosi double %62 to i32
  %64 = and i32 %.3, 15
  %65 = icmp eq i32 %64, 8
  %66 = and i32 %.13, 15
  %67 = icmp eq i32 %66, 8
  %68 = select i1 %65, i1 true, i1 %67
  %69 = select i1 %68, i32 255, i32 0
  %70 = icmp ne i32 %63, %69
  br i1 %70, label %71, label %75

71:                                               ; preds = %53
  %72 = add nsw i32 %.17, 1
  %73 = load ptr, ptr @stderr, align 8
  %74 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %73, ptr noundef @.str.1, i32 noundef %.3, i32 noundef %.13, i32 noundef %69, i32 noundef %63)
  br label %75

75:                                               ; preds = %53, %71
  %.28 = phi i32 [ %72, %71 ], [ %.17, %53 ]
  %76 = add nsw i32 %.13, 1
  br label %51, !llvm.loop !11

77:                                               ; preds = %51
  %78 = add nsw i32 %.3, 1
  br label %49, !llvm.loop !12

79:                                               ; preds = %49
  %80 = icmp eq i32 %.06, 0
  br i1 %80, label %81, label %84

81:                                               ; preds = %79
  %82 = load ptr, ptr @stderr, align 8
  %83 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %82, ptr noundef @.str.2, i32 noundef 63)
  br label %87

84:                                               ; preds = %79
  %85 = load ptr, ptr @stderr, align 8
  %86 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %85, ptr noundef @.str.3, i32 noundef 63, i32 noundef %.06)
  br label %87

87:                                               ; preds = %84, %81
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal void @fourn(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  br label %5

5:                                                ; preds = %7, %4
  %.011 = phi i32 [ 1, %4 ], [ %12, %7 ]
  %.09 = phi i32 [ 1, %4 ], [ %11, %7 ]
  %6 = icmp sle i32 %.011, %2
  br i1 %6, label %7, label %13

7:                                                ; preds = %5
  %8 = sext i32 %.011 to i64
  %9 = getelementptr inbounds i32, ptr %1, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = mul nsw i32 %.09, %10
  %12 = add nsw i32 %.011, 1
  br label %5, !llvm.loop !13

13:                                               ; preds = %5, %127
  %.112 = phi i32 [ %128, %127 ], [ %2, %5 ]
  %.010 = phi i32 [ %19, %127 ], [ 1, %5 ]
  %14 = icmp sge i32 %.112, 1
  br i1 %14, label %15, label %129

15:                                               ; preds = %13
  %16 = sext i32 %.112 to i64
  %17 = getelementptr inbounds i32, ptr %1, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = mul nsw i32 %18, %.010
  %20 = sdiv i32 %.09, %19
  %21 = shl i32 %.010, 1
  %22 = mul nsw i32 %21, %18
  %23 = mul nsw i32 %22, %20
  br label %24

24:                                               ; preds = %62, %15
  %.07 = phi i32 [ 1, %15 ], [ %63, %62 ]
  %.03 = phi i32 [ 1, %15 ], [ %64, %62 ]
  %25 = icmp sle i32 %.03, %22
  br i1 %25, label %26, label %65

26:                                               ; preds = %24
  %27 = icmp slt i32 %.03, %.07
  br i1 %27, label %28, label %54

28:                                               ; preds = %26, %52
  %.02 = phi i32 [ %53, %52 ], [ %.03, %26 ]
  %29 = add nsw i32 %.03, %21
  %30 = sub nsw i32 %29, 2
  %31 = icmp sle i32 %.02, %30
  br i1 %31, label %32, label %54

32:                                               ; preds = %28, %34
  %.05 = phi i32 [ %51, %34 ], [ %.02, %28 ]
  %33 = icmp sle i32 %.05, %23
  br i1 %33, label %34, label %52

34:                                               ; preds = %32
  %35 = add nsw i32 %.07, %.05
  %36 = sub nsw i32 %35, %.03
  %37 = sext i32 %.05 to i64
  %38 = getelementptr inbounds double, ptr %0, i64 %37
  %39 = load double, ptr %38, align 8
  %40 = sext i32 %36 to i64
  %41 = getelementptr inbounds double, ptr %0, i64 %40
  %42 = load double, ptr %41, align 8
  store double %42, ptr %38, align 8
  store double %39, ptr %41, align 8
  %43 = add nsw i32 %.05, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, ptr %0, i64 %44
  %46 = load double, ptr %45, align 8
  %47 = add nsw i32 %36, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, ptr %0, i64 %48
  %50 = load double, ptr %49, align 8
  store double %50, ptr %45, align 8
  store double %46, ptr %49, align 8
  %51 = add nsw i32 %.05, %22
  br label %32, !llvm.loop !14

52:                                               ; preds = %32
  %53 = add nsw i32 %.02, 2
  br label %28, !llvm.loop !15

54:                                               ; preds = %28, %26
  %55 = ashr i32 %22, 1
  br label %56

56:                                               ; preds = %59, %54
  %.013 = phi i32 [ %55, %54 ], [ %61, %59 ]
  %.18 = phi i32 [ %.07, %54 ], [ %60, %59 ]
  %57 = icmp sge i32 %.013, %21
  %58 = icmp sgt i32 %.18, %.013
  %spec.select = select i1 %57, i1 %58, i1 false
  br i1 %spec.select, label %59, label %62

59:                                               ; preds = %56
  %60 = sub nsw i32 %.18, %.013
  %61 = ashr i32 %.013, 1
  br label %56, !llvm.loop !16

62:                                               ; preds = %56
  %63 = add nsw i32 %.18, %.013
  %64 = add nsw i32 %.03, %21
  br label %24, !llvm.loop !17

65:                                               ; preds = %79, %24
  %.014 = phi i32 [ %21, %24 ], [ %68, %79 ]
  %66 = icmp slt i32 %.014, %22
  br i1 %66, label %67, label %127

67:                                               ; preds = %65
  %68 = shl i32 %.014, 1
  %69 = sitofp i32 %3 to double
  %70 = fmul double %69, 0x401921FB54442D1C
  %71 = sdiv i32 %68, %21
  %72 = sitofp i32 %71 to double
  %73 = fdiv double %70, %72
  %74 = fmul double 5.000000e-01, %73
  %75 = call double @sin(double noundef %74) #9
  %76 = fmul double -2.000000e+00, %75
  %77 = fmul double %76, %75
  %78 = call double @sin(double noundef %73) #9
  br label %79

79:                                               ; preds = %119, %67
  %.16 = phi i32 [ 1, %67 ], [ %82, %119 ]
  %.01 = phi double [ 0.000000e+00, %67 ], [ %126, %119 ]
  %.0 = phi double [ 1.000000e+00, %67 ], [ %123, %119 ]
  %80 = icmp sle i32 %.16, %.014
  br i1 %80, label %81, label %65, !llvm.loop !18

81:                                               ; preds = %79, %117
  %.1 = phi i32 [ %118, %117 ], [ %.16, %79 ]
  %82 = add nsw i32 %.16, %21
  %83 = sub nsw i32 %82, 2
  %84 = icmp sle i32 %.1, %83
  br i1 %84, label %85, label %119

85:                                               ; preds = %81, %87
  %.14 = phi i32 [ %116, %87 ], [ %.1, %81 ]
  %86 = icmp sle i32 %.14, %23
  br i1 %86, label %87, label %117

87:                                               ; preds = %85
  %88 = add nsw i32 %.14, %.014
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, ptr %0, i64 %89
  %91 = load double, ptr %90, align 8
  %92 = add nsw i32 %88, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds double, ptr %0, i64 %93
  %95 = load double, ptr %94, align 8
  %96 = fmul double %.01, %95
  %97 = fneg double %96
  %98 = call double @llvm.fmuladd.f64(double %.0, double %91, double %97)
  %99 = load double, ptr %94, align 8
  %100 = load double, ptr %90, align 8
  %101 = fmul double %.01, %100
  %102 = call double @llvm.fmuladd.f64(double %.0, double %99, double %101)
  %103 = sext i32 %.14 to i64
  %104 = getelementptr inbounds double, ptr %0, i64 %103
  %105 = load double, ptr %104, align 8
  %106 = fsub double %105, %98
  store double %106, ptr %90, align 8
  %107 = add nsw i32 %.14, 1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, ptr %0, i64 %108
  %110 = load double, ptr %109, align 8
  %111 = fsub double %110, %102
  store double %111, ptr %94, align 8
  %112 = load double, ptr %104, align 8
  %113 = fadd double %112, %98
  store double %113, ptr %104, align 8
  %114 = load double, ptr %109, align 8
  %115 = fadd double %114, %102
  store double %115, ptr %109, align 8
  %116 = add nsw i32 %.14, %68
  br label %85, !llvm.loop !19

117:                                              ; preds = %85
  %118 = add nsw i32 %.1, 2
  br label %81, !llvm.loop !20

119:                                              ; preds = %81
  %120 = fmul double %.01, %78
  %121 = fneg double %120
  %122 = call double @llvm.fmuladd.f64(double %.0, double %77, double %121)
  %123 = fadd double %122, %.0
  %124 = fmul double %.0, %78
  %125 = call double @llvm.fmuladd.f64(double %.01, double %77, double %124)
  %126 = fadd double %125, %.01
  br label %79, !llvm.loop !21

127:                                              ; preds = %65
  %128 = add nsw i32 %.112, -1
  br label %13, !llvm.loop !22

129:                                              ; preds = %13
  ret void
}

; Function Attrs: nounwind
declare double @sin(double noundef) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #6

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }

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
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
