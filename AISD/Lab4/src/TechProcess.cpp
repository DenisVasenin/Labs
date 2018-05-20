#include "TechProcess.hpp"


TechProcess::TechProcess() {
  this->id = 0;
  this->procRoot = new Operation();
}


TechProcess::TechProcess(int id, vector<Operation*> *opList, 
                        vector<Tool*> *tlList) {
  this->id = id;
  this->opList = opList;
  this->tlList = tlList;
  this->procRoot = new Operation();
}


TechProcess::~TechProcess() {
  deleteAll();
}

// ============================================================================

void TechProcess::deleteAll() {
  delete procRoot;
  for (int i = 0; i < operationList.size(); i++)
    delete operationList.at(i);
  for (int i = 0; i < toolList.size(); i++)
    delete toolList.at(i);
}

// ============================================================================

int TechProcess::getId() {
  return id;
}

// ============================================================================

// 
bool TechProcess::getFromFile(istream &inFile) {
  string str;
  int delimPos = 0;
  vector<Operation*> firstList;
  vector<Operation*> secondList;
  while (!inFile.eof()) {
    getline(inFile, str);
    if (!str.empty()) {
      for (int i = 0; i < str.size(); i++) {
        if (str[i] == ':' || str[i] == ';') delimPos = i;
      }
      int f = atoi(str.substr(0, delimPos).c_str());
      int s = atoi(str.substr(delimPos + 1).c_str());
      for (int i = 0; i < opList->size(); i++) {
        if (opList->at(i)->getId() == f) {
          Operation* fPtr = opList->at(i)->getCopy();;
          for (int j = 0; j < operationList.size(); j++) {
            if (fPtr->getId() == operationList.at(j)->getId()) {
              fPtr = operationList.at(j);
            }
          }
          if (!checkOperation(fPtr, &operationList)) {
            operationList.push_back(fPtr);
            firstList.push_back(fPtr);
          }
          if (s != 0) {
            for (int j = 0; j < opList->size(); j++) {
              if (opList->at(j)->getId() == s) {
                Operation* sPtr = opList->at(j)->getCopy();
                for (int k = 0; k < operationList.size(); k++) {
                  if (sPtr->getId() == operationList.at(k)->getId()) {
                    sPtr = operationList.at(k);
                  }
                }
                fPtr->addNextOperation(sPtr);
                if (!checkOperation(sPtr, &operationList)) {
                  operationList.push_back(sPtr);
                  secondList.push_back(sPtr);
                }
              }
            }
          }
        }
      }
    }
  }
  for (int i = 0; i < firstList.size(); i++)
    if (!checkOperation(firstList.at(i), &secondList)) 
      procRoot->addNextOperation(firstList.at(i));
  for (int i = 0; i < operationList.size(); i++) {
    string type = operationList.at(i)->getType();
    for (int j = 0; j < tlList->size(); j++) {
      string tp = tlList->at(j)->getType();
      if (tp == type) {
        Tool* tl = tlList->at(j)->getCopy();
        toolList.push_back(tl);
      }
    }
  }
  return true;
}


bool TechProcess::checkOperation(Operation *op, vector<Operation*> *opList) {
  for (int i = 0; i < opList->size(); i++) {
    if (opList->at(i)->getId() == op->getId()) {
      return true;
    }
  }
  return false;
}


//
void TechProcess::printTechProcess() {
  procRoot->printProcess(&toolList);
  //procRoot->test(0);
}
