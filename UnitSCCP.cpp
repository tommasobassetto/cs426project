// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-sccp"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Instructions.h"
// for evaluator
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"

#include <map>
#include <set>

#include "UnitSCCP.h"

#define DEBUG_TYPE "UnitSCCP"
// Define any statistics here
STATISTIC(numInstrRemoved, "Number of instructions removed");
STATISTIC(numBBUnreachable, "Number of blocks made unreachable");
STATISTIC(numInstrReplaced, "Number of instructions replaced with simpler ones");

using namespace llvm;
using namespace cs426;

// Compute the meet of two values
UnitSCCPInfo::ValueType UnitSCCPInfo::meet(Value_ first, Value_ second) {
  if (first.type == BOTTOM || second.type == BOTTOM) {
    return BOTTOM;
  }

  if (first.type == TOP && second.type == TOP) {
    return TOP;
  }

  if ((first.type == CONSTANT && second.type == TOP) ||
      (second.type == CONSTANT && first.type == TOP)) {
    return CONSTANT;
  }

  if (first.type == CONSTANT && second.type == CONSTANT &&
    first.value == second.value) {
      return CONSTANT;
    }

  return BOTTOM;
}


UnitSCCPInfo::Value_ UnitSCCPInfo::evaluate(Instruction *inst) {
  // check https://llvm.org/doxygen/classllvm_1_1Interpreter.html
  // note: visit instruction is built in
  // handle binary ops
  // outs() << "--- in eval latcell:\n";
// outs()<< latCell.size()<< "\n";
//     for (const auto &edge : latCell) {
//         Instruction *source = edge.first;
//         auto type = edge.second.type;
//         auto varname = edge.second.varname;
//         auto value = edge.second.value;


//         outs() << *source;
//         outs()  <<", type: " << type;
//          outs()  << ", name = " << varname;
//          if(value)
//          outs() << ", v = " << *value << "\n";
//          else outs() <<", v = null!\n";
//     }

  if (BinaryOperator *binaryOp = dyn_cast<BinaryOperator>(inst)){
    Value *op1 = binaryOp->getOperand(0);
    Value *op2 = binaryOp->getOperand(1);
    Value *const1 = nullptr;
    Value *const2 = nullptr;

    if (isa<Constant>(op1)){
      // outs() << "op1 const!!\n";
      const1 = op1;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op1);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const1 = const_value_->second.value;
      }
      // if still not found, find in phi!!
      if (!const1){
        if(dyn_cast<PHINode>(op1)){
          auto opInstr = dyn_cast<Instruction>(op1);
          outs() << "opInstr: "<< *opInstr << "\n";
              if(latCell.count(opInstr)){
            const1 = latCell[opInstr].type == CONSTANT && isa<Constant>(latCell[opInstr].value) ? latCell[opInstr].value : nullptr;
            if (const1) outs() << "const phi 1 found to be a const!!\n";
            else {outs() << "NNNNNOOOOOOOOOOOOOOOO\n";}
          }
        }
      }
    }
    if (isa<Constant>(op2)){
      const2 = op2;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op2);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const2 = const_value_->second.value;
      }
      if (!const2){
        if(auto opInstr = dyn_cast<Instruction>(op2)){
          if(latCell.count(opInstr)){
            // const2 = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const2 found to be a const!!\n";
          }
        }
      }
    }

    if(const1 && const2) {
      outs() << "binaryOp const!!\n";
      if(inst->getType()->isIntegerTy()){
        // both are constants, add the result to the map
        // perform real operation
        // binary comes from https://llvm.org/docs/LangRef.html#binary-operations
        // outs() << "1::" << *const1<<"\n";
        // outs() << "2::" << *const2<<"\n";
        int64_t ValueArg1 = dyn_cast<ConstantInt>(const1)->getSExtValue();
        int64_t ValueArg2 = dyn_cast<ConstantInt>(const2)->getSExtValue();
        // first, integer
        if (binaryOp->getOpcode() == Instruction::Add) {
          int64_t result = ValueArg1 + ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          // outs() << "inst " << *inst<<"\n";
          // outs() << "RRRRRRRResult " << result<<"\n";
          // outs() << "reeeeeeeer " << *ret<<"\n";
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::Sub) {
          int64_t result = ValueArg1 - ValueArg2;
          Value *ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::Mul) {
          int64_t result = ValueArg1 * ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::UDiv) {
          int64_t result = (uint64_t)ValueArg1 / (uint64_t)ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::SDiv) {
          int64_t result = ValueArg1 / ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::URem) {
          uint64_t result = (uint64_t)ValueArg1 % (uint64_t)ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::SRem) {
          int64_t result = ValueArg1 % ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::Shl) {
          int64_t result = ValueArg1 << ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::LShr) {
          int64_t result = (uint64_t)ValueArg1 >> ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::AShr) {
          int64_t result = ValueArg1 >> ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::And) {
          int64_t result = ValueArg1 & ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::Or) {
          int64_t result = ValueArg1 | ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::Xor) {
          int64_t result = ValueArg1 ^ ValueArg2;
          Value * ret = ConstantInt::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else {
          outs() << "unsupported op " << binaryOp->getOpcode() << "\n";
          exit(-1);
        }
      }
      else if(inst->getType()->isFloatTy()){
        float ValueArg1 = dyn_cast<ConstantFP>(const1)->getValueAPF().convertToFloat();
        float ValueArg2 = dyn_cast<ConstantFP>(const2)->getValueAPF().convertToFloat();
        if (binaryOp->getOpcode() == Instruction::FAdd) {
          float result = ValueArg1 + ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FSub) {
          float result = ValueArg1 - ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FMul) {
          float result = ValueArg1 * ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FDiv) {
          float result = ValueArg1 / ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FRem) {
          float result = fmod(ValueArg1,ValueArg2);  // actually frem is fmod in c++
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else {
          outs() << "unsupported op " << binaryOp->getOpcode() << "\n";
          exit(-1);
        }
      }
      else if(inst->getType()->isDoubleTy()){
        double ValueArg1 = dyn_cast<ConstantFP>(const1)->getValueAPF().convertToDouble();
        double ValueArg2 = dyn_cast<ConstantFP>(const2)->getValueAPF().convertToDouble();
        if (binaryOp->getOpcode() == Instruction::FAdd) {
          double result = ValueArg1 + ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FSub) {
          double result = ValueArg1 - ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FMul) {
          double result = ValueArg1 * ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FDiv) {
          double result = ValueArg1 / ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FRem) {
          double result = fmod(ValueArg1,ValueArg2);  // actually frem is fmod in c++
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else {
          outs() << "unsupported op " << binaryOp->getOpcode() << "\n";
          exit(-1);
        }
      }
      else{
          outs() << "unsupported inst with binary ops " << *inst << "\n";
          exit(-1);
      }
    }
  }
  // handle unary ops
  else if (UnaryOperator *unaryOp = dyn_cast<UnaryOperator>(inst)){
    Value *op1 = unaryOp->getOperand(0);
    Value *const1 = nullptr;
    if (isa<Constant>(op1)){
      const1 = op1;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op1);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const1 = const_value_->second.value;
      }
      if (!const1){
        if(auto opInstr = dyn_cast<Instruction>(op1)){
          if(latCell.count(opInstr)){
            // const1 = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const1 found to be a const!!\n";
          }
        }
      }
    }
    if(const1){
      float ValueArg1 = dyn_cast<ConstantFP>(const1)->getValueAPF().convertToFloat();
      if (unaryOp->getOpcode() == Instruction::FNeg) {
        float result = - ValueArg1;
        Value * ret = ConstantFP::get(inst->getType(), result);
        Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
        constant_map.insert({inst,ret_value_});
        return ret_value_;
      }
      else {
        outs() << "unsupported op " << unaryOp->getOpcode() << "\n";
        exit(-1);
      }
    }
  }
  // handle icmp
  else if (ICmpInst *icmpInst = dyn_cast<ICmpInst>(inst)){
    ICmpInst::Predicate pred = icmpInst->getPredicate();
    Type *instructionType = icmpInst->getType();
    Value *op1 = icmpInst->getOperand(0);
    Value *op2 = icmpInst->getOperand(1);
    Value *const1 = nullptr;
    Value *const2 = nullptr;
    if (isa<Constant>(op1)){
      const1 = op1;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op1);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const1 = const_value_->second.value;
      }
      if (!const1){
        if(auto opInstr = dyn_cast<Instruction>(op1)){
          if(latCell.count(opInstr)){
            // const1 = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const1 found to be a const!!\n";
          }
        }
      }
    }

    if (isa<Constant>(op2)){
      const2 = op2;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op2);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const2 = const_value_->second.value;
      }
      if (!const2){
        if(auto opInstr = dyn_cast<Instruction>(op2)){
          if(latCell.count(opInstr)){
            // const2 = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const2 found to be a const!!\n";
          }
        }
      }
    }
    
    if(const1 && const2){
      outs() << "icmp const!!\n";

      // numBBUnreachable++; // 1 branches can be determined as unreachable
      bool result;
      result = ICmpInst::compare(dyn_cast<ConstantInt>(const1)->getValue(), dyn_cast<ConstantInt>(const2)->getValue(), pred);
      Value * ret = ConstantInt::get(inst->getType(), result);
      Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
      constant_map.insert({inst,ret_value_});
      return ret_value_;
    }
  }
  else if (FCmpInst *fcmpInst = dyn_cast<FCmpInst>(inst)){
    FCmpInst::Predicate pred = fcmpInst->getPredicate();
    Type *instructionType = fcmpInst->getType();
    Value *op1 = fcmpInst->getOperand(0);
    Value *op2 = fcmpInst->getOperand(1);
    Value *const1 = nullptr;
    Value *const2 = nullptr;
    if (isa<Constant>(op1)){
      const1 = op1;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op1);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const1 = const_value_->second.value;
      }
      if (!const1){
        if(auto opInstr = dyn_cast<Instruction>(op1)){
          if(latCell.count(opInstr)){
            // const1 = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const1 found to be a const!!\n";
          }
        }
      }
    }

    if (isa<Constant>(op2)){
      const2 = op2;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op2);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const2 = const_value_->second.value;
      }
      if (!const2){
        if(auto opInstr = dyn_cast<Instruction>(op2)){
          if(latCell.count(opInstr)){
            // const2 = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const2 found to be a const!!\n";
          }
        }
      }
    }

    if(const1 && const2){
      // numBBUnreachable++; // 1 branches can be determined as unreachable
      bool result;
      result = FCmpInst::compare(dyn_cast<ConstantFP>(const1)->getValueAPF(), dyn_cast<ConstantFP>(const2)->getValueAPF(), pred);
      Value * ret = ConstantInt::get(inst->getType(), result);
      Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
      constant_map.insert({inst,ret_value_});
      return ret_value_;
    }
  }
  // Handle branch instructions
  else if (BranchInst *branchInst = dyn_cast<BranchInst>(inst)) {
    Value *const_pred = nullptr;
    if (branchInst->isConditional()) {
      Value *pred = branchInst->getCondition();    
      if (isa<Constant>(pred)){
        const_pred = pred;
      }
      else {
        // check values in the map
        auto const_value_ = constant_map.find(pred);
        if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
          // in our map
          const_pred = const_value_->second.value;
        }
        if (!const_pred){
          if(auto opInstr = dyn_cast<Instruction>(pred)){
            if(latCell.count(opInstr)){
              // const_pred = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
              // outs() << "const_pred found to be a const!!\n";
            }
          }
        }
      }
    }

    if (const_pred){
      numBBUnreachable ++;
      bool pred_value = dyn_cast<ConstantInt>(const_pred)->getSExtValue();
      outs() << "branch const!! "<< pred_value << "\n";
      if (pred_value == true){
        branchInst->setSuccessor(1, branchInst->getSuccessor(0));
      }
      else{
        // false
        branchInst->setSuccessor(0, branchInst->getSuccessor(1));
      }
    }
  }
  else if (SelectInst *selectInst = dyn_cast<SelectInst>(inst)){
    Value *op1 = selectInst->getTrueValue();
    Value *op2 = selectInst->getFalseValue();
    Value *const1 = nullptr;
    Value *const2 = nullptr;
    if (isa<Constant>(op1)){
      const1 = op1;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op1);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const1 = const_value_->second.value;
      }
      if (!const1){
        if(auto opInstr = dyn_cast<Instruction>(op1)){
          if(latCell.count(opInstr)){
            // const1 = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const1 found to be a const!!\n";
          }
        }
      }
    }
    if (isa<Constant>(op2)){
      const2 = op2;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(op2);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const2 = const_value_->second.value;
      }
      if (!const2){
        if(auto opInstr = dyn_cast<Instruction>(op2)){
          if(latCell.count(opInstr)){
            // const2 = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const2 found to be a const!!\n";
          }
        }
      }
    }
    // until now const1 and const2 can still be variable
    if(const1){
      outs() << "really const1 yes????\n";
      // selectInst->setTrueValue(const1);
    }
    if(const2){
      // selectInst->setFalseValue(const2);
    }

    Value *const_pred = nullptr;
    Value *pred = selectInst->getCondition();    
    if (isa<Constant>(pred)){
      const_pred = pred;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(pred);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const_pred = const_value_->second.value;
      }
      if (!const_pred){
        if(auto opInstr = dyn_cast<Instruction>(pred)){
          if(latCell.count(opInstr)){
            // const_pred = latCell[opInstr].type == CONSTANT ? latCell[opInstr].value : nullptr;
            // outs() << "const_pred found to be a const!!\n";
          }
        }
      }
    }

    if (const_pred){
      bool pred_value = dyn_cast<ConstantInt>(const_pred)->getSExtValue();
      if (pred_value == true){
        Value * ret = selectInst->getTrueValue();
        Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
        constant_map.insert({inst,ret_value_});
        return ret_value_;
      }
      else{
        // false
        Value * ret = selectInst->getFalseValue();
        Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
        constant_map.insert({inst,ret_value_});
        return ret_value_;
      }
    }
  }

  // default return value, NECESSARY!!
  Value_ value;
  // todo: return value!!!!
  if(0){
  // if(latCell.count(inst)){
    outs() << "NONOO return same\n";
    value = latCell[inst];
  }
  else{
    outs() << "NONONONO NONOMONO return bottom\n";
    value = UnitSCCPInfo::Value_(UnitSCCPInfo::BOTTOM, inst->getName().str(), inst);
  }
  // value.type = UnitSCCPInfo::BOTTOM;
  return value;
}

std::set<Instruction*> UnitSCCPInfo::successors_(Instruction *inst) {
  std::set<Instruction*> next_instrs = std::set<Instruction*>();

  // if there's a branch we need both sides of the branch
  if (isa<BranchInst>(inst)) {
    BasicBlock *BB = inst->getParent();
    for (auto successor: successors(BB)) {
      next_instrs.insert(&successor->front());
    }
  } else {
    next_instrs.insert(inst->getNextNode());
  }
  return next_instrs;
}

bool UnitSCCPInfo::inEdges(Instruction *inst){
  // outs() << "---now execflags: "  << "\n";
  for (const auto &execFlag : execFlags) {
    Instruction *source = execFlag.first.first;
    Instruction *sink = execFlag.first.second;
    bool value = execFlag.second;
    if ( inst == sink && value == true){
      return true;
    }
  }
  return false;
}

void UnitSCCPInfo::visitInst(Instruction *inst) {
  outs() << "visiting inst: " << *inst <<"\n";
  Value_ val = evaluate(inst);
  Value_ valPrev;

  try {
    valPrev = latCell.at(inst);
  } catch (const std::out_of_range& e) {
    valPrev = Value_();
    valPrev.type = TOP;
  };

  latCell[inst] = val;
  if (val != valPrev) {
    // check if it's an assignment by checking if the return type is non-void
    if (!inst->getType()->isVoidTy()) {
      // add SSAOutEdges(S) to SSAWL
      for (User *user: inst->users()) {
        ssaWL.push_back(
          Edge(inst, dyn_cast<Instruction>(user))
        );
      }
    } else { // S is a branch instruction
      if (val.type == CONSTANT) {
      } else {
    outs() << "ffffffflowwl val.type: " << val.type <<"\n";
        for (Instruction *successor: successors_(inst)) {
    outs() << "ffffffflowwl inst pushed: " << *inst <<"\n";
         if(successor)
         outs() << "ffffffflowwl succ pushed: " << *successor << "\n";
         else outs() <<"ffffffflowwl succ pushed: null!\n";
          flowWL.push_back(Edge(inst, successor));
        }
      }
    }
  }
}

void UnitSCCPInfo::visitPhi(Instruction *inst) {
  PHINode *phi = dyn_cast<PHINode>(inst);
  unsigned numOperands = phi->getNumIncomingValues();

  outs() << "+++++++++++++ inst: " << *inst << "\n";
  outs() << "--- now latcell:\n";
outs()<< latCell.size()<< "\n";
    for (const auto &edge : latCell) {
        Instruction *source = edge.first;
        auto type = edge.second.type;
        auto varname = edge.second.varname;
        auto value = edge.second.value;

      if (type == CONSTANT){
        outs() << *source;
        outs()  <<", type: " << type;
         outs()  << ", name = " << varname;
         if(value)
         outs() << ", v = " << *value << "\n";
         else outs() <<", v = null!\n";
      }
    }

  // outs() << "---now execflags: "  << "\n";
  //   for (const auto &edge : execFlags) {
  //       Instruction *source = edge.first.first;
  //       Instruction *sink = edge.first.second;
  //       bool value = edge.second;

  //       outs() << *source << " -> " << *sink << ": " << (value ? "true" : "false") << "\n";
    // }
  
  for (unsigned i = 0; i < numOperands; ++i) {
    Value *incomingValue = phi->getIncomingValue(i);
    outs() << i << ",incoming: " << *incomingValue <<"\n";
    // outs() << i << ",incoming: " << *(dyn_cast<Instruction>(incomingValue)) <<"\n";
    Instruction *sourceInstr = nullptr;
    // if (sourceInstr = dyn_cast<Instruction>(incomingValue)){
    // }
    // else{
      // assume to be constant
      auto incomingBB = phi->getIncomingBlock(i);
      sourceInstr = incomingBB->getTerminator();
    // }
    assert(sourceInstr);
    UnitSCCPInfo::Edge edge = UnitSCCPInfo::Edge(sourceInstr,inst);
    if (execFlags.count(edge)){
      // outs() << "edge src = " << *sourceInstr << "\n";
      if (execFlags[edge] == true){
        Value_ valPrev;
        try {
          valPrev = latCell.at(inst);
        } catch (const std::out_of_range& e) {
          // outs() << "inst not found!!\n";
          valPrev = Value_();
          valPrev.type = TOP;
        };
        // outs() << "value_  = " << (valPrev.value == nullptr) << "\n";
        
        Value_ incomingValue_;
        // Value* sourceValue = nullptr;
        if (dyn_cast<Instruction>(incomingValue)){
          // outs() << "source cast!\n";
          // get LatCell(Uk)
          // try {
            // incomingValue_ = latCell.at(dyn_cast<Instruction>(incomingValue));
            // outs() << "found!??==" << (incomingValue_.value == nullptr) << "\n";
            if (latCell.count(dyn_cast<Instruction>(incomingValue))){
              incomingValue_ = latCell[dyn_cast<Instruction>(incomingValue)];
              // outs() << "?found!!!\n";
              assert(incomingValue_.value);
            }
            else{
              // outs() << "NNNNNNNNNNNNNNot found!==\n" ;
              incomingValue_ = Value_();
              incomingValue_.type = TOP;
            }
            // }
          // } catch (const std::out_of_range& e) {
          //   outs() << "~~~~~~~~~~~~~~out of range!\n";
          //   incomingValue_ = Value_();
          //   incomingValue_.type = TOP;
          // };
        }
        else if (isa<Constant>(incomingValue)){

          // sourceValue = incomingValue;
          incomingValue_ = Value_(ValueType::CONSTANT, "", incomingValue);
          // if (latCell.count(sourceInstr))

          // outs() << "found const!  = " << *(incomingValue_.value) << "\n";
        }
        else{
          incomingValue_ = Value_(ValueType::TOP, "", incomingValue);
          
        }
        auto newType = meet(valPrev, incomingValue_);
        outs() << "MMMMMMMMMMnewtype = " << newType << "\n";
        Value_ newVal;
        if (valPrev.type == ValueType::CONSTANT){
          newVal = Value_(newType, inst->getName().str(), valPrev.value);
          outs() << "prev constant\n";
        }
        else if (incomingValue_.type == ValueType::CONSTANT){
          newVal = Value_(newType, inst->getName().str(), incomingValue);
          outs() << "incoming constant\n";
        }
        else{ // no constant
          newVal = Value_(newType, inst->getName().str(), inst);
          outs() << "no constant\n";
        }
        
        latCell[inst] = newVal;
        if (latCell[inst] != valPrev){
          // add SSAOutEdges(S) to SSAWL
          outs() <<"!!!!! changed, added here\n";
          for (User *user: inst->users()) {
            outs() <<"user:" << *dyn_cast<Instruction>(user) <<"\n";
            ssaWL.push_back(
              Edge(inst, dyn_cast<Instruction>(user))
            );
          }
        }
      }
      else{
        // outs() << "edge is false\n";
      }
    }
    else{
      outs() << "edge not in execflag!!\n";
    }
  }
}

/// Main function for running the SCCP optimization
PreservedAnalyses UnitSCCP::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitSCCP running on " << F.getName() << "\n";
  UnitSCCPInfo Sccp = UnitSCCPInfo();

  std::set<Instruction*> visited = std::set<Instruction*>();

  // visit the first instruction
  Instruction *first = &F.front().front();
  Sccp.visitInst(first);
  visited.insert(first);

  // find the successors of the inst
  // add the edges to flowWL
  for (auto successor: Sccp.successors_(first)) {
    Sccp.flowWL.push_back(UnitSCCPInfo::Edge(
      first, successor
    ));
  }

  // main loop of SCCP
  while (!Sccp.flowWL.empty() || !Sccp.ssaWL.empty()) {
    if (!Sccp.flowWL.empty()) {
      UnitSCCPInfo::Edge edge = Sccp.flowWL.back();
      // possible that edge.second == nullptr for
      // this is the last instrction
      Sccp.flowWL.pop_back();
      // here just continue
      // i.e., *edge.first = ret i32 %b, no edge.second
      if (edge.second == nullptr)
        continue;

      try {
        if (Sccp.execFlags.at(edge)) continue;
      } catch (const std::out_of_range& e) {
        // false by default, so continue on current iteration
      };

      Sccp.execFlags[edge] = true;
      if (isa<PHINode>(edge.second)) {
        // outs() << "call phi from 1\n";
        Sccp.visitPhi(edge.second);
        visited.insert(edge.second);
      }
      if (!visited.contains(edge.second)) {
        Sccp.visitInst(edge.second);
        visited.insert(edge.second);

      }

      // if only one outgoing edge, add to flowWL
      std::set<Instruction*> next_instrs = Sccp.successors_(edge.second);
      if (next_instrs.size() == 1) {
        for (Instruction* item : next_instrs) {
          Sccp.flowWL.push_back(UnitSCCPInfo::Edge(edge.second, item));
        }
      }

      // This needs to be at the end so it doesn't interfere with the other checks
      // visited.insert(edge.second);
    }


    else if (!Sccp.ssaWL.empty()) {
      UnitSCCPInfo::Edge edge = Sccp.ssaWL.back();
      Sccp.ssaWL.pop_back();

      if (isa<PHINode>(edge.second)) {
        // outs() << "call phi from 2\n";
outs() << "visit ssa1 inst: "<< *edge.second << "\n";
        Sccp.visitPhi(edge.second);
        // visited.insert(edge.second);
      // } else if (Sccp.execFlags[edge]) { // if (E->sink has 1 or more executable in-edges)
      //   outs() << "visit ssa2 inst: "<< *edge.second << "\n";
      //   Sccp.visitInst(edge.second);
      // }
      } else if (Sccp.inEdges(edge.second)) { // if (E->sink has 1 or more executable in-edges)
        outs() << "visit ssa2 inst: "<< *edge.second << "\n";
        Sccp.visitInst(edge.second);
        // visited.insert(edge.second);
      }
      // else if ()
    }
  }

  // add a second pass to replace the uses with constants
  for (auto i: Sccp.latCell) {
    if (i.second.type == UnitSCCPInfo::CONSTANT) {
      // generate the LLVM value, and replace all uses of the instruction
      numInstrReplaced += i.first->getNumUses();
      numInstrRemoved++;
      outs() << "in replacing, inst " << *i.first << " is const and replaced\n";
      i.first->replaceAllUsesWith(i.second.value);
    }
  }

  dbgs() << "Cumulative statistics: " 
    << numInstrRemoved << " instructions removed, "
    << numBBUnreachable << " basic blocks rendered unreachable, "
    << numInstrReplaced << " instructions replaced.\n";

  // Set proper preserved analyses
  return PreservedAnalyses::all();
}