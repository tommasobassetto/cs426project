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

13:                                               ; preds = %5
  %14 = sitofp i32 %3 to double
  br label %15

15:                                               ; preds = %154, %13
  %.112 = phi i32 [ %2, %13 ], [ %156, %154 ]
  %.010 = phi i32 [ 1, %13 ], [ %155, %154 ]
  %16 = icmp sge i32 %.112, 1
  br i1 %16, label %17, label %157

17:                                               ; preds = %15
  %18 = sext i32 %.112 to i64
  %19 = getelementptr inbounds i32, ptr %1, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = mul nsw i32 %20, %.010
  %22 = sdiv i32 %.09, %21
  %23 = shl i32 %.010, 1
  %24 = mul nsw i32 %23, %20
  %25 = mul nsw i32 %24, %22
  br label %26

26:                                               ; preds = %74, %17
  %.07 = phi i32 [ 1, %17 ], [ %75, %74 ]
  %.03 = phi i32 [ 1, %17 ], [ %76, %74 ]
  %27 = icmp sle i32 %.03, %24
  br i1 %27, label %28, label %77

28:                                               ; preds = %26
  %29 = icmp slt i32 %.03, %.07
  br i1 %29, label %30, label %66

30:                                               ; preds = %28, %64
  %.02 = phi i32 [ %65, %64 ], [ %.03, %28 ]
  %31 = add nsw i32 %.03, %23
  %32 = sub nsw i32 %31, 2
  %33 = icmp sle i32 %.02, %32
  br i1 %33, label %34, label %66

34:                                               ; preds = %30, %36
  %.05 = phi i32 [ %63, %36 ], [ %.02, %30 ]
  %35 = icmp sle i32 %.05, %25
  br i1 %35, label %36, label %64

36:                                               ; preds = %34
  %37 = add nsw i32 %.07, %.05
  %38 = sub nsw i32 %37, %.03
  %39 = sext i32 %.05 to i64
  %40 = getelementptr inbounds double, ptr %0, i64 %39
  %41 = load double, ptr %40, align 8
  %42 = sext i32 %38 to i64
  %43 = getelementptr inbounds double, ptr %0, i64 %42
  %44 = load double, ptr %43, align 8
  %45 = sext i32 %.05 to i64
  %46 = getelementptr inbounds double, ptr %0, i64 %45
  store double %44, ptr %46, align 8
  %47 = sext i32 %38 to i64
  %48 = getelementptr inbounds double, ptr %0, i64 %47
  store double %41, ptr %48, align 8
  %49 = add nsw i32 %.05, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, ptr %0, i64 %50
  %52 = load double, ptr %51, align 8
  %53 = add nsw i32 %38, 1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, ptr %0, i64 %54
  %56 = load double, ptr %55, align 8
  %57 = add nsw i32 %.05, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, ptr %0, i64 %58
  store double %56, ptr %59, align 8
  %60 = add nsw i32 %38, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, ptr %0, i64 %61
  store double %52, ptr %62, align 8
  %63 = add nsw i32 %.05, %24
  br label %34, !llvm.loop !14

64:                                               ; preds = %34
  %65 = add nsw i32 %.02, 2
  br label %30, !llvm.loop !15

66:                                               ; preds = %30, %28
  %67 = ashr i32 %24, 1
  br label %68

68:                                               ; preds = %71, %66
  %.013 = phi i32 [ %67, %66 ], [ %73, %71 ]
  %.18 = phi i32 [ %.07, %66 ], [ %72, %71 ]
  %69 = icmp sge i32 %.013, %23
  %70 = icmp sgt i32 %.18, %.013
  %spec.select = select i1 %69, i1 %70, i1 false
  br i1 %spec.select, label %71, label %74

71:                                               ; preds = %68
  %72 = sub nsw i32 %.18, %.013
  %73 = ashr i32 %.013, 1
  br label %68, !llvm.loop !16

74:                                               ; preds = %68
  %75 = add nsw i32 %.18, %.013
  %76 = add nsw i32 %.03, %23
  br label %26, !llvm.loop !17

77:                                               ; preds = %90, %26
  %.014 = phi i32 [ %23, %26 ], [ %80, %90 ]
  %78 = icmp slt i32 %.014, %24
  br i1 %78, label %79, label %154

79:                                               ; preds = %77
  %80 = shl i32 %.014, 1
  %81 = fmul double %14, 0x401921FB54442D1C
  %82 = sdiv i32 %80, %23
  %83 = sitofp i32 %82 to double
  %84 = fdiv double %81, %83
  %85 = fmul double 5.000000e-01, %84
  %86 = call double @sin(double noundef %85) #9
  %87 = fmul double -2.000000e+00, %86
  %88 = fmul double %87, %86
  %89 = call double @sin(double noundef %84) #9
  br label %90

90:                                               ; preds = %145, %79
  %.16 = phi i32 [ 1, %79 ], [ %153, %145 ]
  %.01 = phi double [ 0.000000e+00, %79 ], [ %152, %145 ]
  %.0 = phi double [ 1.000000e+00, %79 ], [ %149, %145 ]
  %91 = icmp sle i32 %.16, %.014
  br i1 %91, label %92, label %77, !llvm.loop !18

92:                                               ; preds = %90, %143
  %.1 = phi i32 [ %144, %143 ], [ %.16, %90 ]
  %93 = add nsw i32 %.16, %23
  %94 = sub nsw i32 %93, 2
  %95 = icmp sle i32 %.1, %94
  br i1 %95, label %96, label %145

96:                                               ; preds = %92, %98
  %.14 = phi i32 [ %142, %98 ], [ %.1, %92 ]
  %97 = icmp sle i32 %.14, %25
  br i1 %97, label %98, label %143

98:                                               ; preds = %96
  %99 = add nsw i32 %.14, %.014
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, ptr %0, i64 %100
  %102 = load double, ptr %101, align 8
  %103 = add nsw i32 %99, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, ptr %0, i64 %104
  %106 = load double, ptr %105, align 8
  %107 = fmul double %.01, %106
  %108 = fneg double %107
  %109 = call double @llvm.fmuladd.f64(double %.0, double %102, double %108)
  %110 = add nsw i32 %99, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, ptr %0, i64 %111
  %113 = load double, ptr %112, align 8
  %114 = sext i32 %99 to i64
  %115 = getelementptr inbounds double, ptr %0, i64 %114
  %116 = load double, ptr %115, align 8
  %117 = fmul double %.01, %116
  %118 = call double @llvm.fmuladd.f64(double %.0, double %113, double %117)
  %119 = sext i32 %.14 to i64
  %120 = getelementptr inbounds double, ptr %0, i64 %119
  %121 = load double, ptr %120, align 8
  %122 = fsub double %121, %109
  %123 = sext i32 %99 to i64
  %124 = getelementptr inbounds double, ptr %0, i64 %123
  store double %122, ptr %124, align 8
  %125 = add nsw i32 %.14, 1
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds double, ptr %0, i64 %126
  %128 = load double, ptr %127, align 8
  %129 = fsub double %128, %118
  %130 = add nsw i32 %99, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds double, ptr %0, i64 %131
  store double %129, ptr %132, align 8
  %133 = sext i32 %.14 to i64
  %134 = getelementptr inbounds double, ptr %0, i64 %133
  %135 = load double, ptr %134, align 8
  %136 = fadd double %135, %109
  store double %136, ptr %134, align 8
  %137 = add nsw i32 %.14, 1
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds double, ptr %0, i64 %138
  %140 = load double, ptr %139, align 8
  %141 = fadd double %140, %118
  store double %141, ptr %139, align 8
  %142 = add nsw i32 %.14, %80
  br label %96, !llvm.loop !19

143:                                              ; preds = %96
  %144 = add nsw i32 %.1, 2
  br label %92, !llvm.loop !20

145:                                              ; preds = %92
  %146 = fmul double %.01, %89
  %147 = fneg double %146
  %148 = call double @llvm.fmuladd.f64(double %.0, double %88, double %147)
  %149 = fadd double %148, %.0
  %150 = fmul double %.0, %89
  %151 = call double @llvm.fmuladd.f64(double %.01, double %88, double %150)
  %152 = fadd double %151, %.01
  %153 = add nsw i32 %.16, %23
  br label %90, !llvm.loop !21

154:                                              ; preds = %77
  %155 = mul nsw i32 %.010, %20
  %156 = add nsw i32 %.112, -1
  br label %15, !llvm.loop !22

157:                                              ; preds = %15
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
