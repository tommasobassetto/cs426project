; ModuleID = 'mp5_testcases/partialsums_c.ll'
source_filename = "mp5_testcases/partialsums.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"%.9f\09%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"(2/3)^k\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"k^-0.5\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"1/k(k+1)\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"Flint Hills\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"Cookson Hills\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Harmonic\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Riemann Zeta\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"Alternating Harmonic\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"Gregory\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local <2 x double> @make_vec(double noundef %0, double noundef %1) #0 {
  %3 = alloca <2 x double>, align 16
  store double %0, ptr %3, align 8
  %4 = getelementptr inbounds double, ptr %3, i64 1
  store double %1, ptr %4, align 8
  %5 = load <2 x double>, ptr %3, align 16
  ret <2 x double> %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @sum_vec(<2 x double> noundef %0) #0 {
  %2 = alloca <2 x double>, align 16
  store <2 x double> %0, ptr %2, align 16
  %3 = load double, ptr %2, align 8
  %4 = getelementptr inbounds double, ptr %2, i64 1
  %5 = load double, ptr %4, align 8
  %6 = fadd double %3, %5
  ret double %6
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca <2 x double>, align 16
  %4 = call <2 x double> @make_vec(double noundef 0.000000e+00, double noundef 0.000000e+00)
  %5 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef 1.000000e+00)
  %6 = call <2 x double> @make_vec(double noundef 2.000000e+00, double noundef 2.000000e+00)
  %7 = call <2 x double> @make_vec(double noundef -1.000000e+00, double noundef -1.000000e+00)
  %8 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef 2.000000e+00)
  %9 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef -1.000000e+00)
  %10 = sitofp i32 2500000 to double
  br label %11

11:                                               ; preds = %13, %2
  %.06 = phi double [ 0.000000e+00, %2 ], [ %31, %13 ]
  %.05 = phi double [ 0.000000e+00, %2 ], [ %27, %13 ]
  %.04 = phi double [ 0.000000e+00, %2 ], [ %19, %13 ]
  %.03 = phi double [ 0.000000e+00, %2 ], [ %16, %13 ]
  %.0 = phi double [ 1.000000e+00, %2 ], [ %32, %13 ]
  %12 = fcmp ole double %.0, %10
  br i1 %12, label %13, label %33

13:                                               ; preds = %11
  %14 = fsub double %.0, 1.000000e+00
  %15 = call double @pow(double noundef 0x3FE5555555555555, double noundef %14) #4
  %16 = fadd double %.03, %15
  %17 = call double @sqrt(double noundef %.0) #4
  %18 = fdiv double 1.000000e+00, %17
  %19 = fadd double %.04, %18
  %20 = fmul double %.0, %.0
  %21 = fmul double %20, %.0
  %22 = call double @sin(double noundef %.0) #4
  %23 = call double @cos(double noundef %.0) #4
  %24 = fmul double %21, %22
  %25 = fmul double %24, %22
  %26 = fdiv double 1.000000e+00, %25
  %27 = fadd double %.05, %26
  %28 = fmul double %21, %23
  %29 = fmul double %28, %23
  %30 = fdiv double 1.000000e+00, %29
  %31 = fadd double %.06, %30
  %32 = fadd double %.0, 1.000000e+00
  br label %11, !llvm.loop !6

33:                                               ; preds = %11
  store <2 x double> %8, ptr %3, align 16
  %34 = fneg <2 x double> %5
  br label %35

35:                                               ; preds = %38, %33
  %.09 = phi <2 x double> [ %4, %33 ], [ %44, %38 ]
  %.08 = phi <2 x double> [ %4, %33 ], [ %52, %38 ]
  %.07 = phi <2 x double> [ %4, %33 ], [ %47, %38 ]
  %.02 = phi <2 x double> [ %4, %33 ], [ %55, %38 ]
  %.01 = phi <2 x double> [ %4, %33 ], [ %59, %38 ]
  %36 = load double, ptr %3, align 16
  %37 = fcmp ole double %36, %10
  br i1 %37, label %38, label %62

38:                                               ; preds = %35
  %39 = load <2 x double>, ptr %3, align 16
  %40 = load <2 x double>, ptr %3, align 16
  %41 = fadd <2 x double> %40, %5
  %42 = fmul <2 x double> %39, %41
  %43 = fdiv <2 x double> %5, %42
  %44 = fadd <2 x double> %.09, %43
  %45 = load <2 x double>, ptr %3, align 16
  %46 = fdiv <2 x double> %5, %45
  %47 = fadd <2 x double> %.07, %46
  %48 = load <2 x double>, ptr %3, align 16
  %49 = load <2 x double>, ptr %3, align 16
  %50 = fmul <2 x double> %48, %49
  %51 = fdiv <2 x double> %5, %50
  %52 = fadd <2 x double> %.08, %51
  %53 = load <2 x double>, ptr %3, align 16
  %54 = fdiv <2 x double> %9, %53
  %55 = fadd <2 x double> %.02, %54
  %56 = load <2 x double>, ptr %3, align 16
  %57 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %6, <2 x double> %56, <2 x double> %34)
  %58 = fdiv <2 x double> %9, %57
  %59 = fadd <2 x double> %.01, %58
  %60 = load <2 x double>, ptr %3, align 16
  %61 = fadd <2 x double> %60, %6
  store <2 x double> %61, ptr %3, align 16
  br label %35, !llvm.loop !8

62:                                               ; preds = %35
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %.03, ptr noundef @.str.1)
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %.04, ptr noundef @.str.2)
  %65 = call double @sum_vec(<2 x double> noundef %.09)
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %65, ptr noundef @.str.3)
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %.05, ptr noundef @.str.4)
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %.06, ptr noundef @.str.5)
  %69 = call double @sum_vec(<2 x double> noundef %.07)
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %69, ptr noundef @.str.6)
  %71 = call double @sum_vec(<2 x double> noundef %.08)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %71, ptr noundef @.str.7)
  %73 = call double @sum_vec(<2 x double> noundef %.02)
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %73, ptr noundef @.str.8)
  %75 = call double @sum_vec(<2 x double> noundef %.01)
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %75, ptr noundef @.str.9)
  ret i32 0
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nounwind
declare double @sin(double noundef) #1

; Function Attrs: nounwind
declare double @cos(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
