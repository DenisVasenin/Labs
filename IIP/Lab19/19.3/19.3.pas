PROGRAM Stat(INPUT, OUTPUT);
USES
  NumbersUnit;
TYPE
  ProgramStates = (Start, Accept, Overflow);
VAR
  NumCount: INTEGER;
  Num, Max, Min, Mean: REAL;
  ProgramState: ProgramStates;
BEGIN { Stat }
  ProgramState := Start;
  Min := MAXINT;
  Max := 0;
  Mean := 0;
  NumCount := 0;
  WHILE NOT EOF(INPUT) AND (ProgramState <> Overflow)
  DO
    BEGIN
      Num := ReadNumber(INPUT);
      READLN(INPUT);
      IF (Num >= 0)
      THEN
        BEGIN
          ProgramState := Accept;
          NumCount := NumCount + 1;
          Min := IsMin(Min, Num);
          Max := IsMax(Max, Num);
          IF NOT SumNum(Mean, Num)
          THEN
            ProgramState := Overflow;
        END;
    END;
  IF ProgramState <> Start
  THEN
    CASE ProgramState OF
      Accept:
        BEGIN
          Mean := Mean / NumCount;
          WRITELN('Min=', Min:0:0, ' Max=', Max:0:0, ' Mean=', Mean:0:2);
        END;
      Overflow: WRITELN('Ошибка: переполнение при сложении.');
    END
  ELSE
    WRITELN('Ошибка: не найдено чисел для обработки.');
END. { Stat }
