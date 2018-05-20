#include "stdafx.h"
#include "info.hpp"
#include "field.hpp"


// относительный путь до папки с файлами ввода-вывода
const char DATA_PATH[] = "data/";


int main(int argc, char* argv[])
{
  Mts::Timer timer;
  timer.startTimer();

  Mts::SetLocale("ru");

  // run without arguments
  if (argc < 2) {
    PrintTaskInfo();
    return 0;
  }

  if (argc != 2) {
    PrintExitInfo(1);
    return 1; // bad arguments count
  }

  // opening input file
  std::wifstream inFile(DATA_PATH + std::string(argv[1]), std::ios::in);
  if (!inFile.is_open()) {
    PrintExitInfo(2);
    return 2; // error opening input file
  }

  // opening output file
  std::wofstream outFile(DATA_PATH + std::string("output"), std::ios::out);
  if (!outFile.is_open()) {
    PrintExitInfo(3);
    return 3; // error opening output file
  }

  // create field object && get input data
  Field field;
  if (!field.getFieldFromFile(inFile)) {
    PrintExitInfo(4);
    return 4; // bad input data
  }

  // build fence
  int fenceCount = field.buildFence();
  outFile << fenceCount;
  std::wcout << "Fence count: " << fenceCount << std::endl;

  timer.stopTimer();
  std::wcout << "RUNTIME: " << timer.getTime() << std::endl;

  return 0;
}
