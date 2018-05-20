// 22. Имеется  И-ИЛИ дерево, соответствующее некоторому множеству конструкций.
// Требуется выдать на экран в наглядном виде все элементы дерева (14).


#include "Headers.hpp"
#include "Tree.hpp"


int main(int argc, char *argv[]) {
  if (argc != 2) {
    cout << "Bad arguments." << endl;
  } else {
    string fileName = argv[1];
    ifstream inFile(fileName, ios::in);
    if (!inFile) {
      cout << "File not found." << endl;
    } else {
      Tree tree;
      tree.readTree(inFile);
      tree.writeElements();
    }
  }

  return 0;
}
