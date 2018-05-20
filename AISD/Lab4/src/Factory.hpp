#ifndef FACTORY_H
#define FACTORY_H


#include "Headers.hpp"
#include "Operation.hpp"
#include "Tool.hpp"
#include "TechProcess.hpp"


class Factory {

  public:

    Factory();
    ~Factory();

    bool loadFromFile(const string &type, istream &inFile);

    void printResources();
    void printTechProcess(int id);

  private:

    vector<Operation*> operationList; // список возможных операций
    vector<Tool*> toolList; // список доступных станков
    vector<TechProcess*> techProcessList; // список техпроцессов

    bool loadOperations(Operation* operation, istream &inFile);
    bool loadTools(Tool* tool, istream &inFile);
    bool loadTechProcess(TechProcess* techProcess, istream &inFile);

    void deleteAll();

};


#endif // FACTORY_H
