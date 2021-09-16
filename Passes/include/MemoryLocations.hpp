#pragma once

#include <llvm/Analysis/MemorySSA.h>
#include <llvm/Analysis/ScalarEvolutionAliasAnalysis.h>

// Structures to keep track of the load/store locations

typedef struct StoreLocation {
  const llvm::MemoryAccess *Acc = nullptr;
  llvm::StoreInst *Store = nullptr;
  const llvm::SCEV *Expr = nullptr;
  llvm::Value *Ptr = nullptr;
  llvm::MemoryLocation Loc;
  int64_t Offset = 0;
  uint64_t Size = 0;

  void dump() const {
    llvm::outs() << "StoreLocation:\n";
    llvm::outs() << "> Inst: ";
    Store->dump();
    llvm::outs() << "> Expr: ";
    Expr->dump();
    llvm::outs() << "> Offset: " << Offset << "\n";
    llvm::outs() << "> Size: " << Size << "\n";
  }
} StoreLocation;

typedef struct LoadLocation {
  const llvm::MemoryAccess *Acc = nullptr;
  llvm::LoadInst *Load = nullptr;
  const llvm::SCEV *Expr = nullptr;
  llvm::Value *Ptr = nullptr;
  llvm::MemoryLocation Loc;
  int64_t Offset = 0;
  uint64_t Size = 0;

  void dump() const {
    llvm::outs() << "LoadLocation:\n";
    llvm::outs() << "> Inst: ";
    Load->dump();
    llvm::outs() << "> Expr: ";
    Expr->dump();
    llvm::outs() << "> Offset: " << Offset << "\n";
    llvm::outs() << "> Size: " << Size << "\n";
  }
} LoadLocation;

typedef struct Assignment {
  std::vector<StoreLocation> SLocs;
  size_t Size;
  LoadLocation LLoc;
  StoreLocation SLoc;
  bool isAssignmentComplete() {
    // 0. Quick check
    if (SLocs.empty()) {
      return false;
    }
    // 1. Get the bytes
    size_t Size = LLoc.Acc ? LLoc.Size : SLoc.Size;
    std::vector<bool> Bytes(Size);
    // 2. Loop the stores
    for (const auto &SLoc : SLocs) {
      for (size_t i = 0; i < SLoc.Size; i++) {
        if (((SLoc.Offset + i) >= 0) && (SLoc.Offset + i) < Bytes.size()) {
          Bytes[SLoc.Offset + i] = true;
        }
      }
    }
    // 3. Verify if is a full coverage
    for (bool Byte : Bytes)
      if (!Byte)
        return false;
    return true;
  }
} Assignment;