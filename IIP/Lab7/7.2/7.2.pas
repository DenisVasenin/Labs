{ DP-1 Сортирует символы, предшествующие #, из INPUT в OUTPUT. Программа выдаст ошибку, если в INPUT отсутствует # }
PROGRAM SelectSort(INPUT, OUTPUT);
VAR
  State, Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN { SelectSort }
  ASSIGN(F1, 'F1.TMP');
  ASSIGN(F2, 'F2.TMP');
  REWRITE(F1);
  REWRITE(F2);
  State := 'N';
  // TEST#1  DP-1.1
  // DP-1.1 Копировать INPUT в F1 и эхо в OUTPUT
  WRITE(OUTPUT, 'INPUT DATA:');
  WHILE (NOT EOLN(INPUT)) AND (State <> 'Y')
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch);
      WRITE(OUTPUT, Ch);
      IF Ch = '#'
      THEN
        State := 'Y';
    END;
  WRITELN(OUTPUT);
  WRITELN(F1);
  // TEST#2  DP-1.1 + DP-1.2 + DP-2.1 + DP-1.2.1.1
  // DP-1.2 Сортировать F1 в OUTPUT, используя стратегию SelectSort
  IF State = 'Y'
  THEN
    BEGIN
      WRITE(OUTPUT, 'SORTED DATA:');
      RESET(F1);
      READ(F1, Ch);
      WHILE Ch <> '#'
      DO
        BEGIN
          // DP-2.1 Выбираем минимальный из F1 и копируем остаток F1 в F2
          REWRITE(F2);
          Min := Ch;
          READ(F1, Ch);
          WHILE Ch <> '#'
          DO
            BEGIN
              // DP-1.2.1.1 Выбираем минимальный из (Ch, Min) копируем второй символ в F2
              IF Ch < Min
              THEN
                BEGIN
                  WRITE(F2, Min);
                  Min := Ch;
                END
              ELSE
                WRITE(F2, Ch);
              READ(F1, Ch);
            END;
          WRITELN(F2, '#');
          WRITE(OUTPUT, Min);
          // TEST#3  DP-1.1 + DP-1.2 + DP-2.1 + DP-1.2.1.1 + DP-1.2.2
          // DP-1.2.2 Копируем F2 в F1
          RESET(F2);
          REWRITE(F1);
          READ(F2, Ch);
          WHILE Ch <> '#'
          DO
            BEGIN
              WRITE(F1, Ch);
              READ(F2, Ch);
            END;
          WRITELN(F1, '#');
          RESET(F1);
          READ(F1, Ch);
        END;
      WRITELN(OUTPUT);
    END
  ELSE
    WRITELN(OUTPUT, 'Ошибка. Не найден символ #.');
  CLOSE(F1);
  CLOSE(F2);
  ERASE(F1);
  ERASE(F2);
END. { SelectSort }
