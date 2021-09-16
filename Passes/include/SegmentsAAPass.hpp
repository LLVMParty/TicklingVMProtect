#pragma once

#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Pass.h>

#include <unordered_map>
#include <memory>
#include <set>

typedef enum PointerType {
  TyUNK,  // unknown pointer
  TyIND,  // indirect pointer
  TyARR,  // stack array
  TyVIR,  // virtual stack slot
  TySS,   // ss: pointer
  TyGS,   // gs: pointer
  TyFS    // fs: pointer
} PointerType;

typedef struct GlobalPointers {
  llvm::GlobalVariable *RAM;
  llvm::GlobalVariable *GS;
  llvm::GlobalVariable *FS;
} GlobalPointers;

class SegmentsAAResult : public llvm::AAResultBase<SegmentsAAResult> {
  friend llvm::AAResultBase<SegmentsAAResult>;

public:
  SegmentsAAResult(const GlobalPointers &GP);

  bool invalidate(llvm::Function &F, const llvm::PreservedAnalyses &PA, llvm::FunctionAnalysisManager::Invalidator &Inv);
  
  llvm::AliasResult alias(const llvm::MemoryLocation &locA, const llvm::MemoryLocation &locB, llvm::AAQueryInfo &AAQI);

private:
  PointerType getPointerType(const llvm::Value *V) const;

  void debugDump(const llvm::Value *PtrA, const llvm::Value *PtrB, PointerType ATy, PointerType BTy) const;

  GlobalPointers mGP;
  std::set<std::string> mStackPointers{"esp", "rsp"};
  std::unordered_map<const llvm::Value *, PointerType> mCache;
};

class SegmentsAAWrapperPass : public llvm::ImmutablePass {
  std::unique_ptr<SegmentsAAResult> mResult;
  
public:
  static char ID;

  SegmentsAAWrapperPass();
  
  SegmentsAAResult& getResult();
  const SegmentsAAResult& getResult() const;
  
  virtual bool doInitialization(llvm::Module &M) override;
  virtual bool doFinalization(llvm::Module &M) override;

  virtual void getAnalysisUsage(llvm::AnalysisUsage &analysisUsage) const override;
};

class SegmentsExternalAAWrapperPass : public llvm::ExternalAAWrapperPass {
public:
  static char ID;
  
  SegmentsExternalAAWrapperPass() : llvm::ExternalAAWrapperPass(
    [](llvm::Pass &P, llvm::Function &F, llvm::AAResults &AAR) {
      if (auto *WrapperPass = P.getAnalysisIfAvailable<SegmentsAAWrapperPass>())
        AAR.addAAResult(WrapperPass->getResult());
    }) {}
 };

llvm::ImmutablePass *createSegmentsAAWrapperPass();