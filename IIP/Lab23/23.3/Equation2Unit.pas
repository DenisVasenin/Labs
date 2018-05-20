UNIT Equation2Unit;

INTERFACE

PROCEDURE Solve2(VAR FIn, FOut: TEXT);

IMPLEMENTATION

CONST
  Accuracy = 3;
TYPE
  Coefficients = ARRAY ['A' .. 'C'] OF REAL;
VAR
  Root1, Root2: REAL;
  Coefs: Coefficients;
  State: BOOLEAN;
  RootCount: INTEGER;

{ прочитать коэффициенты }
PROCEDURE ReadCoefs(VAR FIn: TEXT; VAR C: Coefficients; VAR St: BOOLEAN);
VAR
  Counter: CHAR;
  Coef: REAL;
BEGIN
  FOR Counter := 'A' TO 'C'
  DO
    BEGIN
      IF NOT EOLN(FIn) AND St
      THEN
        BEGIN
          READ(FIn, Coef);
          //WRITELN(Coef:0:5);
          IF (Coef = 0) AND (Counter = 'A')
          THEN
            St := FALSE;
          C[Counter] := Coef;
        END
      ELSE
        St := FALSE;
    END;
END;

{ вычислить корни и вернуть их количество }
FUNCTION CalcRoots(VAR C: Coefficients; VAR R1, R2: REAL): INTEGER;
VAR
  D: REAL;
BEGIN
  D := (C['B'] * C['B']) - (4 * C['A'] * C['C']);
  IF D > 0
  THEN
    BEGIN
      R1 := (-C['B'] + sqrt(D)) / (2 * C['A']);
      R2 := (-C['B'] - sqrt(D)) / (2 * C['A']);
      CalcRoots := 2;
    END
  ELSE
    IF D = 0
    THEN
      BEGIN
        R1 := (-C['B'] + sqrt(D)) / (2 * C['A']);
        CalcRoots := 1;
      END
    ELSE
      CalcRoots := 0
END;

{ вывести корни }
PROCEDURE PrintAnswer(VAR FOut: TEXT; VAR RC: INTEGER; VAR R1, R2: REAL);
BEGIN
  IF RC = 2
  THEN
    WRITELN(FOut, R1:0:Accuracy, ' ', R2:0:Accuracy)
  ELSE
    IF RC = 1
    THEN
      WRITELN(FOut, R1:0:Accuracy)
    ELSE
      WRITELN(FOut, 'No real roots.');
END;

PROCEDURE Solve2(VAR FIn, FOut: TEXT);
BEGIN { Solve2 }
  State := TRUE;
  Root1 := 0;
  Root2 := 0;
  ReadCoefs(FIn, Coefs, State);
  IF State
  THEN
    BEGIN
      RootCount := CalcRoots(Coefs, Root1, Root2);
      PrintAnswer(FOut, RootCount, Root1, Root2);
    END
  ELSE
    WRITELN(FOut, 'Wrong arguments');
END; { Solve2 }

BEGIN
END.
