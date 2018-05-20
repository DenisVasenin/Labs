#ifndef FIELD_HPP
#define FIELD_HPP


#include "stdafx.h"
#include "tree.hpp"


class Tree;


class Field {

  public:

    Field();
    ~Field();

    int getHeight();
    int getWidth();
    Tree* getTree(int index);

    bool getFieldFromFile(std::wifstream &inFile);
    int buildFence();

  private:

    int fieldHeight;
    int fieldWidth;
    
    int firstRareTreeIndex;
    std::vector<Tree*> treeList;

};


#endif // FIELD_HPP
