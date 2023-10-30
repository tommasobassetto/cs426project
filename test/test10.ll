declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry: 
        br label %cond.2

cond.2:
        %tmp.2 = add i32 0, 1
        %tmp.3 = add i32 0, 2
        %tmp.4 = icmp slt i32 %tmp.2, %tmp.3
        br i1 %tmp.4, label %loop.2, label %break.2

loop.2:
        %tmp.5 = add i32 0, 1
        br label %cond.2

break.2:
        %tmp.6 = add i32 0, 1
        ret i32 %tmp.6

abort: 
        call void @abort(  )
        unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
        %vtpm.0 = call i32 @Main.main(  )
        %tpm = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
        %vtpm.1 = call i32(i8*, ... ) @printf( i8* %tpm, i32 %vtpm.0 )
        ret i32 0
}

