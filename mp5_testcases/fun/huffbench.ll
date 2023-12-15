; ModuleID = 'mp5_testcases/fun/huffbench.c'
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
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  store ptr @.str, ptr %3, align 8
  %7 = load i64, ptr %2, align 8
  %8 = call noalias ptr @malloc(i64 noundef %7) #7
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  store ptr %9, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %10

10:                                               ; preds = %23, %1
  %11 = load i32, ptr %6, align 4
  %12 = sext i32 %11 to i64
  %13 = load i64, ptr %2, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %26

15:                                               ; preds = %10
  %16 = load ptr, ptr %3, align 8
  %17 = call i64 @random4()
  %18 = getelementptr inbounds i8, ptr %16, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = load ptr, ptr %5, align 8
  store i8 %19, ptr %20, align 1
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds i8, ptr %21, i32 1
  store ptr %22, ptr %5, align 8
  br label %23

23:                                               ; preds = %15
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  br label %10, !llvm.loop !6

26:                                               ; preds = %10
  %27 = load ptr, ptr %4, align 8
  ret ptr %27
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @compdecomp(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8, align 1
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca [512 x i64], align 16
  %16 = alloca [256 x i64], align 16
  %17 = alloca [512 x i32], align 16
  %18 = alloca [256 x i64], align 16
  %19 = alloca [256 x i8], align 16
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca i32, align 4
  %26 = alloca i64, align 8
  %27 = alloca i8, align 1
  %28 = alloca i32, align 4
  %29 = alloca [256 x i64], align 16
  %30 = alloca [256 x i8], align 16
  %31 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %32 = load ptr, ptr %3, align 8
  store ptr %32, ptr %13, align 8
  %33 = load i64, ptr %4, align 8
  %34 = add i64 %33, 1
  %35 = call noalias ptr @malloc(i64 noundef %34) #7
  store ptr %35, ptr %14, align 8
  %36 = load ptr, ptr %14, align 8
  %37 = load i64, ptr %4, align 8
  %38 = add i64 %37, 1
  %39 = mul i64 1, %38
  call void @llvm.memset.p0.i64(ptr align 1 %36, i8 0, i64 %39, i1 false)
  %40 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %40, i8 0, i64 4096, i1 false)
  %41 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %41, i8 0, i64 2048, i1 false)
  %42 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %42, i8 0, i64 2048, i1 false)
  %43 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %43, i8 0, i64 2048, i1 false)
  %44 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %44, i8 0, i64 256, i1 false)
  store i64 0, ptr %5, align 8
  br label %45

45:                                               ; preds = %58, %2
  %46 = load i64, ptr %5, align 8
  %47 = load i64, ptr %4, align 8
  %48 = icmp ult i64 %46, %47
  br i1 %48, label %49, label %61

49:                                               ; preds = %45
  %50 = load ptr, ptr %13, align 8
  %51 = load i8, ptr %50, align 1
  %52 = zext i8 %51 to i64
  %53 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %52
  %54 = load i64, ptr %53, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr %53, align 8
  %56 = load ptr, ptr %13, align 8
  %57 = getelementptr inbounds i8, ptr %56, i32 1
  store ptr %57, ptr %13, align 8
  br label %58

58:                                               ; preds = %49
  %59 = load i64, ptr %5, align 8
  %60 = add i64 %59, 1
  store i64 %60, ptr %5, align 8
  br label %45, !llvm.loop !8

61:                                               ; preds = %45
  store i64 0, ptr %7, align 8
  store i64 0, ptr %5, align 8
  br label %62

62:                                               ; preds = %77, %61
  %63 = load i64, ptr %5, align 8
  %64 = icmp ult i64 %63, 256
  br i1 %64, label %65, label %80

65:                                               ; preds = %62
  %66 = load i64, ptr %5, align 8
  %67 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %66
  %68 = load i64, ptr %67, align 8
  %69 = icmp ne i64 %68, 0
  br i1 %69, label %70, label %76

70:                                               ; preds = %65
  %71 = load i64, ptr %5, align 8
  %72 = load i64, ptr %7, align 8
  %73 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 %72
  store i64 %71, ptr %73, align 8
  %74 = load i64, ptr %7, align 8
  %75 = add i64 %74, 1
  store i64 %75, ptr %7, align 8
  br label %76

76:                                               ; preds = %70, %65
  br label %77

77:                                               ; preds = %76
  %78 = load i64, ptr %5, align 8
  %79 = add i64 %78, 1
  store i64 %79, ptr %5, align 8
  br label %62, !llvm.loop !9

80:                                               ; preds = %62
  %81 = load i64, ptr %7, align 8
  store i64 %81, ptr %5, align 8
  br label %82

82:                                               ; preds = %92, %80
  %83 = load i64, ptr %5, align 8
  %84 = icmp ugt i64 %83, 0
  br i1 %84, label %85, label %95

85:                                               ; preds = %82
  %86 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 0
  %87 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %88 = load i64, ptr %7, align 8
  %89 = trunc i64 %88 to i32
  %90 = load i64, ptr %5, align 8
  %91 = trunc i64 %90 to i32
  call void @heap_adjust(ptr noundef %86, ptr noundef %87, i32 noundef %89, i32 noundef %91)
  br label %92

92:                                               ; preds = %85
  %93 = load i64, ptr %5, align 8
  %94 = add i64 %93, -1
  store i64 %94, ptr %5, align 8
  br label %82, !llvm.loop !10

95:                                               ; preds = %82
  br label %96

96:                                               ; preds = %99, %95
  %97 = load i64, ptr %7, align 8
  %98 = icmp ugt i64 %97, 1
  br i1 %98, label %99, label %141

99:                                               ; preds = %96
  %100 = load i64, ptr %7, align 8
  %101 = add i64 %100, -1
  store i64 %101, ptr %7, align 8
  %102 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %103 = load i64, ptr %102, align 16
  store i64 %103, ptr %20, align 8
  %104 = load i64, ptr %7, align 8
  %105 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 %104
  %106 = load i64, ptr %105, align 8
  %107 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  store i64 %106, ptr %107, align 16
  %108 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 0
  %109 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %110 = load i64, ptr %7, align 8
  %111 = trunc i64 %110 to i32
  call void @heap_adjust(ptr noundef %108, ptr noundef %109, i32 noundef %111, i32 noundef 1)
  %112 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %113 = load i64, ptr %112, align 16
  %114 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %113
  %115 = load i64, ptr %114, align 8
  %116 = load i64, ptr %20, align 8
  %117 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %116
  %118 = load i64, ptr %117, align 8
  %119 = add i64 %115, %118
  %120 = load i64, ptr %7, align 8
  %121 = add i64 256, %120
  %122 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %121
  store i64 %119, ptr %122, align 8
  %123 = load i64, ptr %7, align 8
  %124 = add i64 256, %123
  %125 = trunc i64 %124 to i32
  %126 = load i64, ptr %20, align 8
  %127 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %126
  store i32 %125, ptr %127, align 4
  %128 = load i64, ptr %7, align 8
  %129 = sub i64 -256, %128
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %132 = load i64, ptr %131, align 16
  %133 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %132
  store i32 %130, ptr %133, align 4
  %134 = load i64, ptr %7, align 8
  %135 = add i64 256, %134
  %136 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  store i64 %135, ptr %136, align 16
  %137 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 0
  %138 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %139 = load i64, ptr %7, align 8
  %140 = trunc i64 %139 to i32
  call void @heap_adjust(ptr noundef %137, ptr noundef %138, i32 noundef %140, i32 noundef 1)
  br label %96, !llvm.loop !11

141:                                              ; preds = %96
  %142 = load i64, ptr %7, align 8
  %143 = add i64 256, %142
  %144 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %143
  store i32 0, ptr %144, align 4
  store i64 0, ptr %23, align 8
  store i64 0, ptr %24, align 8
  store i64 0, ptr %21, align 8
  br label %145

145:                                              ; preds = %204, %141
  %146 = load i64, ptr %21, align 8
  %147 = icmp ult i64 %146, 256
  br i1 %147, label %148, label %207

148:                                              ; preds = %145
  %149 = load i64, ptr %21, align 8
  %150 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %149
  %151 = load i64, ptr %150, align 8
  %152 = icmp ne i64 %151, 0
  br i1 %152, label %158, label %153

153:                                              ; preds = %148
  %154 = load i64, ptr %21, align 8
  %155 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %154
  store i64 0, ptr %155, align 8
  %156 = load i64, ptr %21, align 8
  %157 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %156
  store i8 0, ptr %157, align 1
  br label %203

158:                                              ; preds = %148
  store i64 0, ptr %5, align 8
  store i64 1, ptr %6, align 8
  store i64 0, ptr %22, align 8
  %159 = load i64, ptr %21, align 8
  %160 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %159
  %161 = load i32, ptr %160, align 4
  store i32 %161, ptr %25, align 4
  br label %162

162:                                              ; preds = %174, %158
  %163 = load i32, ptr %25, align 4
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %165, label %183

165:                                              ; preds = %162
  %166 = load i32, ptr %25, align 4
  %167 = icmp slt i32 %166, 0
  br i1 %167, label %168, label %174

168:                                              ; preds = %165
  %169 = load i64, ptr %6, align 8
  %170 = load i64, ptr %22, align 8
  %171 = add i64 %170, %169
  store i64 %171, ptr %22, align 8
  %172 = load i32, ptr %25, align 4
  %173 = sub nsw i32 0, %172
  store i32 %173, ptr %25, align 4
  br label %174

174:                                              ; preds = %168, %165
  %175 = load i32, ptr %25, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %176
  %178 = load i32, ptr %177, align 4
  store i32 %178, ptr %25, align 4
  %179 = load i64, ptr %6, align 8
  %180 = shl i64 %179, 1
  store i64 %180, ptr %6, align 8
  %181 = load i64, ptr %5, align 8
  %182 = add i64 %181, 1
  store i64 %182, ptr %5, align 8
  br label %162, !llvm.loop !12

183:                                              ; preds = %162
  %184 = load i64, ptr %22, align 8
  %185 = load i64, ptr %21, align 8
  %186 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %185
  store i64 %184, ptr %186, align 8
  %187 = load i64, ptr %5, align 8
  %188 = trunc i64 %187 to i8
  %189 = load i64, ptr %21, align 8
  %190 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %189
  store i8 %188, ptr %190, align 1
  %191 = load i64, ptr %22, align 8
  %192 = load i64, ptr %23, align 8
  %193 = icmp ugt i64 %191, %192
  br i1 %193, label %194, label %196

194:                                              ; preds = %183
  %195 = load i64, ptr %22, align 8
  store i64 %195, ptr %23, align 8
  br label %196

196:                                              ; preds = %194, %183
  %197 = load i64, ptr %5, align 8
  %198 = load i64, ptr %24, align 8
  %199 = icmp ugt i64 %197, %198
  br i1 %199, label %200, label %202

200:                                              ; preds = %196
  %201 = load i64, ptr %5, align 8
  store i64 %201, ptr %24, align 8
  br label %202

202:                                              ; preds = %200, %196
  br label %203

203:                                              ; preds = %202, %153
  br label %204

204:                                              ; preds = %203
  %205 = load i64, ptr %21, align 8
  %206 = add i64 %205, 1
  store i64 %206, ptr %21, align 8
  br label %145, !llvm.loop !13

207:                                              ; preds = %145
  %208 = load i64, ptr %24, align 8
  %209 = icmp ugt i64 %208, 64
  br i1 %209, label %210, label %213

210:                                              ; preds = %207
  %211 = load ptr, ptr @stderr, align 8
  %212 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %211, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

213:                                              ; preds = %207
  store i64 0, ptr %26, align 8
  store i8 0, ptr %27, align 1
  store i32 -1, ptr %28, align 4
  %214 = load ptr, ptr %3, align 8
  store ptr %214, ptr %13, align 8
  %215 = load i64, ptr %23, align 8
  %216 = icmp eq i64 %215, 0
  br i1 %216, label %217, label %220

217:                                              ; preds = %213
  %218 = load ptr, ptr @stderr, align 8
  %219 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %218, ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

220:                                              ; preds = %213
  store i64 0, ptr %6, align 8
  br label %221

221:                                              ; preds = %291, %220
  %222 = load i64, ptr %6, align 8
  %223 = load i64, ptr %4, align 8
  %224 = icmp ult i64 %222, %223
  br i1 %224, label %225, label %294

225:                                              ; preds = %221
  %226 = load ptr, ptr %13, align 8
  %227 = load i8, ptr %226, align 1
  %228 = zext i8 %227 to i64
  %229 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %228
  %230 = load i8, ptr %229, align 1
  %231 = zext i8 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = shl i32 1, %232
  %234 = sext i32 %233 to i64
  store i64 %234, ptr %8, align 8
  store i64 0, ptr %5, align 8
  br label %235

235:                                              ; preds = %285, %225
  %236 = load i64, ptr %5, align 8
  %237 = load ptr, ptr %13, align 8
  %238 = load i8, ptr %237, align 1
  %239 = zext i8 %238 to i64
  %240 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %239
  %241 = load i8, ptr %240, align 1
  %242 = zext i8 %241 to i64
  %243 = icmp ult i64 %236, %242
  br i1 %243, label %244, label %288

244:                                              ; preds = %235
  %245 = load i32, ptr %28, align 4
  %246 = icmp eq i32 %245, 7
  br i1 %246, label %247, label %261

247:                                              ; preds = %244
  %248 = load i8, ptr %27, align 1
  %249 = load ptr, ptr %14, align 8
  %250 = load i64, ptr %26, align 8
  %251 = getelementptr inbounds i8, ptr %249, i64 %250
  store i8 %248, ptr %251, align 1
  %252 = load i64, ptr %26, align 8
  %253 = add i64 %252, 1
  store i64 %253, ptr %26, align 8
  %254 = load i64, ptr %26, align 8
  %255 = load i64, ptr %4, align 8
  %256 = icmp eq i64 %254, %255
  br i1 %256, label %257, label %260

257:                                              ; preds = %247
  %258 = load ptr, ptr @stderr, align 8
  %259 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %258, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

260:                                              ; preds = %247
  store i32 0, ptr %28, align 4
  store i8 0, ptr %27, align 1
  br label %268

261:                                              ; preds = %244
  %262 = load i32, ptr %28, align 4
  %263 = add nsw i32 %262, 1
  store i32 %263, ptr %28, align 4
  %264 = load i8, ptr %27, align 1
  %265 = sext i8 %264 to i32
  %266 = shl i32 %265, 1
  %267 = trunc i32 %266 to i8
  store i8 %267, ptr %27, align 1
  br label %268

268:                                              ; preds = %261, %260
  %269 = load ptr, ptr %13, align 8
  %270 = load i8, ptr %269, align 1
  %271 = zext i8 %270 to i64
  %272 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %271
  %273 = load i64, ptr %272, align 8
  %274 = load i64, ptr %8, align 8
  %275 = and i64 %273, %274
  %276 = icmp ne i64 %275, 0
  br i1 %276, label %277, label %282

277:                                              ; preds = %268
  %278 = load i8, ptr %27, align 1
  %279 = sext i8 %278 to i32
  %280 = or i32 %279, 1
  %281 = trunc i32 %280 to i8
  store i8 %281, ptr %27, align 1
  br label %282

282:                                              ; preds = %277, %268
  %283 = load i64, ptr %8, align 8
  %284 = lshr i64 %283, 1
  store i64 %284, ptr %8, align 8
  br label %285

285:                                              ; preds = %282
  %286 = load i64, ptr %5, align 8
  %287 = add i64 %286, 1
  store i64 %287, ptr %5, align 8
  br label %235, !llvm.loop !14

288:                                              ; preds = %235
  %289 = load ptr, ptr %13, align 8
  %290 = getelementptr inbounds i8, ptr %289, i32 1
  store ptr %290, ptr %13, align 8
  br label %291

291:                                              ; preds = %288
  %292 = load i64, ptr %6, align 8
  %293 = add i64 %292, 1
  store i64 %293, ptr %6, align 8
  br label %221, !llvm.loop !15

294:                                              ; preds = %221
  %295 = load i32, ptr %28, align 4
  %296 = sub nsw i32 7, %295
  %297 = load i8, ptr %27, align 1
  %298 = sext i8 %297 to i32
  %299 = shl i32 %298, %296
  %300 = trunc i32 %299 to i8
  store i8 %300, ptr %27, align 1
  %301 = load i8, ptr %27, align 1
  %302 = load ptr, ptr %14, align 8
  %303 = load i64, ptr %26, align 8
  %304 = getelementptr inbounds i8, ptr %302, i64 %303
  store i8 %301, ptr %304, align 1
  %305 = load i64, ptr %26, align 8
  %306 = add i64 %305, 1
  store i64 %306, ptr %26, align 8
  %307 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %307, i8 0, i64 2048, i1 false)
  %308 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 0
  store ptr %308, ptr %31, align 8
  store i64 0, ptr %6, align 8
  br label %309

309:                                              ; preds = %366, %294
  %310 = load i64, ptr %6, align 8
  %311 = icmp ult i64 %310, 256
  br i1 %311, label %312, label %369

312:                                              ; preds = %309
  %313 = load i64, ptr %6, align 8
  %314 = trunc i64 %313 to i8
  %315 = load ptr, ptr %31, align 8
  store i8 %314, ptr %315, align 1
  %316 = load ptr, ptr %31, align 8
  %317 = getelementptr inbounds i8, ptr %316, i32 1
  store ptr %317, ptr %31, align 8
  %318 = load i64, ptr %6, align 8
  %319 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %318
  %320 = load i64, ptr %319, align 8
  %321 = load i64, ptr %6, align 8
  %322 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %321
  %323 = load i8, ptr %322, align 1
  %324 = zext i8 %323 to i64
  %325 = or i64 %320, %324
  %326 = icmp ne i64 %325, 0
  br i1 %326, label %327, label %365

327:                                              ; preds = %312
  store i64 0, ptr %9, align 8
  %328 = load i64, ptr %6, align 8
  %329 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %328
  %330 = load i8, ptr %329, align 1
  %331 = zext i8 %330 to i32
  %332 = sub nsw i32 %331, 1
  %333 = shl i32 1, %332
  %334 = sext i32 %333 to i64
  store i64 %334, ptr %8, align 8
  store i64 0, ptr %5, align 8
  br label %335

335:                                              ; preds = %358, %327
  %336 = load i64, ptr %5, align 8
  %337 = load i64, ptr %6, align 8
  %338 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %337
  %339 = load i8, ptr %338, align 1
  %340 = zext i8 %339 to i64
  %341 = icmp ult i64 %336, %340
  br i1 %341, label %342, label %361

342:                                              ; preds = %335
  %343 = load i64, ptr %9, align 8
  %344 = mul i64 %343, 2
  %345 = add i64 %344, 1
  store i64 %345, ptr %9, align 8
  %346 = load i64, ptr %6, align 8
  %347 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %346
  %348 = load i64, ptr %347, align 8
  %349 = load i64, ptr %8, align 8
  %350 = and i64 %348, %349
  %351 = icmp ne i64 %350, 0
  br i1 %351, label %352, label %355

352:                                              ; preds = %342
  %353 = load i64, ptr %9, align 8
  %354 = add i64 %353, 1
  store i64 %354, ptr %9, align 8
  br label %355

355:                                              ; preds = %352, %342
  %356 = load i64, ptr %8, align 8
  %357 = lshr i64 %356, 1
  store i64 %357, ptr %8, align 8
  br label %358

358:                                              ; preds = %355
  %359 = load i64, ptr %5, align 8
  %360 = add i64 %359, 1
  store i64 %360, ptr %5, align 8
  br label %335, !llvm.loop !16

361:                                              ; preds = %335
  %362 = load i64, ptr %9, align 8
  %363 = load i64, ptr %6, align 8
  %364 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %363
  store i64 %362, ptr %364, align 8
  br label %365

365:                                              ; preds = %361, %312
  br label %366

366:                                              ; preds = %365
  %367 = load i64, ptr %6, align 8
  %368 = add i64 %367, 1
  store i64 %368, ptr %6, align 8
  br label %309, !llvm.loop !17

369:                                              ; preds = %309
  store i64 1, ptr %5, align 8
  br label %370

370:                                              ; preds = %415, %369
  %371 = load i64, ptr %5, align 8
  %372 = icmp ult i64 %371, 256
  br i1 %372, label %373, label %418

373:                                              ; preds = %370
  %374 = load i64, ptr %5, align 8
  %375 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %374
  %376 = load i64, ptr %375, align 8
  store i64 %376, ptr %10, align 8
  %377 = load i64, ptr %5, align 8
  %378 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %377
  %379 = load i8, ptr %378, align 1
  store i8 %379, ptr %11, align 1
  %380 = load i64, ptr %5, align 8
  store i64 %380, ptr %6, align 8
  br label %381

381:                                              ; preds = %393, %373
  %382 = load i64, ptr %6, align 8
  %383 = icmp ne i64 %382, 0
  br i1 %383, label %384, label %391

384:                                              ; preds = %381
  %385 = load i64, ptr %6, align 8
  %386 = sub i64 %385, 1
  %387 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %386
  %388 = load i64, ptr %387, align 8
  %389 = load i64, ptr %10, align 8
  %390 = icmp ugt i64 %388, %389
  br label %391

391:                                              ; preds = %384, %381
  %392 = phi i1 [ false, %381 ], [ %390, %384 ]
  br i1 %392, label %393, label %408

393:                                              ; preds = %391
  %394 = load i64, ptr %6, align 8
  %395 = sub i64 %394, 1
  %396 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %395
  %397 = load i64, ptr %396, align 8
  %398 = load i64, ptr %6, align 8
  %399 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %398
  store i64 %397, ptr %399, align 8
  %400 = load i64, ptr %6, align 8
  %401 = sub i64 %400, 1
  %402 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %401
  %403 = load i8, ptr %402, align 1
  %404 = load i64, ptr %6, align 8
  %405 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %404
  store i8 %403, ptr %405, align 1
  %406 = load i64, ptr %6, align 8
  %407 = add i64 %406, -1
  store i64 %407, ptr %6, align 8
  br label %381, !llvm.loop !18

408:                                              ; preds = %391
  %409 = load i64, ptr %10, align 8
  %410 = load i64, ptr %6, align 8
  %411 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %410
  store i64 %409, ptr %411, align 8
  %412 = load i8, ptr %11, align 1
  %413 = load i64, ptr %6, align 8
  %414 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %413
  store i8 %412, ptr %414, align 1
  br label %415

415:                                              ; preds = %408
  %416 = load i64, ptr %5, align 8
  %417 = add i64 %416, 1
  store i64 %417, ptr %5, align 8
  br label %370, !llvm.loop !19

418:                                              ; preds = %370
  store i64 0, ptr %6, align 8
  br label %419

419:                                              ; preds = %425, %418
  %420 = load i64, ptr %6, align 8
  %421 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %420
  %422 = load i64, ptr %421, align 8
  %423 = icmp eq i64 %422, 0
  br i1 %423, label %424, label %428

424:                                              ; preds = %419
  br label %425

425:                                              ; preds = %424
  %426 = load i64, ptr %6, align 8
  %427 = add i64 %426, 1
  store i64 %427, ptr %6, align 8
  br label %419, !llvm.loop !20

428:                                              ; preds = %419
  store i64 0, ptr %9, align 8
  %429 = load i64, ptr %6, align 8
  store i64 %429, ptr %5, align 8
  store i64 128, ptr %8, align 8
  store i64 0, ptr %7, align 8
  %430 = load ptr, ptr %14, align 8
  store ptr %430, ptr %12, align 8
  %431 = load ptr, ptr %3, align 8
  store ptr %431, ptr %13, align 8
  br label %432

432:                                              ; preds = %484, %428
  %433 = load i64, ptr %7, align 8
  %434 = load i64, ptr %4, align 8
  %435 = icmp ult i64 %433, %434
  br i1 %435, label %436, label %485

436:                                              ; preds = %432
  %437 = load i64, ptr %9, align 8
  %438 = mul i64 %437, 2
  %439 = add i64 %438, 1
  store i64 %439, ptr %9, align 8
  %440 = load ptr, ptr %12, align 8
  %441 = load i8, ptr %440, align 1
  %442 = zext i8 %441 to i64
  %443 = load i64, ptr %8, align 8
  %444 = and i64 %442, %443
  %445 = icmp ne i64 %444, 0
  br i1 %445, label %446, label %449

446:                                              ; preds = %436
  %447 = load i64, ptr %9, align 8
  %448 = add i64 %447, 1
  store i64 %448, ptr %9, align 8
  br label %449

449:                                              ; preds = %446, %436
  br label %450

450:                                              ; preds = %456, %449
  %451 = load i64, ptr %5, align 8
  %452 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %451
  %453 = load i64, ptr %452, align 8
  %454 = load i64, ptr %9, align 8
  %455 = icmp ult i64 %453, %454
  br i1 %455, label %456, label %459

456:                                              ; preds = %450
  %457 = load i64, ptr %5, align 8
  %458 = add i64 %457, 1
  store i64 %458, ptr %5, align 8
  br label %450, !llvm.loop !21

459:                                              ; preds = %450
  %460 = load i64, ptr %9, align 8
  %461 = load i64, ptr %5, align 8
  %462 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %461
  %463 = load i64, ptr %462, align 8
  %464 = icmp eq i64 %460, %463
  br i1 %464, label %465, label %475

465:                                              ; preds = %459
  %466 = load i64, ptr %5, align 8
  %467 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %466
  %468 = load i8, ptr %467, align 1
  %469 = load ptr, ptr %13, align 8
  store i8 %468, ptr %469, align 1
  %470 = load ptr, ptr %13, align 8
  %471 = getelementptr inbounds i8, ptr %470, i32 1
  store ptr %471, ptr %13, align 8
  %472 = load i64, ptr %7, align 8
  %473 = add i64 %472, 1
  store i64 %473, ptr %7, align 8
  store i64 0, ptr %9, align 8
  %474 = load i64, ptr %6, align 8
  store i64 %474, ptr %5, align 8
  br label %475

475:                                              ; preds = %465, %459
  %476 = load i64, ptr %8, align 8
  %477 = icmp ugt i64 %476, 1
  br i1 %477, label %478, label %481

478:                                              ; preds = %475
  %479 = load i64, ptr %8, align 8
  %480 = lshr i64 %479, 1
  store i64 %480, ptr %8, align 8
  br label %484

481:                                              ; preds = %475
  store i64 128, ptr %8, align 8
  %482 = load ptr, ptr %12, align 8
  %483 = getelementptr inbounds i8, ptr %482, i32 1
  store ptr %483, ptr %12, align 8
  br label %484

484:                                              ; preds = %481, %478
  br label %432, !llvm.loop !22

485:                                              ; preds = %432
  %486 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %486) #9
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal void @heap_adjust(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds i64, ptr %11, i32 -1
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = load i32, ptr %8, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i64, ptr %13, i64 %15
  %17 = load i64, ptr %16, align 8
  %18 = trunc i64 %17 to i32
  store i32 %18, ptr %10, align 4
  br label %19

19:                                               ; preds = %69, %4
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %7, align 4
  %22 = sdiv i32 %21, 2
  %23 = icmp sle i32 %20, %22
  br i1 %23, label %24, label %80

24:                                               ; preds = %19
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, ptr %9, align 4
  %28 = load i32, ptr %9, align 4
  %29 = load i32, ptr %7, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %53

31:                                               ; preds = %24
  %32 = load ptr, ptr %5, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = load i32, ptr %9, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i64, ptr %33, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds i64, ptr %32, i64 %37
  %39 = load i64, ptr %38, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = load i32, ptr %9, align 4
  %43 = add nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i64, ptr %41, i64 %44
  %46 = load i64, ptr %45, align 8
  %47 = getelementptr inbounds i64, ptr %40, i64 %46
  %48 = load i64, ptr %47, align 8
  %49 = icmp ugt i64 %39, %48
  br i1 %49, label %50, label %53

50:                                               ; preds = %31
  %51 = load i32, ptr %9, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %9, align 4
  br label %53

53:                                               ; preds = %50, %31, %24
  %54 = load ptr, ptr %5, align 8
  %55 = load i32, ptr %10, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i64, ptr %54, i64 %56
  %58 = load i64, ptr %57, align 8
  %59 = load ptr, ptr %5, align 8
  %60 = load ptr, ptr %6, align 8
  %61 = load i32, ptr %9, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i64, ptr %60, i64 %62
  %64 = load i64, ptr %63, align 8
  %65 = getelementptr inbounds i64, ptr %59, i64 %64
  %66 = load i64, ptr %65, align 8
  %67 = icmp ult i64 %58, %66
  br i1 %67, label %68, label %69

68:                                               ; preds = %53
  br label %80

69:                                               ; preds = %53
  %70 = load ptr, ptr %6, align 8
  %71 = load i32, ptr %9, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i64, ptr %70, i64 %72
  %74 = load i64, ptr %73, align 8
  %75 = load ptr, ptr %6, align 8
  %76 = load i32, ptr %8, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i64, ptr %75, i64 %77
  store i64 %74, ptr %78, align 8
  %79 = load i32, ptr %9, align 4
  store i32 %79, ptr %8, align 4
  br label %19, !llvm.loop !23

80:                                               ; preds = %68, %19
  %81 = load i32, ptr %10, align 4
  %82 = sext i32 %81 to i64
  %83 = load ptr, ptr %6, align 8
  %84 = load i32, ptr %8, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i64, ptr %83, i64 %85
  store i64 %82, ptr %86, align 8
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca double, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i8 0, ptr %7, align 1
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %29

12:                                               ; preds = %2
  store i32 1, ptr %6, align 4
  br label %13

13:                                               ; preds = %25, %12
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %28

17:                                               ; preds = %13
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @strcmp(ptr noundef %20, ptr noundef @.str.4) #10
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %24, label %23

23:                                               ; preds = %17
  store i8 1, ptr %7, align 1
  br label %28

24:                                               ; preds = %17
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %6, align 4
  br label %13, !llvm.loop !24

28:                                               ; preds = %23, %13
  br label %29

29:                                               ; preds = %28, %2
  %30 = call ptr @generate_test_data(i64 noundef 10000000)
  store ptr %30, ptr %8, align 8
  store i32 0, ptr %6, align 4
  br label %31

31:                                               ; preds = %36, %29
  %32 = load i32, ptr %6, align 4
  %33 = icmp slt i32 %32, 30
  br i1 %33, label %34, label %39

34:                                               ; preds = %31
  %35 = load ptr, ptr %8, align 8
  call void @compdecomp(ptr noundef %35, i64 noundef 10000000)
  br label %36

36:                                               ; preds = %34
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  br label %31, !llvm.loop !25

39:                                               ; preds = %31
  store double 0.000000e+00, ptr %9, align 8
  %40 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %40) #9
  %41 = load i8, ptr %7, align 1
  %42 = trunc i8 %41 to i1
  br i1 %42, label %43, label %47

43:                                               ; preds = %39
  %44 = load ptr, ptr @stdout, align 8
  %45 = load double, ptr %9, align 8
  %46 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %44, ptr noundef @.str.5, double noundef %45)
  br label %51

47:                                               ; preds = %39
  %48 = load ptr, ptr @stdout, align 8
  %49 = load double, ptr %9, align 8
  %50 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %48, ptr noundef @.str.6, double noundef %49)
  br label %51

51:                                               ; preds = %47, %43
  %52 = load ptr, ptr @stdout, align 8
  %53 = call i32 @fflush(ptr noundef %52)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #6

declare i32 @fflush(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define internal i64 @random4() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = load i64, ptr @seed, align 8
  %4 = xor i64 %3, 123459876
  store i64 %4, ptr @seed, align 8
  %5 = load i64, ptr @seed, align 8
  %6 = sdiv i64 %5, 127773
  store i64 %6, ptr %1, align 8
  %7 = load i64, ptr @seed, align 8
  %8 = load i64, ptr %1, align 8
  %9 = mul nsw i64 %8, 127773
  %10 = sub nsw i64 %7, %9
  %11 = mul nsw i64 16807, %10
  %12 = load i64, ptr %1, align 8
  %13 = mul nsw i64 2836, %12
  %14 = sub nsw i64 %11, %13
  store i64 %14, ptr @seed, align 8
  %15 = load i64, ptr @seed, align 8
  %16 = icmp slt i64 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %0
  %18 = load i64, ptr @seed, align 8
  %19 = add nsw i64 %18, 2147483647
  store i64 %19, ptr @seed, align 8
  br label %20

20:                                               ; preds = %17, %0
  %21 = load i64, ptr @seed, align 8
  %22 = srem i64 %21, 32
  store i64 %22, ptr %2, align 8
  %23 = load i64, ptr @seed, align 8
  %24 = xor i64 %23, 123459876
  store i64 %24, ptr @seed, align 8
  %25 = load i64, ptr %2, align 8
  ret i64 %25
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
