define i32 @test1(i32 inreg %a) nounwind {
entry:
    %c = add i32 1, 2
    %b = add i32 %a, %c
    ret i32 %b
}

define i32 @main() {
    %a = call i32 @test1(i32 123)
    ret i32 %a
}
