#include "str.hpp"


// GET ARGUMENTS FROM COMMAND LINE ============================================

std::vector<std::wstring> Mts::GetArgs(char **argv, int argc) {
  std::vector<std::wstring> container;
  for (int i = 0; i < argc; i++) {
    std::string string(argv[i]);
    std::wstring wstring = StrToWide(string);
    container.push_back(wstring);
  }
  return container;
}


// READ STRING FROM FILE ====================================================
std::wstring Mts::ReadLine(std::wfstream &file) {
  std::wstring line;
  std::getline(file, line);
  return line;
}


// PARSE WSTRING TO SUBSTRING =================================================

std::vector<std::wstring> Mts::ParseString(const std::wstring &wstring, wchar_t delimeter) {
  wchar_t symbol;
  std::wstring subString;
  std::vector<std::wstring> container;
  int lastIndex = wstring.size() - 1;
  for (int i = 0; i <= lastIndex; i++) {
    symbol = wstring[i];
    if (symbol == delimeter) {
      if (!subString.empty()) {
        container.push_back(subString);
        subString.clear();
      }
    } else if (i == lastIndex) {
      subString.push_back(symbol);
      container.push_back(subString);
    } else {
      subString.push_back(symbol);
    }
  }
  return container;
}

// CONVERT CHAR ARRAY TO WIDE STRING ==========================================

std::wstring Mts::CharToWide(const char *array, int size) {
  std::wstring wstring;
  for (int i = 0; i < size; i++) {
    wstring.push_back(std::use_facet<std::ctype<wchar_t>>(locale).widen(array[i]));
  }
  return wstring;
}

// CONVERT STRING TO WIDE STRING ==============================================

std::wstring Mts::StrToWide(const std::string &string) {
  std::wstring wstring;
  for (int i = 0; i < string.size(); i++) {
    wstring.push_back(std::use_facet<std::ctype<wchar_t>>(locale).widen(string[i]));
  }
  return wstring;
}

// CONVERT WSTRING TO INTEGER NUMBER ==========================================

int Mts::StrToInt(const std::wstring &wstring, int &number) {
  int result = 1; // invalid argument
  if (IsInt(wstring)) {
    result = 0;
    try {
      number = std::stoi(wstring);
    }
    catch (const std::overflow_error &err) {
      result = 2; // overflow detected
    }
  }
	return result;
}

// CONVERT WSTRING TO FLOAT NUMBER ============================================

int Mts::StrToFloat(const std::wstring &wstring, float &number) {
	int result = 1; // invalid argument
  if (IsFloat(wstring)) {
    result = 0;
    try {
      number = std::stof(wstring);
    }
    catch (const std::overflow_error &err) {
      result = 2; // overflow detected
    }
  }
	return result;
}

// CONVERT WSTRING TO DOUBLE NUMBER ===========================================

int Mts::StrToDouble(const std::wstring &wstring, double &number) {
	int result = 1; // invalid argument
  if (IsDouble(wstring)) {
    result = 0;
    try {
      number = std::stod(wstring);
    }
    catch (const std::overflow_error &err) {
      result = 2; // overflow detected
    }
  }
	return result;
}

// IS INTEGER NUMBER ==========================================================
// (+/-)<d>

bool Mts::IsInt(const std::wstring &wstring) {
  bool result = true;
  bool digit = false;
  wchar_t symbol;
  for (int i = 0; i < wstring.size(); i++) {
    symbol = wstring[i];
    if (iswdigit(symbol)) {
      digit = true;
    } else if (i != 0) {
      result = false;
      break;
    } else if (symbol != '+' && symbol != '-') {
      result = false;
      break;
    }
  }
  return digit && result;
}


// IS FLOAT NUMBER ==========================================================
// (+/-)(.|d)<d>(.|d)(d)

bool Mts::IsFloat(const std::wstring &wstring) {
  bool result = true;
  bool digit = false;
  bool point = false;
  wchar_t symbol;
  for (int i = 0; i < wstring.size(); i++) {
    symbol = wstring[i];
    if (iswdigit(symbol)) {
      digit = true;
    } else {
      switch (symbol) {
        case '.': case ',':
          if (!point) {
            point = true;
            break;
          }
        case '-': case '+':
          if (i == 0) {
            break;
          }
        default:
          result = false;
      }
    }
    if (!result) break;
  }
  return digit && result;
}

// IS DOUBLE NUMBER ===========================================================

bool Mts::IsDouble(const std::wstring &wstring) {
  return IsFloat(wstring);
}
