{ DP  Копирует INPUT в OUTPUT,сначала нечетные,а затем четные элементы }
PROGRAM Split(INPUT, OUTPUT);

{ DP-1.1 Копируем F1 в OUTPUT}
PROCEDURE CopyOut(VAR F1: TEXT);
VAR
  Ch: CHAR;
BEGIN
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch);
        END;
      READLN(F1);
    END;
END;

VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN
  { DP-1.2 Разделяет INPUT в Odds и Evens }
  ASSIGN(Odds, 'Odds.dat');
  ASSIGN(Evens, 'Evens.dat');
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          { DP-1.2.1 Прочитать Ch, записать в файл, выбранный через Next, переключить Next }
          READ(INPUT, Ch);
          IF Next = 'O'
          THEN
            BEGIN
              WRITE(Odds, Ch);
              Next := 'E';
            END
          ELSE
            BEGIN
              WRITE(Evens, Ch);
              Next := 'O';
            END;
        END;
      READLN(INPUT);
      WRITELN(Odds);
      WRITELN(Evens);
    END;
  WRITELN(Odds);
  WRITELN(Evens);
  CopyOut(Odds);
  CopyOut(Evens);
  WRITELN(OUTPUT);
  CLOSE(Odds);
  CLOSE(Evens);
END.
