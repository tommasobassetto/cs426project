define float @test1(float inreg %a) nounwind {
entry:
    %c = fneg float 14.0
    ret float %c
}

define float @main() {
    %a = call float @test1(float 123.0)
    ret float %a
}
