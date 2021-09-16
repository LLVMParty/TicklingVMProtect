#include <Passes/PartialOverlapDSEPass.hpp>

#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/MemorySSA.h>
#include <llvm/Analysis/PostDominators.h>
#include <llvm/Analysis/ScalarEvolutionAliasAnalysis.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/CommandLine.h>

#include <algorithm>
#include <iostream>
#include <sstream>
#include <vector>
#include <map>

#include <Passes/MemoryLocations.hpp>
#include <Utilities/Utility.hpp>

llvm::cl::opt<bool> DebugDead("debug-partial-overlap-dse",
  llvm::cl::desc("Debug the partial overlap dead store elimination pass"),
  llvm::cl::value_desc("flag"),
  llvm::cl::init(false),
  llvm::cl::Optional);

namespace {

typedef struct ClobberingInfo {
  llvm::StoreInst *source;
  std::set<llvm::LoadInst *> loads;
  std::set<llvm::StoreInst *> stores;
} ClobberingInfo;

struct PartialOverlapDSEPass : llvm::FunctionPass {
  // Pass ID
  static char ID;

  // Set of safe functions
  std::set<std::string> OkFunctions{
    "llvm.assume",
    "llvm.bswap.i16",
    "llvm.bswap.i32",
    "llvm.bswap.i64",
    "llvm.x86.rdtsc",
    "llvm.ctpop.i8",
    "llvm.ctpop.i16",
    "llvm.ctpop.i32",
    "llvm.ctpop.i64",
    "llvm.lifetime.start.p0i8",
    "llvm.lifetime.end.p0i8",
    "llvm.fshr.i8",
    "llvm.fshr.i16",
    "llvm.fshr.i32",
    "llvm.fshr.i64",
    "llvm.fshl.i8",
    "llvm.fshl.i16",
    "llvm.fshl.i32",
    "llvm.fshl.i64"
  };

  // Optimization guide
  OptimizationGuide *mG = nullptr;

  // Undefined value
  llvm::LoadInst *mLoadUndef = nullptr;
  llvm::GlobalVariable *mUndef = nullptr;

  // Insertion point
  llvm::Instruction *mInsertionPoint = nullptr;

  // Constructors
  PartialOverlapDSEPass() : FunctionPass(ID) {}
  PartialOverlapDSEPass(OptimizationGuide &G) : FunctionPass(ID) { mG = &G; }

  // SCEV utility methods

  bool isSupportedSCEV(llvm::ScalarEvolution &SE, const llvm::SCEV *L, uint64_t LSize, StoreLocation &SLoc) {
    // Get the values we need
    const auto *S = SLoc.Expr;
    uint64_t SSize = SLoc.Size;
    // Check the compatibility of the expressions
    if (auto *LA = llvm::dyn_cast<llvm::SCEVAddExpr>(L)) {
      if (auto *SA = llvm::dyn_cast<llvm::SCEVAddExpr>(S)) {
        if (LA->getNumOperands() == SA->getNumOperands()) {
          switch (SA->getNumOperands()) {
          case 3: {
            // (-180 + %6 + @RAM)
            auto *LOp0 = LA->getOperand(0);
            auto *LOp1 = LA->getOperand(1);
            auto *LOp2 = LA->getOperand(2);
            auto *SOp0 = SA->getOperand(0);
            auto *SOp1 = SA->getOperand(1);
            auto *SOp2 = SA->getOperand(2);
            // Verify that the involved operands are consistent
            if ((LOp2 == SOp2) && (LOp1 == SOp1) && (LOp0->getSCEVType() == SOp0->getSCEVType()) &&
                (LOp2->getSCEVType() == llvm::scUnknown) &&
                (LOp1->getSCEVType() == llvm::scUnknown) &&
                (LOp0->getSCEVType() == llvm::scConstant)) {
              if (auto *LC = llvm::dyn_cast<llvm::SCEVConstant>(LOp0)) {
                if (auto *SC = llvm::dyn_cast<llvm::SCEVConstant>(SOp0)) {
                  // Determine if the values fully overlap
                  auto LV = (int64_t)LC->getValue()->getValue().getLimitedValue();
                  auto SV = (int64_t)SC->getValue()->getValue().getLimitedValue();
                  auto DF = SV - LV;
                  if (DebugDead) {
                    std::cout << "SCEV(MLS.Ptr - MLL.Ptr): " << std::dec << DF << std::endl;
                  }
                  // Save the offset of the store
                  SLoc.Offset = DF;
                  // Determine if the store is inside the load
                  if ((LV < SV) && (DF > 0) && (DF + SSize) <= LSize) {
                    // Notify we can handle this case
                    return true;
                  }
                  // Determine if the store fully overlaps the load
                  else if ((SV < LV) && (DF < 0) && (SSize + DF) >= LSize) {
                    // Notify we can handle this case
                    return true;
                  }
                  // Determine if the store partially overlaps the load (1)
                  else if ((LV < SV) && (DF > 0) && (DF + SSize) >= LSize) {
                    // Notify we can handle this case
                    return true;
                  }
                  // Determine if the store partially overlaps the load (2)
                  else if ((SV < LV) && (DF < 0) && (SSize + DF) < LSize) {
                    // Notify we can handle this case
                    return true;
                  }
                }
              }
            }
          } break;
          case 2: {
            // (5434720965 + @RAM)<nsw>
            auto *LOp0 = LA->getOperand(0);
            auto *LOp1 = LA->getOperand(1);
            auto *SOp0 = SA->getOperand(0);
            auto *SOp1 = SA->getOperand(1);
            // Verify that the involved operands are consistent
            if ((LOp1 == SOp1) && (LOp0->getSCEVType() == SOp0->getSCEVType()) &&
                (LOp1->getSCEVType() == llvm::scUnknown) &&
                (LOp0->getSCEVType() == llvm::scConstant)) {
              if (auto *LC = llvm::dyn_cast<llvm::SCEVConstant>(LOp0)) {
                if (auto *SC = llvm::dyn_cast<llvm::SCEVConstant>(SOp0)) {
                  // Determine if the values fully overlap
                  auto LV = (int64_t)LC->getValue()->getValue().getLimitedValue();
                  auto SV = (int64_t)SC->getValue()->getValue().getLimitedValue();
                  auto DF = SV - LV;
                  // Save the offset of the store
                  SLoc.Offset = DF;
                  // Determine if the store is inside the load
                  if ((LV < SV) && (DF > 0) && (DF + SSize) <= LSize) {
                    // Notify we can handle this case
                    return true;
                  }
                  // Determine if the store fully overlaps the load
                  else if ((SV < LV) && (DF < 0) && (SSize + DF) >= LSize) {
                    // Notify we can handle this case
                    return true;
                  }
                }
              }
            }
          } break;
          default: {
            // Unsupported SCEV
            if (DebugDead) {
              llvm::outs() << "Unsupported SCEV: ";
              L->dump();
              S->dump();
            }
          } break;
          }
        }
      }
    }
    // Unsupported SCEV
    if (DebugDead) {
      llvm::outs() << "Unsupported SCEV: ";
      L->dump();
      S->dump();
    }
    return false;
  }

  llvm::Value *getMemoryPointer(llvm::Value *V) {
    llvm::Value *MP = nullptr;
    // Fetch the load/store pointer operand
    if (auto *SI = llvm::dyn_cast<llvm::StoreInst>(V))
      MP = SI->getPointerOperand();
    else if (auto *LI = llvm::dyn_cast<llvm::LoadInst>(V))
      MP = LI->getPointerOperand();
    // If it's a bitcast, get the pure pointer
    if (auto *BC = llvm::dyn_cast<llvm::BitCastInst>(MP))
      MP = BC->getOperand(0);
    // Return the pure memory pointer
    return MP;
  }

  void undefineStore(llvm::StoreInst *S) {
    // Fetch the store type
    auto *STy = S->getOperand(0)->getType();
    // Load '__undef' the first time
    if (!mLoadUndef)
      mLoadUndef = new llvm::LoadInst(mUndef->getType()->getPointerElementType(), mUndef, "", mInsertionPoint);
    // Resize the undefined value
    llvm::Instruction *undef = mLoadUndef;
    if (mLoadUndef->getType() != STy)
      undef = new llvm::TruncInst(undef, STy, "", mInsertionPoint);
    // Store the undefined value
    S->setOperand(0, undef);
  }

  bool isUndefined(const llvm::StoreInst *S) {
    // Original load
    if (const auto *L = llvm::dyn_cast<llvm::LoadInst>(S->getOperand(0)))
      if (L->getPointerOperand() == mUndef)
        return true;
    // Truncated load
    if (const auto *T = llvm::dyn_cast<llvm::TruncInst>(S->getOperand(0)))
      if (const auto *L = llvm::dyn_cast<llvm::LoadInst>(T->getOperand(0)))
        if (L->getPointerOperand() == mUndef)
          return true;
    // Not loading undefine
    return false;
  }

  // Function pass methods

  bool runOnFunction(llvm::Function &F) override {
    // Keep track if we modified the function
    bool madeChanges = false;

    // Fetch the '__undef' value
    mUndef = F.getParent()->getGlobalVariable("__undef");
    if (!mUndef) {
      std::stringstream ss;
      ss << __func__;
      ss << ": missing '__undef' value!\n";
      llvm::report_fatal_error(ss.str());
    }
    mLoadUndef = nullptr;

    // Fetch the first insertion point
    mInsertionPoint = F.getEntryBlock().getFirstNonPHIOrDbg();    

    // Fetch the memory SSA
    auto &MSSA = getAnalysis<llvm::MemorySSAWrapperPass>().getMSSA();
    // Fetch the memory SSA walker
    auto *MSSAW = MSSA.getWalker();
    // Fetch the alias analysis
    auto &AA = getAnalysis<llvm::AAResultsWrapperPass>().getAAResults();
    // Fetch the scalar evolution
    auto &SE = getAnalysis<llvm::ScalarEvolutionWrapperPass>().getSE();
    // Fetch the post dominator tree
    auto &PDT = getAnalysis<llvm::PostDominatorTreeWrapperPass>().getPostDomTree();

    // Debug dump
    if (DebugDead)
      MSSA.dump();

    // Collect the clobbering information
    std::map<llvm::StoreInst *, std::set<size_t>> cInfoMap;
    std::vector<ClobberingInfo> cInfo;
    for (auto &I : llvm::instructions(F)) {
      if (auto *S0 = llvm::dyn_cast<llvm::StoreInst>(&I)) {
        // Debug dump
        if (DebugDead) {
          llvm::outs() << "--------------------\n";
          S0->dump();
        }
        // Initialize the clobbering information
        ClobberingInfo CI;
        CI.source = S0;
        // Determine the memory location
        auto L0 = llvm::MemoryLocation::get(S0);
        // Get the list of clobbering memory accesses
        std::stack<llvm::MemoryAccess *> accesses;
        std::set<llvm::MemoryAccess *> known;
        accesses.push(MSSA.getMemoryAccess(S0));
        while (!accesses.empty()) {
          // Fetch the next memory access
          auto *MA = accesses.top();
          accesses.pop();
          // Skip if known
          if (known.count(MA))
            continue;
          known.insert(MA);
          // Debug dump
          if (DebugDead)
            MA->dump();
          // Stop at a MemoryDef(liveOnEntry)
          if (MSSA.isLiveOnEntryDef(MA))
            continue;
          // Parse a MemoryPhi
          if (auto *Phi = llvm::dyn_cast<llvm::MemoryPhi>(MA)) {
            for (auto &InMA : Phi->incoming_values()) {
              std::vector<llvm::MemoryAccess *> clobbering;
              if (auto *Acc = llvm::dyn_cast<llvm::MemoryAccess>(&InMA)) {
                // Find the first aliasing memory access
                std::stack<llvm::MemoryAccess *> definitions;
                std::set<llvm::MemoryAccess *> visited;
                definitions.push(Acc);
                while (!definitions.empty()) {
                  // Fetch the next memory access
                  auto *MA = definitions.top();
                  definitions.pop();
                  // Skip if known
                  if (visited.count(MA))
                    continue;
                  visited.insert(MA);
                  // Stop at a MemoryDef(liveOnEntry)
                  if (MSSA.isLiveOnEntryDef(MA))
                    continue;
                  // Stop at a MemoryPhi
                  if (llvm::isa<llvm::MemoryPhi>(MA)) {
                    clobbering.push_back(MA);
                    break;
                  }
                  // Check if it's fully or partially aliasing
                  if (auto *UseOrDef = llvm::dyn_cast<llvm::MemoryUseOrDef>(MA)) {
                    auto L1 = llvm::MemoryLocation::get(UseOrDef->getMemoryInst());
                    auto AAR = AA.alias(L0, L1);
                    if ((AAR == llvm::AliasResult::PartialAlias) || (AAR == llvm::AliasResult::MustAlias))
                      clobbering.push_back(MA);
                  }
                  // Get the defining memory access
                  if (auto *Def = llvm::dyn_cast<llvm::MemoryDef>(MA))
                    definitions.push(Def->getDefiningAccess());
                  else if (auto *Use = llvm::dyn_cast<llvm::MemoryUse>(MA)) {
                    definitions.push(Use->getDefiningAccess());
                  }
                }
                // Push the clobbering definition
                for (auto *Def : clobbering)
                  accesses.push(Def);
              }
            }
          } else if (auto *Def = llvm::dyn_cast<llvm::MemoryDef>(MA)) {
            accesses.push(MSSAW->getClobberingMemoryAccess(Def));
            if (auto *S = llvm::dyn_cast<llvm::StoreInst>(Def->getMemoryInst()))
              CI.stores.insert(S);
          } else if (auto *Use = llvm::dyn_cast<llvm::MemoryUse>(MA)) {
            accesses.push(MSSAW->getClobberingMemoryAccess(Use));
            if (auto *L = llvm::dyn_cast<llvm::LoadInst>(Use->getMemoryInst()))
              CI.loads.insert(L);
          }
        }
        // Store the clobbering information
        cInfo.push_back(CI);
        // Update the clobbering information map
        size_t idx = cInfo.size() - 1;
        for (auto *S : CI.stores) {
          if (S == CI.source)
            continue;
          if (!cInfoMap.count(S))
            cInfoMap[S] = {};
          cInfoMap[S].insert(idx);
        }
      }
    }

    // Identify the dead stores
    std::vector<llvm::StoreInst *> Killed;
    for (const auto &mapping : cInfoMap) {
      // Fetch the current store
      auto *S = mapping.first;
      // Debug dump
      if (DebugDead) {
        llvm::outs() << "Trying to kill: ";
        S->dump();
        llvm::outs() << "Aliasing chains: " << mapping.second.size() << "\n";
      }
      // Ignore if it's storing 'undef'
      if (isUndefined(S))
        continue;
      // Extract the dominated loads
      std::vector<llvm::LoadInst *> loads;
      for (size_t idx : mapping.second) {
        for (auto *U : cInfo[idx].loads) {
          if (DebugDead) {
            llvm::outs() << "Possibly aliasing load: ";
            U->dump();
          }
          if (!PDT.dominates(U, S)) {
            if (DebugDead) {
              llvm::outs() << "Possibly aliasing load: doesn't post dominate the target!\n";
              U->dump();
            }
            continue;
          }
          if (AA.isNoAlias(U->getPointerOperand(), S->getPointerOperand())) {
            if (DebugDead) {
              llvm::outs() << "Possibly aliasing load: doesn't alias with the target!\n";
              U->dump();
            }
            continue;
          }
          loads.push_back(U);
        }
      }
      // Extract the dominated stores
      auto L0 = llvm::MemoryLocation::get(S);
      std::vector<llvm::StoreInst *> stores;
      for (size_t idx : mapping.second) {
        auto *U = cInfo[idx].source;
        if (DebugDead) {
          llvm::outs() << "Possibly aliasing store: ";
          U->dump();
        }
        if (!PDT.dominates(U, S)) {
          if (DebugDead)
            llvm::outs() << "Possibly aliasing store: doesn't post dominate the target!\n";
          continue;
        }
        auto L1 = llvm::MemoryLocation::get(U);
        auto AAR = AA.alias(L0, L1);
        if (DebugDead) {
          switch (AAR) {
            case llvm::AliasResult::PartialAlias: {
              llvm::outs() << "PartialAlias\n";
            } break;
            case llvm::AliasResult::MustAlias: {
              llvm::outs() << "MustAlias\n";
            } break;
            case llvm::AliasResult::MayAlias: {
              llvm::outs() << "MayAlias\n";
            } break;
            case llvm::AliasResult::NoAlias: {
              llvm::outs() << "NoAlias\n";
            } break;
          }
        }
        if ((AAR == llvm::AliasResult::PartialAlias) || (AAR == llvm::AliasResult::MustAlias)) {
          if (DebugDead)
            llvm::outs() << "Fully or partially aliasing store: added to the killers!\n";
          stores.push_back(U);
        }
      }
      // Debug dump
      if (DebugDead) {
        llvm::outs() << "Aliasing loads: " << loads.size() << "\n";
        llvm::outs() << "Aliasing stores: " << stores.size() << "\n";
      }
      // Bail out if we found aliasing loads
      if (!loads.empty()) {
        if (DebugDead)
          llvm::outs() << "Stop: found aliasing load!\n";
        continue;
      }
      // Bail out if we didn't find any store
      if (stores.empty()) {
        if (DebugDead)
          llvm::outs() << "Stop: missing clobbering store!\n";
        continue;
      }
      // Bail out if we didn't find stricly post-dominating stores
      std::vector<llvm::StoreInst *> stores_s(stores.size());
      std::partial_sort_copy(stores.begin(), stores.end(),
        stores_s.begin(), stores_s.end(),
        [&](llvm::StoreInst *A, llvm::StoreInst *B) {
        return PDT.dominates(A, B);
      });
      bool strictPostDomination = true;
      for (size_t i = 0; i < stores_s.size(); i++) {
        for (size_t j = i + 1; j < stores_s.size(); j++) {
          if (!PDT.dominates(stores_s[i], stores_s[j]))
            strictPostDomination = false;
        }
      }
      if (!strictPostDomination) {
        if (DebugDead)
          llvm::outs() << "Stop: invalid post domination!\n";
        continue;
      }
      // Initialise the assignment
      Assignment AI;
      AI.SLoc.Store = S;
      AI.SLoc.Ptr = getMemoryPointer(S);
      AI.SLoc.Acc = MSSA.getMemoryAccess(S);
      AI.SLoc.Loc = llvm::MemoryLocation::get(S);
      AI.SLoc.Size = AI.SLoc.Loc.Size.getValue();
      AI.SLoc.Expr = SE.getSCEV(AI.SLoc.Ptr);
      // Update the assignment information
      for (auto *U : stores_s) {
        StoreLocation NSLoc;
        NSLoc.Store = U;
        NSLoc.Acc = MSSA.getMemoryAccess(U);
        NSLoc.Ptr = getMemoryPointer(U);
        NSLoc.Loc = llvm::MemoryLocation::get(U);
        NSLoc.Size = NSLoc.Loc.Size.getValue();
        NSLoc.Expr = SE.getSCEV(NSLoc.Ptr);
        AI.SLocs.push_back(NSLoc);
      }
      // Check if we have a full assignment
      if (AI.isAssignmentComplete()) {
        Killed.push_back(S);
        if (DebugDead) {
          llvm::outs() << "Killed: ";
          S->dump();
          llvm::outs() << "By: ";
          for (auto *U : stores_s)
            U->dump();
        }
      }
    }

    // Delete the killed stores
    for (auto *Store : Killed)
      undefineStore(Store);
    // Check if we modified the function
    madeChanges |= !Killed.empty();

    // Notify if we modified the function
    mG->HasChanged |= madeChanges;
    return madeChanges;
  }

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const override {
    AU.setPreservesCFG();
    AU.addRequiredTransitive<llvm::AAResultsWrapperPass>();
    AU.addRequiredTransitive<llvm::MemorySSAWrapperPass>();
    AU.addRequiredTransitive<llvm::ScalarEvolutionWrapperPass>();
    AU.addRequiredTransitive<llvm::PostDominatorTreeWrapperPass>();
  }

}; // namespace

char PartialOverlapDSEPass::ID = 0;

static llvm::RegisterPass<PartialOverlapDSEPass> X("PartialOverlapDSEPass",
  "Finds and kills the stores that are unused before being overwritten by partial stores that post-dominate them", false, false);

} // end of anonymous namespace

llvm::FunctionPass *getPartialOverlapDSEPass(OptimizationGuide &G) {
  return new PartialOverlapDSEPass(G);
}