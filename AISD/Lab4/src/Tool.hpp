#ifndef TOOL_H
#define TOOL_H


#include "Headers.hpp"
#include "Operation.hpp"


class Operation;


class Tool {
    
  public:

    Tool();
    Tool(int id, string type, int busyTime);
    ~Tool();

    bool getFromFile(istream &inFile);

    Tool* getCopy();
    int getId();
    string getType();
    bool isWork();
    void setWork(Operation* op);

  private:

    int id; // id инструмента
    string type; // тип инструмента
    int busyTime; // занятость инструмента

    Operation* operation;

};


#endif // TOOL_H
