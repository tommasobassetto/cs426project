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

@str.Object = internal constant [7 x i8] c"Object\00"
%Object = type {
        %_Object_vtable*
}

%_Object_vtable = type {
        i32,
        i32,
        i8*,
        %Object* () *,
        %Object* (%Object*) *,
        %String* (%Object*) *,
        %Object* (%Object*) *
}

@_Object_vtable_prototype = constant %_Object_vtable {
        i32 0,
        i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32),
        i8* getelementptr ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0),
        %Object* () * @Object_new,
        %Object* (%Object*) *@Object_abort,
        %String* (%Object*) *@Object_type_name,
        %Object* (%Object*) *@Object_copy
}

@str.Int = internal constant [4 x i8] c"Int\00"
%Int = type {
        %_Int_vtable*,
        i32
}

%_Int_vtable = type {
        i32,
        i32,
        i8*,
        %Int* () *,
        %Object* (%Int*) *,
        %String* (%Int*) *,
        %Int* (%Int*) *
}

@_Int_vtable_prototype = constant %_Int_vtable {
        i32 1,
        i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32),
        i8* getelementptr ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0),
        %Int* () * @Int_new,
        %Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
        %String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
        %Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
}

@str.Bool = internal constant [5 x i8] c"Bool\00"
%Bool = type {
        %_Bool_vtable*,
        i1
}

%_Bool_vtable = type {
        i32,
        i32,
        i8*,
        %Bool* () *,
        %Object* (%Bool*) *,
        %String* (%Bool*) *,
        %Bool* (%Bool*) *
}

@_Bool_vtable_prototype = constant %_Bool_vtable {
        i32 2,
        i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32),
        i8* getelementptr ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0),
        %Bool* () * @Bool_new,
        %Object* (%Bool*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bool*) *),
        %String* (%Bool*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bool*) *),
        %Bool* (%Bool*) * bitcast (%Object* (%Object*) * @Object_copy to %Bool* (%Bool*) *)
}

@str.String = internal constant [7 x i8] c"String\00"
%String = type {
        %_String_vtable*,
        i8*
}

%_String_vtable = type {
        i32,
        i32,
        i8*,
        %String* () *,
        %Object* (%String*) *,
        %String* (%String*) *,
        %String* (%String*) *,
        i32 (%String*) *,
        %String* (%String*,%String*) *,
        %String* (%String*,i32,i32) *
}

@_String_vtable_prototype = constant %_String_vtable {
        i32 3,
        i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32),
        i8* getelementptr ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0),
        %String* () * @String_new,
        %Object* (%String*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%String*) *),
        %String* (%String*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%String*) *),
        %String* (%String*) * bitcast (%Object* (%Object*) * @Object_copy to %String* (%String*) *),
        i32 (%String*) *@String_length,
        %String* (%String*,%String*) *@String_concat,
        %String* (%String*,i32,i32) *@String_substr
}

@str.IO = internal constant [3 x i8] c"IO\00"
%IO = type {
        %_IO_vtable*
}

%_IO_vtable = type {
        i32,
        i32,
        i8*,
        %IO* () *,
        %Object* (%IO*) *,
        %String* (%IO*) *,
        %IO* (%IO*) *,
        %IO* (%IO*,%String*) *,
        %IO* (%IO*,i32) *,
        %String* (%IO*) *,
        i32 (%IO*) *
}

@_IO_vtable_prototype = constant %_IO_vtable {
        i32 4,
        i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32),
        i8* getelementptr ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0),
        %IO* () * @IO_new,
        %Object* (%IO*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%IO*) *),
        %String* (%IO*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%IO*) *),
        %IO* (%IO*) * bitcast (%Object* (%Object*) * @Object_copy to %IO* (%IO*) *),
        %IO* (%IO*,%String*) *@IO_out_string,
        %IO* (%IO*,i32) *@IO_out_int,
        %String* (%IO*) *@IO_in_string,
        i32 (%IO*) *@IO_in_int
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
        %_Main_vtable*,
        %Derp2*
}

%_Main_vtable = type {
        i32,
        i32,
        i8*,
        %Main* () *,
        %Object* (%Main*) *,
        %String* (%Main*) *,
        %Main* (%Main*) *,
        %Main* (%Main*,%String*) *,
        %Main* (%Main*,i32) *,
        %String* (%Main*) *,
        i32 (%Main*) *,
        i32 (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
        i32 5,
        i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
        i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
        %Main* () * @Main_new,
        %Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
        %String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
        %Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
        %Main* (%Main*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
        %Main* (%Main*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Main* (%Main*,i32) *),
        %String* (%Main*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Main*) *),
        i32 (%Main*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Main*) *),
        i32 (%Main*) *@Main.main
}

@str.Derp1 = internal constant [6 x i8] c"Derp1\00"
%Derp1 = type {
        %_Derp1_vtable*
}

%_Derp1_vtable = type {
        i32,
        i32,
        i8*,
        %Derp1* () *,
        %Object* (%Derp1*) *,
        %String* (%Derp1*) *,
        %Derp1* (%Derp1*) *,
        %String* (%Derp1*) *
}

@_Derp1_vtable_prototype = constant %_Derp1_vtable {
        i32 6,
        i32 ptrtoint (%Derp1* getelementptr (%Derp1, %Derp1* null, i32 1) to i32),
        i8* getelementptr ([6 x i8], [6 x i8]* @str.Derp1, i32 0, i32 0),
        %Derp1* () * @Derp1_new,
        %Object* (%Derp1*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Derp1*) *),
        %String* (%Derp1*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Derp1*) *),
        %Derp1* (%Derp1*) * bitcast (%Object* (%Object*) * @Object_copy to %Derp1* (%Derp1*) *),
        %String* (%Derp1*) *@Derp1.derp
}

@str.Derp2 = internal constant [6 x i8] c"Derp2\00"
%Derp2 = type {
        %_Derp2_vtable*
}

%_Derp2_vtable = type {
        i32,
        i32,
        i8*,
        %Derp2* () *,
        %Object* (%Derp2*) *,
        %String* (%Derp2*) *,
        %Derp2* (%Derp2*) *,
        %String* (%Derp2*) *,
        %String* (%Derp2*) *
}

@_Derp2_vtable_prototype = constant %_Derp2_vtable {
        i32 7,
        i32 ptrtoint (%Derp2* getelementptr (%Derp2, %Derp2* null, i32 1) to i32),
        i8* getelementptr ([6 x i8], [6 x i8]* @str.Derp2, i32 0, i32 0),
        %Derp2* () * @Derp2_new,
        %Object* (%Derp2*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Derp2*) *),
        %String* (%Derp2*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Derp2*) *),
        %Derp2* (%Derp2*) * bitcast (%Object* (%Object*) * @Object_copy to %Derp2* (%Derp2*) *),
        %String* (%Derp2*) * bitcast (%String* (%Derp1*) * @Derp1.derp to %String* (%Derp2*) *),
        %String* (%Derp2*) *@Derp2.derp
}
@str.3 = internal constant  [14 x i8] c"<basic class>\00"
@String.3 = constant %String {
        %_String_vtable* @_String_vtable_prototype,
        i8* getelementptr ([14 x i8], [14 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant  [7 x i8] c"derp2\0A\00"
@String.2 = constant %String {
        %_String_vtable* @_String_vtable_prototype,
        i8* getelementptr ([7 x i8], [7 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant  [7 x i8] c"derp1\0A\00"
@String.1 = constant %String {
        %_String_vtable* @_String_vtable_prototype,
        i8* getelementptr ([7 x i8], [7 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant  [18 x i8] c"../test/test16.cl\00"
@String.0 = constant %String {
        %_String_vtable* @_String_vtable_prototype,
        i8* getelementptr ([18 x i8], [18 x i8]* @str.0, i32 0, i32 0)
}


define i32 @main() {
entry:
        %main.obj = call %Main*() @Main_new( )
        %main.retval = call i32(%Main*) @Main.main( %Main* %main.obj )
        ret i32 0
}
  
define %Main* @Main_new() {
entry:
        %tmp.2 = alloca %Main*
        %tmp.3 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
        %tmp.4 = load i32, i32* %tmp.3
        %tmp.5 = call i8*(i32 ) @malloc( i32 %tmp.4 )
        %tmp.6 = bitcast i8* %tmp.5 to %Main*
        %malloc.null = icmp eq %Main* %tmp.6, null
        br i1 %malloc.null, label %abort, label %okay
okay:
        %tmp.7 = getelementptr %Main, %Main* %tmp.6, i32 0, i32 0
        store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %tmp.7
        store %Main* %tmp.6, %Main** %tmp.2
        ret %Main* %tmp.6
abort:
        call void @abort( )
        unreachable
}

define i32 @Main.main(%Main* %self) {

entry: 
        %tmp.8 = alloca %Main*
        store %Main* %self, %Main** %tmp.8
        %tmp.9 = load %Main*, %Main** %tmp.8
        %tmp.10 = icmp eq %Main* %tmp.9, null
        br i1 %tmp.10, label %abort, label %ok.2
ok.2:
        %tmp.11 = call %Derp2* @Derp2_new( )
        %tmp.12 = alloca %Main*
        store %Main* %self, %Main** %tmp.12
        %tmp.13 = load %Main*, %Main** %tmp.12
        %tmp.14 = getelementptr %Main, %Main* %tmp.13, i32 0, i32 1
        store %Derp2* %tmp.11, %Derp2** %tmp.14
        %tmp.15 = alloca %Main*
        store %Main* %self, %Main** %tmp.15
        %tmp.16 = load %Main*, %Main** %tmp.15
        %tmp.17 = getelementptr %Main, %Main* %tmp.16, i32 0, i32 1
        %tmp.18 = load %Derp2*, %Derp2** %tmp.17
        %tmp.19 = bitcast %Derp2* %tmp.18 to %Derp2*
        %tmp.20 = getelementptr %Derp2, %Derp2* %tmp.19, i32 0, i32 0
        %tmp.21 = load %_Derp2_vtable*, %_Derp2_vtable** %tmp.20
        %tmp.22 = getelementptr %_Derp2_vtable, %_Derp2_vtable* %tmp.21, i32 0, i32 8
        %tmp.23 = load %String*(%Derp2*)*, %String*(%Derp2*)** %tmp.22
        %tmp.24 = call %String*(%Derp2*) %tmp.23(%Derp2* %tmp.19)
        %tmp.25 = alloca %Main*
        store %Main* %self,%Main** %tmp.25
        %tmp.26 = load %Main*, %Main** %tmp.25
        %tmp.27 = getelementptr %Main, %Main* %tmp.26, i32 0, i32 0
        %tmp.28 = load %_Main_vtable*, %_Main_vtable** %tmp.27
        %tmp.29 = getelementptr %_Main_vtable, %_Main_vtable* %tmp.28, i32 0, i32 7
        %tmp.30 = load %Main*(%Main*, %String*)*, %Main*(%Main*, %String*)** %tmp.29
        %tmp.31 = call %Main*(%Main*, %String*) %tmp.30(%Main* %tmp.26, %String* %tmp.24)
        %tmp.32 = add i32 0, 0
        ret i32 %tmp.32

abort: 
        call void @abort(  )
        unreachable
}

define %Derp2* @Derp2_new() {
entry:
        %tmp.33 = alloca %Derp2*
        %tmp.34 = getelementptr %_Derp2_vtable, %_Derp2_vtable* @_Derp2_vtable_prototype, i32 0, i32 1
        %tmp.35 = load i32, i32* %tmp.34
        %tmp.36 = call i8*(i32 ) @malloc( i32 %tmp.35 )
        %tmp.37 = bitcast i8* %tmp.36 to %Derp2*
        %malloc.null = icmp eq %Derp2* %tmp.37, null
        br i1 %malloc.null, label %abort, label %okay
okay:
        %tmp.38 = getelementptr %Derp2, %Derp2* %tmp.37, i32 0, i32 0
        store %_Derp2_vtable* @_Derp2_vtable_prototype, %_Derp2_vtable** %tmp.38
        store %Derp2* %tmp.37, %Derp2** %tmp.33
        ret %Derp2* %tmp.37
abort:
        call void @abort( )
        unreachable
}

define %String* @Derp2.derp(%Derp2* %self) {

entry: 
        %tmp.39 = alloca %Derp2*
        store %Derp2* %self, %Derp2** %tmp.39
        %tmp.40 = load %Derp2*, %Derp2** %tmp.39
        %tmp.41 = icmp eq %Derp2* %tmp.40, null
        br i1 %tmp.41, label %abort, label %ok.3
ok.3:
        %tmp.42 = alloca %String*
        store %String* @String.2, %String** %tmp.42
        %tmp.43 = load %String*, %String** %tmp.42
        ret %String* %tmp.43

abort: 
        call void @abort(  )
        unreachable
}

define %Derp1* @Derp1_new() {
entry:
        %tmp.44 = alloca %Derp1*
        %tmp.45 = getelementptr %_Derp1_vtable, %_Derp1_vtable* @_Derp1_vtable_prototype, i32 0, i32 1
        %tmp.46 = load i32, i32* %tmp.45
        %tmp.47 = call i8*(i32 ) @malloc( i32 %tmp.46 )
        %tmp.48 = bitcast i8* %tmp.47 to %Derp1*
        %malloc.null = icmp eq %Derp1* %tmp.48, null
        br i1 %malloc.null, label %abort, label %okay
okay:
        %tmp.49 = getelementptr %Derp1, %Derp1* %tmp.48, i32 0, i32 0
        store %_Derp1_vtable* @_Derp1_vtable_prototype, %_Derp1_vtable** %tmp.49
        store %Derp1* %tmp.48, %Derp1** %tmp.44
        ret %Derp1* %tmp.48
abort:
        call void @abort( )
        unreachable
}

define %String* @Derp1.derp(%Derp1* %self) {

entry: 
        %tmp.50 = alloca %Derp1*
        store %Derp1* %self, %Derp1** %tmp.50
        %tmp.51 = load %Derp1*, %Derp1** %tmp.50
        %tmp.52 = icmp eq %Derp1* %tmp.51, null
        br i1 %tmp.52, label %abort, label %ok.4
ok.4:
        %tmp.53 = alloca %String*
        store %String* @String.1, %String** %tmp.53
        %tmp.54 = load %String*, %String** %tmp.53
        ret %String* %tmp.54

abort: 
        call void @abort(  )
        unreachable
}

