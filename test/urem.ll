define i32 @test1(i32 inreg %a) nounwind {
entry:
    %c = urem i32 -11, 3
    %b = urem i32 %a, %c
    ret i32 %b
}

define i32 @main() {
    %a = call i32 @test1(i32 123)
    ret i32 %a
}
