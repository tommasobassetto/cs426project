#!/usr/bin/sh
# Use this script to run MP5!
cd build
make -j &&
cd .. &&
export LLVM_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-15

# this is for licm --------
# clang-15 mp5_testcases/$1.c -c -O0 -S -Xclang -disable-O0-optnone -emit-llvm -o test/$1.ll
# opt-15 -passes="mem2reg" test/$1.ll -S -o test/$1_c.ll &&
# opt-15 -load-pass-plugin=build/libUnitProject.so -passes="mem2reg,loop-simplify,unit-licm-multiple" test/$1.ll -S -o test/$1_parsed.ll
# clang-15 test/$1_parsed.ll coolrt.o -Wl,--unresolved-symbols=ignore-in-object-files -o test/a.out
# test/a.out
# -------- this is for licm

# this is for sccp -------
clang-15 test/$1.c -c -O0 -S -Xclang -disable-O0-optnone -emit-llvm -o test/$1.ll
opt-15 -passes="mem2reg,simplifycfg" test/$1.ll -S -o test/$1_c.ll &&
opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-sccp" test/$1_c.ll -S -o test/$1_parsed.ll &&
# opt-15 -load-pass-plugin=build/libUnitProject.so -passes="sccp" test/$1_c.ll -S -o test/$1_parsed.ll &&
# opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-sccp,adce,simplifycfg" test/$1_c.ll -S -o test/$1_parsed.ll &&
clang-15 test/$1_parsed.ll coolrt.o -lm -Wl,--unresolved-symbols=ignore-in-object-files -o test/a.out &&
test/a.out
#  ------- this is for sccp

# this is for cse ---------
# clang-15 test/$1.c -c -O0 -S -Xclang -disable-O0-optnone -emit-llvm -o test/$1.ll
#opt-15 -passes="mem2reg" test/$1.ll -S -o test/$1_c.ll &&
# opt-15 -load-pass-plugin=build/libUnitProject.so -passes="early-cse,adce" test/$1_c.ll -S -o test/$1_parsed.ll && cp test/$1_parsed.ll test/earlycse.ll &&
#opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-cse,adce" test/$1_c.ll -S -o test/$1_parsed.ll &&
#clang-15 test/$1_parsed.ll coolrt.o -Wl,--unresolved-symbols=ignore-in-object-files -o test/a.out &&
#test/a.out
# --------- this is for cse

# echo "generating correct output..."
# clang-15 test/$1.ll -lm -o test/a.out
# test/a.out
# export a=$?
# echo "returned value:"
# echo ${a}
