#!/bin/bash

REMILL_PATH="/path/to/remill/include"
LLVM_PATH="/path/to/llvm/"
TBAAFLAG=true

LLVM_OPTS_32="-isysroot $(xcrun -sdk macosx --show-sdk-path) -I $LLVM_PATH/include/c++/v1/ -fno-discard-value-names -fstrict-aliasing -mno-sse -mno-sse2 -mno-mmx -mtune=generic -fno-vectorize -fno-slp-vectorize -std=c++17 -O3 -g0 -fno-exceptions -fno-rtti -mllvm -enable-tbaa=true -DADDRESS_SIZE_BITS=32 -m32"
LLVM_OPTS_64="-isysroot $(xcrun -sdk macosx --show-sdk-path) -I $LLVM_PATH/include/c++/v1/ -fno-discard-value-names -fstrict-aliasing -mno-sse -mno-sse2 -mno-mmx -mtune=generic -fno-vectorize -fno-slp-vectorize -std=c++17 -O3 -g0 -fno-exceptions -fno-rtti -mllvm -enable-tbaa=true -DADDRESS_SIZE_BITS=64"

# Generate the LLVM-IR files
$LLVM_PATH/bin/clang++ VMProtectHelpers.cpp -emit-llvm -S -I $REMILL_PATH $LLVM_OPTS_32 -o VMProtectHelpers_32.ll
$LLVM_PATH/bin/clang++ VMProtectHelpers.cpp -emit-llvm -S -I $REMILL_PATH $LLVM_OPTS_64 -o VMProtectHelpers_64.ll

# Generate the BITCODE files
$LLVM_PATH/bin/clang++ VMProtectHelpers.cpp -emit-llvm -c -I $REMILL_PATH $LLVM_OPTS_32 -o VMProtectHelpers_32.bc
$LLVM_PATH/bin/clang++ VMProtectHelpers.cpp -emit-llvm -c -I $REMILL_PATH $LLVM_OPTS_64 -o VMProtectHelpers_64.bc