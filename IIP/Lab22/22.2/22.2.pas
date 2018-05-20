PROGRAM XPrint(INPUT, OUTPUT);
USES
  Functions;
VAR
  FMask: FileOfMask;
  FPat: TEXT;
  Letter: CHAR;
  LetterCounter: INTEGER;
  State: BOOLEAN;

BEGIN { XPrint }
  ASSIGN(FPat, 'MASK');
  ASSIGN(FMask, 'LETTER.MASK');
  LetterCounter := 0;
  State := FALSE;
  CreateMaskFile(FPat, FMask);
  WRITE('Please enter word: ');
  { прочитать буквы и записать их матрицы в матрицу строки }
  WHILE NOT EOLN(INPUT) AND (LetterCounter < LetterCount)
  DO
    BEGIN
      READ(INPUT, Letter);
      IF (Letter >= 'a') AND (Letter <= 'z')
      THEN
        BEGIN
          ReadMask(FMask, Letter);
          LetterCounter := LetterCounter + 1;
          State := TRUE; { была ли хоть одна допустимая буква на входе }
        END;
    END;
  { вывести строку в файл }
  IF State
  THEN
    WriteString(OUTPUT)
  ELSE
    WRITELN('Не найдено символов для отображения.');
  CLOSE(FMask);
  CLOSE(FPat);
  ERASE(FMask);
END. { XPrint }
