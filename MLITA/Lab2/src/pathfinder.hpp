#ifndef PATHFINDER_HPP
#define PATHFINDER_HPP

#include "stdafx.h"
#include "chessboard.hpp"
#include "figure.hpp"


class ChessBoard;
class Figure;

class PathFinder {

  public:

    PathFinder();
    PathFinder(ChessBoard* board);
    ~PathFinder();

    int getBestPath(figure_color c, figure_type t);

  private:

    int bestPath;
    figure_color inverseColor;

    ChessBoard* board;
    int boardRows, boardCols;
    std::set<int> expandedIndexes;

    void getTargets(Figure* self, Figure* target, int& stepCount);
    void goToTarget(Figure* self, Figure* target, int& stepCount);
    bool iCmp(int i, int a, int b);
    void sortIndexes(int ind, std::vector<int> *iL);
    void sortTargets(int i, std::vector<Figure*> *fL);

    void test(std::vector<int> &v);

};


#endif // PATHFINDER_HPP
