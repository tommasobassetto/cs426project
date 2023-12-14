#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitCSE.h"
#include "UnitLoopInfo.h"

#include <map>

#define DEBUG_TYPE "UnitCSE"
// Define any statistics here
STATISTIC(NumInstCSE, "Number of instructions eliminated");
using namespace llvm;
using namespace cs426;

int UnitCSEInfo::findSameInst(Instruction* inst, std::vector<Instruction*> uniqueInsts){
  auto opcode = inst->getOpcode();
  auto numOperands = inst->getNumOperands();
  for (size_t i=0;i<uniqueInsts.size();i++){
    auto uInst = uniqueInsts[i];
    if(uInst->getOpcode() == opcode && uInst->getNumOperands() == numOperands){
      // test whether operands are the same
      bool match = true;
      for (size_t j=0; j<numOperands;j++){
        if(uInst->getOperand(j) != inst->getOperand(j)){
          match = false;
          break;
        }
      }
      if (match){
        return i;
      }
    }
  }
  return -1;
}

PreservedAnalyses UnitCSE::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitCSE running on " << F.getName() << "\n";
  UnitCSEInfo Cse = UnitCSEInfo();
  for (BasicBlock &bb : F){
    for (Instruction &inst : bb) {
      if (!inst.getType()->isVoidTy()){// this means it is an assignment
        outs() << inst << "\n";
        bool mayEliminate = false;
        int match = Cse.findSameInst(&inst, Cse.uniqueInsts);
        if (match != -1){
          // found 1
          // replace all its use
          outs()<< "++++++++inst matched "<< *Cse.uniqueInsts[match]<<"\n";
          //
    //           if (inst.hasName()) {
    //     errs() << "Return Operand: " << inst.getName() << "\n";
    // } else {
    //     errs() << "inst->getName() = "<<inst.getName().str()<<"\n";
    // }
          inst.replaceAllUsesWith(Cse.uniqueInsts[match]);
        }
        // }
        if (!mayEliminate){
          Cse.uniqueInsts.push_back(&inst);
        }
      }
    }
  }
  return PreservedAnalyses::all();
}
