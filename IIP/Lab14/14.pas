PROGRAM Sort(INPUT, OUTPUT);

{ Разбивает F1 на F2 и F3 }
PROCEDURE Split(VAR F1, F2, F3: TEXT);
VAR 
  Ch, Switch: CHAR;
BEGIN { Split }
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  Switch := '2';
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3';
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2';
        END;
    END;
  WRITELN(F2);
  WRITELN(F3);
END; { Split }

{ Сливает F2 и F3 в F1 }
PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR 
  Ch2, Ch3: CHAR;
BEGIN { Merge }
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE (NOT EOF(F2)) AND (NOT EOF(F3))
  DO
    BEGIN
      IF Ch2 < Ch3
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2);
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3);
        END;
    END;
  WHILE NOT EOF(F2)
  DO
    BEGIN
      WRITE(F1, Ch2);
      READ(F2, Ch2);
    END;
  WHILE NOT EOF(F3)
  DO
    BEGIN
      WRITE(F1, Ch3);
      READ(F3, Ch3);
    END;
  WRITELN(F1);
END; { Merge }

PROCEDURE RecursiveSort(VAR F1, Names: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN { RecursiveSort }
  READ(Names, Ch);
  ASSIGN(F2, Ch + '.TMP');
  READ(Names, Ch);
  ASSIGN(F3, Ch + '.TMP');
  RESET(F1);
  { Файл имеет как минимум 2 символа }
  IF NOT EOLN(F1)
  THEN
    READ(F1, Ch);
    IF NOT EOLN(F1)
    THEN
      BEGIN
        Split(F1, F2, F3);
        RecursiveSort(F2, Names);
        RecursiveSort(F3, Names);
        Merge(F1, F2, F3);
      END;
END; { RecursiveSort }

VAR
  F1, Names: TEXT;
BEGIN { Sort }
  ASSIGN(Names, 'names');
  RESET(Names);
  ASSIGN(F1, 'input');
  RecursiveSort(F1, Names);
  RESET(F1);
  IF EOF(F1)
  THEN
    BEGIN
      REWRITE(F1);
      WRITELN(F1);
    END;
  CLOSE(F1);
  CLOSE(Names);
END. { Sort }
