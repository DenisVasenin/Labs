#include "Operation.hpp"


Operation::Operation() {
  this->id = 0;
  this->type = "";
  this->cost = 0;
  this->complete = false;
}


Operation::Operation(int id, string type, int cost) {
  this->id = id;
  this->type = type;
  this->cost = cost;
  this->complete = false;
}


Operation::~Operation() {
  deleteAll();
}

// ============================================================================

// удалить операцию
void Operation::deleteAll() {
  for (int i = 0; i < prevOperationList.size(); i++)
    prevOperationList.at(i)->deleteNextOperation(this);
  for (int i = 0; i < nextOperationList.size(); i++)
    nextOperationList.at(i)->deletePrevOperation(this);
}

// ============================================================================

// добавить операцию в список след. операций
void Operation::addNextOperation(Operation* operation) {
  for (int i = 0; i < nextOperationList.size(); i++) {
    if (nextOperationList.at(i)->getId() == operation->getId()) return;
  }
  nextOperationList.push_back(operation);
  operation->addPrevOperation(this);
}


// удалить операцию из списка след. операций
void Operation::deleteNextOperation(Operation* operation) {
  for (int i = 0; i < nextOperationList.size(); i++) {
    if (nextOperationList.at(i)->getId() == operation->getId()) {
      nextOperationList.erase(nextOperationList.begin() + i);
      break;
    }
  }
}


// добавить операцию в список пред. операций
void Operation::addPrevOperation(Operation* operation) {
  for (int i = 0; i < prevOperationList.size(); i++) {
    if (prevOperationList.at(i)->getId() == operation->getId()) return;
  }
  prevOperationList.push_back(operation);
  operation->addNextOperation(this);
}


// удалить операцию из списка пред. операций
void Operation::deletePrevOperation(Operation* operation) {
  for (int i = 0; i < prevOperationList.size(); i++) {
    if (prevOperationList.at(i)->getId() == operation->getId()) {
      prevOperationList.erase(prevOperationList.begin() + i);
      break;
    }
  }
}

// ============================================================================

// вернуть копию операции
Operation* Operation::getCopy() {
  Operation* operation = new Operation(id, type, cost);
  return operation;
}

vector<Operation*> Operation::getNextOperations() {
  return nextOperationList;
}

int Operation::getId() { 
  return id; 
}

string Operation::getType() { 
  return type; 
}

int Operation::getCost() { 
  return cost; 
}

bool Operation::isPrepare() {
  bool prepare = true;
  for (int i = 0; i < prevOperationList.size(); i++) {
    prepare *= prevOperationList.at(i)->isComplete();
  }
  return prepare;
}

bool Operation::isComplete() {
  return complete;
}

void Operation::toggleState() {
  complete = !complete;
}

// ============================================================================

// прочитать параметры операции из файла 
bool Operation::getFromFile(istream &inFile) {
  string str;
  vector<int> delimPos;
  while (str.empty()) {
    if (inFile.eof()) return false;
    getline(inFile, str);
  }
  for (int i = 0; i < str.size(); i++) {
    if (str[i] == ':' || str[i] == ';') {
      delimPos.push_back(i);
    }
  }
  id = atoi(str.substr(0, delimPos[0]).c_str());
  type = str.substr(delimPos[0] + 1, delimPos[1] - delimPos[0] - 1);
  cost = atoi(str.substr(delimPos[1] + 1).c_str());

  return true;
}


//
void Operation::printProcess(vector<Tool*> *toolList) {
  complete = true;
  vector<Operation*> notWorkedList(nextOperationList);
  while (notWorkedList.size() > 0) {
    for (int i = 0; i < toolList->size(); i++) {
      if (!toolList->at(i)->isWork()) {
        int maxCost = 0, index = -1;
        for (int j = 0; j < notWorkedList.size(); j++) {
          if (toolList->at(i)->getType() == notWorkedList.at(j)->getType()) {
            if (notWorkedList.at(j)->isPrepare()) {
              int tmpMaxCost = notWorkedList.at(j)->getMaxCost();
              if (tmpMaxCost > maxCost) {
                maxCost = tmpMaxCost;
                index = j;
              }
            }
          }
        }
        if (index >= 0) {
          cout << "  TO: " << notWorkedList.at(index)->getId();
          cout << "  TYPE: " << notWorkedList.at(index)->getType();
          cout << "  MAXCOST: " << notWorkedList.at(index)->getMaxCost();
          cout << endl;

          vector<Operation*> newNextList(notWorkedList.at(index)->getNextOperations());
          toolList->at(i)->setWork(notWorkedList.at(index));
          notWorkedList.erase(notWorkedList.begin() + index);
          for (int k = 0; k < newNextList.size(); k++) {
            bool tmp = true;
            for (int n = 0; n < notWorkedList.size(); n++) {
              if (newNextList.at(k)->getId() == notWorkedList.at(n)->getId()) {
                tmp == false;
                break;
              }
            }
            if (tmp) notWorkedList.push_back(newNextList.at(k));
          }
        }
      }
    }
  }
}

// ============================================================================

// получить max путь до конца
int Operation::getMaxCost() {
  int nextCost, currCost = 0;
  for (int i = 0; i < nextOperationList.size(); i++) {
    nextCost = nextOperationList.at(i)->getMaxCost();
    if (nextCost > currCost) currCost = nextCost;
  }
  return currCost + cost;
}

// ============================================================================

void Operation::test(int id) {
  for (int i = 0; i < nextOperationList.size(); i++) {
    cout << "FROM: " << id;
    cout << "   ID: " << nextOperationList.at(i)->getId();
    cout << "   TYPE: " << nextOperationList.at(i)->getType();
    cout << "   COST: " << nextOperationList.at(i)->getCost();
    cout << endl; 
    nextOperationList.at(i)->test(nextOperationList.at(i)->getId());
  }
}
