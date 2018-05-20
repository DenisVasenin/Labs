PROGRAM AverageScore(INPUT, OUTPUT);

CONST
  NumberOfScores = 4;
  ClassSize = 4;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: 0 .. 100;
  Ave, TotalScore, ClassTotal: INTEGER;

BEGIN { AverageScore }
  ClassTotal := 0;
  Student := 0;
  WRITELN('Student averages:');
  WHILE (Student < ClassSize)
  DO
  BEGIN
    TotalScore := 0;
    WhichScore := 0;
    WHILE (WhichScore < NumberOfScores)
    DO
      BEGIN
        READ(NextScore);
        TotalScore := TotalScore + NextScore;
        WhichScore := WhichScore + 1;
      END;
    READLN();                                                       // 2 3 4 4            3 4 4 5           4 4 5 5
    TotalScore := TotalScore * 10;                                  // 13 * 10 = 130      16 * 10 = 160     18 * 10 = 180
    Ave := TotalScore DIV NumberOfScores;                           // 130 / 4 = 32       160 / 4 = 40      180 / 4 = 45
    IF ((Ave MOD 10) >= 5)                                          // 32 % 10 = 2        40 % 10 = 0       45 % 10 = 5
    THEN
      WRITELN(Ave DIV 10 + 1)                                       //                                      (45 / 10) + 1 = 5
    ELSE
      WRITELN(Ave DIV 10);                                          // 32 / 10 = 3        40 / 10 = 4
    ClassTotal := ClassTotal + TotalScore;
    Student := Student + 1;
  END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);        // 600 / (4 * 4) = 37    6000 / 16 = 375
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1);             // 3.7                  37.?5
END.  { AverageScore }
