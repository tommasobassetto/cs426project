; ModuleID = 'test/shl.ll'
source_filename = "test/shl.ll"

; Function Attrs: nounwind
define i32 @test1(i32 inreg %a) #0 {
entry:
  %b = shl i32 %a, 4
  ret i32 %b
}

define i32 @main() {
  %a = call i32 @test1(i32 4)
  ret i32 %a
}

attributes #0 = { nounwind }
