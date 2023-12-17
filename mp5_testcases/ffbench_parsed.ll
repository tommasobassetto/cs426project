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

11:                                               ; preds = %28, %10
  %.01 = phi i32 [ 0, %10 ], [ %29, %28 ]
  %12 = icmp slt i32 %.01, 256
  br i1 %12, label %.preheader4, label %.preheader3

.preheader4:                                      ; preds = %11, %26
  %.02 = phi i32 [ %27, %26 ], [ 0, %11 ]
  %13 = icmp slt i32 %.02, 256
  br i1 %13, label %14, label %28

14:                                               ; preds = %.preheader4
  %15 = and i32 %.01, 15
  %16 = icmp eq i32 %15, 8
  %17 = and i32 %.02, 15
  %18 = icmp eq i32 %17, 8
  %or.cond = select i1 %16, i1 true, i1 %18
  br i1 %or.cond, label %19, label %26

19:                                               ; preds = %14
  %20 = mul nsw i32 256, %.01
  %21 = add nsw i32 %20, %.02
  %22 = mul nsw i32 %21, 2
  %23 = add nsw i32 1, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, ptr %5, i64 %24
  store double 1.280000e+02, ptr %25, align 8
  br label %26

26:                                               ; preds = %19, %14
  %27 = add nsw i32 %.02, 1
  br label %.preheader4, !llvm.loop !6

28:                                               ; preds = %.preheader4
  %29 = add nsw i32 %.01, 1
  br label %11, !llvm.loop !8

.preheader3:                                      ; preds = %11, %31
  %.1 = phi i32 [ %32, %31 ], [ 0, %11 ]
  %30 = icmp slt i32 %.1, 63
  br i1 %30, label %31, label %.preheader2

31:                                               ; preds = %.preheader3
  call void @fourn(ptr noundef %5, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %5, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  %32 = add nsw i32 %.1, 1
  br label %.preheader3, !llvm.loop !9

.preheader2:                                      ; preds = %.preheader3, %35
  %.011 = phi double [ %..011, %35 ], [ 1.000000e+10, %.preheader3 ]
  %.010 = phi double [ %40, %35 ], [ -1.000000e+10, %.preheader3 ]
  %.2 = phi i32 [ %41, %35 ], [ 1, %.preheader3 ]
  %33 = sext i32 %.2 to i64
  %34 = icmp sle i64 %33, %1
  br i1 %34, label %35, label %42

35:                                               ; preds = %.preheader2
  %36 = getelementptr inbounds double, ptr %5, i64 %33
  %37 = load double, ptr %36, align 8
  %38 = fcmp ole double %37, %.011
  %..011 = select i1 %38, double %37, double %.011
  %39 = fcmp ogt double %37, %.010
  %40 = select i1 %39, double %37, double %.010
  %41 = add nsw i32 %.2, 2
  br label %.preheader2, !llvm.loop !10

42:                                               ; preds = %.preheader2
  %43 = fsub double %.010, %.011
  %44 = fdiv double 2.550000e+02, %43
  br label %45

45:                                               ; preds = %72, %42
  %.06 = phi i32 [ 0, %42 ], [ %.17, %72 ]
  %.3 = phi i32 [ 0, %42 ], [ %73, %72 ]
  %46 = icmp slt i32 %.3, 256
  br i1 %46, label %.preheader, label %74

.preheader:                                       ; preds = %45, %70
  %.17 = phi i32 [ %.28, %70 ], [ %.06, %45 ]
  %.13 = phi i32 [ %71, %70 ], [ 0, %45 ]
  %47 = icmp slt i32 %.13, 256
  br i1 %47, label %48, label %72

48:                                               ; preds = %.preheader
  %49 = mul nsw i32 256, %.3
  %50 = add nsw i32 %49, %.13
  %51 = mul nsw i32 %50, 2
  %52 = add nsw i32 1, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, ptr %5, i64 %53
  %55 = load double, ptr %54, align 8
  %56 = fsub double %55, %.011
  %57 = fmul double %56, %44
  %58 = fptosi double %57 to i32
  %59 = and i32 %.3, 15
  %60 = icmp eq i32 %59, 8
  %61 = and i32 %.13, 15
  %62 = icmp eq i32 %61, 8
  %63 = select i1 %60, i1 true, i1 %62
  %64 = select i1 %63, i32 255, i32 0
  %65 = icmp ne i32 %58, %64
  br i1 %65, label %66, label %70

66:                                               ; preds = %48
  %67 = add nsw i32 %.17, 1
  %68 = load ptr, ptr @stderr, align 8
  %69 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %68, ptr noundef @.str.1, i32 noundef %.3, i32 noundef %.13, i32 noundef %64, i32 noundef %58)
  br label %70

70:                                               ; preds = %48, %66
  %.28 = phi i32 [ %67, %66 ], [ %.17, %48 ]
  %71 = add nsw i32 %.13, 1
  br label %.preheader, !llvm.loop !11

72:                                               ; preds = %.preheader
  %73 = add nsw i32 %.3, 1
  br label %45, !llvm.loop !12

74:                                               ; preds = %45
  %75 = icmp eq i32 %.06, 0
  br i1 %75, label %76, label %79

76:                                               ; preds = %74
  %77 = load ptr, ptr @stderr, align 8
  %78 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %77, ptr noundef @.str.2, i32 noundef 63)
  br label %82

79:                                               ; preds = %74
  %80 = load ptr, ptr @stderr, align 8
  %81 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %80, ptr noundef @.str.3, i32 noundef 63, i32 noundef %.06)
  br label %82

82:                                               ; preds = %79, %76
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
  %5 = sitofp i32 %3 to double
  %6 = fmul double %5, 0x401921FB54442D1C
  br label %7

7:                                                ; preds = %9, %4
  %.011 = phi i32 [ 1, %4 ], [ %14, %9 ]
  %.09 = phi i32 [ 1, %4 ], [ %13, %9 ]
  %8 = icmp sle i32 %.011, %2
  br i1 %8, label %9, label %.preheader6

9:                                                ; preds = %7
  %10 = sext i32 %.011 to i64
  %11 = getelementptr inbounds i32, ptr %1, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = mul nsw i32 %.09, %12
  %14 = add nsw i32 %.011, 1
  br label %7, !llvm.loop !13

.preheader6:                                      ; preds = %7, %120
  %.112 = phi i32 [ %121, %120 ], [ %2, %7 ]
  %.010 = phi i32 [ %20, %120 ], [ 1, %7 ]
  %15 = icmp sge i32 %.112, 1
  br i1 %15, label %16, label %122

16:                                               ; preds = %.preheader6
  %17 = sext i32 %.112 to i64
  %18 = getelementptr inbounds i32, ptr %1, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = mul nsw i32 %19, %.010
  %21 = sdiv i32 %.09, %20
  %22 = shl i32 %.010, 1
  %23 = mul nsw i32 %22, %19
  %24 = mul nsw i32 %23, %21
  br label %25

25:                                               ; preds = %60, %16
  %.07 = phi i32 [ 1, %16 ], [ %61, %60 ]
  %.03 = phi i32 [ 1, %16 ], [ %62, %60 ]
  %26 = icmp sle i32 %.03, %23
  br i1 %26, label %27, label %.preheader5

27:                                               ; preds = %25
  %28 = icmp slt i32 %.03, %.07
  br i1 %28, label %.preheader3, label %.loopexit4

.preheader3:                                      ; preds = %27, %51
  %.02 = phi i32 [ %52, %51 ], [ %.03, %27 ]
  %29 = add nsw i32 %.03, %22
  %30 = sub nsw i32 %29, 2
  %31 = icmp sle i32 %.02, %30
  br i1 %31, label %.preheader2, label %.loopexit4

.preheader2:                                      ; preds = %.preheader3, %33
  %.05 = phi i32 [ %50, %33 ], [ %.02, %.preheader3 ]
  %32 = icmp sle i32 %.05, %24
  br i1 %32, label %33, label %51

33:                                               ; preds = %.preheader2
  %34 = add nsw i32 %.07, %.05
  %35 = sub nsw i32 %34, %.03
  %36 = sext i32 %.05 to i64
  %37 = getelementptr inbounds double, ptr %0, i64 %36
  %38 = load double, ptr %37, align 8
  %39 = sext i32 %35 to i64
  %40 = getelementptr inbounds double, ptr %0, i64 %39
  %41 = load double, ptr %40, align 8
  store double %41, ptr %37, align 8
  store double %38, ptr %40, align 8
  %42 = add nsw i32 %.05, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, ptr %0, i64 %43
  %45 = load double, ptr %44, align 8
  %46 = add nsw i32 %35, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, ptr %0, i64 %47
  %49 = load double, ptr %48, align 8
  store double %49, ptr %44, align 8
  store double %45, ptr %48, align 8
  %50 = add nsw i32 %.05, %23
  br label %.preheader2, !llvm.loop !14

51:                                               ; preds = %.preheader2
  %52 = add nsw i32 %.02, 2
  br label %.preheader3, !llvm.loop !15

.loopexit4:                                       ; preds = %.preheader3, %27
  %53 = ashr i32 %23, 1
  br label %54

54:                                               ; preds = %57, %.loopexit4
  %.013 = phi i32 [ %53, %.loopexit4 ], [ %59, %57 ]
  %.18 = phi i32 [ %.07, %.loopexit4 ], [ %58, %57 ]
  %55 = icmp sge i32 %.013, %22
  %56 = icmp sgt i32 %.18, %.013
  %spec.select = select i1 %55, i1 %56, i1 false
  br i1 %spec.select, label %57, label %60

57:                                               ; preds = %54
  %58 = sub nsw i32 %.18, %.013
  %59 = ashr i32 %.013, 1
  br label %54, !llvm.loop !16

60:                                               ; preds = %54
  %61 = add nsw i32 %.18, %.013
  %62 = add nsw i32 %.03, %22
  br label %25, !llvm.loop !17

.preheader5:                                      ; preds = %74, %25
  %.014 = phi i32 [ %22, %25 ], [ %65, %74 ]
  %63 = icmp slt i32 %.014, %23
  br i1 %63, label %64, label %120

64:                                               ; preds = %.preheader5
  %65 = shl i32 %.014, 1
  %66 = sdiv i32 %65, %22
  %67 = sitofp i32 %66 to double
  %68 = fdiv double %6, %67
  %69 = fmul double 5.000000e-01, %68
  %70 = call double @sin(double noundef %69) #9
  %71 = fmul double -2.000000e+00, %70
  %72 = fmul double %71, %70
  %73 = call double @sin(double noundef %68) #9
  br label %74

74:                                               ; preds = %112, %64
  %.16 = phi i32 [ 1, %64 ], [ %76, %112 ]
  %.01 = phi double [ 0.000000e+00, %64 ], [ %119, %112 ]
  %.0 = phi double [ 1.000000e+00, %64 ], [ %116, %112 ]
  %75 = icmp sle i32 %.16, %.014
  br i1 %75, label %.preheader1, label %.preheader5, !llvm.loop !18

.preheader1:                                      ; preds = %74, %110
  %.1 = phi i32 [ %111, %110 ], [ %.16, %74 ]
  %76 = add nsw i32 %.16, %22
  %77 = sub nsw i32 %76, 2
  %78 = icmp sle i32 %.1, %77
  br i1 %78, label %.preheader, label %112

.preheader:                                       ; preds = %.preheader1, %80
  %.14 = phi i32 [ %109, %80 ], [ %.1, %.preheader1 ]
  %79 = icmp sle i32 %.14, %24
  br i1 %79, label %80, label %110

80:                                               ; preds = %.preheader
  %81 = add nsw i32 %.14, %.014
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, ptr %0, i64 %82
  %84 = load double, ptr %83, align 8
  %85 = add nsw i32 %81, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, ptr %0, i64 %86
  %88 = load double, ptr %87, align 8
  %89 = fmul double %.01, %88
  %90 = fneg double %89
  %91 = call double @llvm.fmuladd.f64(double %.0, double %84, double %90)
  %92 = load double, ptr %87, align 8
  %93 = load double, ptr %83, align 8
  %94 = fmul double %.01, %93
  %95 = call double @llvm.fmuladd.f64(double %.0, double %92, double %94)
  %96 = sext i32 %.14 to i64
  %97 = getelementptr inbounds double, ptr %0, i64 %96
  %98 = load double, ptr %97, align 8
  %99 = fsub double %98, %91
  store double %99, ptr %83, align 8
  %100 = add nsw i32 %.14, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds double, ptr %0, i64 %101
  %103 = load double, ptr %102, align 8
  %104 = fsub double %103, %95
  store double %104, ptr %87, align 8
  %105 = load double, ptr %97, align 8
  %106 = fadd double %105, %91
  store double %106, ptr %97, align 8
  %107 = load double, ptr %102, align 8
  %108 = fadd double %107, %95
  store double %108, ptr %102, align 8
  %109 = add nsw i32 %.14, %65
  br label %.preheader, !llvm.loop !19

110:                                              ; preds = %.preheader
  %111 = add nsw i32 %.1, 2
  br label %.preheader1, !llvm.loop !20

112:                                              ; preds = %.preheader1
  %113 = fmul double %.01, %73
  %114 = fneg double %113
  %115 = call double @llvm.fmuladd.f64(double %.0, double %72, double %114)
  %116 = fadd double %115, %.0
  %117 = fmul double %.0, %73
  %118 = call double @llvm.fmuladd.f64(double %.01, double %72, double %117)
  %119 = fadd double %118, %.01
  br label %74, !llvm.loop !21

120:                                              ; preds = %.preheader5
  %121 = add nsw i32 %.112, -1
  br label %.preheader6, !llvm.loop !22

122:                                              ; preds = %.preheader6
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
