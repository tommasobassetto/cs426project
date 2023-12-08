define i32 @test1(i32 inreg %a) nounwind {
entry:
    %c = xor i32 43, 24
    %b = xor i32 %a, %c
    ret i32 %b
}

define i32 @main() {
    %a = call i32 @test1(i32 4444)
    ret i32 %a
}
