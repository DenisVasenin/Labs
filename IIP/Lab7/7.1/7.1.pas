// echo '123456' | ./7.1
// echo '123456#' | ./7.1

PROGRAM Split(INPUT, OUTPUT);
VAR
  State, Ch: CHAR;
  Odds, Evens: TEXT;
BEGIN { Split }
  ASSIGN(Odds, 'ODDS');
  ASSIGN(Evens, 'EVENS');
  REWRITE(Odds);
  REWRITE(Evens);
  State := 'O';
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch);
  WHILE (State <> 'B') AND (Ch <> '#')
  DO
    BEGIN
      IF State = 'O'
      THEN
        BEGIN
          WRITE(Odds, Ch);
          State := 'E';
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          State := 'O';
        END;
      IF EOLN(INPUT)
      THEN
        State := 'B';
      READ(INPUT, Ch);
    END;
  IF State = 'B'
  THEN
    WRITELN('Не найден символ конца строки.')
  ELSE
    BEGIN
      WRITELN(Odds);
      WRITELN(Evens);
      RESET(Odds);
      RESET(Evens);
      WHILE NOT EOLN(Odds)
      DO
        BEGIN
          READ(Odds, Ch);
          WRITE(OUTPUT, Ch);
        END;
      WHILE NOT EOLN(Evens)
      DO
        BEGIN
          READ(Evens, Ch);
          WRITE(OUTPUT, Ch);
        END;
      WRITELN(OUTPUT);
    END;
  CLOSE(Odds);
  CLOSE(Evens);
  ERASE(Odds);
  ERASE(Evens);
END. { Split }