#pragma once

#include <llvm/IR/CFG.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Pass.h>

#include <souper/Extractor/Candidates.h>
#include <souper/Extractor/ExprBuilder.h>
#include <souper/Extractor/Solver.h>
#include <souper/Inst/Inst.h>
#include <souper/KVStore/KVStore.h>

#include <filesystem>
#include <iostream>
#include <set>
#include <stack>
#include <vector>

#include <Lifter/Lifter.hpp>
#include <Utilities/Utility.hpp>

llvm::FunctionPass *getConstantConcretizationPassPass(OptimizationGuide &OG);
