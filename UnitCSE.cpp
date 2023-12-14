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

int UnitCSEInfo::findIdenticalInst(Instruction* inst, std::vector<Instruction*> uniqueInsts){
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

int UnitCSEInfo::findCommunativeInst(Instruction* inst, std::vector<Instruction*> uniqueInsts){
  auto opcode = inst->getOpcode();
  auto numOperands = inst->getNumOperands();
  for (size_t i=0;i<uniqueInsts.size();i++){
    auto uInst = uniqueInsts[i];
    if(uInst->getOpcode() == opcode && uInst->getNumOperands() == numOperands){
      // test communative
      // fadd a,b == fadd b,a
      bool match = true;
      if (inst->isCommutative()){
        for (size_t j=0; j<numOperands;j++){
          if(uInst->getOperand(j) != inst->getOperand(numOperands-j-1)){
            assert (numOperands==2);
            // acutally this is always numOperands == 2?
            match = false;
            break;
          }
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
        int match = Cse.findIdenticalInst(&inst, Cse.uniqueInsts);
        if (match == -1){
          match = Cse.findCommunativeInst(&inst, Cse.uniqueInsts);
        }
        if (match != -1){
          // found at least one pattern
          // replace all its use
          // outs()<< "matched "<< match<<"\n";
          inst.replaceAllUsesWith(Cse.uniqueInsts[match]);
          // outs()<< "inst "<< *Cse.uniqueInsts[match]<<"\n";
          NumInstCSE++;
        }
        else{
          // (match==-1), unique
          Cse.uniqueInsts.push_back(&inst);
        }
      }
    }
  }
  return PreservedAnalyses::all();
}
