{ DP-8 Сортируем первую строку INPUT в OUTPUT }
PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN { BubbleSort }
  ASSIGN(F1, 'F1.DAT');
  ASSIGN(F2, 'F2.DAT');
  { DP-8.2 Копируем INPUT в F1 }
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch);
    END;
  WRITELN(F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { DP-8.1 Копируем F1 в F2,проверяя отсортированность и переставляя первые соседнии символы по порядку}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOLN(F1)
          DO { По крайней мере два символа остается для Ch1, Ch2 }
            BEGIN
              READ(F1, Ch2);
              { DP-8.1.1 Выводим   min(Ch1,Ch2) в  F2, записывая отсортированные символы }
            END;
          WRITELN(F2, Ch1); { Выводим последний символ в F2 }
        END;
      { DP-8.4 Копируем F2 в F1 }
      RESET(F2);
      REWRITE(F1);
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, Ch);
          WRITE(F1, Ch);
        END;
      WRITELN(F1);
    END;
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
  CLOSE(F2);
END. { BubbleSort }
