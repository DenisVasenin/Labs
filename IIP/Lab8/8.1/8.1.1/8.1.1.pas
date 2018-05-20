{ DP-8 Сортируем первую строку INPUT в OUTPUT }
PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN { BubbleSort }
  ASSIGN(F1, 'F1.DAT');
  { DP-8.2 Копируем INPUT в F1 }
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch);
    END;
  WRITELN(F1);
  { DP-8.5 Копируем F1 в OUTPUT }
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(OUTPUT, Ch);
    END;
  WRITELN(OUTPUT);
  CLOSE(F1);
END. { BubbleSort }
