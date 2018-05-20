PROGRAM IsPrime(INPUT, OUTPUT);
USES
  NumbersUnit;
CONST
  Lim = MAXINT;
VAR
  N: INTEGER;

{ проверка на простое число }
FUNCTION CheckPrime(N: INTEGER): BOOLEAN;
VAR
  Numbers: ARRAY [1 .. Lim] OF BOOLEAN;
  Number, Index: INTEGER;
BEGIN { CheckPrime }
  IF (N < 2) OR ((N > 2) AND (N MOD 2 = 0))
  THEN
    CheckPrime := FALSE
  ELSE
    BEGIN
      Numbers[2] := TRUE;
      Numbers[3] := TRUE;
      Number := 5;
      WHILE Number <= N
      DO
        BEGIN
          Numbers[Number] := TRUE;
          Index := 3;
          REPEAT
            IF (Number MOD Index = 0)
            THEN
              BEGIN
                Numbers[Number] := FALSE;
                Index := Number;
              END
            ELSE
              Index := Index + 2;
          UNTIL Index = Number;
          { защита от переполнения, если N = MAXINT }
          IF Number = N
          THEN
            BREAK
          ELSE
            Number := Number + 2;
        END;
      IF Numbers[N]
      THEN
        CheckPrime := TRUE
      ELSE
        CheckPrime := FALSE;
    END;
END; { CheckPrime }

{ вывести ответ }
PROCEDURE ReturnAnswer(VAR FOut: TEXT; N: INTEGER);
BEGIN { ReturnAnswer }
  IF (N >= 0) AND (N <= Lim)
  THEN
    IF CheckPrime(N)
    THEN
      WRITELN(FOut, 'Prime')
    ELSE
      WRITELN(FOut, 'Not prime')
  ELSE
    WRITELN(FOut, 'Wrong number');
END; { ReturnAnswer }

BEGIN { IsPrime }
  N := ReadNumber(INPUT);
  ReturnAnswer(OUTPUT, N);
END. { IsPrime }
