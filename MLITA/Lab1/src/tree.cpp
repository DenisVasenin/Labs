#include "tree.hpp"


Tree::Tree(int index, wchar_t value, Field* field) {
  this->index = index;
  this->value = value;
  this->field = field;
  this->fenceCount = 0;
  this->isVisited = false;
}


Tree::~Tree() {}

// TEST =======================================================================

wchar_t Tree::getValue() {
  return value;
}


int Tree::getFenceCount() {
  return fenceCount;
}


int Tree::isVisited() {
  return isVisited;
}

// ============================================================================

int Tree::getNextIndex(int prevIndex) {
  int ind;
  if (!isVisited) {
    isVisited = true;
    for (int i = 0; i < directList.size(); i++) {
      ch = directList.at(i);
      switch (ch) {
        case 'u': ind = getUpIndex(); break;
        case 'd': ind = getDownIndex(); break;
        case 'l': ind = getLeftIndex(); break;
        case 'r': ind = getRightIndex(); break;
        default: break;
      }
      if (checkIndex(ind)) indexQueue.push_back(ind);
    }
    std::sort(indexQueue.begin(), indexQueue.end(), [&](int a, int b) { return (a == prevIndex) > (b == prevIndex) });
  }
  ind = indexQueue.at(0);
  indexQueue.pop_front();
  indexQueue.push_back(ind);

  return ind;
}


bool Tree::checkIndex(int nextIndex) {
  if (nextIndex >= 0 && field->getTree(nextIndex)->getValue() == '1') {
    return true;
  }
  fenceCount++;
  return false;
}

// ============================================================================

int Tree::getUpIndex() {
  int ind = index - field->getWidth();
  if (ind < 0) return -1;
  else return ind;
}


int Tree::getDownIndex() {
  int ind = index + field->getWidth();
  if (ind > field->getHeight() * field->getWidth() - 1) return -1;
  else return ind;
}


int Tree::getLeftIndex() {
  int ind = index - 1;
  if (index / field->getWidth() != ind / field->getWidth()) return -1;
  else return ind;
}


int Tree::getRightIndex() {
  int ind = index + 1;
  if (index / field->getWidth() != ind / field->getWidth()) return -1;
  else return ind;
}