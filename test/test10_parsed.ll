; ModuleID = 'test/test10.ll'
source_filename = "test/test10.ll"

%_Object_vtable = type { i32, i32, i8*, %Object* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)* }
%Object = type { %_Object_vtable* }
%String = type { %_String_vtable*, i8* }
%_String_vtable = type { i32, i32, i8*, %String* ()*, %Object* (%String*)*, %String* (%String*)*, %String* (%String*)*, i32 (%String*)*, %String* (%String*, %String*)*, %String* (%String*, i32, i32)* }
%_Int_vtable = type { i32, i32, i8*, %Int* ()*, %Object* (%Int*)*, %String* (%Int*)*, %Int* (%Int*)* }
%Int = type { %_Int_vtable*, i32 }
%_Bool_vtable = type { i32, i32, i8*, %Bool* ()*, %Object* (%Bool*)*, %String* (%Bool*)*, %Bool* (%Bool*)* }
%Bool = type { %_Bool_vtable*, i1 }
%_IO_vtable = type { i32, i32, i8*, %IO* ()*, %Object* (%IO*)*, %String* (%IO*)*, %IO* (%IO*)*, %IO* (%IO*, %String*)*, %IO* (%IO*, i32)*, %String* (%IO*)*, i32 (%IO*)* }
%IO = type { %_IO_vtable* }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Main*)*, %String* (%Main*)*, %Main* (%Main*)*, %Main* (%Main*, %String*)*, %Main* (%Main*, i32)*, %String* (%Main*)*, i32 (%Main*)*, i32 (%Main*)* }
%Main = type { %_Main_vtable*, i32 }

@str.Object = internal constant [7 x i8] c"Object\00"
@_Object_vtable_prototype = constant %_Object_vtable { i32 0, i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0), %Object* ()* @Object_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.Int = internal constant [4 x i8] c"Int\00"
@_Int_vtable_prototype = constant %_Int_vtable { i32 1, i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0), %Int* ()* @Int_new, %Object* (%Int*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Int*)*), %String* (%Int*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Int*)*), %Int* (%Int*)* bitcast (%Object* (%Object*)* @Object_copy to %Int* (%Int*)*) }
@str.Bool = internal constant [5 x i8] c"Bool\00"
@_Bool_vtable_prototype = constant %_Bool_vtable { i32 2, i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0), %Bool* ()* @Bool_new, %Object* (%Bool*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Bool*)*), %String* (%Bool*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Bool*)*), %Bool* (%Bool*)* bitcast (%Object* (%Object*)* @Object_copy to %Bool* (%Bool*)*) }
@str.String = internal constant [7 x i8] c"String\00"
@_String_vtable_prototype = constant %_String_vtable { i32 3, i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0), %String* ()* @String_new, %Object* (%String*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%String*)*), %String* (%String*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%String*)*), %String* (%String*)* bitcast (%Object* (%Object*)* @Object_copy to %String* (%String*)*), i32 (%String*)* @String_length, %String* (%String*, %String*)* @String_concat, %String* (%String*, i32, i32)* @String_substr }
@str.IO = internal constant [3 x i8] c"IO\00"
@_IO_vtable_prototype = constant %_IO_vtable { i32 4, i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0), %IO* ()* @IO_new, %Object* (%IO*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%IO*)*), %String* (%IO*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%IO*)*), %IO* (%IO*)* bitcast (%Object* (%Object*)* @Object_copy to %IO* (%IO*)*), %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Main*)* bitcast (%Object* (%Object*)* @Object_abort to %Object* (%Main*)*), %String* (%Main*)* bitcast (%String* (%Object*)* @Object_type_name to %String* (%Main*)*), %Main* (%Main*)* bitcast (%Object* (%Object*)* @Object_copy to %Main* (%Main*)*), %Main* (%Main*, %String*)* bitcast (%IO* (%IO*, %String*)* @IO_out_string to %Main* (%Main*, %String*)*), %Main* (%Main*, i32)* bitcast (%IO* (%IO*, i32)* @IO_out_int to %Main* (%Main*, i32)*), %String* (%Main*)* bitcast (%String* (%IO*)* @IO_in_string to %String* (%Main*)*), i32 (%Main*)* bitcast (i32 (%IO*)* @IO_in_int to i32 (%Main*)*), i32 (%Main*)* @Main.main }
@str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0) }
@str.0 = internal constant [18 x i8] c"../test/test10.cl\00"
@String.0 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.0, i32 0, i32 0) }

declare i32 @strcmp(i8*, i8*)

declare i32 @printf(i8*, ...)

declare void @abort()

declare i8* @malloc(i32)

declare %Object* @Object_new()

declare %Object* @Object_abort(%Object*)

declare %String* @Object_type_name(%Object*)

declare %Object* @Object_copy(%Object*)

declare %IO* @IO_new()

declare %IO* @IO_out_string(%IO*, %String*)

declare %IO* @IO_out_int(%IO*, i32)

declare %String* @IO_in_string(%IO*)

declare i32 @IO_in_int(%IO*)

declare %String* @String_new()

declare i32 @String_length(%String*)

declare %String* @String_concat(%String*, %String*)

declare %String* @String_substr(%String*, i32, i32)

declare %Int* @Int_new()

declare void @Int_init(%Int*, i32)

declare %Bool* @Bool_new()

declare void @Bool_init(%Bool*, i1)

define i32 @main() {
entry:
  %main.obj = call %Main* @Main_new()
  %main.retval = call i32 @Main.main(%Main* %main.obj)
  ret i32 0
}

define %Main* @Main_new() {
entry:
  %tmp.2 = alloca %Main*, align 8
  %tmp.3 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
  %tmp.4 = load i32, i32* %tmp.3, align 4
  %tmp.5 = call i8* @malloc(i32 %tmp.4)
  %tmp.6 = bitcast i8* %tmp.5 to %Main*
  %malloc.null = icmp eq %Main* %tmp.6, null
  br i1 %malloc.null, label %abort, label %okay

okay:                                             ; preds = %entry
  %tmp.7 = getelementptr %Main, %Main* %tmp.6, i32 0, i32 0
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %tmp.7, align 8
  store %Main* %tmp.6, %Main** %tmp.2, align 8
  %tmp.8 = add i32 0, 0
  %tmp.9 = getelementptr %Main, %Main* %tmp.6, i32 0, i32 1
  store i32 %tmp.8, i32* %tmp.9, align 4
  %tmp.10 = add i32 0, 0
  %tmp.11 = getelementptr %Main, %Main* %tmp.6, i32 0, i32 1
  store i32 %tmp.10, i32* %tmp.11, align 4
  ret %Main* %tmp.6

abort:                                            ; preds = %entry
  call void @abort()
  unreachable
}

define i32 @Main.main(%Main* %self) {
entry:
  %tmp.12 = alloca %Main*, align 8
  store %Main* %self, %Main** %tmp.12, align 8
  %tmp.13 = load %Main*, %Main** %tmp.12, align 8
  %tmp.14 = icmp eq %Main* %tmp.13, null
  br i1 %tmp.14, label %abort, label %ok.2

ok.2:                                             ; preds = %entry
  %tmp.27 = alloca %Main*, align 8
  %tmp.25 = add i32 0, 1
  %tmp.21 = alloca %Main*, align 8
  %tmp.19 = add i32 0, 100
  %tmp.15 = alloca %Main*, align 8
  br label %cond.3

cond.3:                                           ; preds = %loop.3, %ok.2
  store %Main* %self, %Main** %tmp.15, align 8
  %tmp.16 = load %Main*, %Main** %tmp.15, align 8
  %tmp.17 = getelementptr %Main, %Main* %tmp.16, i32 0, i32 1
  %tmp.18 = load i32, i32* %tmp.17, align 4
  %tmp.20 = icmp sle i32 %tmp.18, %tmp.19
  br i1 %tmp.20, label %loop.3, label %break.3

loop.3:                                           ; preds = %cond.3
  store %Main* %self, %Main** %tmp.21, align 8
  %tmp.22 = load %Main*, %Main** %tmp.21, align 8
  %tmp.23 = getelementptr %Main, %Main* %tmp.22, i32 0, i32 1
  %tmp.24 = load i32, i32* %tmp.23, align 4
  %tmp.26 = add i32 %tmp.24, %tmp.25
  store %Main* %self, %Main** %tmp.27, align 8
  %tmp.28 = load %Main*, %Main** %tmp.27, align 8
  %tmp.29 = getelementptr %Main, %Main* %tmp.28, i32 0, i32 1
  store i32 %tmp.26, i32* %tmp.29, align 4
  br label %cond.3

break.3:                                          ; preds = %cond.3
  %tmp.30 = alloca %Main*, align 8
  store %Main* %self, %Main** %tmp.30, align 8
  %tmp.31 = load %Main*, %Main** %tmp.30, align 8
  %tmp.32 = getelementptr %Main, %Main* %tmp.31, i32 0, i32 1
  %tmp.33 = load i32, i32* %tmp.32, align 4
  %tmp.34 = alloca %Main*, align 8
  store %Main* %self, %Main** %tmp.34, align 8
  %tmp.35 = load %Main*, %Main** %tmp.34, align 8
  %tmp.36 = getelementptr %Main, %Main* %tmp.35, i32 0, i32 0
  %tmp.37 = load %_Main_vtable*, %_Main_vtable** %tmp.36, align 8
  %tmp.38 = getelementptr %_Main_vtable, %_Main_vtable* %tmp.37, i32 0, i32 8
  %tmp.39 = load %Main* (%Main*, i32)*, %Main* (%Main*, i32)** %tmp.38, align 8
  %tmp.40 = call %Main* %tmp.39(%Main* %tmp.35, i32 %tmp.33)
  %tmp.41 = add i32 0, 0
  ret i32 %tmp.41

abort:                                            ; preds = %entry
  call void @abort()
  unreachable
}
