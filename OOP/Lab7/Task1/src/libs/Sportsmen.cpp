#include "Sportsmen.hpp"

Sportsmen::Sportsmen(const std::string& name, double height, double weight) {
  if (name.empty()) {
    throw std::invalid_argument("Error: name is empty.");
  }
  if (height == 0) {
    throw std::invalid_argument("Error: invalid height.");
  }
  if (weight == 0) {
    throw std::invalid_argument("Error: invalid weight.");
  }
  m_fullName = name;
  m_height = height;
  m_weight = weight;
}

// ============================================================================

std::string Sportsmen::GetFullName() const {
  return m_fullName;
}

double Sportsmen::GetHeight() const {
  return m_height;
}

double Sportsmen::GetWeight() const {
  return m_weight;
}
