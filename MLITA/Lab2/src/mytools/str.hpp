#ifndef STR_HPP
#define STR_HPP

#include <fstream>
#include <string>
#include <vector>
#include "locale.hpp"


namespace Mts {

  // GET ARGUMENTS FROM COMMAND LINE ==========================================
  std::vector<std::wstring> GetArgs(char *argv[], int argc);

  // READ STRING FROM FILE ====================================================
  std::wstring ReadLine(std::wfstream &file);

  // PARSE WSTRING TO SUBSTRING ===============================================
  std::vector<std::wstring> ParseString(const std::wstring &string, wchar_t delimeter);

  // CONVERT CHAR ARRAY TO WIDE STRING ========================================
  std::wstring CharToWide(const char *string, int stringLength);

  // CONVERT STRING TO WIDE STRING ============================================
  std::wstring StrToWide(const std::string &string);

  // CONVERT WSTRING TO INTEGER NUMBER ========================================
  int StrToInt(const std::wstring &string, int &number);

  // CONVERT WSTRING TO FLOAT NUMBER ==========================================
  int StrToFloat(const std::wstring &string, float &number);

  // CONVERT WSTRING TO DOUBLE NUMBER =========================================
  int StrToDouble(const std::wstring &string, double &number);

  // IS INTEGER NUMBER ========================================================
  bool IsInt(const std::wstring &string);

  // IS FLOAT NUMBER ==========================================================
  bool IsFloat(const std::wstring &string);

  // IS DOUBLE NUMBER =========================================================
  bool IsDouble(const std::wstring &string);

}

#endif // STR_HPP
