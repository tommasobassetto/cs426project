#!/usr/bin/sh
# Use this script to run MP5!
cd build
make -j &&
cd .. &&
export LLVM_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-15
clang-15 mp5_testcases/$1.c -c -O0 -S -Xclang -disable-O0-optnone -emit-llvm -o test/$1.ll
opt-15 -load-pass-plugin=build/libUnitProject.so -passes="mem2reg,loop-simplify,unit-licm-multiple" test/$1.ll -S -o test/$1_parsed.ll
clang-15 test/$1_parsed.ll  -Wl -lm -o test/a.out

# echo "printed value:"
# test/a.out
# echo "\n"

# opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-sccp,adce" test/$1_c.ll -S -o test/$1_parsed.ll &&
# clang-15 test/$1_parsed.ll coolrt.o -Wl,--unresolved-symbols=ignore-in-object-files -o test/a.out &&
# opt-15 -load-pass-plugin=build/libUnitProject.so -passes="mem2reg,unit-licm-multiple" test/$1.ll -S -o test/$1_parsed.ll
# clang-15 test/$1_parsed.ll coolrt.o -Wl,--unresolved-symbols=ignore-in-object-files -o test/a.out

# echo "printed value:"
# test/a.out
# echo "\n"

# opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-sccp,adce" test/$1.ll -S -o test/$1_parsed.ll &&
# clang-15 test/$1_parsed.ll coolrt.o -Wl,--unresolved-symbols=ignore-in-object-files -o test/a.out &&
test/a.out
export a=$?
echo "returned value:"
echo ${a}
