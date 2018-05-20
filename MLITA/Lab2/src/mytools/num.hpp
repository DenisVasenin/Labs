#ifndef NUM_HPP
#define NUM_HPP

#include <limits>
#include <iostream>


namespace Mts {

  // INFINITY CONSTANTS ===================================================
  constexpr float FINF = std::numeric_limits<float>::infinity();
  constexpr double DINF = std::numeric_limits<double>::infinity();


  // MIN/MAX CONSTANTS ====================================================
  const int INT_MIN = std::numeric_limits<int>::lowest();
  const int INT_MAX = std::numeric_limits<int>::max();
  constexpr float FLOAT_MIN = std::numeric_limits<float>::lowest();
  constexpr float FLOAT_MAX = std::numeric_limits<float>::max();
  constexpr double DOUBLE_MIN = std::numeric_limits<double>::lowest();
  constexpr double DOUBLE_MAX = std::numeric_limits<double>::max();


  // BITE SIZE CONSTANTS ==================================================
  const int INT_BIT_SIZE = sizeof(int) * 8;
	const int FLOAT_BIT_SIZE = sizeof(float) * 8;
	const int DOUBLE_BIT_SIZE = sizeof(double) * 8;


  // INTEGER CALCULATION ==================================================
  int Add(int operand1, int operand2, int &result);
  int Sub(int operand1, int operand2, int &result);
  int Mul(int operand1, int operand2, int &result);
  int Div(int operand1, int operand2, int &result);


  // FLOAT CALCULATION ====================================================
  int Add(float operand1, float operand2, float& result);
  int Sub(float operand1, float operand2, float& result);
  int Mul(float operand1, float operand2, float& result);
  int Div(float operand1, float operand2, float& result);


  // DOUBLE CALCULATION ===================================================
  int Add(double operand1, double operand2, double &result);
  int Sub(double operand1, double operand2, double &result);
  int Mul(double operand1, double operand2, double &result);
  int Div(double operand1, double operand2, double &result);


  // GET NUMBER SIGN ==============================================
  int GetSign(int number);
  int GetSign(float number);
  int GetSign(double number);

}

#endif // NUM_HPP
