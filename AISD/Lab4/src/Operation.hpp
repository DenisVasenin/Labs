#ifndef OPERATION_H
#define OPERATION_H


#include "Headers.hpp"
#include "Tool.hpp"


class Tool;


class Operation {
    
  public:

    Operation();
    Operation(int id, string type, int cost);
    ~Operation();

    bool getFromFile(istream &inFile);
    void printProcess(vector<Tool*> *toolList);

    Operation* getCopy();
    vector<Operation*> getNextOperations();
    bool isPrepare();
    bool isComplete();
    void toggleState();
    int getId();
    string getType();
    int getCost();
    int getMaxCost();

    void addNextOperation(Operation* operation);
    void deleteNextOperation(Operation* operation);
    void addPrevOperation(Operation* operation);
    void deletePrevOperation(Operation* operation);

    void test(int id);

  private:

    int id; // id операции
    string type; // тип операции
    int cost; // цена операции
    bool complete; //

    vector<Operation*> prevOperationList; // список пред. операций
    vector<Operation*> nextOperationList; // список след. операций

    void deleteAll();

};


#endif // OPERATION_H
