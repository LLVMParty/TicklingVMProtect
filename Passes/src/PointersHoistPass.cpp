#include <Passes/PointersHoistPass.hpp>
#include <Utilities/Utility.hpp>

#include <llvm/IR/InstIterator.h>

#include <sstream>

// https://llvm.org/docs/WritingAnLLVMPass.html

namespace {

struct PointersHoistPass : llvm::FunctionPass {
  static char ID;

  OptimizationGuide *mOG = nullptr;
  const llvm::GlobalVariable *mFS = nullptr;
  const llvm::GlobalVariable *mGS = nullptr;
  const llvm::GlobalVariable *mRAM = nullptr;

  PointersHoistPass() : llvm::FunctionPass(ID) {}
  PointersHoistPass(OptimizationGuide &OG) : llvm::FunctionPass(ID), mOG(&OG) {}

  bool HoistChain(llvm::Instruction *P, llvm::Instruction *insertionPoint) {
    // Determine if the chain can be hoisted to the entry block:
    // - uses loads from the entry block (TODO verify how to support this, removed for the moment)
    // - uses function arguments
    // - uses only binary operators
    bool hoisted = false;
    if (const auto *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(P->stripPointerCasts())) {
      // Skip if it is not accessing 2 indices
      if (GEP->getNumIndices() != 2)
        return hoisted;
      // Fetch the base and index
      const auto *base = GEP->getPointerOperand();
      const auto *idx = GEP->getOperand(2);
      // Skip if not accessing a known segment
      if (base != mRAM && base != mGS && base != mFS)
        return hoisted;
      // Proceed with the hoisting requirements check
      bool canBeHoisted = true;
      std::set<const llvm::Value *> Known;
      std::stack<const llvm::Value *> Worklist{{idx}};
      while (!Worklist.empty() && canBeHoisted) {
        // Fetch the value
        const auto *V = Worklist.top();
        Worklist.pop();
        // Skip if known
        if (Known.count(V))
          continue;
        Known.insert(V);
        // Check if supported
        if (const auto *B = llvm::dyn_cast<llvm::BinaryOperator>(V)) {
          for (size_t i = 0; i < B->getNumOperands(); i++) {
            if (const auto *O = llvm::dyn_cast<llvm::Instruction>(B->getOperand(i)))
              Worklist.push(O);
            else if (llvm::isa<llvm::PHINode>(B->getOperand(i)))
              canBeHoisted = false;
          }
        } else if (llvm::isa<llvm::ExtractValueInst>(V)) {
        } else {
          canBeHoisted = false;
        }
      }
      // Hoist the chain
      if (canBeHoisted) {
        // Clone the pointer calculation chain
        auto *clonedP = cloneInstructionsChain(P, insertionPoint);
        // Replace all the uses
        P->replaceAllUsesWith(clonedP);
        // Delete the useless instruction(s)
        P->eraseFromParent();
        // Mark as hoisted
        hoisted = true;
      }
    }
    return hoisted;
  }

  bool runOnFunction(llvm::Function &F) override {
    bool hasChanged = false;
    // Fetch the RAM pointer
    const auto *M = F.getParent();
    mFS = M->getGlobalVariable("FS");
    mGS = M->getGlobalVariable("GS");
    mRAM = M->getGlobalVariable("RAM");
    // Find the stack pointer argument
    const llvm::Argument *stackPointer = nullptr;
    for (const auto &Arg : F.args())
      if (Arg.getName() == "rsp" || Arg.getName() == "esp") {
        stackPointer = &Arg;
        break;
      }
    // Sanity check
    if (!stackPointer || !mRAM || !mFS || !mGS) {
      std::stringstream ss;
      ss << __func__;
      ss << ": missing RAM or stack pointer!";
      llvm::report_fatal_error(ss.str());
    }
    // Find the best insertion point
    auto *entryBB = &F.getEntryBlock();
    auto *insertionPoint = entryBB->getFirstNonPHIOrDbg();
    for (auto &U : stackPointer->uses()) {
      if (auto *L = llvm::dyn_cast<llvm::LoadInst>(&U))
        if (L->getParent() == entryBB) {
          insertionPoint = L;
          break;
        }
    }
    // If the entry block has only a jump, insert a dummy insertion point
    if (insertionPoint == entryBB->getTerminator()) {
      // Create a dummy instruction
      auto *True = llvm::ConstantInt::getTrue(F.getContext());
      insertionPoint = llvm::BinaryOperator::CreateNot(True, "", insertionPoint);
    }
    // Find all the pointers in the function
    std::set<const llvm::Value *> pointers;
    for (llvm::inst_iterator I = inst_begin(F), E = inst_end(F); I != E; I++) {
      // Skip the instruction if it's part of the entry block
      if (I->getParent() == entryBB)
        continue;
      // Match a 'load' or 'store' instruction
      if (const auto *LI = llvm::dyn_cast<llvm::LoadInst>(&*I))
        pointers.insert(LI->getPointerOperand());
      else if (const auto *SI = llvm::dyn_cast<llvm::StoreInst>(&*I))
        pointers.insert(SI->getPointerOperand());
    }
    // Hoist the pointers to the entry block
    for (const auto *pointer : pointers) {
      if (const auto *P = llvm::dyn_cast<llvm::Instruction>(pointer))
        hasChanged |= HoistChain(const_cast<llvm::Instruction *>(P), insertionPoint);
    }
    // Notify about the changes
    return hasChanged;
  }

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const override { AU.setPreservesCFG(); }

};

char PointersHoistPass::ID = 0;

static llvm::RegisterPass<PointersHoistPass> X("PointersHoistPass",
  "Hoists the pointer calculation to the entry block",
  false /* Only looks at CFG */,
  false /* Analysis Pass */);

}

llvm::FunctionPass *getPointersHoistPass(OptimizationGuide &OG) { return new PointersHoistPass(OG); }