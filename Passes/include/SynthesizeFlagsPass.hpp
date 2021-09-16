#pragma once

#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Pass.h>

#include <souper/Extractor/Solver.h>
#include <souper/Inst/Inst.h>

#include <filesystem>

#include <Lifter/Lifter.hpp>
#include <Synthesis/EnumerativeSynthesis.hpp>

llvm::FunctionPass *getSynthesizeFlagsPass(OptimizationGuide &G);