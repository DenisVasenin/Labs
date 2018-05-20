#include "num.hpp"

using namespace Mts;


// INTEGER CALCULATION ========================================================

int Mts::Add(int operand1, int operand2, int& result) {
  if (operand2 > 0) { 
    if (operand1 > INT_MAX - operand2) return 0;
  } else if (operand2 < 0) {
    if (operand1 < INT_MIN - operand2) return 0;
  }
  result = operand1 + operand2;
  return 1;
}


int Mts::Sub(int operand1, int operand2, int& result) {
  if (operand2 < 0) {
    if (operand1 > INT_MAX + operand2) return 0;
  } else if (operand2 > 0) {
    if (operand1 < INT_MIN + operand2) return 0;
  }
  result = operand1 - operand2;
  return 1;
}


int abs(int number) {
  int sign = number >> 31;
  return (number ^ sign) - sign;
}

// numbers allow range [-MAX_INT::MAX_INT]
int Mts::Mul(int operand1, int operand2, int& result) {
  if (operand1 != 0 && operand2 != 0) {
    if (operand1 < -INT_MAX || operand2 < -INT_MAX) return 0;
    else if (abs(operand1) > INT_MAX / abs(operand2)) return 0;
  }
  result = operand1 * operand2;
  return 1;
}


int Mts::Div(int operand1, int operand2, int& result) {
  if (operand2 == 0) return 0;
  else if (operand1 < -INT_MAX) return 0;
  else result = operand1 / operand2;
  return 1;
}

// FLOAT CALCULATION ========================================================

int Mts::Add(float operand1, float operand2, float& result) {
  result = operand1 + operand2;
  if (result > 0) {
    if (result == FINF) return 0;
  } else if (result == -FINF) return 0;
  return 1;
}


int Mts::Sub(float operand1, float operand2, float& result) {
  result = operand1 - operand2;
  if (result > 0) {
    if (result == FINF) return 0;
  } else if (result == -FINF) return 0;
  return 1;
}


int Mts::Mul(float operand1, float operand2, float& result) {
  result = operand1 * operand2;
  if (result > 0) {
    if (result == FINF) return 0;
  } else if (result == -FINF) return 0;
  return 1;
}


int Mts::Div(float operand1, float operand2, float& result) {
  result = operand1 / operand2;
  if (result > 0) {
    if (result == FINF) return 0;
  } else if (result == -FINF) return 0;
  return 1;
}

// DOUBLE CALCULATION =========================================================

int Mts::Add(double operand1, double operand2, double& result) {
  result = operand1 + operand2;
  if (result > 0) {
    if (result == DINF) return 0;
  } else if (result == -DINF) return 0;
  return 1;
}


int Mts::Sub(double operand1, double operand2, double& result) {
  result = operand1 - operand2;
  if (result > 0) {
    if (result == DINF) return 0;
  } else if (result == -DINF) return 0;
  return 1;
}


int Mts::Mul(double operand1, double operand2, double& result) {
  result = operand1 * operand2;
  if (result > 0) {
    if (result == DINF) return 0;
  } else if (result == -DINF) return 0;
  return 1;
}


int Mts::Div(double operand1, double operand2, double& result) {
  result = operand1 / operand2;
  if (result > 0) {
    if (result == DINF) return 0;
  } else if (result == -DINF) return 0;
  return 1;
}

// GET NUMBER SIGN ====================================================

int Mts::GetSign(int number) {
  return (number >> 31) | ((unsigned)-number >> 31);
}

int Mts::GetSign(float number) {
  return (number > 0) - (number < 0);
}

int Mts::GetSign(double number) {
  return (number > 0) - (number < 0);
}

// ============================================================================
