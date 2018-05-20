// echo 'abc' | ./5.3
// echo 'bac' | ./5.3
// echo 'bca' | ./5.3
// echo 'cba' | ./5.3
// echo 'cab' | ./5.3
// echo 'acb' | ./5.3

{ DP-3 сортирует 3-строку из INPUT в OUTPUT }
PROGRAM MinSort3 (INPUT,OUTPUT);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN { MinSort3 }
  READ(Ch1, Ch2, Ch3);
  WRITE('Входные данные (', Ch1, ',', Ch2, ',', Ch3, ') сортируются в (');
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
  WRITE(',');
  { DP-3.1 Сортируем Ch1, Ch2 в OUTPUT }
  IF Ch1 < Ch2
  THEN
    WRITE(Ch1, ',', Ch2)
  ELSE
    WRITE(Ch2, ',', Ch1);
  WRITELN(').');
END.{ Minsort3 }
