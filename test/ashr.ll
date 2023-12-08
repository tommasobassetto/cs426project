define i32 @test1(i32 inreg %a) nounwind {
entry:
    %c = ashr i32 3, 2
    %b = ashr i32 %a, %c
    ret i32 %b
}

define i32 @main() {
    %a = call i32 @test1(i32 4444)
    ret i32 %a
}
