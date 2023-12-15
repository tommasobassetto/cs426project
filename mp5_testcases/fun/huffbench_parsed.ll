; ModuleID = 'mp5_testcases/fun/huffbench_c.ll'
source_filename = "mp5_testcases/fun/huffbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [33 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ012345\00", align 1
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [26 x i8] c"error: bit code overflow\0A\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"error: file has only one value!\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"error: no compression\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global ptr, align 8
@.str.5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal global i64 1325, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @generate_test_data(i64 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef %0) #7
  br label %3

3:                                                ; preds = %6, %1
  %.01 = phi ptr [ %2, %1 ], [ %10, %6 ]
  %.0 = phi i32 [ 0, %1 ], [ %11, %6 ]
  %4 = sext i32 %.0 to i64
  %5 = icmp ult i64 %4, %0
  br i1 %5, label %6, label %12

6:                                                ; preds = %3
  %7 = call i64 @random4()
  %8 = getelementptr inbounds i8, ptr @.str, i64 %7
  %9 = load i8, ptr %8, align 1
  store i8 %9, ptr %.01, align 1
  %10 = getelementptr inbounds i8, ptr %.01, i32 1
  %11 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

12:                                               ; preds = %3
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @compdecomp(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca [512 x i64], align 16
  %4 = alloca [256 x i64], align 16
  %5 = alloca [512 x i32], align 16
  %6 = alloca [256 x i64], align 16
  %7 = alloca [256 x i8], align 16
  %8 = alloca [256 x i64], align 16
  %9 = alloca [256 x i8], align 16
  %10 = add i64 %1, 1
  %11 = call noalias ptr @malloc(i64 noundef %10) #7
  %12 = add i64 %1, 1
  %13 = mul i64 1, %12
  call void @llvm.memset.p0.i64(ptr align 1 %11, i8 0, i64 %13, i1 false)
  %14 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 4096, i1 false)
  %15 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %15, i8 0, i64 2048, i1 false)
  %16 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %16, i8 0, i64 2048, i1 false)
  %17 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %17, i8 0, i64 2048, i1 false)
  %18 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %18, i8 0, i64 256, i1 false)
  br label %19

19:                                               ; preds = %21, %2
  %.033 = phi ptr [ %0, %2 ], [ %27, %21 ]
  %.02 = phi i64 [ 0, %2 ], [ %28, %21 ]
  %20 = icmp ult i64 %.02, %1
  br i1 %20, label %21, label %29

21:                                               ; preds = %19
  %22 = load i8, ptr %.033, align 1
  %23 = zext i8 %22 to i64
  %24 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %23
  %25 = load i64, ptr %24, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr %24, align 8
  %27 = getelementptr inbounds i8, ptr %.033, i32 1
  %28 = add i64 %.02, 1
  br label %19, !llvm.loop !8

29:                                               ; preds = %19, %38
  %.010 = phi i64 [ %.111, %38 ], [ 0, %19 ]
  %.13 = phi i64 [ %39, %38 ], [ 0, %19 ]
  %30 = icmp ult i64 %.13, 256
  br i1 %30, label %31, label %40

31:                                               ; preds = %29
  %32 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %.13
  %33 = load i64, ptr %32, align 8
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %38

35:                                               ; preds = %31
  %36 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 %.010
  store i64 %.13, ptr %36, align 8
  %37 = add i64 %.010, 1
  br label %38

38:                                               ; preds = %31, %35
  %.111 = phi i64 [ %37, %35 ], [ %.010, %31 ]
  %39 = add i64 %.13, 1
  br label %29, !llvm.loop !9

40:                                               ; preds = %29, %42
  %.24 = phi i64 [ %47, %42 ], [ %.010, %29 ]
  %41 = icmp ugt i64 %.24, 0
  br i1 %41, label %42, label %48

42:                                               ; preds = %40
  %43 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  %44 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %45 = trunc i64 %.010 to i32
  %46 = trunc i64 %.24 to i32
  call void @heap_adjust(ptr noundef %43, ptr noundef %44, i32 noundef %45, i32 noundef %46)
  %47 = add i64 %.24, -1
  br label %40, !llvm.loop !10

48:                                               ; preds = %40, %50
  %.212 = phi i64 [ %51, %50 ], [ %.010, %40 ]
  %49 = icmp ugt i64 %.212, 1
  br i1 %49, label %50, label %82

50:                                               ; preds = %48
  %51 = add i64 %.212, -1
  %52 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %53 = load i64, ptr %52, align 16
  %54 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 %51
  %55 = load i64, ptr %54, align 8
  %56 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  store i64 %55, ptr %56, align 16
  %57 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  %58 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %59 = trunc i64 %51 to i32
  call void @heap_adjust(ptr noundef %57, ptr noundef %58, i32 noundef %59, i32 noundef 1)
  %60 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %61 = load i64, ptr %60, align 16
  %62 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %61
  %63 = load i64, ptr %62, align 8
  %64 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %53
  %65 = load i64, ptr %64, align 8
  %66 = add i64 %63, %65
  %67 = add i64 256, %51
  %68 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %67
  store i64 %66, ptr %68, align 8
  %69 = add i64 256, %51
  %70 = trunc i64 %69 to i32
  %71 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %53
  store i32 %70, ptr %71, align 4
  %72 = sub i64 -256, %51
  %73 = trunc i64 %72 to i32
  %74 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %75 = load i64, ptr %74, align 16
  %76 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %75
  store i32 %73, ptr %76, align 4
  %77 = add i64 256, %51
  %78 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  store i64 %77, ptr %78, align 16
  %79 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  %80 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %81 = trunc i64 %51 to i32
  call void @heap_adjust(ptr noundef %79, ptr noundef %80, i32 noundef %81, i32 noundef 1)
  br label %48, !llvm.loop !11

82:                                               ; preds = %48
  %83 = add i64 256, %.212
  %84 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %83
  store i32 0, ptr %84, align 4
  br label %85

85:                                               ; preds = %114, %82
  %.045 = phi i64 [ 0, %82 ], [ %.247, %114 ]
  %.042 = phi i64 [ 0, %82 ], [ %115, %114 ]
  %.039 = phi i64 [ 0, %82 ], [ %.241, %114 ]
  %86 = icmp ult i64 %.042, 256
  br i1 %86, label %87, label %116

87:                                               ; preds = %85
  %88 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %.042
  %89 = load i64, ptr %88, align 8
  %90 = icmp ne i64 %89, 0
  br i1 %90, label %94, label %91

91:                                               ; preds = %87
  %92 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.042
  store i64 0, ptr %92, align 8
  %93 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.042
  store i8 0, ptr %93, align 1
  br label %114

94:                                               ; preds = %87
  %95 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %.042
  %96 = load i32, ptr %95, align 4
  br label %97

97:                                               ; preds = %99, %94
  %.043 = phi i64 [ 0, %94 ], [ %.144, %99 ]
  %.037 = phi i32 [ %96, %94 ], [ %105, %99 ]
  %.05 = phi i64 [ 1, %94 ], [ %106, %99 ]
  %.3 = phi i64 [ 0, %94 ], [ %107, %99 ]
  %98 = icmp ne i32 %.037, 0
  br i1 %98, label %99, label %108

99:                                               ; preds = %97
  %100 = icmp slt i32 %.037, 0
  %101 = add i64 %.043, %.05
  %102 = sub nsw i32 0, %.037
  %.144 = select i1 %100, i64 %101, i64 %.043
  %.138 = select i1 %100, i32 %102, i32 %.037
  %103 = sext i32 %.138 to i64
  %104 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %103
  %105 = load i32, ptr %104, align 4
  %106 = shl i64 %.05, 1
  %107 = add i64 %.3, 1
  br label %97, !llvm.loop !12

108:                                              ; preds = %97
  %109 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.042
  store i64 %.043, ptr %109, align 8
  %110 = trunc i64 %.3 to i8
  %111 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.042
  store i8 %110, ptr %111, align 1
  %112 = icmp ugt i64 %.043, %.045
  %spec.select = select i1 %112, i64 %.043, i64 %.045
  %113 = icmp ugt i64 %.3, %.039
  %.140 = select i1 %113, i64 %.3, i64 %.039
  br label %114

114:                                              ; preds = %91, %108
  %.247 = phi i64 [ %spec.select, %108 ], [ %.045, %91 ]
  %.241 = phi i64 [ %.140, %108 ], [ %.039, %91 ]
  %115 = add i64 %.042, 1
  br label %85, !llvm.loop !13

116:                                              ; preds = %85
  %117 = icmp ugt i64 %.039, 64
  br i1 %117, label %118, label %121

118:                                              ; preds = %116
  %119 = load ptr, ptr @stderr, align 8
  %120 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %119, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

121:                                              ; preds = %116
  %122 = icmp eq i64 %.045, 0
  br i1 %122, label %123, label %126

123:                                              ; preds = %121
  %124 = load ptr, ptr @stderr, align 8
  %125 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %124, ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

126:                                              ; preds = %121, %170
  %.134 = phi ptr [ %171, %170 ], [ %0, %121 ]
  %.028 = phi i64 [ %.129, %170 ], [ 0, %121 ]
  %.024 = phi i8 [ %.125, %170 ], [ 0, %121 ]
  %.16 = phi i64 [ %172, %170 ], [ 0, %121 ]
  %.01 = phi i32 [ %.1, %170 ], [ -1, %121 ]
  %127 = icmp ult i64 %.16, %1
  br i1 %127, label %128, label %173

128:                                              ; preds = %126
  %129 = load i8, ptr %.134, align 1
  %130 = zext i8 %129 to i64
  %131 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %130
  %132 = load i8, ptr %131, align 1
  %133 = zext i8 %132 to i32
  %134 = sub nsw i32 %133, 1
  %135 = shl i32 1, %134
  %136 = sext i32 %135 to i64
  br label %137

137:                                              ; preds = %158, %128
  %.129 = phi i64 [ %.028, %128 ], [ %.230, %158 ]
  %.125 = phi i8 [ %.024, %128 ], [ %.327, %158 ]
  %.015 = phi i64 [ %136, %128 ], [ %168, %158 ]
  %.4 = phi i64 [ 0, %128 ], [ %169, %158 ]
  %.1 = phi i32 [ %.01, %128 ], [ %.2, %158 ]
  %138 = load i8, ptr %.134, align 1
  %139 = zext i8 %138 to i64
  %140 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %139
  %141 = load i8, ptr %140, align 1
  %142 = zext i8 %141 to i64
  %143 = icmp ult i64 %.4, %142
  br i1 %143, label %144, label %170

144:                                              ; preds = %137
  %145 = icmp eq i32 %.1, 7
  br i1 %145, label %146, label %153

146:                                              ; preds = %144
  %147 = getelementptr inbounds i8, ptr %11, i64 %.129
  store i8 %.125, ptr %147, align 1
  %148 = add i64 %.129, 1
  %149 = icmp eq i64 %148, %1
  br i1 %149, label %150, label %158

150:                                              ; preds = %146
  %151 = load ptr, ptr @stderr, align 8
  %152 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %151, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

153:                                              ; preds = %144
  %154 = add nsw i32 %.1, 1
  %155 = sext i8 %.125 to i32
  %156 = shl i32 %155, 1
  %157 = trunc i32 %156 to i8
  br label %158

158:                                              ; preds = %146, %153
  %.230 = phi i64 [ %.129, %153 ], [ %148, %146 ]
  %.226 = phi i8 [ %157, %153 ], [ 0, %146 ]
  %.2 = phi i32 [ %154, %153 ], [ 0, %146 ]
  %159 = load i8, ptr %.134, align 1
  %160 = zext i8 %159 to i64
  %161 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %160
  %162 = load i64, ptr %161, align 8
  %163 = and i64 %162, %.015
  %164 = icmp ne i64 %163, 0
  %165 = sext i8 %.226 to i32
  %166 = or i32 %165, 1
  %167 = trunc i32 %166 to i8
  %.327 = select i1 %164, i8 %167, i8 %.226
  %168 = lshr i64 %.015, 1
  %169 = add i64 %.4, 1
  br label %137, !llvm.loop !14

170:                                              ; preds = %137
  %171 = getelementptr inbounds i8, ptr %.134, i32 1
  %172 = add i64 %.16, 1
  br label %126, !llvm.loop !15

173:                                              ; preds = %126
  %174 = sub nsw i32 7, %.01
  %175 = sext i8 %.024 to i32
  %176 = shl i32 %175, %174
  %177 = trunc i32 %176 to i8
  %178 = getelementptr inbounds i8, ptr %11, i64 %.028
  store i8 %177, ptr %178, align 1
  %179 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %179, i8 0, i64 2048, i1 false)
  %180 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 0
  br label %181

181:                                              ; preds = %217, %173
  %.27 = phi i64 [ 0, %173 ], [ %218, %217 ]
  %.0 = phi ptr [ %180, %173 ], [ %185, %217 ]
  %182 = icmp ult i64 %.27, 256
  br i1 %182, label %183, label %219

183:                                              ; preds = %181
  %184 = trunc i64 %.27 to i8
  store i8 %184, ptr %.0, align 1
  %185 = getelementptr inbounds i8, ptr %.0, i32 1
  %186 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.27
  %187 = load i64, ptr %186, align 8
  %188 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.27
  %189 = load i8, ptr %188, align 1
  %190 = zext i8 %189 to i64
  %191 = or i64 %187, %190
  %192 = icmp ne i64 %191, 0
  br i1 %192, label %193, label %217

193:                                              ; preds = %183
  %194 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.27
  %195 = load i8, ptr %194, align 1
  %196 = zext i8 %195 to i32
  %197 = sub nsw i32 %196, 1
  %198 = shl i32 1, %197
  %199 = sext i32 %198 to i64
  br label %200

200:                                              ; preds = %205, %193
  %.019 = phi i64 [ 0, %193 ], [ %spec.select1, %205 ]
  %.116 = phi i64 [ %199, %193 ], [ %213, %205 ]
  %.5 = phi i64 [ 0, %193 ], [ %214, %205 ]
  %201 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.27
  %202 = load i8, ptr %201, align 1
  %203 = zext i8 %202 to i64
  %204 = icmp ult i64 %.5, %203
  br i1 %204, label %205, label %215

205:                                              ; preds = %200
  %206 = mul i64 %.019, 2
  %207 = add i64 %206, 1
  %208 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.27
  %209 = load i64, ptr %208, align 8
  %210 = and i64 %209, %.116
  %211 = icmp ne i64 %210, 0
  %212 = add i64 %207, 1
  %spec.select1 = select i1 %211, i64 %212, i64 %207
  %213 = lshr i64 %.116, 1
  %214 = add i64 %.5, 1
  br label %200, !llvm.loop !16

215:                                              ; preds = %200
  %216 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.27
  store i64 %.019, ptr %216, align 8
  br label %217

217:                                              ; preds = %183, %215
  %218 = add i64 %.27, 1
  br label %181, !llvm.loop !17

219:                                              ; preds = %181, %.critedge
  %.6 = phi i64 [ %245, %.critedge ], [ 1, %181 ]
  %220 = icmp ult i64 %.6, 256
  br i1 %220, label %221, label %246

221:                                              ; preds = %219
  %222 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.6
  %223 = load i64, ptr %222, align 8
  %224 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.6
  %225 = load i8, ptr %224, align 1
  br label %226

226:                                              ; preds = %233, %221
  %.38 = phi i64 [ %.6, %221 ], [ %242, %233 ]
  %227 = icmp ne i64 %.38, 0
  br i1 %227, label %228, label %.critedge

228:                                              ; preds = %226
  %229 = sub i64 %.38, 1
  %230 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %229
  %231 = load i64, ptr %230, align 8
  %232 = icmp ugt i64 %231, %223
  br i1 %232, label %233, label %.critedge

233:                                              ; preds = %228
  %234 = sub i64 %.38, 1
  %235 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %234
  %236 = load i64, ptr %235, align 8
  %237 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.38
  store i64 %236, ptr %237, align 8
  %238 = sub i64 %.38, 1
  %239 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %238
  %240 = load i8, ptr %239, align 1
  %241 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.38
  store i8 %240, ptr %241, align 1
  %242 = add i64 %.38, -1
  br label %226, !llvm.loop !18

.critedge:                                        ; preds = %226, %228
  %243 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.38
  store i64 %223, ptr %243, align 8
  %244 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.38
  store i8 %225, ptr %244, align 1
  %245 = add i64 %.6, 1
  br label %219, !llvm.loop !19

246:                                              ; preds = %219, %250
  %.49 = phi i64 [ %251, %250 ], [ 0, %219 ]
  %247 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.49
  %248 = load i64, ptr %247, align 8
  %249 = icmp eq i64 %248, 0
  br i1 %249, label %250, label %252

250:                                              ; preds = %246
  %251 = add i64 %.49, 1
  br label %246, !llvm.loop !20

252:                                              ; preds = %246, %277
  %.235 = phi ptr [ %.336, %277 ], [ %0, %246 ]
  %.031 = phi ptr [ %.132, %277 ], [ %11, %246 ]
  %.221 = phi i64 [ %.423, %277 ], [ 0, %246 ]
  %.217 = phi i64 [ %.318, %277 ], [ 128, %246 ]
  %.313 = phi i64 [ %.414, %277 ], [ 0, %246 ]
  %.7 = phi i64 [ %.9, %277 ], [ %.49, %246 ]
  %253 = icmp ult i64 %.313, %1
  br i1 %253, label %254, label %281

254:                                              ; preds = %252
  %255 = mul i64 %.221, 2
  %256 = add i64 %255, 1
  %257 = load i8, ptr %.031, align 1
  %258 = zext i8 %257 to i64
  %259 = and i64 %258, %.217
  %260 = icmp ne i64 %259, 0
  %261 = add i64 %256, 1
  %spec.select2 = select i1 %260, i64 %261, i64 %256
  br label %262

262:                                              ; preds = %266, %254
  %.8 = phi i64 [ %.7, %254 ], [ %267, %266 ]
  %263 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.8
  %264 = load i64, ptr %263, align 8
  %265 = icmp ult i64 %264, %spec.select2
  br i1 %265, label %266, label %268

266:                                              ; preds = %262
  %267 = add i64 %.8, 1
  br label %262, !llvm.loop !21

268:                                              ; preds = %262
  %269 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.8
  %270 = load i64, ptr %269, align 8
  %271 = icmp eq i64 %spec.select2, %270
  br i1 %271, label %272, label %277

272:                                              ; preds = %268
  %273 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.8
  %274 = load i8, ptr %273, align 1
  store i8 %274, ptr %.235, align 1
  %275 = getelementptr inbounds i8, ptr %.235, i32 1
  %276 = add i64 %.313, 1
  br label %277

277:                                              ; preds = %272, %268
  %.336 = phi ptr [ %275, %272 ], [ %.235, %268 ]
  %.423 = phi i64 [ 0, %272 ], [ %spec.select2, %268 ]
  %.414 = phi i64 [ %276, %272 ], [ %.313, %268 ]
  %.9 = phi i64 [ %.49, %272 ], [ %.8, %268 ]
  %278 = icmp ugt i64 %.217, 1
  %279 = lshr i64 %.217, 1
  %280 = getelementptr inbounds i8, ptr %.031, i32 1
  %.132 = select i1 %278, ptr %.031, ptr %280
  %.318 = select i1 %278, i64 %279, i64 128
  br label %252, !llvm.loop !22

281:                                              ; preds = %252
  call void @free(ptr noundef %11) #9
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal void @heap_adjust(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = getelementptr inbounds i64, ptr %1, i32 -1
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds i64, ptr %5, i64 %6
  %8 = load i64, ptr %7, align 8
  %9 = trunc i64 %8 to i32
  br label %10

10:                                               ; preds = %40, %4
  %.01 = phi i32 [ %3, %4 ], [ %.0, %40 ]
  %11 = sdiv i32 %2, 2
  %12 = icmp sle i32 %.01, %11
  br i1 %12, label %13, label %.loopexit

13:                                               ; preds = %10
  %14 = add nsw i32 %.01, %.01
  %15 = icmp slt i32 %14, %2
  br i1 %15, label %16, label %30

16:                                               ; preds = %13
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i64, ptr %5, i64 %17
  %19 = load i64, ptr %18, align 8
  %20 = getelementptr inbounds i64, ptr %0, i64 %19
  %21 = load i64, ptr %20, align 8
  %22 = add nsw i32 %14, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i64, ptr %5, i64 %23
  %25 = load i64, ptr %24, align 8
  %26 = getelementptr inbounds i64, ptr %0, i64 %25
  %27 = load i64, ptr %26, align 8
  %28 = icmp ugt i64 %21, %27
  %29 = add nsw i32 %14, 1
  %spec.select = select i1 %28, i32 %29, i32 %14
  br label %30

30:                                               ; preds = %16, %13
  %.0 = phi i32 [ %14, %13 ], [ %spec.select, %16 ]
  %31 = sext i32 %9 to i64
  %32 = getelementptr inbounds i64, ptr %0, i64 %31
  %33 = load i64, ptr %32, align 8
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds i64, ptr %5, i64 %34
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr inbounds i64, ptr %0, i64 %36
  %38 = load i64, ptr %37, align 8
  %39 = icmp ult i64 %33, %38
  br i1 %39, label %.loopexit, label %40

40:                                               ; preds = %30
  %41 = sext i32 %.0 to i64
  %42 = getelementptr inbounds i64, ptr %5, i64 %41
  %43 = load i64, ptr %42, align 8
  %44 = sext i32 %.01 to i64
  %45 = getelementptr inbounds i64, ptr %5, i64 %44
  store i64 %43, ptr %45, align 8
  br label %10, !llvm.loop !23

.loopexit:                                        ; preds = %10, %30
  %46 = sext i32 %9 to i64
  %47 = sext i32 %.01 to i64
  %48 = getelementptr inbounds i64, ptr %5, i64 %47
  store i64 %46, ptr %48, align 8
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp sgt i32 %0, 1
  br i1 %3, label %4, label %.loopexit

4:                                                ; preds = %2, %11
  %.01 = phi i32 [ %12, %11 ], [ 1, %2 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %.loopexit

6:                                                ; preds = %4
  %7 = getelementptr inbounds ptr, ptr %1, i64 1
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 @strcmp(ptr noundef %8, ptr noundef @.str.4) #10
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %.loopexit

11:                                               ; preds = %6
  %12 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !24

.loopexit:                                        ; preds = %6, %4, %2
  %.1 = phi i8 [ 0, %2 ], [ 1, %6 ], [ 0, %4 ]
  %13 = call ptr @generate_test_data(i64 noundef 10000000)
  br label %14

14:                                               ; preds = %16, %.loopexit
  %.12 = phi i32 [ 0, %.loopexit ], [ %17, %16 ]
  %15 = icmp slt i32 %.12, 30
  br i1 %15, label %16, label %18

16:                                               ; preds = %14
  call void @compdecomp(ptr noundef %13, i64 noundef 10000000)
  %17 = add nsw i32 %.12, 1
  br label %14, !llvm.loop !25

18:                                               ; preds = %14
  call void @free(ptr noundef %13) #9
  %19 = trunc i8 %.1 to i1
  br i1 %19, label %20, label %23

20:                                               ; preds = %18
  %21 = load ptr, ptr @stdout, align 8
  %22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.5, double noundef 0.000000e+00)
  br label %26

23:                                               ; preds = %18
  %24 = load ptr, ptr @stdout, align 8
  %25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %24, ptr noundef @.str.6, double noundef 0.000000e+00)
  br label %26

26:                                               ; preds = %23, %20
  %27 = load ptr, ptr @stdout, align 8
  %28 = call i32 @fflush(ptr noundef %27)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #6

declare i32 @fflush(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define internal i64 @random4() #0 {
  %1 = load i64, ptr @seed, align 8
  %2 = xor i64 %1, 123459876
  store i64 %2, ptr @seed, align 8
  %3 = load i64, ptr @seed, align 8
  %4 = sdiv i64 %3, 127773
  %5 = load i64, ptr @seed, align 8
  %6 = mul nsw i64 %4, 127773
  %7 = sub nsw i64 %5, %6
  %8 = mul nsw i64 16807, %7
  %9 = mul nsw i64 2836, %4
  %10 = sub nsw i64 %8, %9
  store i64 %10, ptr @seed, align 8
  %11 = load i64, ptr @seed, align 8
  %12 = icmp slt i64 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %0
  %14 = load i64, ptr @seed, align 8
  %15 = add nsw i64 %14, 2147483647
  store i64 %15, ptr @seed, align 8
  br label %16

16:                                               ; preds = %13, %0
  %17 = load i64, ptr @seed, align 8
  %18 = srem i64 %17, 32
  %19 = load i64, ptr @seed, align 8
  %20 = xor i64 %19, 123459876
  store i64 %20, ptr @seed, align 8
  ret i64 %18
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }
attributes #10 = { nounwind readonly willreturn }

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
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
