#include "stdafx.h"
#include "chessboard.hpp"
#include "pathfinder.hpp"


// относительный путь до папки с файлами ввода-вывода
const char DATA_PATH[] = "data/";


void PrintTaskInfo() {
  std::wcout << std::endl << L"Пенкин С.В. группа PS-22" << std::endl << std::endl; 
  std::wcout << L"Задача:" << std::endl << L"Шахматная доска состоит из N строк и M столбцов (1 ≤ N, M ≤ 15). Имеется единственный белый король. У черных в распоряжении кони, слоны и ладьи. По заданному расположению фигур требуется взять белым королем все черные фигуры за минимальное число ходов, не находясь при этом под боем." << std::endl << std::endl;
  std::wcout << L"Пример запуска: ./build/lab2 input1" << std::endl << std::endl;
}


int main(int argc, char** argv) {
  Mts::SetLocale("ru");
  Mts::Timer timer;
  timer.startTimer();

  int exitCode = 0;

  std::wfstream inFile;
  if (argc < 2) {
    PrintTaskInfo();
    exitCode = 1;
  } else {
    std::string path(DATA_PATH + std::string(argv[1]));
    inFile.open(path.c_str(), std::ios::in);
    if (!inFile.is_open()) {
      exitCode = 2;
    } else {
      ChessBoard board;
      exitCode = board.getFromFile(inFile);
      if (exitCode == 0) {
        int wFC = board.getFiguresCount(figure_state::ALL , figure_color::WHITE, figure_type::ALL);
        int bFC = board.getFiguresCount(figure_state::ALL , figure_color::BLACK, figure_type::ALL);
        if (wFC > 0 && bFC > 0) {
          PathFinder pf(&board);
          int bP = pf.getBestPath(figure_color::WHITE, figure_type::KING);
          if (bP < Mts::INT_MAX) std::wcout << bP << std::endl;
          else std::wcout << -1 << std::endl;
        } else {
          std::wcout << 0 << std::endl;
        }
      }
      inFile.close();
    }
  }

  timer.stopTimer();
  if (exitCode == 0) {
    std::wcout << "PROGRAM RUNTIME: " << timer.getTime() << std::endl;
  }

  return exitCode;
}
