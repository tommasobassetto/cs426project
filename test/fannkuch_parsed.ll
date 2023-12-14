; ModuleID = 'test/fannkuch.ll'
source_filename = "mp5_testcases/fannkuch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 11, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = load i32, ptr %6, align 4
  %9 = call i64 @fannkuch(i32 noundef %8)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %7, i64 noundef %9)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i64 @fannkuch(i32 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %17 = load i32, ptr %3, align 4
  %18 = sub nsw i32 %17, 1
  store i32 %18, ptr %13, align 4
  %19 = load i32, ptr %3, align 4
  %20 = icmp slt i32 %19, 1
  br i1 %20, label %21, label %22

21:                                               ; preds = %1
  store i64 0, ptr %2, align 8
  br label %221

22:                                               ; preds = %1
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = call noalias ptr @calloc(i64 noundef %24, i64 noundef 4) #3
  store ptr %25, ptr %4, align 8
  %26 = load i32, ptr %3, align 4
  %27 = sext i32 %26 to i64
  %28 = call noalias ptr @calloc(i64 noundef %27, i64 noundef 4) #3
  store ptr %28, ptr %5, align 8
  %29 = load i32, ptr %3, align 4
  %30 = sext i32 %29 to i64
  %31 = call noalias ptr @calloc(i64 noundef %30, i64 noundef 4) #3
  store ptr %31, ptr %6, align 8
  store i32 0, ptr %10, align 4
  br label %32

32:                                               ; preds = %42, %22
  %33 = load i32, ptr %10, align 4
  %34 = load i32, ptr %3, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %45

36:                                               ; preds = %32
  %37 = load i32, ptr %10, align 4
  %38 = load ptr, ptr %5, align 8
  %39 = load i32, ptr %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %38, i64 %40
  store i32 %37, ptr %41, align 4
  br label %42

42:                                               ; preds = %36
  %43 = load i32, ptr %10, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %10, align 4
  br label %32, !llvm.loop !6

45:                                               ; preds = %32
  %46 = load i32, ptr %3, align 4
  store i32 %46, ptr %9, align 4
  store i32 0, ptr %12, align 4
  store i64 0, ptr %8, align 8
  br label %47

47:                                               ; preds = %220, %45
  %48 = load i32, ptr %12, align 4
  %49 = icmp slt i32 %48, 30
  br i1 %49, label %50, label %70

50:                                               ; preds = %47
  store i32 0, ptr %10, align 4
  br label %51

51:                                               ; preds = %63, %50
  %52 = load i32, ptr %10, align 4
  %53 = load i32, ptr %3, align 4
  %54 = icmp slt i32 %52, %53
  br i1 %54, label %55, label %66

55:                                               ; preds = %51
  %56 = load ptr, ptr %5, align 8
  %57 = load i32, ptr %10, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %56, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = add nsw i32 1, %60
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %61)
  br label %63

63:                                               ; preds = %55
  %64 = load i32, ptr %10, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %10, align 4
  br label %51, !llvm.loop !8

66:                                               ; preds = %51
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %68 = load i32, ptr %12, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %12, align 4
  br label %70

70:                                               ; preds = %66, %47
  br label %71

71:                                               ; preds = %81, %70
  %72 = load i32, ptr %9, align 4
  %73 = icmp ne i32 %72, 1
  br i1 %73, label %74, label %84

74:                                               ; preds = %71
  %75 = load i32, ptr %9, align 4
  %76 = load ptr, ptr %6, align 8
  %77 = load i32, ptr %9, align 4
  %78 = sub nsw i32 %77, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, ptr %76, i64 %79
  store i32 %75, ptr %80, align 4
  br label %81

81:                                               ; preds = %74
  %82 = load i32, ptr %9, align 4
  %83 = add nsw i32 %82, -1
  store i32 %83, ptr %9, align 4
  br label %71, !llvm.loop !9

84:                                               ; preds = %71
  %85 = load ptr, ptr %5, align 8
  %86 = getelementptr inbounds i32, ptr %85, i64 0
  %87 = load i32, ptr %86, align 4
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %175, label %89

89:                                               ; preds = %84
  %90 = load ptr, ptr %5, align 8
  %91 = load i32, ptr %13, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, ptr %90, i64 %92
  %94 = load i32, ptr %93, align 4
  %95 = load i32, ptr %13, align 4
  %96 = icmp eq i32 %94, %95
  br i1 %96, label %175, label %97

97:                                               ; preds = %89
  store i64 0, ptr %7, align 8
  store i32 1, ptr %10, align 4
  br label %98

98:                                               ; preds = %112, %97
  %99 = load i32, ptr %10, align 4
  %100 = load i32, ptr %3, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %115

102:                                              ; preds = %98
  %103 = load ptr, ptr %5, align 8
  %104 = load i32, ptr %10, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, ptr %103, i64 %105
  %107 = load i32, ptr %106, align 4
  %108 = load ptr, ptr %4, align 8
  %109 = load i32, ptr %10, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, ptr %108, i64 %110
  store i32 %107, ptr %111, align 4
  br label %112

112:                                              ; preds = %102
  %113 = load i32, ptr %10, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %10, align 4
  br label %98, !llvm.loop !10

115:                                              ; preds = %98
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds i32, ptr %116, i64 0
  %118 = load i32, ptr %117, align 4
  store i32 %118, ptr %11, align 4
  br label %119

119:                                              ; preds = %165, %115
  store i32 1, ptr %10, align 4
  %120 = load i32, ptr %11, align 4
  %121 = sub nsw i32 %120, 1
  store i32 %121, ptr %14, align 4
  br label %122

122:                                              ; preds = %146, %119
  %123 = load i32, ptr %10, align 4
  %124 = load i32, ptr %14, align 4
  %125 = icmp slt i32 %123, %124
  br i1 %125, label %126, label %151

126:                                              ; preds = %122
  %127 = load ptr, ptr %4, align 8
  %128 = load i32, ptr %10, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, ptr %127, i64 %129
  %131 = load i32, ptr %130, align 4
  store i32 %131, ptr %15, align 4
  %132 = load ptr, ptr %4, align 8
  %133 = load i32, ptr %14, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, ptr %132, i64 %134
  %136 = load i32, ptr %135, align 4
  %137 = load ptr, ptr %4, align 8
  %138 = load i32, ptr %10, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, ptr %137, i64 %139
  store i32 %136, ptr %140, align 4
  %141 = load i32, ptr %15, align 4
  %142 = load ptr, ptr %4, align 8
  %143 = load i32, ptr %14, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, ptr %142, i64 %144
  store i32 %141, ptr %145, align 4
  br label %146

146:                                              ; preds = %126
  %147 = load i32, ptr %10, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, ptr %10, align 4
  %149 = load i32, ptr %14, align 4
  %150 = add nsw i32 %149, -1
  store i32 %150, ptr %14, align 4
  br label %122, !llvm.loop !11

151:                                              ; preds = %122
  %152 = load i64, ptr %7, align 8
  %153 = add nsw i64 %152, 1
  store i64 %153, ptr %7, align 8
  %154 = load ptr, ptr %4, align 8
  %155 = load i32, ptr %11, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, ptr %154, i64 %156
  %158 = load i32, ptr %157, align 4
  store i32 %158, ptr %14, align 4
  %159 = load i32, ptr %11, align 4
  %160 = load ptr, ptr %4, align 8
  %161 = load i32, ptr %11, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, ptr %160, i64 %162
  store i32 %159, ptr %163, align 4
  %164 = load i32, ptr %14, align 4
  store i32 %164, ptr %11, align 4
  br label %165

165:                                              ; preds = %151
  %166 = load i32, ptr %11, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %119, label %168, !llvm.loop !12

168:                                              ; preds = %165
  %169 = load i64, ptr %8, align 8
  %170 = load i64, ptr %7, align 8
  %171 = icmp slt i64 %169, %170
  br i1 %171, label %172, label %174

172:                                              ; preds = %168
  %173 = load i64, ptr %7, align 8
  store i64 %173, ptr %8, align 8
  br label %174

174:                                              ; preds = %172, %168
  br label %175

175:                                              ; preds = %174, %89, %84
  br label %176

176:                                              ; preds = %217, %175
  %177 = load i32, ptr %9, align 4
  %178 = load i32, ptr %3, align 4
  %179 = icmp eq i32 %177, %178
  br i1 %179, label %180, label %182

180:                                              ; preds = %176
  %181 = load i64, ptr %8, align 8
  store i64 %181, ptr %2, align 8
  br label %221

182:                                              ; preds = %176
  %183 = load ptr, ptr %5, align 8
  %184 = getelementptr inbounds i32, ptr %183, i64 0
  %185 = load i32, ptr %184, align 4
  store i32 %185, ptr %16, align 4
  store i32 0, ptr %10, align 4
  br label %186

186:                                              ; preds = %190, %182
  %187 = load i32, ptr %10, align 4
  %188 = load i32, ptr %9, align 4
  %189 = icmp slt i32 %187, %188
  br i1 %189, label %190, label %203

190:                                              ; preds = %186
  %191 = load i32, ptr %10, align 4
  %192 = add nsw i32 %191, 1
  store i32 %192, ptr %11, align 4
  %193 = load ptr, ptr %5, align 8
  %194 = load i32, ptr %11, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i32, ptr %193, i64 %195
  %197 = load i32, ptr %196, align 4
  %198 = load ptr, ptr %5, align 8
  %199 = load i32, ptr %10, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, ptr %198, i64 %200
  store i32 %197, ptr %201, align 4
  %202 = load i32, ptr %11, align 4
  store i32 %202, ptr %10, align 4
  br label %186, !llvm.loop !13

203:                                              ; preds = %186
  %204 = load i32, ptr %16, align 4
  %205 = load ptr, ptr %5, align 8
  %206 = load i32, ptr %9, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i32, ptr %205, i64 %207
  store i32 %204, ptr %208, align 4
  %209 = load ptr, ptr %6, align 8
  %210 = load i32, ptr %9, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i32, ptr %209, i64 %211
  %213 = load i32, ptr %212, align 4
  %214 = sub nsw i32 %213, 1
  store i32 %214, ptr %212, align 4
  %215 = icmp sgt i32 %214, 0
  br i1 %215, label %216, label %217

216:                                              ; preds = %203
  br label %220

217:                                              ; preds = %203
  %218 = load i32, ptr %9, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, ptr %9, align 4
  br label %176

220:                                              ; preds = %216
  br label %47

221:                                              ; preds = %180, %21
  %222 = load i64, ptr %2, align 8
  ret i64 %222
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
