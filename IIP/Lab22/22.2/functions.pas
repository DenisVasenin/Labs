UNIT Functions;

INTERFACE

CONST
  LetterCount = 10; { количество выводимых букв }
  LetterRowCount = 5; { количество строк матрицы буквы }
  LetterColCount = 5; { количество столбцов матрицы буквы }
  LetterMatrixSize = LetterRowCount * LetterColCount; { размер матрицы буквы }
TYPE
  LetterMaskRecord = RECORD
                      Mark: 'a' .. 'z'; { диапазон допустимых букв }
                      Mask: SET OF 1 .. LetterMatrixSize; { множество для матрицы буквы }
                     END;
  FileOfMask = FILE OF LetterMaskRecord; { файл матриц букв }

PROCEDURE CreateMaskFile(VAR FIn: TEXT; VAR FOut: FileOfMask);
PROCEDURE ReadMask(VAR FIn: FileOfMask; VAR Letter: CHAR);
PROCEDURE WriteString(VAR FOut: TEXT);

IMPLEMENTATION

VAR
  LetterPosition: INTEGER; { переменная для позиционирования матриц букв в матрице строки }
  StringMask: SET OF 1 .. (LetterMatrixSize * LetterCount); { матрицa строки }

{ создать файл масок букв из файла паттернов }
PROCEDURE CreateMaskFile(VAR FIn: TEXT; VAR FOut: FileOfMask);
VAR
  LetterMask: LetterMaskRecord;
  Num: 1 .. LetterMatrixSize;
BEGIN { CreateMaskFile }
  RESET(FIn);
  REWRITE(FOut);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      LetterMask.Mask := [];
      READ(FIn, LetterMask.Mark);
      WHILE NOT EOLN(FIn)
      DO
        BEGIN
          READ(FIn, Num);
          LetterMask.Mask := LetterMask.Mask + [Num];
        END;
      WRITE(FOut, LetterMask);
      READLN(FIn);
    END;
END; { CreateMaskFile }

{ копировать матрицу буквы в матрицу строки }
PROCEDURE ReadMask(VAR FIn: FileOfMask; VAR Letter: CHAR);
VAR
  LetterMask: LetterMaskRecord;
  Counter: INTEGER;
  State: BOOLEAN;
BEGIN { ReadMask }
  RESET(FIn);
  State := TRUE;
  WHILE NOT EOF(FIn) AND State
  DO
    BEGIN
      READ(FIn, LetterMask);
      IF LetterMask.Mark = Letter
      THEN
        BEGIN
          FOR Counter := 1 TO LetterMatrixSize
          DO
            IF Counter IN LetterMask.Mask
            THEN
              StringMask := StringMask + [Counter + LetterPosition];
          LetterPosition := LetterPosition + LetterMatrixSize;
          State := FALSE;
        END;
    END;
END; { ReadMask }

{ вывести строку в файл }
PROCEDURE WriteString(VAR FOut: TEXT);
VAR
  RowCounter, LetterCounter, Counter, StartOffset, EndOffset: INTEGER;
BEGIN { WriteString }
  { выводим построчно }
  FOR RowCounter := 0 TO (LetterRowCount - 1)
  DO
    BEGIN
      { начальное и конечное смещение вывода для каждой строки }
      StartOffset := 1 + (LetterColCount * RowCounter);
      EndOffset := LetterColCount + (LetterColCount * RowCounter);
      { для каждой буквы.. }
      FOR LetterCounter := 1 TO LetterCount
      DO
        BEGIN
          { ..выводим текущую строку и.. }
          FOR Counter := StartOffset TO EndOffset
          DO
            IF Counter IN StringMask
            THEN
              WRITE(FOut, 'X')
            ELSE
              WRITE(FOut, ' ');
          { ..увеличиваем смещения для перехода к следующей букве }
          StartOffset := StartOffset + LetterMatrixSize;
          EndOffset := EndOffset + LetterMatrixSize;
          WRITE(FOut, ' ');
        END;
      WRITELN(FOut);
    END;
END; { WriteString }

BEGIN
  StringMask := [];
  LetterPosition := 0;
END.
