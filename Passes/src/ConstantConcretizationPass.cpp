#include <Passes/ConstantConcretizationPass.hpp>
#include <llvm/Support/CommandLine.h>
#include <Synthesis/Solver.hpp>

using namespace llvm;

// https://llvm.org/docs/WritingAnLLVMPass.html

namespace {

llvm::cl::opt<unsigned> SolutionsLimit("clc-solutions-limit",
  llvm::cl::desc("Limit the solutions computed by the constant concretization"),
  llvm::cl::value_desc("value"),
  llvm::cl::init(256),
  llvm::cl::Optional);

llvm::cl::opt<unsigned> SolverTimeout("clc-solver-timeout",
  llvm::cl::desc("Limit the time used by Z3 to solve the queries"),
  llvm::cl::value_desc("value"),
  llvm::cl::init(2),
  llvm::cl::Optional);

llvm::cl::opt<bool> PrintSMTQuery("clc-print-smt-query",
  llvm::cl::desc("Print the SMT query before solving it"),
  llvm::cl::value_desc("flag"),
  llvm::cl::init(false),
  llvm::cl::Optional);

llvm::cl::opt<bool> Debug("clc-debug",
  llvm::cl::value_desc("flag"),
  llvm::cl::init(false),
  llvm::cl::Optional);

// Useful structures

typedef struct PathCondition {
  souper::Inst *Candidate = nullptr;
  llvm::Value *Condition = nullptr;
  bool Negated = false;
} PathCondition;

// Utility functions

std::unique_ptr<souper::SMTLIBSolver> GetUnderlyingSolver() {
  std::string Z3PathStr("/usr/local/bin/z3");
  if (!std::filesystem::exists(Z3PathStr))
    llvm::report_fatal_error("Solver '" + Z3PathStr +
                             "' does not exist or is not executable.\nSet path "
                             "by -z3-path=<z3_binary_path>");
  return souper::createZ3Solver(souper::makeExternalSolverProgram(Z3PathStr), false);
}

uint64_t ApplyMask(uint64_t Value, uint64_t Size) {
  // Simple algorithm, no overflow issues up to 64 bits
  uint64_t Mask = (uint64_t)(((__uint128_t)1 << Size) - 1);
  Value &= Mask;
  return Value;
}

bool CollectBranchAssumptions(llvm::Function *F, llvm::Instruction *I,
  std::vector<PathCondition> &Assumptions) {

  // TODO: a complete logic would require to calculate the
  // disjoint sets of path constraints leading to the
  // basic block containing the instruction I

  // Retrieve a single path constraint from the entry block
  std::stack<llvm::BasicBlock *> WorklistBB{{I->getParent()}};
  std::set<llvm::BasicBlock *> KnownBB;
  std::set<llvm::Value *> KnownPC;
  std::vector<PathCondition> PathConstraints;
  while (!WorklistBB.empty()) {
    // Fetch the basic block
    auto *BB = WorklistBB.top();
    WorklistBB.pop();
    // Skip if known
    if (KnownBB.count(BB))
      continue;
    KnownBB.insert(BB);
    // Obtain the predecessors
    llvm::BasicBlock *UnconditionalBB = nullptr;
    llvm::BasicBlock *ConditionalBB = nullptr;
    for (auto *PBB : predecessors(BB)) {
      if (auto *T = llvm::dyn_cast<llvm::BranchInst>(PBB->getTerminator())) {
        if (T->isConditional()) {
          ConditionalBB = PBB;
          break;
        }
      }
    }
    // Process the predecessor
    if (ConditionalBB) {
      // Extract the path condition
      if (auto *T = llvm::dyn_cast<llvm::BranchInst>(ConditionalBB->getTerminator())) {
        // Skip if it's a known condition
        if (!KnownPC.count(T->getCondition())) {
          PathCondition PC;
          PC.Condition = T->getCondition();
          PC.Negated = T->getSuccessor(0) != BB;
          PathConstraints.push_back(PC);
          // Mark the condition as known
          KnownPC.insert(T->getCondition());
        }
      }
      WorklistBB.push(ConditionalBB);
    } else {
      for (auto *PBB : predecessors(BB)) {
        UnconditionalBB = PBB;
        break;
      }
      if (UnconditionalBB)
        WorklistBB.push(UnconditionalBB);
    }
  }
  // Debug dump the path constraints
  if (Debug) {
    llvm::outs() << "Constraints:\n";
    for (auto &PC : PathConstraints)
      PC.Condition->dump();
  }
  // Slice the expression
  std::stack<llvm::Value *> Worklist{{I}};
  std::set<llvm::Value *> Used;
  while (!Worklist.empty()) {
    // Fetch the value
    auto *V = Worklist.top();
    Worklist.pop();
    // Skip if known
    if (Used.count(V))
      continue;
    // Skip if constant
    if (llvm::isa<llvm::ConstantInt>(V))
      continue;
    // Save the value
    Used.insert(V);
    // Stop if it's a 'load'
    if (llvm::isa<llvm::LoadInst>(V))
      continue;
    // Fetch the operands
    if (auto *I = llvm::dyn_cast<llvm::Instruction>(V)) {
      for (size_t i = 0; i < I->getNumOperands(); i++)
        Worklist.push(I->getOperand(i));
    }
  }
  // Debug dump used values
  if (Debug) {
    llvm::outs() << "Used:\n";
    for (auto *U : Used)
      U->dump();
  }
  // Determine the useful assumptions
  for (const auto &PC : PathConstraints) {
    if (Debug)
      llvm::outs() << "Condition slice:\n";
    // Slice the assumption
    std::stack<llvm::Value *> Worklist{{PC.Condition}};
    std::set<llvm::Value *> Known;
    bool Useful = false;
    while (!Worklist.empty()) {
      // Fetch the value
      auto *V = Worklist.top();
      Worklist.pop();
      // Skip if known
      if (Known.find(V) != Known.end())
        continue;
      // Skip if constant
      if (llvm::isa<llvm::ConstantInt>(V))
        continue;
      // Debug dump
      if (Debug)
        V->dump();
      // Save the value
      Known.insert(V);
      // Is a useful assumption?
      if (Used.find(V) != Used.end())
        Useful = true;
      // Stop if it's a 'load'
      if (llvm::isa<llvm::LoadInst>(V))
        continue;
      // Fetch the operands
      if (auto *I = llvm::dyn_cast<llvm::Instruction>(V)) {
        for (size_t i = 0; i < I->getNumOperands(); i++)
          Worklist.push(I->getOperand(i));
      }
    }
    if (Debug)
      llvm::outs() << "Useful: " << Useful << "\n";
    // Save if useful
    if (Useful) {
      Used.insert(Known.begin(), Known.end());
      Assumptions.push_back(PC);
    }
  }
  // Notify if we found assumptions
  return !Assumptions.empty();
}

bool CollectLLVMAssumptions(llvm::Function *F, llvm::Instruction *I,
  std::set<llvm::CallInst *> &Assumptions) {
  // Fetch the 'llvm.assume' function
  auto *LLVMAssume = F->getParent()->getFunction("llvm.assume");
  if (!LLVMAssume)
    return false;
  // Find the uses inside the function
  std::vector<llvm::CallInst *> Calls;
  for (auto *U : LLVMAssume->users()) {
    if (auto *CI = llvm::dyn_cast<llvm::CallInst>(U)) {
      if (CI->getFunction() == F)
        Calls.push_back(CI);
    }
  }
  if (Calls.empty())
    return false;
  // Order the assumptions by dominance
  llvm::DominatorTree DT(*F);
  std::sort(Calls.begin(), Calls.end(),
            [&DT](const llvm::CallInst *A, const llvm::CallInst *B) { return DT.dominates(A, B); });
  // Slice the expression
  std::stack<llvm::Value *> Worklist{{I}};
  std::set<llvm::Value *> Used;
  while (!Worklist.empty()) {
    // Fetch the value
    auto *V = Worklist.top();
    Worklist.pop();
    // Skip if known
    if (Used.find(V) != Used.end())
      continue;
    // Skip if constant
    if (llvm::isa<llvm::ConstantInt>(V))
      continue;
    // Save the value
    Used.insert(V);
    // Stop if it's a 'load'
    if (llvm::isa<llvm::LoadInst>(V))
      continue;
    // Fetch the operands
    if (auto *I = llvm::dyn_cast<llvm::Instruction>(V)) {
      for (size_t i = 0; i < I->getNumOperands(); i++)
        Worklist.push(I->getOperand(i));
    }
  }
  // Determine the useful assumptions
  for (auto *CI : Calls) {
    // Slice the assumption
    std::stack<llvm::Value *> Worklist{{CI->getOperand(0)}};
    std::set<llvm::Value *> Known;
    bool Useful = false;
    while (!Worklist.empty()) {
      // Fetch the value
      auto *V = Worklist.top();
      Worklist.pop();
      // Skip if known
      if (Known.find(V) != Known.end())
        continue;
      // Skip if constant
      if (llvm::isa<llvm::ConstantInt>(V))
        continue;
      // Save the value
      Known.insert(V);
      // Is a useful assumption?
      if (Used.find(V) != Used.end())
        Useful = true;
      // Stop if it's a 'load'
      if (llvm::isa<llvm::LoadInst>(V))
        continue;
      // Fetch the operands
      if (auto *I = llvm::dyn_cast<llvm::Instruction>(V)) {
        for (size_t i = 0; i < I->getNumOperands(); i++) {
          Worklist.push(I->getOperand(i));
        }
      }
    }
    // Save if useful
    if (Useful) {
      Used.insert(Known.begin(), Known.end());
      Assumptions.insert(CI);
    }
  }
  // Notify if we found assumptions
  return !Assumptions.empty();
}

// Utility structures

typedef struct ProvedConstant {
  souper::Inst *I;
  uint64_t V;
  ProvedConstant(souper::Inst *I, uint64_t V) : I(I), V(V) {}
} ProvedConstant;

// Pass definition

struct ConstantConcretizationPass : FunctionPass {
  static char ID;

  OptimizationGuide *mOG = nullptr;

  ConstantConcretizationPass() : FunctionPass(ID) {}
  ConstantConcretizationPass(OptimizationGuide &OG) : FunctionPass(ID), mOG(&OG) {}

  bool runOnFunction(Function &F) override {
    bool HasChanged = false;
    // Fetch the module pointer
    auto *M = F.getParent();
    // Fetch the RAM pointer
    auto *RAM = M->getGlobalVariable("RAM");
    if (!RAM || !mOG)
      return false;
    // Find the load instructions
    for (auto *I : getOrderedInstructions(&F)) {
      if (auto *L = llvm::dyn_cast<llvm::LoadInst>(I)) {
        // Obtain the stripped pointer
        auto *P = L->getPointerOperand()->stripPointerCasts();
        // Constant access
        if (auto *CE = llvm::dyn_cast<llvm::ConstantExpr>(P)) {
          if (CE->getOperand(0) == RAM) {
            if (auto *C = llvm::dyn_cast<llvm::ConstantInt>(CE->getOperand(2))) {
              // Fetch the address
              uint64_t Address = C->getLimitedValue();
              // Check if it's a known address
              auto IT = mOG->Constants.find(Address);
              if (IT != mOG->Constants.end()) {
                // Fetch the loaded type
                auto *LTy = L->getType();
                // Bail out if not integer
                if (LTy->isIntegerTy()) {
                  // Fetch the value and mask it
                  uint64_t Value = ApplyMask(IT->second, LTy->getIntegerBitWidth());
                  // Concretize the load
                  auto *Constant = llvm::ConstantInt::get(L->getType(), Value);
                  // Replace the load
                  L->replaceAllUsesWith(Constant);
                  // Remove the load
                  L->eraseFromParent();
                  // Mark it as modified
                  HasChanged = true;
                }
              } else if (!mOG->Sections.empty()) {
                // Check if the value lies in a binary section
                for (const auto &section : mOG->Sections) {
                  if (Address >= section.first && Address < section.second) {
                    std::cout << "[!] Possible constant address: 0x"
                    << std::hex << Address << std::endl;
                    break;
                  }
                }
              }
            }
          }
        }
        // Symbolic access
        else if (auto *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(P)) {
          if (GEP->getPointerOperand() == RAM) {
            if (auto *J = llvm::dyn_cast<llvm::Instruction>(GEP->getOperand(2))) {
              // Fetch the loaded and index types
              auto *LTy = L->getType();
              auto *JTy = J->getType();
              // Bail out if not integer
              if (LTy->isIntegerTy() && JTy->isIntegerTy()) {
                // Use Souper
                souper::InstContext IC;
                souper::ExprBuilderContext EBC;
                souper::ExprBuilderOptions EBO;
                souper::FunctionCandidateSet FCS;
                // Collect the assumptions
                std::vector<PathCondition> SouperAssumptions;
                std::vector<PathCondition> BranchAssumptions;
                std::set<llvm::CallInst *> LLVMAssumptions;

                if (CollectLLVMAssumptions(&F, J, LLVMAssumptions)) {
                  for (auto *CI : LLVMAssumptions) {
                    // Mark the candidate instruction
                    EBO.CandidateFilterInstruction = CI->getOperand(0);
                    // Extract the candidates
                    FCS = souper::ExtractCandidates(&F, IC, EBC, EBO);
                    // Identify the candidate
                    souper::Inst *Candidate = nullptr;
                    for (auto &B : FCS.Blocks) {
                      for (auto &R : B->Replacements) {
                        if ((R.Origin != EBO.CandidateFilterInstruction) ||
                            (R.Mapping.LHS->Width != 1))
                          continue;
                        Candidate = R.Mapping.LHS;
                        break;
                      }
                    }
                    if (!Candidate)
                      llvm::report_fatal_error("identifyChildren (1): no available candidates!");
                    // Save the assumption candidate
                    SouperAssumptions.push_back({ Candidate, nullptr, false });
                  }
                  // Debug print the amount of assumptions
                  if (Debug)
                    llvm::outs() << "LLVM assumptions: " << LLVMAssumptions.size() << "\n";
                }
                
                if (CollectBranchAssumptions(&F, J, BranchAssumptions)) {
                  for (const auto &PC : BranchAssumptions) {
                    // Mark the candidate instruction
                    EBO.CandidateFilterInstruction = PC.Condition;
                    // Extract the candidates
                    FCS = souper::ExtractCandidates(&F, IC, EBC, EBO);
                    // Identify the candidate
                    souper::Inst *Candidate = nullptr;
                    for (auto &B : FCS.Blocks) {
                      for (auto &R : B->Replacements) {
                        if ((R.Origin != EBO.CandidateFilterInstruction) ||
                            (R.Mapping.LHS->Width != 1))
                          continue;
                        Candidate = R.Mapping.LHS;
                        break;
                      }
                    }
                    if (!Candidate)
                      llvm::report_fatal_error("identifyChildren (1): no available candidates!");
                    // Save the assumption candidate
                    SouperAssumptions.push_back({ Candidate, nullptr, PC.Negated });
                  }
                  // Debug print the amount of assumptions
                  if (Debug)
                    llvm::outs() << "Branch assumptions: " << BranchAssumptions.size() << "\n";
                }

                // Extract the index cadidate
                EBO.CandidateFilterInstruction = J;
                FCS = souper::ExtractCandidates(&F, IC, EBC, EBO);
                souper::CandidateReplacement *CR = nullptr;
                for (auto &B : FCS.Blocks) {
                  for (auto &R : B->Replacements) {
                    if ((R.Origin != EBO.CandidateFilterInstruction) ||
                        (R.Mapping.LHS->Width != 64))
                      continue;
                    CR = &R;
                    break;
                  }
                }
                if (!CR)
                  llvm::report_fatal_error("identifyChildren (2): no available candidates!");
                // Determine the possible values
                souper::Inst *Solution = nullptr;
                // Create a new variable
                souper::Inst *LoadIndex = IC.createVar(CR->Mapping.LHS->Width, "LoadIndex");
                // Map the variable to the left-hand side
                souper::InstMapping IM(CR->Mapping.LHS, LoadIndex);
                // Search the valid solutions
                std::vector<ProvedConstant> RecoveredConstants;
                do {
                  std::vector<souper::Inst *> ModelInstructions;
                  std::vector<llvm::APInt> ModelValues;
                  // Populate the preconditions
                  std::vector<souper::Inst *> Preconditions;
                  souper::Inst *Precondition = nullptr;
                  // Build the exclusions
                  for (const auto &RecoveredConstant : RecoveredConstants) {
                    souper::Inst *NotConstant =
                        IC.getInst(souper::Inst::Ne, 64, {CR->Mapping.LHS, RecoveredConstant.I});
                    Preconditions.push_back(NotConstant);
                  }
                  // Build the assumptions
                  for (const auto &PC : SouperAssumptions) {
                    souper::Inst *Assumption = IC.getInst(
                        (PC.Negated ? souper::Inst::Ne : souper::Inst::Eq),
                        1,
                        {PC.Candidate, IC.getConst(llvm::APInt(1, 1))}
                      );
                    Preconditions.push_back(Assumption);
                  }
                  // Add the preconditions
                  if (!Preconditions.empty())
                    Precondition = IC.getInst(souper::Inst::And, 1, Preconditions);
                  // Build the query
                  const auto &Query = souper::BuildQuery(IC, CR->BPCs, CR->PCs, IM,
                                                         &ModelInstructions, Precondition, true);
                  // Debug print the SMT query if requested
                  if (PrintSMTQuery) {
                    llvm::outs() << "[+] SMT Query:\n";
                    llvm::outs() << Query << "\n";
                  }
                  // Solve the query
                  bool IsSat = false;
                  GlobalSolver::Get().isSatisfiable(Query, IsSat, ModelInstructions.size(), &ModelValues, SolverTimeout);
                  // Check if we satisfied the query
                  if (!IsSat)
                    break;
                  // Parse the solution
                  Solution = nullptr;
                  for (int i = 0; i < ModelValues.size(); i++)
                    if (ModelInstructions[i]->Name == "LoadIndex")
                      Solution = IC.getConst(ModelValues[i]);
                  // Check if we got a solution
                  if (!Solution)
                    break;
                  // Store the solution
                  auto Proved = ProvedConstant(Solution, Solution->Val.getLimitedValue());
                  RecoveredConstants.push_back(Proved);
                  // Stop if we found an invalid solution
                  if (!mOG->Constants.count(Proved.V))
                    break;
                  // Stop if we reached the limit
                  if (RecoveredConstants.size() > SolutionsLimit)
                    break;
                } while (Solution);
                // Is it loading constants?
                std::vector<std::tuple<uint64_t, uint64_t>> Constants;
                for (const auto &RecoveredConstant : RecoveredConstants) {
                  // Check if it's a mapped address
                  auto IT = mOG->Constants.find(RecoveredConstant.V);
                  if (IT != mOG->Constants.end()) {
                    Constants.push_back(std::make_tuple(IT->first, IT->second));
                    if (Debug)
                      std::cout << "[FETCHING] [0x" << std::hex << IT->first << "] = 0x" << std::hex << IT->second << std::endl;
                  } else if (!mOG->Sections.empty()) {
                    // Check if the value lies in a binary section
                    for (const auto &section : mOG->Sections) {
                      if (RecoveredConstant.V >= section.first && RecoveredConstant.V < section.second) {
                        std::cout << "[!] Possible constant address: 0x"
                        << std::hex << RecoveredConstant.V << std::endl;
                        break;
                      }
                    }
                  }
                }
                // Generate a select chain
                if (!Constants.empty() && (RecoveredConstants.size() == Constants.size())) {
                  // Generate the selected value
                  llvm::Value *Select = llvm::ConstantInt::get(LTy, std::get<1>(Constants[0]));
                  // Loop the rest of the values
                  for (size_t i = 1; i < Constants.size(); i++) {
                    // Fetch the constant
                    const auto &Tuple = Constants[i];
                    // Obtain the masked value
                    uint64_t Value = ApplyMask(std::get<1>(Tuple), LTy->getIntegerBitWidth());
                    // Generate the constants
                    auto *Address = llvm::ConstantInt::get(JTy, std::get<0>(Tuple));
                    auto *Constant = llvm::ConstantInt::get(LTy, Value);
                    // Generate the comparison
                    auto *Cmp = llvm::CmpInst::Create(llvm::Instruction::ICmp,
                                                      llvm::ICmpInst::ICMP_EQ, J, Address, "", L);
                    // Generate the select
                    Select = llvm::SelectInst::Create(Cmp, Constant, Select, "", L);
                  }
                  // Replace the load
                  L->replaceAllUsesWith(Select);
                  // Remove the load
                  L->eraseFromParent();
                  // Mark it as modified
                  HasChanged = true;
                }
              }
            }
          }
        }
      }
    }
    // Update the change state
    if (mOG)
      mOG->HasChanged |= HasChanged;
    // Notify about the changes
    return HasChanged;
  }

  void getAnalysisUsage(AnalysisUsage &AU) const override { AU.setPreservesCFG(); }

}; // namespace

char ConstantConcretizationPass::ID = 0;

static RegisterPass<ConstantConcretizationPass> X("ConstantConcretizationPass",
                                                  "Concretize the load instructions reading from the binary",
                                                  false /* Only looks at CFG */,
                                                  false /* Analysis Pass */);

} // end of anonymous namespace

FunctionPass *getConstantConcretizationPassPass(OptimizationGuide &OG) {
  return new ConstantConcretizationPass(OG);
}
