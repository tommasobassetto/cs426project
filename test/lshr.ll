define i32 @test1(i32 inreg %a) nounwind {
entry:
    %c = lshr i32 -12, 2
    %b = lshr i32 %a, %c
    ret i32 %b
}

define i32 @main() {
    %a = call i32 @test1(i32 44)
    ret i32 %a
}
