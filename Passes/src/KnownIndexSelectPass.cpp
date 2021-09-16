#include <Passes/KnownIndexSelectPass.hpp>

using namespace llvm;

// https://llvm.org/docs/WritingAnLLVMPass.html
// http://lists.llvm.org/pipermail/llvm-dev/2020-June/142426.html

namespace {

struct KnownIndexSelectPass : llvm::FunctionPass {
  static char ID;

  OptimizationGuide *mOG = nullptr;

  KnownIndexSelectPass() : FunctionPass(ID) {}
  KnownIndexSelectPass(OptimizationGuide &OG) : FunctionPass(ID), mOG(&OG) {}

  bool runOnFunction(Function &F) override {
    bool HasChanged = false;
    const llvm::DataLayout &DL = F.getParent()->getDataLayout();
    // Load the RAM pointer
    auto *RAM = F.getParent()->getGlobalVariable("RAM");
    if (!RAM)
      llvm::report_fatal_error("KnownIndexSelectPass: 'RAM' pointer is missing!");
    // Loop all the basic blocks and instructions
    for (auto &BB : F) {
      for (auto &I : BB) {
        // Check if we found a 'load' instruction
        if (auto *Load = llvm::dyn_cast<llvm::LoadInst>(&I)) {
          if (auto *BitCast = llvm::dyn_cast<llvm::BitCastInst>(Load->getPointerOperand())) {
            if (auto *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(BitCast->getOperand(0))) {
              // Check if it a RAM access
              if ((GEP->getPointerOperand() == RAM) && (GEP->getNumIndices() == 2)) {
                // Determine if the index is an 'add' instruction
                if (auto *BO = llvm::dyn_cast<llvm::BinaryOperator>(GEP->getOperand(2))) {
                  if (BO->getOpcode() == llvm::Instruction::BinaryOps::Add) {
                    // Check if one of the operands may be folded to 2 known values
                    auto *Op1 = BO->getOperand(0);
                    auto *Op2 = BO->getOperand(1);
                    auto *Op1Ty = Op1->getType();
                    auto *Op2Ty = Op2->getType();
                    // Compute the known bits (zeros and ones)
                    llvm::KnownBits Op1KnownBits(Op1Ty->getIntegerBitWidth());
                    llvm::KnownBits Op2KnownBits(Op2Ty->getIntegerBitWidth());
                    llvm::computeKnownBits(Op1, Op1KnownBits, DL);
                    llvm::computeKnownBits(Op2, Op2KnownBits, DL);
                    // Determine the unknown bits mask
                    auto Op1UnknownBits = ~(Op1KnownBits.Zero | Op1KnownBits.One);
                    auto Op2UnknownBits = ~(Op2KnownBits.Zero | Op2KnownBits.One);
                    // Determine if we have a value with 1 unknown bit
                    if (Op1UnknownBits.isPowerOf2() && !Op2UnknownBits.isPowerOf2()) {
                      // Fine, we'll handle the case
                    } else if (Op2UnknownBits.isPowerOf2() && !Op1UnknownBits.isPowerOf2()) {
                      // Swap the values
                      auto *OpT = Op1;
                      Op1 = Op2;
                      Op2 = OpT;
                      auto KbT = Op1KnownBits;
                      Op1KnownBits = Op2KnownBits;
                      Op2KnownBits = KbT;
                    } else {
                      // Stop the optimization
                      continue;
                    }
                    // Get the 2 possible constant values
                    auto *Const1 = llvm::ConstantInt::get(Op1Ty, Op1KnownBits.getMinValue());
                    auto *Const2 = llvm::ConstantInt::get(Op1Ty, Op1KnownBits.getMaxValue());
                    // Generate the 2 possible indexes
                    auto *Index1 = llvm::BinaryOperator::CreateAdd(Op2, Const1, "", Load);
                    auto *Index2 = llvm::BinaryOperator::CreateAdd(Op2, Const2, "", Load);
                    // Generate the 2 possible 'getelementptr' instructions
                    std::vector<llvm::Value *> Indexes1{GEP->getOperand(1), Index1};
                    auto *GEP1 = llvm::GetElementPtrInst::CreateInBounds(GEP->getPointerOperand(),
                                                                         Indexes1, "", Load);
                    std::vector<llvm::Value *> Indexes2{GEP->getOperand(1), Index2};
                    auto *GEP2 = llvm::GetElementPtrInst::CreateInBounds(GEP->getPointerOperand(),
                                                                         Indexes2, "", Load);
                    // Generate the 2 possible 'bitcast' instructions
                    auto *BC1 = new llvm::BitCastInst(GEP1, BitCast->getType(), "", Load);
                    auto *BC2 = new llvm::BitCastInst(GEP2, BitCast->getType(), "", Load);
                    // Generate the 2 possible 'load' instructions
                    auto *L1 =
                        new llvm::LoadInst(BC1->getType()->getPointerElementType(), BC1, "", Load);
                    auto *L2 =
                        new llvm::LoadInst(BC2->getType()->getPointerElementType(), BC2, "", Load);
                    // Generate a new 'icmp' instruction
                    auto *ICmp = llvm::CmpInst::Create(
                        llvm::Instruction::ICmp, llvm::ICmpInst::ICMP_EQ, Op1, Const1, "", Load);
                    // Generate a new 'select' instruction
                    auto *Select = llvm::SelectInst::Create(ICmp, L1, L2, "", Load);
                    // Replace the original 'getelementptr'
                    Load->replaceAllUsesWith(Select);
                    HasChanged = true;
                  }
                }
                // Determine if the index is a 'select' instruction
                else if (auto *SEL = llvm::dyn_cast<llvm::SelectInst>(GEP->getOperand(2))) {
                  // Generate the new pointers calculations
                  std::vector<llvm::Value *> Indices0{GEP->getOperand(1), SEL->getTrueValue()};
                  std::vector<llvm::Value *> Indices1{GEP->getOperand(1), SEL->getFalseValue()};
                  auto *Ptr0 = llvm::GetElementPtrInst::CreateInBounds(GEP->getPointerOperand(), Indices0, "", Load);
                  auto *Ptr1 = llvm::GetElementPtrInst::CreateInBounds(GEP->getPointerOperand(), Indices1, "", Load);
                  // Generate the new cast instructions
                  auto *Cast0 = new llvm::BitCastInst(Ptr0, BitCast->getType(), "", Load);
                  auto *Cast1 = new llvm::BitCastInst(Ptr1, BitCast->getType(), "", Load);
                  // Generate the new load instructions
                  auto *Load0 = new llvm::LoadInst(Cast0->getType()->getPointerElementType(), Cast0, "", Load);
                  auto *Load1 = new llvm::LoadInst(Cast1->getType()->getPointerElementType(), Cast1, "", Load);
                  // Select between the 2 values
                  auto *Select = llvm::SelectInst::Create(SEL->getCondition(), Load0, Load1, "", Load);
                  // Replace the old loaded value with the new one
                  Load->replaceAllUsesWith(Select);
                  HasChanged = true;
                }
              }
            }
          }
        }
      }
    }
    if (mOG)
      mOG->HasChanged |= HasChanged;
    return HasChanged;
  }

  void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.setPreservesCFG();
    AU.addRequired<AssumptionCacheTracker>();
  }

}; // end of struct KnownIndexSelectPass

char KnownIndexSelectPass::ID = 0;

static RegisterPass<KnownIndexSelectPass>
    X("KnownIndexSelectPass", "http://lists.llvm.org/pipermail/llvm-dev/2020-June/142426.html",
      false /* Only looks at CFG */, false /* Analysis Pass */);

} // end of anonymous namespace

llvm::FunctionPass *getKnownIndexSelectPassPass(OptimizationGuide &OG) {
  return new KnownIndexSelectPass(OG);
}
