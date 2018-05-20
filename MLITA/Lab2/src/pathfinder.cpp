#include "pathfinder.hpp"


PathFinder::PathFinder() {}


PathFinder::PathFinder(ChessBoard *board) {
  this->bestPath = Mts::INT_MAX;
  this->board = board;
  this->boardRows = board->getRows();
  this->boardCols = board->getCols();
}


PathFinder::~PathFinder() {}

// ============================================================================

// 
int PathFinder::getBestPath(figure_color c, figure_type t) {
  if (c == figure_color::WHITE) inverseColor = figure_color::BLACK;
  else inverseColor = figure_color::WHITE;
  int stepCount = 0;
  Figure* self = board->getFigures(figure_state::ALIVE, c, t)->at(0);
  getTargets(self, nullptr, stepCount);
  return bestPath;
}


//
void PathFinder::getTargets(Figure* self, Figure* target, int& stepCount) {
  
  std::vector<Figure*>* targetsList = board->getFigures(figure_state::ALIVE, inverseColor, figure_type::ALL);
  
  if (targetsList->size() > 0) {
    sortTargets(self->getIndex(), targetsList);
  } else {
    // TEST ===================================================================
    std::wcout << "STEP COUNT: " << stepCount << std::endl;
    // ========================================================================
    if (stepCount < bestPath) bestPath = stepCount;
    return;
  }

  for (auto t: *targetsList) {
    if (!board->isIndexAttacked(t->getIndex(), inverseColor)) {
      //expandedIndexes.clear();
      int currIndex = self->getIndex();
      goToTarget(self, t, stepCount);
      self->moveToIndex(currIndex);
      self->updateIndexes();
    }
  }
}


// 
void PathFinder::goToTarget(Figure* self, Figure* target, int& stepCount) {
  if (stepCount == bestPath) return;

  int currIndex = self->getIndex();
  int targetIndex = target->getIndex();
  if (currIndex != targetIndex) {
    std::vector<int>* movesIndexesList = self->getAvailableMoves(); 
    sortIndexes(targetIndex, movesIndexesList);

    for (auto ind: *movesIndexesList) {
      if (expandedIndexes.count(ind) > 0) continue;
      if (!board->isIndexAttacked(ind, inverseColor)) {
        stepCount++;
        if (stepCount < bestPath) {
          expandedIndexes.insert(ind);
          self->moveToIndex(ind);
          self->updateIndexes();
          // TEST =============================================================
          //std::wcout << "move to index: " << nextIndex << "    current target index: " << targetIndex << "    new dist:" << newDistance << std::endl;
          // ==================================================================
          goToTarget(self, target, stepCount);
          //expandedIndexes.erase(ind);
        }
        stepCount--;
      }
    }
    
    // stepCount++;
    // expandedIndexes.insert(nextIndex);
    // if (stepCount < bestPath) {
    //   self->moveToIndex(nextIndex);
    //   self->updateIndexes();
    //   // TEST ===============================================================
    //   //std::wcout << "move to index: " << nextIndex << "    current target index: " << targetIndex << "    new dist:" << newDistance << std::endl;
    //   // ====================================================================
    //   goToTarget(self, target, currIndex, stepCount);
    // }
    // stepCount--;
  } else {
    // TEST ===================================================================
    //std::wcout << "target reached: " << currIndex << std::endl;
    // ======================================================================
    expandedIndexes.clear();
    target->setState(figure_state::DEAD);
    getTargets(self, target, stepCount);
    target->setState(figure_state::ALIVE);
  }
}


// COMPARATOR FOR SORT
bool PathFinder::iCmp(int i, int a, int b) {
  int rowDistA = std::abs(i / boardCols - a / boardCols);
  int colDistA = std::abs(i % boardCols - a % boardCols);
  int rowDistB = std::abs(i / boardCols - b / boardCols);
  int colDistB = std::abs(i % boardCols - b % boardCols);

  if (rowDistA + colDistA > rowDistB + colDistB) return false;
  if (rowDistA + colDistA < rowDistB + colDistB) return true;
  if (std::abs(rowDistA - colDistA) < std::abs(rowDistB - colDistB)) return true;
  return false;
}


// SORT INDEX LIST
void PathFinder::sortIndexes(int i, std::vector<int> *iL) {
  std::sort(iL->begin(), iL->end(), [&](int a, int b) {return iCmp(i, a, b);});
}


// SORT TARGETS LIST
void PathFinder::sortTargets(int i, std::vector<Figure*> *fL) {
  std::sort(fL->begin(), fL->end(), [&](Figure* a, Figure* b) {return iCmp(i, a->getIndex(), b->getIndex());});
}


// void PathFinder::test(std::vector<int> &v) {
//   for (auto& e: v) {
//     std::wcout << e << "  ";
//   }
//   std::wcout << std::endl;
// }


// GET MANHATTAN DISTANCE BETWEEN TWO INDEXES
// int PathFinder::getDistance(int selfIndex, int targetIndex) {
//   return std::abs(selfIndex / boardCols - targetIndex / boardCols) + std::abs(selfIndex % boardCols - targetIndex % boardCols);
// }
