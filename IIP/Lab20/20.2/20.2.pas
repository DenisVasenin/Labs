PROGRAM AverageScore(INPUT, OUTPUT);

CONST
  NumberOfScores = 4;
  ClassSize = 4;
  Min = 0;
  Max = 100;
VAR
  Ave, TotalScore, ClassTotal, NextScore, WhichScore, Student: INTEGER;
  Ch: CHAR;
  State: BOOLEAN;

BEGIN { AverageScore }
  ClassTotal := 0;
  Student := 0;
  State := TRUE;
  WRITELN('Student averages:');
  WHILE (Student < ClassSize) AND State
  DO
  BEGIN
    TotalScore := 0;
    WhichScore := 0;
    READ(Ch);
    WHILE ((Ch >= 'a') AND (Ch <= 'z')) OR ((Ch >= 'A') AND (Ch <= 'Z'))
    DO
      BEGIN
        WRITE(Ch);
        READ(Ch);
      END;
    WHILE (WhichScore < NumberOfScores) AND State
    DO
      BEGIN
        READ(NextScore);
        IF (NextScore > Max) OR (NextScore < Min)
        THEN
          State := FALSE
        ELSE
          BEGIN
            TotalScore := TotalScore + NextScore;
            WhichScore := WhichScore + 1;
          END;
      END;
    READLN();
    IF State
    THEN
      BEGIN
        TotalScore := TotalScore * 10;
        Ave := TotalScore DIV NumberOfScores;
        IF ((Ave MOD 10) >= 5)
        THEN
          WRITELN(' ', Ave DIV 10 + 1)
        ELSE
          WRITELN(' ', Ave DIV 10);
        ClassTotal := ClassTotal + TotalScore;
        Student := Student + 1;
      END;
  END;
  IF State
  THEN
    BEGIN
      WRITELN();
      WRITELN ('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1);
    END
  ELSE
    WRITELN(' Error');
END.  { AverageScore }
