#!/usr/bin/sh
clang-15 test/$1.ll coolrt.o -Wl,--unresolved-symbols=ignore-in-object-files -o test/gt.out
test/gt.out
export a=$?
echo "returned value:"
echo ${a}
