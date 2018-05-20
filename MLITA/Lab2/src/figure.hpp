#ifndef FIGURE_HPP
#define FIGURE_HPP

#include "stdafx.h"
#include "chessboard.hpp"


class ChessBoard;

class Figure {

  public:

    Figure();
    Figure(figure_color color, figure_type type, int row, int column, ChessBoard* board);
    ~Figure();

    const bool operator == (const Figure &f) {
      if (this->id == f.getId()) return true;
      return false;
    }

    const bool operator != (const Figure &f) {
      if (this->id != f.getId()) return true;
      return false;
    }

    void setState(figure_state s);

    bool isAlive() const;
    int getId() const;
    int getIndex() const;
    figure_color getColor() const;
    figure_type getType() const;
    std::vector<int>* getAvailableMoves();
    bool isIndexAttacked(int i) const;

    void updateIndexes();
    void moveToIndex(int i);

  private:

    int id;
    int row;
    int column;
    int index;
    figure_state state;
    figure_color color;
    figure_type type;

    ChessBoard* board;
    int boardRows, boardCols;
    //std::vector<int> movesIndexes;
    std::vector<int> attackedIndexes;

    void QRB(int r, int c, int rStep, int cStep);
    void KK(int r, int c);
    void PA(int r, int c);
    void PM(int r, int c);

};


#endif // FIGURE_HPP
