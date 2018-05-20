#include "info.hpp"


void PrintTaskInfo() {
  std::wcout << L"Пенкин С.В. группа PS-22" << std::endl << std::endl; 
  std::wcout << L"Задача:" << std::endl << L"В заповеднике растет роща реликтовых деревьев. Для их защиты требуется обнести рощу забором. Но для обеспечения доступа к остальной территории заповедника площадь участка, окруженного забором, должна быть минимальной. Деревья растут точно в узлах координатной сетки на расстоянии одного метра друг от друга. Любое из деревьев имеет хотя бы одного соседа (с юга, севера, востока или запада)." << std::endl << L"По заданной конфигурации рощи найти минимально необходимое число блоков для забора." << std::endl << std::endl << L"Ввод: В первой строке записаны через пробел два числа N и K (1 <= N, K <= 300) – количество строк и столбцов данных. В следующих N строках содержатся последовательности из K символов (единиц или нулей). Единицей обозначается расположение реликтового дерева, а нулем – его отсутствие в узле координатной сетки." << std::endl << std::endl << L"Вывод: В единственной строке выводится число блоков забора, необходимое для огораживания." << std::endl << std::endl;
}


void PrintExitInfo(int exitCode) {
  switch (exitCode) {
    case 0:
      std::wcout << std::endl;
      break;
    case 1:
      std::wcout << L"Error: input file number not found." << std::endl;
		  std::wcout << L"Use './build/lab1 <input_file>'" << std::endl;
      break;
    case 2:
      std::wcout << L"Error: error opening input file." << std::endl;
		  std::wcout << L"Put input file 'input[№]' into './data/' directory." << std::endl;
      break;
    case 3:
      std::wcout << L"Error: error opening output file." << std::endl;
      break;
    case 4:
      std::wcout << L"Error: incorrect input file." << std::endl;
      break;
    case 5:
      std::wcout << L"Error: rare tree not found." << std::endl;
      break;
    default:
      std::wcout << L"Error: unknown error." << std::endl;
      break;
  }
}
