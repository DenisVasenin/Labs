#ifndef TECHPROCESS_H
#define TECHPROCESS_H


#include "Headers.hpp"
#include "Operation.hpp"
#include "Tool.hpp"


class TechProcess {
    
  public:

    TechProcess();
    TechProcess(int id, vector<Operation*> *opList, vector<Tool*> *tlList);
    ~TechProcess();

    bool getFromFile(istream &inFile);
    void printTechProcess();

    int getId();

  private:

    int id; // id техпроцесса 
    Operation* procRoot; // корень дерева техпроцесса
    vector<Operation*> operationList; // список операций техпроцесса
    vector<Tool*> toolList; // список инструментов техпроцесса

    vector<Operation*>* opList; // ссылка на доступные операции
    vector<Tool*>* tlList; // ссылка на доступные инструменты

    void deleteAll();
    bool checkOperation(Operation *op, vector<Operation*> *opList);

};


#endif // TECHPROCESS_H
