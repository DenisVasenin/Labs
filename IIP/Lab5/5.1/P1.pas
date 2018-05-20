// echo 'abc' | ./P1
// echo 'bac' | ./P1
// echo 'bca' | ./P1
// echo 'cba' | ./P1
// echo 'cab' | ./P1
// echo 'acb' | ./P1

{ DP-1 Сортирует 3-строку из INPUT в OUTPUT }
PROGRAM IFSort3(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3:Char;
BEGIN { IFSort3 }
  READ(Ch1, Ch2, Ch3);
  WRITELN('Входные данные ', Ch1, Ch2, Ch3);
  WRITE('Cортированные данные ');
  { DP-2.1 сортируем Ch1, Ch2, Ch3 в OUTPUT }
  IF Ch1 < Ch2
  THEN
    { DP-2.1.1 Ch1 < Ch2 < Ch3:сортируем Ch1, Ch2, Ch3 в OUTPUT }
    IF Ch2 < Ch3
    THEN
      WRITELN(Ch1, Ch2, Ch3)
    ELSE
      { DP-2.1.1.1 Ch1 < Ch2, Ch3 <= Ch2:сортируем Ch1, Ch2, Ch3 в OUTPUT }
  ELSE
    { DP-2.1.2 Ch2 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT }
  WRITELN();
END.
