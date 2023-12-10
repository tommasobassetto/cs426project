define i32 @test1(i32 inreg %0) nounwind {
entry:
    %1 = add i32 1, 2
    %2 = add i32 %0, %1
    ret i32 %2
}

define i32 @main() {
    %1 = call i32 @test1(i32 123)
    ret i32 %1
}
