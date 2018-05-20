PROGRAM RN(INPUT, OUTPUT);
USES
  NumbersUnit;
VAR
  N: INTEGER;
BEGIN
  N := ReadNumber(INPUT);
  IF (N >= 0)
  THEN
    WRITELN(N)
  ELSE
    WRITELN('Wrong number');
END.
