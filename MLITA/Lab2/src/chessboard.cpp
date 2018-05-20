#include "chessboard.hpp"


ChessBoard::ChessBoard() {
  rows = 0;
  cols = 0;
  size = 0;
}

ChessBoard::~ChessBoard() {
  for (auto* fig: figuresList) {
    delete fig;
  }
}

// ============================================================================

int ChessBoard::getRows() const {
  return rows;
}


int ChessBoard::getCols() const {
  return cols;
}


int ChessBoard::getSize() const {
  return size;
}


// GET FIGURE BY INDEX
Figure* ChessBoard::getFigure(int i) {
  for (auto fig: figuresList) {
    if (i == fig->getIndex()) return fig;
  }
  return nullptr;
}


// GET FIGURES BY STATE, COLOR AND TYPE
// s: ALL - all states, ALIVE - alive state, DEAD - dead state
// c: ALL - all colors, WHITE - white color, BLACK - black color
// t: ALL - all types, BISHOP - bishop, etc..
std::vector<Figure*>* ChessBoard::getFigures(figure_state s, figure_color c, figure_type t) {
  fL.clear();
  for (auto* fig: figuresList) {
    switch (s) {
      case figure_state::ALL:
        if (checkConditions(fig, c, t)) fL.push_back(fig);
        break;
      case figure_state::ALIVE:
        if (fig->isAlive()) {
          if (checkConditions(fig, c, t)) fL.push_back(fig);
        }
        break;
      case figure_state::DEAD:
        if (!fig->isAlive()) {
          if (checkConditions(fig, c, t)) fL.push_back(fig);
        }
        break;
      default:
        break;
    }
  }
  return &fL;
}


// check conditions for getFigures function
bool ChessBoard::checkConditions(Figure *f, figure_color c, figure_type t) {
  if (c == figure_color::ALL) {
    if (t == figure_type::ALL) return true;
    else if (t == f->getType()) return true;
  } else if (c == f->getColor()) {
    if (t == figure_type::ALL) return true;
    else if (t == f->getType()) return true;
  }
  return false;
}


// GET FIGURES BY STATE, COLOR AND TYPE
int ChessBoard::getFiguresCount(figure_state s, figure_color c, figure_type t){
  std::vector<Figure*>* figL = getFigures(s, c, t);
  return figL->size();
}

// ============================================================================

// CHECK INDEX TO ATTACKED
figure_color ChessBoard::isIndexAttacked(int i) {
  int black = 0, white = 0;
  for (auto* fig: figuresList) {
    if (fig->isIndexAttacked(i)) {
      if (fig->getColor()  == figure_color::WHITE) white = 1;
      else black = 2;
    }
    if (white + black == 3) break;
  }
  switch (black + white) {
    case 1: return figure_color::WHITE;
    case 2: return figure_color::BLACK;
    case 3: return figure_color::ALL;
    default: break;
  }
  return figure_color::NONE;
}

bool ChessBoard::isIndexAttacked(int i, figure_color col) {
  for (auto* fig: figuresList) {
    if (fig->isIndexAttacked(i)) {
      if (fig->getColor()  == col) return true;
    }
  }
  return false;
}


// CHECK INDEX HOLD
figure_color ChessBoard::isIndexHolded(int i) {
  for (auto* fig: figuresList) {
    if (i == fig->getIndex()) {
      if (fig->isAlive()) return fig->getColor();
    }
  }
  return figure_color::NONE;
}


// UPDATE ATTACKED INDEXES
void ChessBoard::updateIndexes() {
  for (auto* fig: figuresList) {
    fig->updateIndexes();
  }
}


// MOVE FIGURE TO INDEX
bool ChessBoard::moveFigureToIndex(Figure* f, int i) {
  figure_color col = isIndexHolded(i);
  if (col == f->getColor()) return false;
  else if (col != figure_color::NONE) {
    getFigure(i)->setState(figure_state::DEAD);
  }
  f->moveToIndex(i);
  updateIndexes();
  return true;
}

// ============================================================================

// GET BOARD FROM INPUT FILE
int ChessBoard::getFromFile(std::wfstream &file) {
  if (!file.eof()) {
    std::wstring wline = Mts::ReadLine(file);
    std::vector<std::wstring> cont = Mts::ParseString(wline, ' ');
    if (cont.size() != 2) return 1; // dimension values count != 2
    else {
      if (Mts::StrToInt(cont[0], rows) || Mts::StrToInt(cont[1], cols)) {
        return 2; // not integer value
      } else {
        if (rows < 1 || cols < 1 || rows > 15 || cols > 15) return 3; // bad dimension value
      }
      return getFiguresFromFile(file);
    }
  } else return 4; // empty input file
}


// GET FIGURES FROM INPUT FILE
int ChessBoard::getFiguresFromFile(std::wfstream &file) {
  int rowCounter = 0;
  std::wstring wline;
  while (!file.eof()) {
    wline = Mts::ReadLine(file);
    if (!wline.empty()) {
      if (wline.size() < cols) return 5; // bad columns count in line
      for (int i = 0; i < cols; i++) {
        wchar_t wch = wline[i];
        if (wch != '.') {
          figure_type type;
          figure_color color;
          switch (wch) {
            case '*':
              type = figure_type::KING;
              color = figure_color::WHITE;
              break;
            case 'R': 
              type = figure_type::ROOK;
              color = figure_color::BLACK;
              break;
            case 'B':
              type = figure_type::BISHOP;
              color = figure_color::BLACK;
              break; 
            case 'K': 
              type = figure_type::KNIGHT;
              color = figure_color::BLACK;
              break;
            default: return 6; // undefined symbol
          }
          Figure* f = new Figure(color, type, rowCounter, i , this);
          figuresList.push_back(f);
        }
      }
      rowCounter++;
    }
  }
  if (rowCounter != rows) return 7; // bad rows count
  size = rows * cols;
  updateIndexes();
  return 0;
}
