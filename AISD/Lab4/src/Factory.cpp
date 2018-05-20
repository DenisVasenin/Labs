#include "Factory.hpp"


Factory::Factory() {}


Factory::~Factory() {
  deleteAll();
}

// ============================================================================

// удалить все данные
void Factory::deleteAll() {
  for (int i = 0; i < techProcessList.size(); i++)
    delete techProcessList.at(i);
  for (int i = 0; i < toolList.size(); i++)
    delete toolList.at(i);
  for (int i = 0; i < operationList.size(); i++)
    delete operationList.at(i);
}

// ============================================================================

// прочитать из файла
bool Factory::loadFromFile(const string &type, istream &inFile) {
  if (type == "operations") {
    Operation* operation = new Operation();
    return loadOperations(operation, inFile);
  } else if (type == "tools") {
    Tool* tool = new Tool();
    return loadTools(tool, inFile);
  } else if (type == "techprocess") {
    int id = techProcessList.size() + 1;
    TechProcess* techProcess = new TechProcess(id, &operationList, &toolList);
    return loadTechProcess(techProcess, inFile);
  } else return false;
}


// прочитать из файла список операций
bool Factory::loadOperations(Operation* operation, istream &inFile) {
  while (operation->getFromFile(inFile)) {
    operationList.push_back(operation);
    operation = new Operation();
  }
  delete operation;
  if (operationList.size() > 0) return true;
  else return false;
}


// прочитать из файла список инструментов
bool Factory::loadTools(Tool* tool, istream &inFile) {
  while (tool->getFromFile(inFile)) {
    toolList.push_back(tool);
    tool = new Tool();
  }
  delete tool;
  if (toolList.size() > 0) return true;
  else return false;
}


// прочитать из файла техпроцесс
bool Factory::loadTechProcess(TechProcess* techProcess, istream &inFile) {
  if (techProcess->getFromFile(inFile)) {
    techProcessList.push_back(techProcess);
    return true;
  } else {
    delete techProcess;
    return false;
  }
}

// ============================================================================

//
void Factory::printTechProcess(int id) {
  for (int i = 0; i < techProcessList.size(); i++) {
    if (techProcessList.at(i)->getId() == id) {
      techProcessList.at(i)->printTechProcess();
    }
  }
}


//
void Factory::printResources() {
  cout << endl;
  for (int i = 0; i < operationList.size(); i++) {
    cout << "OP_ID: " << operationList.at(i)->getId() << " ";
    cout << "OP_TYPE: " << operationList.at(i)->getType() << " ";
    cout << "OP_COST: " << operationList.at(i)->getCost();
    cout << endl; 
  }
  cout << endl;
  for (int i = 0; i < toolList.size(); i++) {
    cout << "TL_ID: " << toolList.at(i)->getId() << " ";
    cout << "TL_TYPE: " << toolList.at(i)->getType();
    cout << endl; 
  }
  cout << endl;
  for (int i = 0; i < techProcessList.size(); i++) {
    cout << "TP_ID: " << techProcessList.at(i)->getId();
    cout << endl;
  }
  cout << endl;
}
