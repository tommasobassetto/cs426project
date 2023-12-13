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
  %1 = sext i32 65536 to i64
  %2 = add nsw i64 %1, 1
  %3 = mul nsw i64 %2, 2
  %4 = mul i64 %3, 8
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 2), align 4
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 1), align 4
  %5 = call noalias ptr @malloc(i64 noundef %4) #7
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %0
  %8 = load ptr, ptr @stderr, align 8
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

10:                                               ; preds = %0
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 %4, i1 false)
  br label %11

11:                                               ; preds = %29, %10
  %.01 = phi i32 [ 0, %10 ], [ %30, %29 ]
  %12 = icmp slt i32 %.01, 256
  br i1 %12, label %13, label %31

13:                                               ; preds = %11, %27
  %.02 = phi i32 [ %28, %27 ], [ 0, %11 ]
  %14 = icmp slt i32 %.02, 256
  br i1 %14, label %15, label %29

15:                                               ; preds = %13
  %16 = and i32 %.01, 15
  %17 = icmp eq i32 %16, 8
  %18 = and i32 %.02, 15
  %19 = icmp eq i32 %18, 8
  %or.cond = select i1 %17, i1 true, i1 %19
  br i1 %or.cond, label %20, label %27

20:                                               ; preds = %15
  %21 = mul nsw i32 256, %.01
  %22 = add nsw i32 %21, %.02
  %23 = mul nsw i32 %22, 2
  %24 = add nsw i32 1, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, ptr %5, i64 %25
  store double 1.280000e+02, ptr %26, align 8
  br label %27

27:                                               ; preds = %20, %15
  %28 = add nsw i32 %.02, 1
  br label %13, !llvm.loop !6

29:                                               ; preds = %13
  %30 = add nsw i32 %.01, 1
  br label %11, !llvm.loop !8

31:                                               ; preds = %11, %33
  %.1 = phi i32 [ %34, %33 ], [ 0, %11 ]
  %32 = icmp slt i32 %.1, 63
  br i1 %32, label %33, label %35

33:                                               ; preds = %31
  call void @fourn(ptr noundef %5, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %5, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  %34 = add nsw i32 %.1, 1
  br label %31, !llvm.loop !9

35:                                               ; preds = %31, %38
  %.011 = phi double [ %..011, %38 ], [ 1.000000e+10, %31 ]
  %.010 = phi double [ %44, %38 ], [ -1.000000e+10, %31 ]
  %.2 = phi i32 [ %45, %38 ], [ 1, %31 ]
  %36 = sext i32 %.2 to i64
  %37 = icmp sle i64 %36, %1
  br i1 %37, label %38, label %46

38:                                               ; preds = %35
  %39 = sext i32 %.2 to i64
  %40 = getelementptr inbounds double, ptr %5, i64 %39
  %41 = load double, ptr %40, align 8
  %42 = fcmp ole double %41, %.011
  %..011 = select i1 %42, double %41, double %.011
  %43 = fcmp ogt double %41, %.010
  %44 = select i1 %43, double %41, double %.010
  %45 = add nsw i32 %.2, 2
  br label %35, !llvm.loop !10

46:                                               ; preds = %35
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
  %59 = getelementptr inbounds double, ptr %5, i64 %58
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

13:                                               ; preds = %5, %153
  %.112 = phi i32 [ %155, %153 ], [ %2, %5 ]
  %.010 = phi i32 [ %154, %153 ], [ 1, %5 ]
  %14 = icmp sge i32 %.112, 1
  br i1 %14, label %15, label %156

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

24:                                               ; preds = %72, %15
  %.07 = phi i32 [ 1, %15 ], [ %73, %72 ]
  %.03 = phi i32 [ 1, %15 ], [ %74, %72 ]
  %25 = icmp sle i32 %.03, %22
  br i1 %25, label %26, label %75

26:                                               ; preds = %24
  %27 = icmp slt i32 %.03, %.07
  br i1 %27, label %28, label %64

28:                                               ; preds = %26, %62
  %.02 = phi i32 [ %63, %62 ], [ %.03, %26 ]
  %29 = add nsw i32 %.03, %21
  %30 = sub nsw i32 %29, 2
  %31 = icmp sle i32 %.02, %30
  br i1 %31, label %32, label %64

32:                                               ; preds = %28, %34
  %.05 = phi i32 [ %61, %34 ], [ %.02, %28 ]
  %33 = icmp sle i32 %.05, %23
  br i1 %33, label %34, label %62

34:                                               ; preds = %32
  %35 = add nsw i32 %.07, %.05
  %36 = sub nsw i32 %35, %.03
  %37 = sext i32 %.05 to i64
  %38 = getelementptr inbounds double, ptr %0, i64 %37
  %39 = load double, ptr %38, align 8
  %40 = sext i32 %36 to i64
  %41 = getelementptr inbounds double, ptr %0, i64 %40
  %42 = load double, ptr %41, align 8
  %43 = sext i32 %.05 to i64
  %44 = getelementptr inbounds double, ptr %0, i64 %43
  store double %42, ptr %44, align 8
  %45 = sext i32 %36 to i64
  %46 = getelementptr inbounds double, ptr %0, i64 %45
  store double %39, ptr %46, align 8
  %47 = add nsw i32 %.05, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, ptr %0, i64 %48
  %50 = load double, ptr %49, align 8
  %51 = add nsw i32 %36, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, ptr %0, i64 %52
  %54 = load double, ptr %53, align 8
  %55 = add nsw i32 %.05, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, ptr %0, i64 %56
  store double %54, ptr %57, align 8
  %58 = add nsw i32 %36, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, ptr %0, i64 %59
  store double %50, ptr %60, align 8
  %61 = add nsw i32 %.05, %22
  br label %32, !llvm.loop !14

62:                                               ; preds = %32
  %63 = add nsw i32 %.02, 2
  br label %28, !llvm.loop !15

64:                                               ; preds = %28, %26
  %65 = ashr i32 %22, 1
  br label %66

66:                                               ; preds = %69, %64
  %.013 = phi i32 [ %65, %64 ], [ %71, %69 ]
  %.18 = phi i32 [ %.07, %64 ], [ %70, %69 ]
  %67 = icmp sge i32 %.013, %21
  %68 = icmp sgt i32 %.18, %.013
  %spec.select = select i1 %67, i1 %68, i1 false
  br i1 %spec.select, label %69, label %72

69:                                               ; preds = %66
  %70 = sub nsw i32 %.18, %.013
  %71 = ashr i32 %.013, 1
  br label %66, !llvm.loop !16

72:                                               ; preds = %66
  %73 = add nsw i32 %.18, %.013
  %74 = add nsw i32 %.03, %21
  br label %24, !llvm.loop !17

75:                                               ; preds = %89, %24
  %.014 = phi i32 [ %21, %24 ], [ %78, %89 ]
  %76 = icmp slt i32 %.014, %22
  br i1 %76, label %77, label %153

77:                                               ; preds = %75
  %78 = shl i32 %.014, 1
  %79 = sitofp i32 %3 to double
  %80 = fmul double %79, 0x401921FB54442D1C
  %81 = sdiv i32 %78, %21
  %82 = sitofp i32 %81 to double
  %83 = fdiv double %80, %82
  %84 = fmul double 5.000000e-01, %83
  %85 = call double @sin(double noundef %84) #9
  %86 = fmul double -2.000000e+00, %85
  %87 = fmul double %86, %85
  %88 = call double @sin(double noundef %83) #9
  br label %89

89:                                               ; preds = %144, %77
  %.16 = phi i32 [ 1, %77 ], [ %152, %144 ]
  %.01 = phi double [ 0.000000e+00, %77 ], [ %151, %144 ]
  %.0 = phi double [ 1.000000e+00, %77 ], [ %148, %144 ]
  %90 = icmp sle i32 %.16, %.014
  br i1 %90, label %91, label %75, !llvm.loop !18

91:                                               ; preds = %89, %142
  %.1 = phi i32 [ %143, %142 ], [ %.16, %89 ]
  %92 = add nsw i32 %.16, %21
  %93 = sub nsw i32 %92, 2
  %94 = icmp sle i32 %.1, %93
  br i1 %94, label %95, label %144

95:                                               ; preds = %91, %97
  %.14 = phi i32 [ %141, %97 ], [ %.1, %91 ]
  %96 = icmp sle i32 %.14, %23
  br i1 %96, label %97, label %142

97:                                               ; preds = %95
  %98 = add nsw i32 %.14, %.014
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, ptr %0, i64 %99
  %101 = load double, ptr %100, align 8
  %102 = add nsw i32 %98, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, ptr %0, i64 %103
  %105 = load double, ptr %104, align 8
  %106 = fmul double %.01, %105
  %107 = fneg double %106
  %108 = call double @llvm.fmuladd.f64(double %.0, double %101, double %107)
  %109 = add nsw i32 %98, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds double, ptr %0, i64 %110
  %112 = load double, ptr %111, align 8
  %113 = sext i32 %98 to i64
  %114 = getelementptr inbounds double, ptr %0, i64 %113
  %115 = load double, ptr %114, align 8
  %116 = fmul double %.01, %115
  %117 = call double @llvm.fmuladd.f64(double %.0, double %112, double %116)
  %118 = sext i32 %.14 to i64
  %119 = getelementptr inbounds double, ptr %0, i64 %118
  %120 = load double, ptr %119, align 8
  %121 = fsub double %120, %108
  %122 = sext i32 %98 to i64
  %123 = getelementptr inbounds double, ptr %0, i64 %122
  store double %121, ptr %123, align 8
  %124 = add nsw i32 %.14, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds double, ptr %0, i64 %125
  %127 = load double, ptr %126, align 8
  %128 = fsub double %127, %117
  %129 = add nsw i32 %98, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, ptr %0, i64 %130
  store double %128, ptr %131, align 8
  %132 = sext i32 %.14 to i64
  %133 = getelementptr inbounds double, ptr %0, i64 %132
  %134 = load double, ptr %133, align 8
  %135 = fadd double %134, %108
  store double %135, ptr %133, align 8
  %136 = add nsw i32 %.14, 1
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds double, ptr %0, i64 %137
  %139 = load double, ptr %138, align 8
  %140 = fadd double %139, %117
  store double %140, ptr %138, align 8
  %141 = add nsw i32 %.14, %78
  br label %95, !llvm.loop !19

142:                                              ; preds = %95
  %143 = add nsw i32 %.1, 2
  br label %91, !llvm.loop !20

144:                                              ; preds = %91
  %145 = fmul double %.01, %88
  %146 = fneg double %145
  %147 = call double @llvm.fmuladd.f64(double %.0, double %87, double %146)
  %148 = fadd double %147, %.0
  %149 = fmul double %.0, %88
  %150 = call double @llvm.fmuladd.f64(double %.01, double %87, double %149)
  %151 = fadd double %150, %.01
  %152 = add nsw i32 %.16, %21
  br label %89, !llvm.loop !21

153:                                              ; preds = %75
  %154 = mul nsw i32 %.010, %18
  %155 = add nsw i32 %.112, -1
  br label %13, !llvm.loop !22

156:                                              ; preds = %13
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
