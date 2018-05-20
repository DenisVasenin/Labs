// echo 'abc' | ./P1
// echo 'bac' | ./P1
// echo 'bca' | ./P1
// echo 'cba' | ./P1
// echo 'cab' | ./P1
// echo 'acb' | ./P1

{ DP-3 сортирует 3-строку из INPUT в OUTPUT }
PROGRAM MinSort3 (INPUT,OUTPUT);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN { MinSort3 }
  READ(Ch1, Ch2, Ch3);
  WRITELN('Входные данные ', Ch1, Ch2, Ch3);
  WRITE('Сортированные данные ');
  { DP-3.1 Печатать минимум в  OUTPUT, сохранить содержимое в Ch1 and Ch2 };
  IF Ch1 < Ch2
  THEN
    { Печатать минимум из Ch1, Ch3 в  OUTPUT, переместить Ch3 в Ch1,если необходимо }
    IF Ch1 < Ch3
    THEN
      BEGIN
        WRITE(Ch1);
        Ch1 := Ch3;
      END
    ELSE
      WRITE(Ch3)
  ELSE
    { Печатать минимум из Ch2, Ch3 в  OUTPUT, переместить Ch3 в Ch2,если необходимо }
    IF Ch2 < Ch3
    THEN
      BEGIN
        WRITE(Ch2);
        Ch2 := Ch3;
      END
    ELSE
      WRITE(Ch3);
  { DP-3.2 Сортируем Ch1, Ch2 в OUTPUT }
  WRITELN();
END.{ Minsort3 }
