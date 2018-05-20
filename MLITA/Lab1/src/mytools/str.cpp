#include "locale.hpp"
#include "str.hpp"


// GET ARGUMENTS FROM COMMAND LINE ============================================
std::vector<std::wstring> Mts::GetArgs(char **argv, int argc) {
  std::vector<std::wstring> container;
  for (int i = 0; i < argc; i++) {
    std::wstring wstr = CharToWide(argv[i]);
    container.push_back(wstr);
  }
  return container;
}


// READ WSTRING FROM FILE =====================================================
std::wstring Mts::ReadLine(std::wifstream &file, bool &error) {
  error = false;
  std::wstring line;
  if (!file.is_open()) error = true;
  else if (file.eof()) error = true;
  else std::getline(file, line);
  return line;
}


// PARSE WSTRING TO SUBSTRING =================================================
std::vector<std::wstring> Mts::ParseString(const std::wstring &wstring, wchar_t delimeter) {
  std::vector<std::wstring> container;
  std::wstring subStr;
  for (wchar_t wch: wstring) {
    if (wch == delimeter) {
      if (!subStr.empty()) {
        container.push_back(subStr);
        subStr.clear();
      }
    } else if (wch != '\0' && wch != '\n' && wch != '\r') {
      subStr.push_back(wch);
    } else break;
  }
  if (!subStr.empty()) container.push_back(subStr);
  return container;
}


// CONVERT TO WIDE STRING =====================================================

std::wstring Mts::CharToWide(const char *array, int length) {
  std::wstring wstring;
  char ch;
  for (int i = 0; i < length; i++) {
    ch = array[i];
    if (ch != '\0' && ch != '\n' && ch != '\r') {
      wstring.push_back(std::use_facet<std::ctype<wchar_t>>(locale).widen(ch));
    } else break;
  }
  return wstring;
}


// max string length = INT_MAX
std::wstring Mts::CharToWide(const char *string) {
  std::wstring wstring;
  char ch;
  for (int i = 0; i < INT_MAX; i++) {
    ch = string[i];
    if (ch != '\0' && ch != '\n' && ch != '\r') {
      wstring.push_back(std::use_facet<std::ctype<wchar_t>>(locale).widen(ch));
    } else break;
  }
  return wstring;
}


std::wstring Mts::StrToWide(const std::string &string) {
  std::wstring wstring;
  for (char ch: string) {
    if (ch != '\0' && ch != '\n' && ch != '\r') {
      wstring.push_back(std::use_facet<std::ctype<wchar_t>>(locale).widen(ch));
    } else break;
  }
  return wstring;
}


// CONVERT WSTRING TO NUMBER ==================================================

int Mts::StrToInt(const std::wstring &wstring, int radix, bool &error) {
  error = false;
  int number = 0;
  size_t pos;
  try {
    number = std::stoi(wstring, &pos, radix);
    if (pos != wstring.size()) error = true;
  }
  catch (...) { 
    error = true;
  }
  return number;
}


int Mts::StrToInt(const std::wstring &wstring, bool &error) {
  return StrToInt(wstring, 10, error);
}


double Mts::StrToDouble(const std::wstring &wstring, bool &error) {
  error = false;
  double number = 0;
  size_t pos;
  try { 
    number = std::stod(wstring, &pos);
    if (pos != wstring.size()) error = true;
  }
  catch (...) {
    error = true;
  }
  return number;
}

// ============================================================================
