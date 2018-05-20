PROGRAM Reverse(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  F1, F2: TEXT;
BEGIN
  ASSIGN(F1, 'BUF1');
  ASSIGN(F2, 'BUF2');
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch);
    END;
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      REWRITE(F2);
      WHILE NOT EOF(F1)
      DO
        BEGIN
          READ(F1, Ch);
          IF NOT EOF(F1)
          THEN
            WRITE(F2, Ch)
          ELSE
            WRITE(OUTPUT, Ch);
        END;
      RESET(F2);
      REWRITE(F1);
      WHILE NOT EOF(F2)
      DO
        BEGIN
          READ(F2, Ch);
          WRITE(F1, Ch);
        END;
      RESET(F1);
    END;
  WRITELN;
END.
