// PRECOMPILE HEADER FILE

#ifndef STDAFX_H
#define STDAFX_H

#include <cassert>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <set>
#include <vector>
#include <string>
#include "./mytools/mytools.hpp"

enum class figure_state { ALIVE, DEAD, ALL };
enum class figure_color { WHITE, BLACK, NONE, ALL };
enum class figure_type { KING, QUEEN, BISHOP, KNIGHT, ROOK, PAWN, NONE, ALL };

#endif // STDAFX_H
