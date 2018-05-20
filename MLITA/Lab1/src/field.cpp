#include "field.hpp"


Field::Field() {
  fieldHeight = 0;
  fieldWidth = 0;
  firstRareTreeIndex = -1;
}


Field::~Field() {
  for (auto& tree: treeList) {
    delete tree;
  }
}

// GETTERS ====================================================================

int Field::getHeight() {
  return fieldHeight;
}


int Field::getWidth() {
  return fieldWidth;
}


Tree* Field::getTree(int index) {
  return treeList[index];
}

//=============================================================================

// get input data from file
bool Field::getFieldFromFile(std::wifstream &inFile) {
  bool err;
  std::wstring wstr = Mts::ReadLine(inFile, err);
  std::vector<std::wstring> data = Mts::ParseString(wstr, ' ');

  if (data.size() != 2) {
    return false;
  }

  bool errh, errw;
  fieldHeight = Mts::StrToInt(data[0], errh);
  fieldWidth = Mts::StrToInt(data[1], errw);
  if (errh || errw) {
    return false;
  }

  int rowCounter = 0;
  while (!inFile.eof()) {
    wstr = Mts::ReadLine(inFile, err);
    if (!wstr.empty()) {
      if (wstr.size() != fieldWidth) {
        return false;
      }
      for (int i = 0; i < wstr.size(); i++) {
        if (wstr[i] != '1' && wstr[i] != '0') {
          return false;
        }
        if (wstr[i] == '1' && firstRareTreeIndex < 0) {
          firstRareTreeIndex = rowCounter * fieldWidth + i;
        }

        int index = rowCounter * fieldWidth + i;
        int quadrant = 0;
        if (rowCounter <= fieldHeight / 2) {
          if (i <= fieldWidth / 2) quadrant = 1;
          else quadrant = 4;
        } else {
          if (i <= fieldWidth / 2) quadrant = 2;
          else quadrant = 3;
        }
        
        Tree* tree = new Tree(index, quadrant, wstr[i], this);
        treeList.push_back(tree);
      }
      rowCounter++;
    }
  }

  if (rowCounter != fieldHeight) {
    return false;
  }

  // TEST ==============================
  // std::wcout << firstRareTreeIndex << std::endl;
  // std::wcout << fieldHeight << " " << fieldWidth << std::endl;
  // for (int i = 1; i <= treeList.size(); i++) {
  //   std::wcout << treeList[i-1]->getValue();
  //   if (i % fieldWidth == 0) {
  //     std::wcout << std::endl;
  //   }
  // }
  // ====================================

  return true;
}

// ============================================================================

// build optimal fence
int Field::buildFence() {
  int fenceCount = 0;
  int startIndex = firstRareTreeIndex;
  int prevIndex = startIndex;
  int currIndex = treeList[startIndex]->getNextIndex(prevIndex);

  //Mts::Timer timer;

  while (true) {
    //timer.pause(1);
    if (currIndex == startIndex && treeList[startIndex]->isRound()) break;

    std::wcout << "prev: " << prevIndex << std::endl;
    std::wcout << "curr: " << currIndex << std::endl << std::endl;

    int index = treeList[currIndex]->getNextIndex(prevIndex);
    prevIndex = currIndex;
    currIndex = index;
  }

  for (auto& tree: treeList) {
    fenceCount += tree->getFenceCount();
  }

  return fenceCount;
}
