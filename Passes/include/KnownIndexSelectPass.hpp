#pragma once

#include <llvm/Analysis/AssumptionCache.h>
#include <llvm/Analysis/DemandedBits.h>
#include <llvm/Analysis/ValueTracking.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Pass.h>
#include <llvm/Support/KnownBits.h>

#include <Lifter/Lifter.hpp>

llvm::FunctionPass *getKnownIndexSelectPassPass(OptimizationGuide &OG);