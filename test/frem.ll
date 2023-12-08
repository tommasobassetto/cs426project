define float @test1(float inreg %a) nounwind {
entry:
    %c = frem float 14.0, 2.0
    %b = frem float %a, %c
    ret float %b
}

define float @main() {
    %a = call float @test1(float 123.0)
    ret float %a
}
