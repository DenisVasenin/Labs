#include "figure.hpp"


Figure::Figure() {}


Figure::Figure(figure_color color, figure_type type, int row, int column, ChessBoard* board) {
  this->state = figure_state::ALIVE;
  this->id = row * board->getCols() + column;
  this->row = row;
  this->column = column;
  this->index = id;
  this->type = type;
  this->color = color;
  this->board = board;
  this->boardRows = board->getRows();
  this->boardCols = board->getCols();
}


Figure::~Figure() {}

// ============================================================================

void Figure::setState(figure_state s) {
  if (s != figure_state::ALL) state = s;
}

// ============================================================================

bool Figure::isAlive() const {
  if (state == figure_state::ALIVE) return true;
  return false;
}


int Figure::getId() const {
  return id;
}


int Figure::getIndex() const {
  return index;
}


figure_color Figure::getColor() const {
  return color;
}


figure_type Figure::getType() const {
  return type;
}


std::vector<int>* Figure::getAvailableMoves() {
  //return movesIndexes;
  return &attackedIndexes;
}


bool Figure::isIndexAttacked(int i) const {
  if (isAlive()) {
    for (auto& ind: attackedIndexes) {
      if (i == ind) return true;
    }
  }
  return false;
}

// ============================================================================

void Figure::moveToIndex(int i) {
  index = i;
  row = index / boardCols;
  column = index % boardCols;
}


void Figure::updateIndexes() {
  if (!isAlive()) return;
  //movesIndexes.clear();
  attackedIndexes.clear();
  switch (type) {
    case figure_type::KING:
      KK(row - 1, column);
      KK(row + 1, column);
      KK(row, column - 1);
      KK(row, column + 1);
      KK(row - 1, column - 1);
      KK(row - 1, column + 1);
      KK(row + 1, column - 1);
      KK(row + 1, column + 1);
      break;
    case figure_type::QUEEN:
      QRB(row - 1, column, -1,  0);
      QRB(row + 1, column,  1,  0);
      QRB(row, column - 1,  0, -1);
      QRB(row, column + 1,  0,  1);
      QRB(row - 1, column - 1, -1, -1);
      QRB(row - 1, column + 1, -1,  1);
      QRB(row + 1, column - 1,  1, -1);
      QRB(row + 1, column + 1,  1,  1);
      break;
    case figure_type::ROOK:
      QRB(row - 1, column, -1,  0);
      QRB(row + 1, column,  1,  0);
      QRB(row, column - 1,  0, -1);
      QRB(row, column + 1,  0,  1);
      break;
    case figure_type::BISHOP:
      QRB(row - 1, column - 1, -1, -1);
      QRB(row - 1, column + 1, -1,  1);
      QRB(row + 1, column - 1,  1, -1);
      QRB(row + 1, column + 1,  1,  1);
      break;
    case figure_type::KNIGHT:
      KK(row - 2, column - 1);
      KK(row - 2, column + 1);
      KK(row - 1, column - 2);
      KK(row - 1, column + 2);
      KK(row + 2, column - 1);
      KK(row + 2, column + 1);
      KK(row + 1, column - 2);
      KK(row + 1, column + 2);
      break;
    case figure_type::PAWN:
      PA(row, column - 1);
      PA(row, column + 1);
      PM(row, column);
      break;
    default:
      break;
  }
}


void Figure::QRB(int r, int c, int rStep, int cStep) {
  for (int ri = r, ci = c; ri >= 0 && ci >= 0 && ri < boardRows && ci < boardCols; ri += rStep, ci += cStep) {
    int ind = ri * boardCols + ci;
    attackedIndexes.push_back(ind);
    figure_color col = board->isIndexHolded(ind);
    //if (col != color) movesIndexes.push_back(ind);
    if (col != figure_color::NONE) return;
  }
}


void Figure::KK(int r, int c) {
  if (r >= 0 && c >= 0 && r < boardRows && c < boardCols) {
    int ind = r * boardCols + c;
    attackedIndexes.push_back(ind);
    //if (board->isIndexHolded(ind) != color) movesIndexes.push_back(ind);
  }
}


void Figure::PA(int r, int c) {
  if (color == figure_color::WHITE) r++;
  else r--;
  if (r >= 0 && c >= 0 && r < boardRows && c < boardCols) {
    int ind = r * boardCols + c;
    attackedIndexes.push_back(ind);
    figure_color col = board->isIndexHolded(ind);
    //if (col != color && col != figure_color::NONE) movesIndexes.push_back(ind);
  }
}


void Figure::PM(int r, int c) {
  if (color == figure_color::WHITE) r++;
  else r--;
  if (r >= 0 && r < boardRows) {
    int ind = r * boardCols + c;
    if (board->isIndexHolded(ind) != figure_color::NONE) return;
    //movesIndexes.push_back(ind);
  }
}
