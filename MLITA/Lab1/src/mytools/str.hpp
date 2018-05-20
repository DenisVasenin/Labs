#ifndef STR_HPP
#define STR_HPP


#include <fstream>
#include <string>
#include <vector>


namespace Mts {

  // GET ARGUMENTS FROM COMMAND LINE ==========================================
  std::vector<std::wstring> GetArgs(char *argv[], int argc);

  // READ WSTRING FROM FILE ===================================================
  std::wstring ReadLine(std::wifstream &file, bool &error);

  // PARSE WSTRING TO SUBSTRING ===============================================
  std::vector<std::wstring> ParseString(const std::wstring &wstring, wchar_t delimeter);

  // CONVERT TO WIDE STRING ========================================
  std::wstring CharToWide(const char *array, int length);
  std::wstring CharToWide(const char *string);
  std::wstring StrToWide(const std::string &wstring);

  // CONVERT WSTRING TO NUMBER ========================================
  int StrToInt(const std::wstring &wstring, int radix, bool &error);
  int StrToInt(const std::wstring &wstring, bool &error);
  double StrToDouble(const std::wstring &wstring, bool &error);

}


#endif // STR_HPP
