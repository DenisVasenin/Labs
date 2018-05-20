// 28. Информация  о  некотором  изделии  задана   с   помощью
// ориентированного графа.  Вершина графа соответствует отдельной
// операции,  а дуги показывают очередность  выполнения  операций
// (каждая   операция   может   начаться   не   ранее   окончания
// предшествующих операций).  Продолжительность  каждой  операции
// известна.  Имеется  один  станок  для  выполнения каждого типа
// операций.  Если станок освобождается,  то производится  та  из
// готовых  к выполнению операций,  для которой максимальный путь
// от соответствующей вершины до конца  имеет  наибольшую  длину.
// Определить  время  изготовления  изделия.  Выдать общий график
// выполнения операций и график загрузки каждого станка (12).

// ============================================================================

#include "Factory.hpp"


int main(int argc, char *argv[]) {
  ifstream operationsFile("./input/operations.txt", ios::in);
  ifstream toolsFile("./input/tools.txt", ios::in);
  ifstream techProcessFile("./input/techprocess.txt", ios::in);

  Factory factory;
  if (factory.loadFromFile("operations", operationsFile)) {
    if (factory.loadFromFile("tools", toolsFile)) {
      if (factory.loadFromFile("techprocess", techProcessFile)) {
        factory.printTechProcess(1);
        //factory.printResources();
      } else cout << "Error: tech process was not loaded.";
    } else cout << "Error: tools was not loaded.";
  } else cout << "Error: operations was not loaded.";

  return 0;
}
