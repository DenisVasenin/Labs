#ifndef TREE_HPP
#define TREE_HPP


#include "stdafx.h"
#include "field.hpp"


class Field;


class Tree {

  public:

    Tree(int index, int quadrant, wchar_t value, Field* field);
    ~Tree();

    int getNextIndex(int prevIndex);
    int getFenceCount();
    wchar_t getValue();
    int isRound();

  private:

    int index;
    int quadrant;
    wchar_t value;
    Field* field;
    int fenceCount;
    bool isVisited;
    std::vector<char> directList;
    std::deque<int> indexQueue;

    int checkIndex(int nextInd, int prevIndex);
    int getUpIndex();
    int getDownIndex();
    int getLeftIndex();
    int getRightIndex();

};


#endif // TREE_HPP
