PROGRAM PG(INPUT, OUTPUT);
CONST
  Cols = 5;
  MatrixSize = 5 * Cols;
  LetterA = [3, 7, 9, 11, 15, 16, 17, 18, 19, 20, 21, 25];
  LetterB = [1, 2, 3, 4, 5, 6, 10, 11, 12 , 13, 14, 16, 20, 21, 22, 23, 24 ,25];
  LetterC = [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];
  LetterD = [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
  LetterE = [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
TYPE
  Matrix = SET OF 1 .. MatrixSize;
VAR
  Ch: CHAR;

PROCEDURE PrintLetter(Letter: Matrix);
VAR
  Counter: INTEGER;
BEGIN
  FOR Counter := 1 TO MatrixSize
  DO
    BEGIN
      IF (Counter IN Letter)
      THEN
        WRITE('X')
      ELSE
        WRITE(' ');
      IF (Counter MOD Cols = 0)
      THEN
        WRITELN(OUTPUT);
    END;
  WRITELN(OUTPUT);
END;

BEGIN { PG }
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(Ch);
      IF (Ch >= 'A') AND (Ch <= 'E')
      THEN
        CASE Ch OF
          'A': PrintLetter(LetterA);
          'B': PrintLetter(LetterB);
          'C': PrintLetter(LetterC);
          'D': PrintLetter(LetterD);
          'E': PrintLetter(LetterE);
        END
      ELSE
        BEGIN
          WRITELN('Неизвестный символ ');
          WRITELN();
        END;
    END;
END. { PG }
