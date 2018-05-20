// echo 'abc' | ./P3
// echo 'bac' | ./P3
// echo 'bca' | ./P3
// echo 'cba' | ./P3
// echo 'cab' | ./P3
// echo 'acb' | ./P3

{ DP-1 Сортирует 3-строку из INPUT в OUTPUT }
PROGRAM IfSort3(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3: CHAR;
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
      { DP-2.1.1.1 Ch1, Ch2, Ch3 <= Ch2:сортируем Ch1, Ch2, Ch3 в OUTPUT }
      IF Ch1 < Ch3
      THEN
        WRITELN(Ch1, Ch3, Ch2)
      ELSE
        WRITELN(Ch3, Ch1, Ch2)
  ELSE
    { DP-2.1.2 Ch2 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT }
    IF Ch1 < Ch3
    THEN
      WRITELN(Ch2, Ch1, Ch3)
    ELSE
      { DP-2.1.2.1 Ch2 <= Ch1, Ch3 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT }
  WRITELN();
END.
