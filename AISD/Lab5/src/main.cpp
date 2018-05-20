// 18. При  заданном  четном  N  (N  <=  18)  перечислить  все
// правильные скобочные формы длины N из скобок  '(',  ')',  '[',
// ']'. Например, для N=4 правильные формы
// (()) , ([]) , ()() , ()[] , [()] , [[]] , []() , [][]


#include "func.cpp"


int main(int argc, char *argv[]) {
  if (argc == 2) {
    int N = atoi(argv[1]);
    if (N % 2 != 0) cout << "Bad argument" << endl;
    else Foo(N);
  }

  return 0;
}
