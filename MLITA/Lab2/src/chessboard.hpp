#ifndef CHESSBOARD_HPP
#define CHESSBOARD_HPP

#include "stdafx.h"
#include "figure.hpp"


class Figure;

class ChessBoard {

  public:

    ChessBoard();
    ~ChessBoard();

    int getRows() const;
    int getCols() const;
    int getSize() const;
    Figure* getFigure(int i);
    std::vector<Figure*>* getFigures(figure_state s, figure_color c, figure_type t);
    int getFiguresCount(figure_state s, figure_color c, figure_type t);
    figure_color isIndexAttacked(int i);
    bool isIndexAttacked(int i, figure_color col);
    figure_color isIndexHolded(int i);
    void updateIndexes();
    bool moveFigureToIndex(Figure* f, int i);

    int getFromFile(std::wfstream &file);

  private:

    int rows;
    int cols;
    int size;
    std::vector<Figure*> figuresList;
    std::vector<Figure*> fL; 

    int getFiguresFromFile(std::wfstream &file);
    bool checkConditions(Figure* f, figure_color c, figure_type t);

};


#endif // CHESSBOARD_HPP
