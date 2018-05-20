PROGRAM Prime(INPUT, OUTPUT);
CONST
  N = 100;
TYPE
  Range = SET OF 2 .. N;
VAR
  Numbers: Range;
  Number, Counter: INTEGER;

PROCEDURE Print(Numbers: Range);
BEGIN { Print }
  Number := 2;
  WHILE (Number <= N)
  DO
    BEGIN
      IF (Number IN Numbers)
      THEN
        WRITE(Number, ' ');
      Number := Number + 1;
    END;
  WRITELN();
END; { Print }

BEGIN { Prime }
  Numbers := [2, 3];
  Number := 5;
  WHILE (Number <= N)
  DO
    BEGIN
      Numbers := Numbers + [Number];
      Counter := 3;
      WHILE (Counter < Number)
      DO
        BEGIN
          IF (Counter IN Numbers)
          THEN
            IF (Number MOD Counter = 0)
            THEN
              BEGIN
                Numbers := Numbers - [Number];
                Counter := Number;
              END;
          Counter := Counter + 2;
        END;
      Number := Number + 2;
    END;
  Print(Numbers);
END.  { Prime }
