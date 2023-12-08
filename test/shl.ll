define i32 @test1(i32 inreg %a) nounwind {
entry:
    %c = shl i32 1, 2
    %b = shl i32 %a, %c
    ret i32 %b
}

define i32 @main() {
    %a = call i32 @test1(i32 4)
    ret i32 %a
}
