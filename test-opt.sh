#!/usr/bin/sh
# Use this script to run MP5!
cd build
make clean && make -j
cd ..
export LLVM_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-15
opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-licm-multiple,mem2reg,unit-sccp,adce" test/$1.ll -S -o test/$1_parsed.ll
# FIXME - opt gives unknown file format
clang-15 test/$1_parsed.ll coolrt.o -Wl,--unresolved-symbols=ignore-in-object-files -o test/a.out

echo "returned value:"
test/a.out
