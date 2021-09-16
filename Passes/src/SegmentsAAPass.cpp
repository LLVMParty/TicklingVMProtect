#include <Passes/SegmentsAAPass.hpp>
#include <llvm/IR/PatternMatch.h>
#include <iostream>
#include <vector>
#include <stack>
#include <set>

using namespace llvm::PatternMatch;

SegmentsAAResult::SegmentsAAResult(const GlobalPointers &GP) : mGP(GP) {}

bool SegmentsAAResult::invalidate(llvm::Function &F, const llvm::PreservedAnalyses &PA, llvm::FunctionAnalysisManager::Invalidator &Inv) {
  return false;
}

llvm::AliasResult SegmentsAAResult::alias(const llvm::MemoryLocation &locA, const llvm::MemoryLocation &locB, llvm::AAQueryInfo &AAQI) {
  // Determine the pointers types
  auto ATy = getPointerType(locA.Ptr);
  auto BTy = getPointerType(locB.Ptr);
  // Cache the results
  // mCache[locA.Ptr] = ATy;
  // mCache[locB.Ptr] = BTy;
  // Debug dump
  // Check if they access different segments
  if ((ATy != PointerType::TyUNK) && (BTy != PointerType::TyUNK) && (ATy != BTy)) {
    // debugDump(locA.Ptr, locB.Ptr, ATy, BTy);
    return llvm::AliasResult::NoAlias;
  }
  // Fallback to the default alias analysis
  return AAResultBase::alias(locA, locB, AAQI);
}

void SegmentsAAResult::debugDump(const llvm::Value *PtrA, const llvm::Value *PtrB, PointerType ATy, PointerType BTy) const {
  // Dump the function
  if (auto *I = llvm::dyn_cast<llvm::Instruction>(PtrA))
    I->getFunction()->dump();
  // Dump the location A information
  llvm::outs() << "Ptr: ";
  PtrA->dump();
  llvm::outs() << "ATy: ";
  switch (ATy) {
    case PointerType::TyUNK: { llvm::outs() << "TyUNK"; } break;
    case PointerType::TyIND: { llvm::outs() << "TyIND"; } break;
    case PointerType::TyARR: { llvm::outs() << "TyARR"; } break;
    case PointerType::TyVIR: { llvm::outs() << "TyVIR"; } break;
    case PointerType::TySS: { llvm::outs() << "TySS"; } break;
    case PointerType::TyGS: { llvm::outs() << "TyGS"; } break;
    case PointerType::TyFS: { llvm::outs() << "TyFS"; } break;
  }
  llvm::outs() << "\n";
  // Dump the location B information
  llvm::outs() << "Ptr: ";
  PtrB->dump();
  llvm::outs() << "BTy: ";
  switch (BTy) {
    case PointerType::TyUNK: { llvm::outs() << "TyUNK"; } break;
    case PointerType::TyIND: { llvm::outs() << "TyIND"; } break;
    case PointerType::TyARR: { llvm::outs() << "TyARR"; } break;
    case PointerType::TyVIR: { llvm::outs() << "TyVIR"; } break;
    case PointerType::TySS: { llvm::outs() << "TySS"; } break;
    case PointerType::TyGS: { llvm::outs() << "TyGS"; } break;
    case PointerType::TyFS: { llvm::outs() << "TyFS"; } break;
  }
  llvm::outs() << "\n";
}

PointerType SegmentsAAResult::getPointerType(const llvm::Value *V) const {
  // Lambda function to identify a stack argument
  auto isStackArgument = [&](const llvm::Value *B, const std::set<const llvm::Value *> &chain) {
    llvm::Value *V;
    llvm::ConstantInt *C;
    // First we check for direct [rsp] access
    if (m_Load(m_Value(V)).match(B)) {
      if (const auto *A = llvm::dyn_cast<llvm::Argument>(V))
        if (mStackPointers.count(A->getName().str()))
          return true;
    } else if (const auto *A = llvm::dyn_cast<llvm::Argument>(B)) {
      if (mStackPointers.count(A->getName().str()))
        return true;
    }
    // Then we check for a non-negative stack pattern in the chain
    // - we support the direct access [rsp + displacement]
    // - we support the array access [rsp + displacement + index]
    for (const auto *O : chain) {
      if (m_Add(m_Load(m_Value(V)), m_ConstantInt(C)).match(O)) {
        if (const auto *A = llvm::dyn_cast<llvm::Argument>(V))
          if (mStackPointers.count(A->getName().str()))
            if (!C->isNegative())
              return true;
      } else if (m_Add(m_Value(V), m_ConstantInt(C)).match(O)) {
        if (const auto *A = llvm::dyn_cast<llvm::Argument>(V))
          if (mStackPointers.count(A->getName().str()))
            if (!C->isNegative())
              return true;
      }
    }
    return false;
  };
  // Lambda function to identify a stack slot
  auto isStackSlot = [&](const llvm::Value *B) {
    llvm::Value *V;
    llvm::ConstantInt *C;
    if (m_Add(m_Load(m_Value(V)), m_ConstantInt(C)).match(B)) {
      if (const auto *A = llvm::dyn_cast<llvm::Argument>(V))
        if (mStackPointers.count(A->getName().str()))
          if (C->isNegative())
            return true;
    } else if (m_Add(m_Value(V), m_ConstantInt(C)).match(B)) {
      if (const auto *A = llvm::dyn_cast<llvm::Argument>(V))
        if (mStackPointers.count(A->getName().str()))
          if (C->isNegative())
            return true;
    }
    return false;
  };
  // Lambda function to identify a virtual stack slot
  auto isVirtualStackSlot = [&](const llvm::Value *B) {
    llvm::Value *V;
    llvm::ConstantInt *C;
    if (m_Add(m_Load(m_Value(V)), m_ConstantInt(C)).match(B)) {
      if (const auto *A = llvm::dyn_cast<llvm::Argument>(V))
        if (A->getName() == "vsp")
          if (C->isNegative())
            return true;
    }
    return false;
  };
  // Lambda function to identify a stack array
  auto isStackArray = [&](const llvm::Value *I, const std::set<const llvm::Value *> &chain) {
    // We want to find an increasing/decreasing PHI node (loop)
    // %100 = add i64 %2, -96
    // %157 = phi i64 [ %177, %214 ], [ 0, %140 ]
    // %177 = add i64 %157, 1
    // %210 = shl i64 %157, 2
    // %211 = add i64 %210, %100
    // %212 = getelementptr inbounds [0 x i8], [0 x i8]* @RAM, i64 0, i64 %211
    for (const auto *V : chain) {
      if (const auto *PHI = llvm::dyn_cast<llvm::PHINode>(V)) {
        auto numIncoming = PHI->getNumIncomingValues();
        if (numIncoming == 2) {
          bool initFound = false;
          bool stepFound = false;
          for (unsigned int i = 0; i < numIncoming; i++) {
            const auto *IV = PHI->getIncomingValue(i);
            if (const auto *BinOp = llvm::dyn_cast<llvm::BinaryOperator>(IV)) {
              if (BinOp->getOpcode() == llvm::Instruction::Add || BinOp->getOpcode() == llvm::Instruction::Sub)
                if (BinOp->getOperand(0) == PHI)
                  if (llvm::isa<llvm::ConstantInt>(BinOp->getOperand(1)))
                    stepFound = true;
            } else if (llvm::isa<llvm::ConstantInt>(IV)) {
              initFound = true;
            } else if (isStackSlot(IV)) {
              initFound = true;
            }
          }
          if (initFound && stepFound)
            return true;
        }
      }
    }
    return false;
  };
  // Lambda function to resolve an indirect type
  auto getIndirectPointerType = [&](const llvm::Value *B) {
    if (const auto *A = llvm::dyn_cast<llvm::Argument>(B)) {
      if (mStackPointers.count(A->getName().str())) {
        // Loading from the stack pointer => TySS
        return PointerType::TySS;
      } else if (A->getName() == "vsp") {
        // Loading from a passing slot => TyVIR
        return PointerType::TyVIR;
      } else {
        // Loading from a non stack pointer register => TyIND
        return PointerType::TyIND;
      }
    } else {
      // Loading from a pointer derived from TyIND/TyGS/TyFS => TyIND
      auto PtrTy = getPointerType(B);
      switch (PtrTy) {
        case PointerType::TyIND:
        case PointerType::TyGS:
        case PointerType::TyFS: {
          return PointerType::TyIND;
        } break;
        default: break;
      }
    }
    // Loading from a pointer derived from TySS/TyVIR/TyARR => TyUNK
    return PointerType::TyUNK;
  };
  // Check if the pointer is cached
  // if (mCache.count(V))
    // return mCache.at(V);
  // Strip the pointer casts as they bring no information
  auto *P = V->stripPointerCasts();
  // A 'getelementptr' or 'constantexpr' instruction is expected
  if (const auto *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(P)) {
    if (const auto *GV = llvm::dyn_cast<llvm::GlobalVariable>(GEP->getPointerOperand())) {
      if (mGP.GS && GV == mGP.GS)
        return PointerType::TyGS;
      if (mGP.FS && GV == mGP.FS)
        return PointerType::TyFS;
      if (mGP.RAM && GV == mGP.RAM && GEP->getNumIndices() == 2) {
        // Fetch the index
        const auto *idx = GEP->getOperand(2);
        // Slice the index to detect the base value
        std::stack<const llvm::Value *> Worklist{{idx}};
        std::vector<const llvm::Value *> Bases;
        std::set<const llvm::Value *> Known;
        while (!Worklist.empty()) {
          // Extract the current value
          auto *V = Worklist.top();
          Worklist.pop();
          // Skip the known values
          if (Known.count(V))
            continue;
          Known.insert(V);
          // Detect the expected instructions
          if (const auto *L = llvm::dyn_cast<llvm::LoadInst>(V)) {
            Bases.push_back(L->getPointerOperand());
            continue;
          } else if (const auto *A = llvm::dyn_cast<llvm::Argument>(V)) {
            Bases.push_back(A);
            continue;
          } else if (const auto *C = llvm::dyn_cast<llvm::CallInst>(V)) {
            const auto *CF = C->getCalledFunction();
            if (CF) {
              if (CF->getName().startswith("llvm.ctpop.")) {
              } else if (CF->getName().startswith("llvm.fshl")) {
              } else if (CF->getName().startswith("llvm.fshr")) {
              } else {
                llvm::outs() << "Unknown pointer call instruction:";
                V->dump();
                return PointerType::TyUNK;
              }
            } else {
              llvm::outs() << "Unknown pointer call instruction:";
              V->dump();
              return PointerType::TyUNK;
            }
          } else if (llvm::isa<llvm::BinaryOperator>(V)) {
          } else if (llvm::isa<llvm::PHINode>(V)) {
          } else if (llvm::isa<llvm::TruncInst>(V)) {
          } else if (llvm::isa<llvm::ZExtInst>(V)) {
          } else if (llvm::isa<llvm::SExtInst>(V)) {
          } else if (llvm::isa<llvm::SelectInst>(V)) {
          } else if (llvm::isa<llvm::ICmpInst>(V)) {
          } else {
            llvm::outs() << "Unknown pointer instruction:";
            V->dump();
            return PointerType::TyUNK;
          }
          // Detect the source operands
          if (const auto *I = llvm::dyn_cast<llvm::Instruction>(V)) {
            for (size_t i = 0; i < I->getNumOperands(); i++)
              if (const auto *O = llvm::dyn_cast<llvm::Instruction>(I->getOperand(i)))
                Worklist.push(O);
              else if (const auto *O = llvm::dyn_cast<llvm::Argument>(I->getOperand(i)))
                Worklist.push(O);
          }
        }
        // If we got a loop chain, we can't say anything
        for (const auto *B : Bases)
          if (B == V)
            return PointerType::TyUNK;
        // Determine if we got consistent bases
        if (Bases.empty()) {
          // llvm::errs() << "[SGMTAA] Pointer without base found: ";
          // GEP->dump();
        } else {
          // Collect the pointer types
          std::set<PointerType> types;
          for (const auto *B : Bases)
            types.insert(getIndirectPointerType(B));
          // We need to be strict with the stack pointers
          if (types.count(PointerType::TySS)) {
            // Check if we detected a stack argument
            if (isStackArgument(idx, Known))
              return PointerType::TyIND;
            // Check if we detected a stack array
            if (isStackArray(idx, Known))
              return PointerType::TyARR;
            // Check if we detected a stack slot
            if (isStackSlot(idx))
              return PointerType::TySS;
            // We can just say this is a stack access
            return PointerType::TySS;
          }
          // We detect a virtual stack slot
          else if (types.count(PointerType::TyVIR)) {
            if (isVirtualStackSlot(idx))
              return PointerType::TyVIR;
            // We can't say anything sure: TyUNK for safety
            return PointerType::TyUNK;
          }
          // All good if we have a single provenance
          else if (types.size() == 1) {
            return *types.begin();
          }
        }
      }
    } else if (const auto *ARG = llvm::dyn_cast<llvm::Argument>(GEP->getPointerOperand())) {
      if (ARG->getName() == "slots")
        return PointerType::TyVIR;
      // We can't say anything sure: TyUNK for safety
      return PointerType::TyUNK;
    }
  } else if (const auto *CE = llvm::dyn_cast<llvm::ConstantExpr>(P)) {
    if (CE->getOpcode() == llvm::Instruction::GetElementPtr) {
      if (const auto *GV = llvm::dyn_cast<llvm::GlobalVariable>(CE->getOperand(0))) {
        if (mGP.GS && GV == mGP.GS)
          return PointerType::TyGS;
        if (mGP.FS && GV == mGP.FS)
          return PointerType::TyFS;
        if (mGP.RAM && GV == mGP.RAM)
          return PointerType::TyIND;
        // We can't say anything sure: TyUNK for safety
        return PointerType::TyUNK;
      }
    }
  }
  // Nothing can be said about the type of the pointer
  return PointerType::TyUNK;
}

char SegmentsAAWrapperPass::ID = 0;

SegmentsAAWrapperPass::SegmentsAAWrapperPass() : llvm::ImmutablePass(ID) {}

SegmentsAAResult& SegmentsAAWrapperPass::getResult() { return *mResult; }

const SegmentsAAResult& SegmentsAAWrapperPass::getResult() const { return *mResult; }

bool SegmentsAAWrapperPass::doInitialization(llvm::Module &M) {
  GlobalPointers GP {
    .RAM = M.getGlobalVariable("RAM"),
    .GS = M.getGlobalVariable("GS"),
    .FS = M.getGlobalVariable("FS")
  };
  mResult.reset(new SegmentsAAResult(GP));
  return false;
}

bool SegmentsAAWrapperPass::doFinalization(llvm::Module &M) {
  mResult.reset();
  return false;
}

void SegmentsAAWrapperPass::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.setPreservesAll();
}

llvm::ImmutablePass *createSegmentsAAWrapperPass() { return new SegmentsAAWrapperPass(); }

static llvm::RegisterPass<SegmentsAAWrapperPass> SegmentsAliasAnalysis("-saa", "NoAlias for pointers in different segments", false, true);
