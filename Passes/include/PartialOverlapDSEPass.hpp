#pragma once

#include <llvm/Pass.h>

#include <Lifter/Lifter.hpp>

llvm::FunctionPass *getPartialOverlapDSEPass(OptimizationGuide &OG);