#include <Passes/SynthesizeFlagsPass.hpp>
#include <Synthesis/Solver.hpp>

namespace {

// Utility functions

std::unique_ptr<souper::SMTLIBSolver> GetUnderlyingSolver() {
  std::string Z3PathStr("/usr/local/bin/z3");
  if (!std::filesystem::exists(Z3PathStr))
    llvm::report_fatal_error("Solver '" + Z3PathStr +
                             "' does not exist or is not executable.\nSet path "
                             "by -z3-path=<z3_binary_path>");
  return souper::createZ3Solver(souper::makeExternalSolverProgram(Z3PathStr), false);
}

struct SynthesizeFlagsPass : llvm::FunctionPass {

  // Optimization state

  OptimizationGuide *mG = nullptr;

  // Replaced values

  std::map<souper::Inst *, llvm::Value *> ReplacedValues;

  // Generated instructions

  std::set<llvm::Value *> ToBeSkipped;

  // Pass ID

  static char ID;

  // Utilities

  souper::CandidateReplacement *getReplacement(souper::FunctionCandidateSet &CS,
                                               llvm::Instruction *I) {
    for (auto &Block : CS.Blocks) {
      for (auto &Replacement : Block->Replacements) {
        if ((Replacement.Origin == I) &&
            (Replacement.Mapping.LHS->Width == I->getType()->getIntegerBitWidth())) {
          return &Replacement;
        }
      }
    }
    return nullptr;
  }

  llvm::Value *getOperand(souper::Inst *I, unsigned index, llvm::Instruction *ReplacedInst,
                          souper::ExprBuilderContext &EBC, llvm::DominatorTree &DT,
                          std::map<souper::Inst *, llvm::Value *> &ReplacedValues,
                          llvm::IRBuilder<> &Builder, llvm::Module *M) {
    llvm::Value *Result = nullptr;
    if (souper::Inst::isOverflowIntrinsicMain(I->K)) {
      assert(I->Ops.size() == 2 && I->Ops[0]->Ops.size() == 2);
      Result = getValue(I->Ops[0]->Ops[index], ReplacedInst, EBC, DT, ReplacedValues, Builder, M);
    } else {
      Result = getValue(I->Ops[index], ReplacedInst, EBC, DT, ReplacedValues, Builder, M);
    }
    return Result;
  }

  llvm::Value *getValue(souper::Inst *I, llvm::Instruction *ReplacedInst,
                        souper::ExprBuilderContext &EBC, llvm::DominatorTree &DT,
                        std::map<souper::Inst *, llvm::Value *> &ReplacedValues,
                        llvm::IRBuilder<> &Builder, llvm::Module *M) {

    auto *T = llvm::Type::getIntNTy(ReplacedInst->getContext(), I->Width);

    if (I->K == souper::Inst::Const)
      return llvm::ConstantInt::get(T, I->Val);

    if (ReplacedValues.find(I) != ReplacedValues.end())
      return ReplacedValues[I];

    if (I->Origins.size() > 0) {
      // if there's an Origin, we're connecting to existing code
      for (auto V : I->Origins) {
        if (V->getType() != T)
          continue; // TODO: can we assert this doesn't happen?
        if (llvm::isa<llvm::Argument>(V) || llvm::isa<llvm::Constant>(V))
          return V;
        if (auto IP = llvm::dyn_cast<llvm::Instruction>(V)) {
          if (DT.dominates(IP, ReplacedInst)) {
            return V;
          } else {
            if (DebugLevel > 2)
              llvm::errs() << "dominance check failed\n";
          }
        } else {
          llvm::report_fatal_error("Unhandled LLVM instruction in getValue()");
        }
      }
      if (DebugLevel > 2)
        llvm::errs() << "returning nullptr from getValue()\n";
      return nullptr;
    }

    auto *V0 = getOperand(I, 0, ReplacedInst, EBC, DT, ReplacedValues, Builder, M);
    if (!V0)
      return nullptr;

    switch (I->Ops.size()) {
    case 1:
      switch (I->K) {
      case souper::Inst::SExt:
        return Builder.CreateSExt(V0, T);
      case souper::Inst::ZExt:
        return Builder.CreateZExt(V0, T);
      case souper::Inst::Trunc:
        return Builder.CreateTrunc(V0, T);
      case souper::Inst::CtPop: {
        auto *F = llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::ctpop, T);
        return Builder.CreateCall(F, V0);
      }
      case souper::Inst::BSwap: {
        auto *F = llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::bswap, T);
        return Builder.CreateCall(F, V0);
      }
      case souper::Inst::BitReverse: {
        auto *F = llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::bitreverse, T);
        return Builder.CreateCall(F, V0);
      }
      case souper::Inst::Cttz: {
        auto *F = llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::cttz, T);
        // According to LLVM LangRef, the second argument of cttz i1
        // <is_zero_undef> must be a constant and is a flag to indicate
        // whether the intrinsic should ensure that a zero as the first
        // argument produces a defined result.
        return Builder.CreateCall(
            F, {V0, llvm::ConstantInt::get(V0->getContext(), llvm::APInt(1, 0))});
      }
      case souper::Inst::Ctlz: {
        // Ditto
        auto *F = llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::ctlz, T);
        return Builder.CreateCall(
            F, {V0, llvm::ConstantInt::get(V0->getContext(), llvm::APInt(1, 0))});
      }
      default:
        break;
      }
    case 2: {
      auto *V1 = getOperand(I, 1, ReplacedInst, EBC, DT, ReplacedValues, Builder, M);
      if (!V1)
        return nullptr;
      switch (I->K) {
      case souper::Inst::And:
        if (llvm::isa<llvm::Constant>(V0))
          return Builder.CreateAnd(V1, V0);
        return Builder.CreateAnd(V0, V1);
      case souper::Inst::Or:
        if (llvm::isa<llvm::Constant>(V0))
          return Builder.CreateOr(V1, V0);
        return Builder.CreateOr(V0, V1);
      case souper::Inst::Xor:
        if (llvm::isa<llvm::Constant>(V0))
          return Builder.CreateXor(V1, V0);
        return Builder.CreateXor(V0, V1);
      case souper::Inst::Add:
        if (llvm::isa<llvm::Constant>(V0))
          return Builder.CreateAdd(V1, V0);
        return Builder.CreateAdd(V0, V1);
      case souper::Inst::Sub:
        return Builder.CreateSub(V0, V1);
      case souper::Inst::Mul:
        if (llvm::isa<llvm::Constant>(V0))
          return Builder.CreateMul(V1, V0);
        return Builder.CreateMul(V0, V1);
      case souper::Inst::Shl:
        return Builder.CreateShl(V0, V1);
      case souper::Inst::AShr:
        return Builder.CreateAShr(V0, V1);
      case souper::Inst::LShr:
        return Builder.CreateLShr(V0, V1);
      case souper::Inst::Ne:
        if (llvm::isa<llvm::Constant>(V0)) {
          return Builder.CreateICmpNE(V1, V0);
        } else {
          return Builder.CreateICmpNE(V0, V1);
        }
      case souper::Inst::Eq:
        if (llvm::isa<llvm::Constant>(V0)) {
          return Builder.CreateICmpEQ(V1, V0);
        } else {
          return Builder.CreateICmpEQ(V0, V1);
        }
      case souper::Inst::Ult:
        if (llvm::isa<llvm::Constant>(V0)) {
          return Builder.CreateICmpUGT(V1, V0);
        } else {
          return Builder.CreateICmpULT(V0, V1);
        }
      case souper::Inst::Slt:
        if (llvm::isa<llvm::Constant>(V0)) {
          return Builder.CreateICmpSGT(V1, V0);
        } else {
          return Builder.CreateICmpSLT(V0, V1);
        }
      case souper::Inst::Ule:
        if (llvm::isa<llvm::Constant>(V0)) {
          return Builder.CreateICmpUGE(V1, V0);
        } else {
          return Builder.CreateICmpULE(V0, V1);
        }
      case souper::Inst::Sle:
        if (llvm::isa<llvm::Constant>(V0)) {
          return Builder.CreateICmpSGE(V1, V0);
        } else {
          return Builder.CreateICmpSLE(V0, V1);
        }
      case souper::Inst::ExtractValue:
        if (auto C1 = llvm::dyn_cast<llvm::ConstantInt>(V1)) {
          auto idx = C1->getUniqueInteger().getLimitedValue();
          return Builder.CreateExtractValue(V0, idx);
        }
        llvm::report_fatal_error("Unexpected extractvalue semantics!");
      case souper::Inst::SAddSat:
        return Builder.CreateCall(llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::sadd_sat, T),
                                  {V0, V1});
      case souper::Inst::UAddSat:
        return Builder.CreateCall(llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::uadd_sat, T),
                                  {V0, V1});
      case souper::Inst::SSubSat:
        return Builder.CreateCall(llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::ssub_sat, T),
                                  {V0, V1});
      case souper::Inst::USubSat:
        return Builder.CreateCall(llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::usub_sat, T),
                                  {V0, V1});
      case souper::Inst::SAddWithOverflow:
        return Builder.CreateCall(
            llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::sadd_with_overflow, V0->getType()),
            {V0, V1});
      case souper::Inst::UAddWithOverflow:
        return Builder.CreateCall(
            llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::uadd_with_overflow, V0->getType()),
            {V0, V1});
      case souper::Inst::SSubWithOverflow:
        return Builder.CreateCall(
            llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::ssub_with_overflow, V0->getType()),
            {V0, V1});
      case souper::Inst::USubWithOverflow:
        return Builder.CreateCall(
            llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::usub_with_overflow, V0->getType()),
            {V0, V1});
      case souper::Inst::SMulWithOverflow:
        return Builder.CreateCall(
            llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::smul_with_overflow, V0->getType()),
            {V0, V1});
      case souper::Inst::UMulWithOverflow:
        return Builder.CreateCall(
            llvm::Intrinsic::getDeclaration(M, llvm::Intrinsic::umul_with_overflow, V0->getType()),
            {V0, V1});
      default:
        break;
      }
    }
    case 3: {
      auto *V1 = getOperand(I, 1, ReplacedInst, EBC, DT, ReplacedValues, Builder, M);
      auto *V2 = getOperand(I, 2, ReplacedInst, EBC, DT, ReplacedValues, Builder, M);
      if (!V1 || !V2)
        return nullptr;
      switch (I->K) {
      case souper::Inst::Select:
        return Builder.CreateSelect(V0, V1, V2);
      case souper::Inst::FShl:
      case souper::Inst::FShr: {
        auto ID = I->K == souper::Inst::FShl ? llvm::Intrinsic::fshl : llvm::Intrinsic::fshr;
        auto *F = llvm::Intrinsic::getDeclaration(M, ID, T);
        return Builder.CreateCall(F, {V0, V1, V2});
      }
      default:
        break;
      }
    }
    default:
      break;
    }
    llvm::report_fatal_error((std::string) "Unhandled Souper instruction " +
                             souper::Inst::getKindName(I->K) + " in getValue()");
  }

  bool synthesizeCondition(llvm::Function &F, llvm::Value *V, llvm::DominatorTree *DT) {
    if (auto *CC = llvm::dyn_cast<llvm::Instruction>(V)) {
      llvm::outs() << "Synthesizing:";
      CC->dump();
      // Use Souper
      souper::InstContext IC;
      souper::ExprBuilderContext EBC;
      souper::ExprBuilderOptions EBO;
      souper::FunctionCandidateSet FCS;
      // 1. Extract the cadidate
      EBO.CandidateFilterInstruction = CC;
      FCS = souper::ExtractCandidates(&F, IC, EBC, EBO);
      souper::CandidateReplacement *CR = getReplacement(FCS, CC);
      if (!CR)
        llvm::report_fatal_error("[!] synthesizeCondition: missing condition candidate!");
      // 2. Synthesize the candidate
      std::vector<souper::Inst *> RHSs;
      synthesis::CustomEnumerativeSynthesis ES;
      auto EC = ES.synthesize(CR->BPCs, CR->PCs, CR->Mapping.LHS, RHSs, false, IC, 1);
      if (!RHSs.empty()) CR->Mapping.RHS = RHSs[0];
      // 3. Check for 'timeout' or 'value too large' issues
      if (EC || EC == std::errc::timed_out || EC == std::errc::value_too_large)
        llvm::report_fatal_error("[!] synthesizeCondition: timed out or value too large!");
      // 4. Check if we found a replacement
      if (!CR->Mapping.RHS)
        return false;
      // 5. Generate a replacement instruction
      auto *I = CR->Origin;
      assert(CR->Mapping.LHS->hasOrigin(I) && "Origin 'I' not found!");
      llvm::IRBuilder<> Builder(I);
      auto *NewVal = getValue(CR->Mapping.RHS, I, EBC, *DT, ReplacedValues, Builder, F.getParent());
      // 6. Check if we created a replacement
      if (!NewVal)
        return false;
      // 7. Replace the instruction in the LLVM-IR
      if (CR->Mapping.LHS->HarvestKind == souper::HarvestType::HarvestedFromDef) {
        // Mark the instruction with a metadata
        auto &ctx = I->getContext();
        auto *meta = llvm::MDNode::get(ctx, llvm::MDString::get(ctx, "synthesized"));
        if (auto *NI = llvm::dyn_cast<llvm::Instruction>(NewVal))
          NI->setMetadata("souper", meta);
        // Replace and erase the instruction
        I->replaceAllUsesWith(NewVal);
        I->eraseFromParent();
        ToBeSkipped.insert(NewVal);
        ToBeSkipped.insert(I);
        return true;
      } else {
        llvm::report_fatal_error("[!] synthesizeCondition: not a HarvestedFromDef, it should never "
                                 "happen!\n");
      }
    }
    return false;
  }

  // Constructors

  SynthesizeFlagsPass() : FunctionPass(ID) {}
  SynthesizeFlagsPass(OptimizationGuide &G) : FunctionPass(ID) { mG = &G; }

  // Pass entry point

  bool runOnFunction(llvm::Function &F) override {
    // Keep track of the changes
    bool HasChanged = false;
    // Fetch the function information
    auto *DT = &getAnalysis<llvm::DominatorTreeWrapperPass>().getDomTree();
    // Loop all the instructions
    std::vector<llvm::Instruction *> Instructions;
    for (llvm::inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I)
      Instructions.push_back(&*I);
    for (int64_t i = Instructions.size() - 1; i >= 0; i--) {
      auto *I = Instructions[i];
      // Skip if necessary
      if (ToBeSkipped.count(I))
        continue;
      // Skip if not 'br' or 'select'
      if (!llvm::isa<llvm::BranchInst>(I) && !llvm::isa<llvm::SelectInst>(I))
        continue;
      // Skip if already synthesized
      if (auto *II = llvm::dyn_cast<llvm::Instruction>(I->getOperand(0)))
        if (II->hasMetadata("souper"))
          continue;
      // Try to synthesize the condition
      if (synthesizeCondition(F, I->getOperand(0), DT))
        HasChanged = true;
    }
    // Notify if we modified the function
    if (mG)
      mG->HasChanged |= HasChanged;
    return HasChanged;
  }

  // Prerequisites of the pass

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const override {
    AU.setPreservesCFG();
    AU.addRequiredTransitive<llvm::DominatorTreeWrapperPass>();
  }
}; // namespace

char SynthesizeFlagsPass::ID = 0;

static llvm::RegisterPass<SynthesizeFlagsPass>
    X("SynthesizeFlagsPass", "Synthesizing the flags used by VMProtect", false, false);

} // end of anonymous namespace

llvm::FunctionPass *getSynthesizeFlagsPass(OptimizationGuide &G) {
  return new SynthesizeFlagsPass(G);
}