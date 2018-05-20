PROGRAM BubbleSort(INPUT,OUTPUT);

PROCEDURE CopyFile(VAR FileIn, FileOut: TEXT);
VAR
  Ch: CHAR;
BEGIN
  RESET(FileIn);
  REWRITE(FileOut);
  WHILE NOT EOLN(FileIn)
  DO
    BEGIN
      READ(FileIn, Ch);
      WRITE(FileOut, Ch);
    END;
  WRITELN(FileOut);
END;
  
PROCEDURE Sort(VAR F1, F2: TEXT; VAR Sorted: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN
  Sorted := 'Y';
  RESET(F1);
  REWRITE(F2);
  IF NOT EOF(F1)
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN(F1)
      DO 
        { По крайней мере два символа остается для Ch1,Ch2 }
        BEGIN
          READ(F1, Ch2);
          { Выводим   min(Ch1, Ch2) в  F2, записывая отсортированные символы }
          IF Ch1 <= Ch2
          THEN
            BEGIN
              WRITE(F2, Ch1);
              Ch1 := Ch2;
            END
          ELSE
            BEGIN
              WRITE(F2, Ch2); 
              Sorted := 'N'; 
            END
        END;
        { Выводим последний символ в F2 }
        WRITELN(F2, Ch1); 
    END;
END;


VAR
  Sorted:CHAR;
  F1, F2:TEXT;
BEGIN { BubbleSort }
  ASSIGN(F1, 'F1.DAT');
  ASSIGN(F2, 'F2.DAT');
  { Копируем INPUT в F1 }
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sort(F1, F2, Sorted);
      { Копируем F2 в F1 }
      Sort(F2, F1, Sorted);
    END;
  { Копируем F1 в OUTPUT }
  CopyFile(F1, OUTPUT);
  CLOSE(F1);
  CLOSE(F2);
END.{ BubbleSort }
