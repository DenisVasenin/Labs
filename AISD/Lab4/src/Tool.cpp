#include "Tool.hpp"


Tool::Tool() {
  this->id = 0;
  this->type = "";
  this->busyTime = 0;
  this->operation = nullptr;
}

Tool::Tool(int id, string type, int busyTime) {
  this->id = id;
  this->type = type;
  this->busyTime = busyTime;
  this->operation = nullptr;
}

Tool::~Tool() {}

// ============================================================================

// вернуть копию операции
Tool* Tool::getCopy() {
  Tool* tool = new Tool(id, type, busyTime);
  return tool;
}

int Tool::getId() {
  return id;
}

string Tool::getType() {
  return type;
}

bool Tool::isWork() {
  if (busyTime > 0) {
    busyTime--;
    return true;
  } else {
    if (operation) {
      operation->toggleState();
      operation = nullptr;
    }
    return false;
  }
}

void Tool::setWork(Operation* op) {
  this->operation = op;
  this->busyTime += operation->getCost();
}

// ============================================================================

// прочитать параметры инструмента из файла 
bool Tool::getFromFile(istream &inFile) {
  string str;
  int delimPos = 0;
  while (str.empty()) {
    if (inFile.eof()) return false;
    getline(inFile, str);
  }
  for (int i = 0; i < str.size(); i++) {
    if (str[i] == ':' || str[i] == ';') {
      delimPos = i;
    }
  }
  id = atoi(str.substr(0, delimPos).c_str());
  type = str.substr(delimPos + 1);

  return true;
}
