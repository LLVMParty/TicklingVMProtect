#include "Passes/MemoryCoalescingPass.hpp"

#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/MemorySSA.h>
#include <llvm/Analysis/PostDominators.h>
#include <llvm/Analysis/ScalarEvolutionAliasAnalysis.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>

#include <algorithm>
#include <iostream>
#include <vector>
#include <map>

#include <Passes/MemoryLocations.hpp>
#include <Utilities/Utility.hpp>

bool DebugMerge = false;

namespace {

struct MemoryCoalescingPass : llvm::FunctionPass {
  // Pass ID
  static char ID;

  // Set of safe functions
  std::set<std::string> OkFunctions{
    "llvm.assume",
    "llvm.bswap.i16",
    "llvm.bswap.i32",
    "llvm.bswap.i64"
  };

  // Optimization guide
  OptimizationGuide *mG = nullptr;

  // Constructors
  MemoryCoalescingPass() : FunctionPass(ID) {}
  MemoryCoalescingPass(OptimizationGuide &G) : FunctionPass(ID) { mG = &G; }

  // Main coalescing logic

  bool coalesceConstantPointerStores(llvm::LoadInst *Load, const std::vector<llvm::StoreInst *> &Stores) {
    if (DebugMerge) {
      std::cout << "Executing: coalesceConstantPointerStores" << std::endl;
    }
    // Keep track if we modified the function
    bool MadeChanges = false;
    // Determine the values stored in memory
    std::map<uint64_t, uint64_t> Memory;
    for (const auto *SI : Stores) {
      // Determine the store information: address, size and value
      llvm::ConstantExpr *CEGEP = nullptr;
      if (auto *CE1 = llvm::dyn_cast<llvm::ConstantExpr>(SI->getOperand(1))) {
        if (auto *CE2 = llvm::dyn_cast<llvm::ConstantExpr>(CE1->getOperand(0))) {
          CEGEP = CE2;
        } else {
          CEGEP = CE1;
        }
      }
      if (CEGEP && (CEGEP->getNumOperands() == 3)) {
        if (auto *Addr = llvm::dyn_cast<llvm::ConstantInt>(CEGEP->getOperand(2))) {
          if (auto *Val = llvm::dyn_cast<llvm::ConstantInt>(SI->getOperand(0))) {
            auto *StoreTy = Val->getType();
            if (StoreTy->isIntegerTy()) {
              uint64_t ByteSize = StoreTy->getIntegerBitWidth() / 8;
              uint64_t Address = Addr->getLimitedValue();
              uint64_t Value = Val->getLimitedValue();
              for (size_t i = 0; i < ByteSize; i++) {
                Memory[Address + i] = ((Value >> (i * 8)) & 0xFF);
                if (DebugMerge) {
                  std::cout << "S: 0x" << std::hex << (Address + i) << " = 0x" << std::hex
                            << Memory[Address + i] << std::endl;
                }
              }
            }
          }
        }
      }
    }
    // Determine the load information: address, size and value
    llvm::ConstantExpr *CEGEP = nullptr;
    uint64_t Value = 0;
    if (auto *CE1 = llvm::dyn_cast<llvm::ConstantExpr>(Load->getOperand(0))) {
      if (auto *CE2 = llvm::dyn_cast<llvm::ConstantExpr>(CE1->getOperand(0))) {
        CEGEP = CE2;
      } else {
        CEGEP = CE1;
      }
    }
    if (DebugMerge) {
      if (CEGEP) {
        CEGEP->dump();
      } else {
        std::cout << "CEGEP = nullptr" << std::endl;
      }
    }
    bool ValueFound = false;
    if (CEGEP && (CEGEP->getNumOperands() == 3)) {
      if (auto *Addr = llvm::dyn_cast<llvm::ConstantInt>(CEGEP->getOperand(2))) {
        auto *LoadTy = Load->getType();
        if (LoadTy->isIntegerTy()) {
          uint64_t ByteSize = LoadTy->getIntegerBitWidth() / 8;
          uint64_t Address = Addr->getLimitedValue();
          if (DebugMerge) {
            std::cout << "ByteSize: " << std::dec << ByteSize << std::endl;
            std::cout << "Address: 0x" << std::hex << Address << std::endl;
          }
          for (size_t i = 0; i < ByteSize; i++) {
            auto IT = Memory.find(Address + i);
            if (IT != Memory.end()) {
              Value |= ((IT->second & 0xFF) << (i * 8));
              ValueFound = true;
              // std::cout << "L: 0x" << std::hex << (Address + i) << " = 0x" <<
              // std::hex << IT->second << std::endl;
            } else {
              // Missing byte value
              if (DebugMerge) {
                std::cout << "Missing byte @ 0x" << std::hex << (Address + i) << std::endl;
              }
              return false;
            }
          }
        }
      }
    }
    // Check if we detected the loaded value
    if (ValueFound) {
      if (DebugMerge) {
        std::cout << "Store -> Load chain found:" << std::endl;
        Load->dump();
        for (const auto *SI : Stores) {
          SI->dump();
        }
        std::cout << "CoalescedConstant: 0x" << std::hex << Value << std::endl;
      }
      // Modify the load instruction
      auto *CoalescedConstant = llvm::ConstantInt::get(Load->getType(), Value);
      if (DebugMerge) {
        CoalescedConstant->dump();
      }
      // Replace all uses of the load with the new constant
      Load->replaceAllUsesWith(CoalescedConstant);
      // Mark the function as modified
      MadeChanges = true;
    }
    // Notify if we modified the function
    return MadeChanges;
  }

  bool coalesceSamePointerStores(llvm::LoadInst *Load, const std::vector<llvm::StoreInst *> &Stores) {
    if (DebugMerge) {
      std::cout << "Executing: coalesceSamePointerStores" << std::endl;
    }
    // Fetch the base load memory pointer
    auto *MP = this->getMemoryPointer(Load);
    // Verify if the load is using an integer value
    if (!Load->getType()->isIntegerTy()) {
      if (DebugMerge) {
        llvm::outs() << "coalesceSamePointerStores: stopping, non-integer "
                        "load found!\n";
      }
      return false;
    }
    // Verify if all the stores are integer values
    for (const auto *Store : Stores) {
      // Check if the value is an integer
      if (!Store->getOperand(0)->getType()->isIntegerTy()) {
        // Stop if it isn't
        if (DebugMerge) {
          llvm::outs() << "coalesceSamePointerStores: stopping, non-integer "
                          "store found!\n";
        }
        return false;
      }
    }
    // Verify if the sizes are monotonically decreasing
    uint64_t CurrSz = 0;
    for (const auto *Store : Stores) {
      uint64_t TmpSz = Store->getOperand(0)->getType()->getIntegerBitWidth();
      if (CurrSz && (TmpSz >= CurrSz)) {
        if (DebugMerge) {
          llvm::outs() << "coalesceSamePointerStores: stopping, sizes are not "
                          "monotolically decreasing!\n";
        }
        return false;
      }
      CurrSz = TmpSz;
    }
    // Verify if the biggest store is bigger or equal than the load
    uint64_t LoadSz = Load->getType()->getIntegerBitWidth();
    uint64_t StoreSz = Stores[0]->getOperand(0)->getType()->getIntegerBitWidth();
    if (LoadSz > StoreSz) {
      if (DebugMerge) {
        llvm::outs() << "coalesceSamePointerStores: stopping, load size bigger "
                        "than the biggest store size!\n";
        llvm::outs() << "coalesceSamePointerStores: stopping, load size (" << LoadSz
                     << ") bigger "
                        "than the biggest store size ("
                     << StoreSz << ")!\n";
      }
      return false;
    }
    // Now we can merge the values
    llvm::Value *CoalescedValue = nullptr;
    for (const auto *Store : Stores) {
      CoalescedValue = this->coalesceValues(Load, CoalescedValue, Store->getOperand(0));
    }
    // Truncate the coalesced value to the proper size
    if (Load->getType() != CoalescedValue->getType()) {
      CoalescedValue = new llvm::TruncInst(CoalescedValue, Load->getType(), "", Load);
      if (DebugMerge) {
        CoalescedValue->dump();
      }
    }
    // Replace the load instruction with the coalesced value
    Load->replaceAllUsesWith(CoalescedValue);
    // Notify if we modified the function
    return true;
  }

  bool coalesceOffsetPointerStores(Assignment &AI) {
    // Lambda function to calculate the overlap of two segments
    auto overlap = [&](int64_t min1, int64_t max1, int64_t min2, int64_t max2) {
      return std::max<int64_t>(0, std::min<int64_t>(max1, max2) - std::max<int64_t>(min1, min2));
    };
    // This function is meant to handle the following cases
    // 1. Stores inside the load memory slot
    // Load1  = [ L1 L1 L1 L1 L1 L1 L1 L1 ] (offset 0, size 8)
    // Store1 = [ S1 S1 S1 S1 L1 L1 L1 L1 ] (offset 0, size 4)
    // Store2 = [ S1 S1 S1 S1 S2 S2 S2 S2 ] (offset 4, size 4)
    // 2. Stores overlapping the load memory slot
    // Load1  =             [ L1 L1 L1 L1 ] (offset  0, size 4)
    // Store1 = [ S1 S1 S1 S1 S1 S1 S1 S1 ] (offset -4, size 8)
    // 3. Mix of stores overlapping the load memory slot
    // Load1  =       [ L1 L1 L1 L1 ]       (offset  0, size 4)
    // Store1 = [ S1 S1 S1 S1 ]             (offset -2, size 4)
    // Store2 =             [ S2 S2 S2 S2 ] (offset  2, size 4)
    if (DebugMerge) {
      std::cout << "Executing: coalesceOffsetPointerStores" << std::endl;
    }
    // Fetch the load location structure
    auto &LLoc = AI.LLoc;
    // Fetch the load instruction
    auto *Load = LLoc.Load;
    // Collect all the store instructions
    std::vector<StoreLocation> SLocs;
    for (auto &SLoc : AI.SLocs)
      SLocs.insert(SLocs.begin(), SLoc);
    if (DebugMerge) {
      for (const auto &SLoc : SLocs) {
        std::cout << "========================================================" << std::endl;
        SLoc.dump();
      }
      std::cout << "========================================================" << std::endl;
      AI.LLoc.dump();
    }
    // Coalesce the values
    llvm::Value *CoalescedValue = nullptr;
    // Loop the store instructions
    for (auto &SLoc : SLocs) {
      // 1. Fetch the stored value
      auto *StoredValue = SLoc.Store->getOperand(0);
      if (DebugMerge) {
        StoredValue->dump();
      }
      // 2. Resize and shift the value
      uint64_t Mask = getMask(LLoc.Size * 8);
      if ((SLoc.Size == LLoc.Size) && (SLoc.Offset <= 0)) {
        // We are handling these cases:
        // ------------------------------------------------
        // Load1  =             [ L1 L1 L1 L1 L1 L1 L1 L1 ]
        // Store1 = [ S1 S1 S1 S1 S1 S1 S1 S1 ]
        // ------------------------------------------------
        // Load1  = [ L1 L1 L1 L1 L1 L1 L1 L1 ]
        // Store1 = [ S1 S1 S1 S1 S1 S1 S1 S1 ]
        // ------------------------------------------------
        auto *ShiftValue = llvm::ConstantInt::get(Load->getType(), (-SLoc.Offset) * 8);
        StoredValue = llvm::BinaryOperator::CreateExactLShr(StoredValue, ShiftValue, "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        // Calculate the mask
        uint64_t Overlap = overlap(LLoc.Offset, LLoc.Size, SLoc.Offset, SLoc.Offset + SLoc.Size);
        Mask -= getMask(Overlap * 8);
      } else if ((SLoc.Size == LLoc.Size) && SLoc.Offset > 0) {
        // We are handling this case:
        // ------------------------------------------------
        // Load1  = [ L1 L1 L1 L1 L1 L1 L1 L1 ]
        // Store1 =             [ S1 S1 S1 S1 S1 S1 S1 S1 ]
        // ------------------------------------------------
        auto *ShiftValue = llvm::ConstantInt::get(Load->getType(), SLoc.Offset * 8);
        StoredValue = llvm::BinaryOperator::CreateNUWShl(StoredValue, ShiftValue, "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        // Calculate the mask
        uint64_t Overlap = overlap(LLoc.Offset, LLoc.Size, SLoc.Offset, SLoc.Offset + SLoc.Size);
        Mask -= getMask(Overlap * 8, SLoc.Offset);
      } else if ((SLoc.Size < LLoc.Size) && (SLoc.Offset <= 0)) {
        // We are handling these cases:
        // ------------------------------------------
        // Load1  =       [ L1 L1 L1 L1 L1 L1 L1 L1 ]
        // Store1 = [ S1 S1 S1 S1 ]
        // ------------------------------------------
        // Load1  = [ L1 L1 L1 L1 L1 L1 L1 L1 ]
        // Store1 = [ S1 S1 S1 S1 ]
        // ------------------------------------------
        auto *ShiftValue = llvm::ConstantInt::get(Load->getType(), (-SLoc.Offset) * 8);
        StoredValue = new llvm::ZExtInst(StoredValue, Load->getType(), "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        StoredValue = llvm::BinaryOperator::CreateExactLShr(StoredValue, ShiftValue, "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        // Calculate the mask
        uint64_t Overlap = overlap(LLoc.Offset, LLoc.Size, SLoc.Offset, SLoc.Offset + SLoc.Size);
        Mask -= getMask(Overlap * 8);
      } else if ((SLoc.Size < LLoc.Size) && (SLoc.Offset > 0)) {
        // We are handling these cases:
        // ------------------------------------------
        // Load1  = [ L1 L1 L1 L1 L1 L1 L1 L1 ]
        // Store1 =             [ S1 S1 S1 S1 ]
        // ------------------------------------------
        // Load1  = [ L1 L1 L1 L1 L1 L1 L1 L1 ]
        // Store1 =                   [ S1 S1 S1 S1 ]
        // ------------------------------------------
        // Load1  = [ L1 L1 L1 L1 L1 L1 L1 L1 ]
        // Store1 =    [ S1 S1 S1 S1 ]
        // ------------------------------------------
        auto *ShiftValue = llvm::ConstantInt::get(Load->getType(), SLoc.Offset * 8);
        StoredValue = new llvm::ZExtInst(StoredValue, Load->getType(), "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        StoredValue = llvm::BinaryOperator::CreateNUWShl(StoredValue, ShiftValue, "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        // Calculate the mask
        uint64_t Overlap = overlap(LLoc.Offset, LLoc.Size, SLoc.Offset, SLoc.Offset + SLoc.Size);
        Mask -= getMask(Overlap * 8, SLoc.Offset);
      } else if ((SLoc.Size > LLoc.Size) && (SLoc.Offset <= 0)) {
        // We are handling these cases:
        // ---------------------------
        // Load1  =          [ L1 L1 ]
        // Store1 = [ S1 S1 S1 S1 ]
        // ---------------------------
        // Load1  =       [ L1 L1 ]
        // Store1 = [ S1 S1 S1 S1 ]
        // ---------------------------
        // Load1  = [ L1 L1 ]
        // Store1 = [ S1 S1 S1 S1 ]
        // ---------------------------
        auto *ShiftValue = llvm::ConstantInt::get(StoredValue->getType(), (-SLoc.Offset) * 8);
        StoredValue = llvm::BinaryOperator::CreateExactLShr(StoredValue, ShiftValue, "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        StoredValue = new llvm::TruncInst(StoredValue, Load->getType(), "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        // Calculate the mask
        uint64_t Overlap = overlap(LLoc.Offset, LLoc.Size, SLoc.Offset, SLoc.Offset + SLoc.Size);
        Mask -= getMask(Overlap * 8);
      } else if ((SLoc.Size > LLoc.Size) && (SLoc.Offset > 0)) {
        // We are handling this case:
        // ---------------------------
        // Load1  = [ L1 L1 ]
        // Store1 =    [ S1 S1 S1 S1 ]
        // ---------------------------
        auto *ShiftValue = llvm::ConstantInt::get(StoredValue->getType(), SLoc.Offset * 8);
        StoredValue = llvm::BinaryOperator::CreateNUWShl(StoredValue, ShiftValue, "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        StoredValue = new llvm::TruncInst(StoredValue, Load->getType(), "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
        // Calculate the mask
        uint64_t Overlap = overlap(LLoc.Offset, LLoc.Size, SLoc.Offset, SLoc.Offset + SLoc.Size);
        Mask -= getMask(Overlap * 8, SLoc.Offset);
      }
      // 3. Merge the values
      if (CoalescedValue != nullptr) {
        // 4. Determine the mask value
        // uint64_t Mask = getMask(LLoc.Size * 8);
        // if (SLoc.Offset >= 0) {
        //   Mask -= getMask(SLoc.Size * 8, SLoc.Offset);
        // } else if (SLoc.Offset < 0) {
        //   Mask -= getMask(SLoc.Size * 8, 0, true);
        // }
        auto *MaskValue = llvm::ConstantInt::get(CoalescedValue->getType(), Mask);
        // 5. Apply the mask
        auto *MaskedValue = llvm::BinaryOperator::CreateAnd(CoalescedValue, MaskValue, "", Load);
        if (DebugMerge) {
          MaskedValue->dump();
        }
        // 6. Merge the values
        StoredValue = llvm::BinaryOperator::CreateOr(MaskedValue, StoredValue, "", Load);
        if (DebugMerge) {
          StoredValue->dump();
        }
      }
      // 7. Assign the value
      CoalescedValue = StoredValue;
    }
    // Replace the original value
    Load->replaceAllUsesWith(CoalescedValue);
    // Return the result
    return true;
  }

  bool coalesceStores(Assignment &AI) {
    // Fetch the load and store values
    auto *Load = AI.LLoc.Load;
    std::vector<llvm::StoreInst *> Stores;
    for (auto &SLoc : AI.SLocs) {
      Stores.push_back(SLoc.Store);
    }
    // Sort the vector in reverse order
    std::vector<llvm::StoreInst *> Reversed;
    for (auto *Store : Stores)
      Reversed.insert(Reversed.begin(), Store);
    Stores = Reversed;
    // Debug print the collected instructions
    if (DebugMerge) {
      std::cout << "coalesceStores" << std::endl;
      for (const auto &Store : Stores)
        Store->dump();
      Load->dump();
      std::cout << "basicBlock:" << std::endl;
      Load->getParent()->dump();
    }
    // Keep track if we modified the function
    bool MadeChanges = false;
    // Check if the stores are all from the base
    bool BaseStores = true;
    for (const auto &SLoc : AI.SLocs) {
      if (SLoc.Offset != 0) {
        BaseStores = false;
        break;
      }
    }
    // Check if the load uses a constant address
    bool ConstantAddressLoad = llvm::isa_and_nonnull<llvm::ConstantExpr>(Load->getPointerOperand());
    // Check the amount of constant address stores
    size_t ConstantAddressStores = 0;
    for (const auto &Store : Stores) {
      if (llvm::isa_and_nonnull<llvm::ConstantExpr>(Store->getPointerOperand()))
        ConstantAddressStores++;
    }
    if (DebugMerge) {
      llvm::outs() << "ConstantAddressLoad (bool): " << ConstantAddressLoad << "\n";
      llvm::outs() << "ConstantAddressStores (int): " << ConstantAddressStores << "\n";
      llvm::outs() << "BaseStores (bool): " << BaseStores << "\n";
    }
    // Check if we found consistent information
    if (ConstantAddressLoad && (ConstantAddressStores == Stores.size())) {
      MadeChanges = this->coalesceConstantPointerStores(Load, Stores);
    } else if (!ConstantAddressLoad && BaseStores && (ConstantAddressStores == 0)) {
      MadeChanges = this->coalesceSamePointerStores(Load, Stores);
    } else if (!ConstantAddressLoad && !BaseStores && (ConstantAddressStores == 0)) {
      MadeChanges = this->coalesceOffsetPointerStores(AI);
    }
    // Notify if we modified the function
    return MadeChanges;
  }

  // Utility methods

  uint64_t getMask(uint64_t Size, uint64_t Offset = 0, bool RightShift = false) {
    uint64_t BitShift = Offset * 8;
    switch (Size) {
    case 0:
      return RightShift ? (0x0000000000000000LL >> BitShift) : (0x0000000000000000LL << BitShift);
    case 8:
      return RightShift ? (0x00000000000000FFLL >> BitShift) : (0x00000000000000FFLL << BitShift);
    case 16:
      return RightShift ? (0x000000000000FFFFLL >> BitShift) : (0x000000000000FFFFLL << BitShift);
    case 24:
      return RightShift ? (0x0000000000FFFFFFLL >> BitShift) : (0x0000000000FFFFFFLL << BitShift);
    case 32:
      return RightShift ? (0x00000000FFFFFFFFLL >> BitShift) : (0x00000000FFFFFFFFLL << BitShift);
    case 40:
      return RightShift ? (0x000000FFFFFFFFFFLL >> BitShift) : (0x000000FFFFFFFFFFLL << BitShift);
    case 48:
      return RightShift ? (0x0000FFFFFFFFFFFFLL >> BitShift) : (0x0000FFFFFFFFFFFFLL << BitShift);
    case 56:
      return RightShift ? (0x00FFFFFFFFFFFFFFLL >> BitShift) : (0x00FFFFFFFFFFFFFFLL << BitShift);
    case 64:
      return RightShift ? (0xFFFFFFFFFFFFFFFFLL >> BitShift) : (0xFFFFFFFFFFFFFFFFLL << BitShift);
    default:
      llvm::report_fatal_error("getMask: unsupported size!");
    }
  }

  llvm::Value *coalesceValues(llvm::Instruction *I, llvm::Value *V1, llvm::Value *V2) {
    if (V1 == nullptr) {
      return V2;
    } else if (V2 == nullptr) {
      return V1;
    } else {
      // Fetch the value types
      auto *V1Ty = V1->getType();
      auto *V2Ty = V2->getType();
      // We only handle integer types
      if (V1Ty->isIntegerTy() && V2Ty->isIntegerTy()) {
        // Fetch the bitwidth of the values
        uint64_t V1Sz = V1Ty->getIntegerBitWidth();
        uint64_t V2Sz = V2Ty->getIntegerBitWidth();
        // Calculate the bigger value mask
        uint64_t M1F = getMask(V1Sz);
        // Calculate the smaller value mask
        uint64_t M2F = getMask(V2Sz);
        // Subtract the 2 masks
        uint64_t M3F = M1F - M2F;
        // Clear the lowest bits of the biggest value
        auto *Mask = llvm::ConstantInt::get(V1Ty, M3F);
        auto *AndOp = llvm::BinaryOperator::CreateAnd(V1, Mask, "", I);
        if (DebugMerge) {
          AndOp->dump();
        }
        // Zero extend the second value
        auto *ZextOp = new llvm::ZExtInst(V2, V1Ty, "", I);
        if (DebugMerge) {
          ZextOp->dump();
        }
        // Merge the two values
        auto *OrOp = llvm::BinaryOperator::CreateOr(AndOp, ZextOp, "", I);
        if (DebugMerge) {
          OrOp->dump();
        }
        // Return the coalesced values
        return OrOp;
      }
    }
    return nullptr;
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
                  if (DebugMerge) {
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
            if (DebugMerge) {
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
    if (DebugMerge) {
      llvm::outs() << "Unsupported SCEV: ";
      L->dump();
      S->dump();
    }
    return false;
  }

  // Function pass methods

  bool runOnFunction(llvm::Function &F) override {
    // Fetch the module
    auto *M = F.getParent();
    // Keep track if we modified the function
    bool MadeChanges = false;
    // Fetch the alias analysis results
    auto &AA = getAnalysis<llvm::AAResultsWrapperPass>().getAAResults();
    // Fetch the memory SSA information
    auto &MSSA = getAnalysis<llvm::MemorySSAWrapperPass>().getMSSA();
    // Fetch the dominator tree of the function
    auto &DT = MSSA.getDomTree();
    auto PDT = llvm::PostDominatorTree(F);
    // Fetch the scalar evolution interface
    auto &SE = getAnalysis<llvm::ScalarEvolutionWrapperPass>().getSE();
    if (DebugMerge) {
      MSSA.print(llvm::outs());
      std::cout << "Printed the MemorySSA" << std::endl;
    }
    // Execute the intra-block load-store merging
    for (auto &BB : F) {
      // Fecth the list of memory accesses in this block
      auto *Accs = MSSA.getBlockAccesses(&BB);
      // Fetch the list of memory definitions in this block (in reverse order)
      std::vector<const llvm::MemoryAccess *> Defs;
      auto *BBDefs = MSSA.getBlockDefs(&BB);
      if (BBDefs)
        for (auto &Def : *BBDefs)
          Defs.insert(Defs.begin(), &Def);
      // Skip the block if we don't have memory reads
      if (Accs && (Accs->size() == Defs.size()))
        continue;
      // Loop all the instructions in this block
      for (auto &I : BB) {
        // Check if we reached a call instruction
        if (auto *CI = llvm::dyn_cast<llvm::CallInst>(&I)) {
          // Skip InlineAsm
          if (CI->isInlineAsm())
            continue;

          // Fetch the called function
          auto *CF = CI->getCalledFunction();
          // Check if the function is not marked as 'readnone'
          if (!CF->hasFnAttribute(llvm::Attribute::ReadNone)) {
            // Check if the function is possibly problematic
            if (OkFunctions.find(CF->getName().str()) == OkFunctions.end()) {
              break;
            }
          }
        }
        // Check if we reached a load instruction
        else if (auto *LI = llvm::dyn_cast<llvm::LoadInst>(&I)) {
          if (DebugMerge) {
            llvm::outs() << "Handling a load instruction: ";
            LI->dump();
          }
          // Stop if we found a vectorised load
          if (LI->getType()->isVectorTy())
            break;
          // Assignment information
          Assignment AI;
          AI.LLoc.Load = LI;
          AI.LLoc.Ptr = getMemoryPointer(LI);
          AI.LLoc.Acc = MSSA.getMemoryAccess(LI);
          AI.LLoc.Loc = llvm::MemoryLocation::get(LI);
          AI.LLoc.Size = AI.LLoc.Loc.Size.getValue();
          AI.LLoc.Expr = SE.getSCEV(AI.LLoc.Ptr);
          // Fetch the load location
          auto &LLoc = AI.LLoc;
          // Determine the stores writing to this location
          if (LLoc.Acc) {
            for (auto *SMA : Defs) {
              // Skip the stores that are not dominating the load
              if (!MSSA.locallyDominates(SMA, LLoc.Acc))
                continue;
              // Consider only the memory definitions (ignore the PHI)
              if (auto *MD = llvm::dyn_cast<llvm::MemoryDef>(SMA)) {
                // Fetch the store instruction
                if (auto *SI = llvm::dyn_cast<llvm::StoreInst>(MD->getMemoryInst())) {
                  if (DebugMerge) {
                    llvm::outs() << "Handling a store instruction: ";
                    SI->dump();
                  }
                  // Check if we found a vectorised store
                  if (SI->getOperand(0)->getType()->isVectorTy()) {
                    AI.SLocs.clear();
                    break;
                  }
                  // Store instruction
                  StoreLocation SLoc;
                  SLoc.Store = SI;
                  SLoc.Acc = SMA;
                  SLoc.Ptr = getMemoryPointer(SI);
                  SLoc.Loc = llvm::MemoryLocation::get(SI);
                  SLoc.Size = SLoc.Loc.Size.getValue();
                  SLoc.Expr = SE.getSCEV(SLoc.Ptr);
                  // Calculate the alias analysis information
                  auto AAR = AA.alias(LLoc.Loc, SLoc.Loc);
                  if (DebugMerge) {
                    std::cout << "Aliasing?" << std::endl;
                    llvm::outs() << "MLL.Ptr: ";
                    LLoc.Ptr->dump();
                    llvm::outs() << "MLS.Ptr: ";
                    SLoc.Ptr->dump();
                    llvm::outs() << "SCEV(MLL.Ptr): ";
                    LLoc.Expr->dump();
                    llvm::outs() << "SCEV(MLS.Ptr): ";
                    SLoc.Expr->dump();
                    std::cout << "Size(MLL): " << std::dec << LLoc.Size << std::endl;
                    std::cout << "Size(MLS): " << std::dec << SLoc.Size << std::endl;
                    std::cout << "MayAlias: " << (AAR == llvm::AliasResult::MayAlias) << std::endl;
                    std::cout << "PartialAlias: " << (AAR == llvm::AliasResult::PartialAlias)
                              << std::endl;
                    std::cout << "MustAlias: " << (AAR == llvm::AliasResult::MustAlias)
                              << std::endl;
                  }
                  // Verify if we found a partial or full alias (good)
                  bool PartialOrFullAlias = (AAR == llvm::AliasResult::PartialAlias) ||
                                            (AAR == llvm::AliasResult::MustAlias);
                  // Verify if we found a may alias (bad)
                  bool MayAlias = (AAR == llvm::AliasResult::MayAlias);
                  // If we found a partial or full alias, we save the store
                  // instruction
                  bool ClearAndStop = false;
                  if (PartialOrFullAlias) {
                    // If we are storing constants on constant addresses, fine
                    if (auto *CE = llvm::dyn_cast<llvm::ConstantExpr>(SLoc.Store->getOperand(1))) {
                      if (auto *C = llvm::dyn_cast<llvm::ConstantInt>(SLoc.Store->getOperand(0))) {
                        if (DebugMerge) {
                          llvm::outs() << "Store found (1): ";
                          SLoc.Store->dump();
                        }
                        AI.SLocs.push_back(SLoc);
                      } else {
                        if (DebugMerge) {
                          llvm::outs() << "Unexpected write (1): ";
                          SMA->dump();
                        }
                        ClearAndStop = true;
                      }
                    }
                    // If we are writing to the same address that is being
                    // loaded, fine
                    else if (LLoc.Ptr == SLoc.Ptr) {
                      if (DebugMerge) {
                        llvm::outs() << "Store found (2): ";
                        SI->dump();
                      }
                      SLoc.Offset = 0;
                      AI.SLocs.push_back(SLoc);
                    }
                    // If we are writing to an internal offset from the one
                    // being loaded, fine
                    else if (isSupportedSCEV(SE, LLoc.Expr, LLoc.Size, SLoc)) {
                      if (DebugMerge) {
                        llvm::outs() << "Store found (3): ";
                        SLoc.Store->dump();
                      }
                      AI.SLocs.push_back(SLoc);
                    } else {
                      if (DebugMerge) {
                        llvm::outs() << "Unexpected write (2): ";
                        SMA->dump();
                      }
                      break;
                    }
                  }
                  // If we found a may alias, we clear the results and stop the
                  // search
                  else if (MayAlias) {
                    if (DebugMerge) {
                      llvm::outs() << "May alias (clearing the stores): ";
                      SMA->dump();
                    }
                    ClearAndStop = true;
                  }
                  // Check if we have to clear the results and stop
                  if (ClearAndStop) {
                    if (DebugMerge) {
                      llvm::outs() << "Clearing the stores\n";
                    }
                    AI.SLocs.clear();
                    break;
                  }
                  // Check if we completely covered the load slot
                  if (AI.isAssignmentComplete()) {
                    if (DebugMerge) {
                      llvm::outs() << "Stopping the search, slot completely assigned\n";
                    }
                    break;
                  }
                }
              }
            }
          }
          // At this point we can verify if we can propagate the stored
          // constants
          if (AI.SLocs.size() > 0) {
            // We can now coalesce the stores
            MadeChanges |= this->coalesceStores(AI);
          }
        }
      }
    }
    if (DebugMerge)
      std::cout << "ConstantMemoryCoalescing: " << MadeChanges << std::endl;
    // Notify if we modified the function
    mG->HasChanged |= MadeChanges;
    return MadeChanges;
  }

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const override {
    AU.setPreservesCFG();
    AU.addRequiredTransitive<llvm::AAResultsWrapperPass>();
    AU.addRequiredTransitive<llvm::MemorySSAWrapperPass>();
    AU.addRequiredTransitive<llvm::ScalarEvolutionWrapperPass>();
  }

}; // namespace

char MemoryCoalescingPass::ID = 0;

static llvm::RegisterPass<MemoryCoalescingPass> X("MemoryCoalescingPass",
                                                  "https://godbolt.org/z/1crY4j", false, false);

} // end of anonymous namespace

llvm::FunctionPass *getMemoryCoalescingPass(OptimizationGuide &G) {
  return new MemoryCoalescingPass(G);
}