{ Читает строку из входа ,пропускает ее через RemoveExtraBlanks }
PROGRAM TestRemove(INPUT,OUTPUT);
USES
  Queue;
VAR
  Ch: CHAR;

{ Удаляет лишниe пробелы между словами на одной строке }
PROCEDURE RemoveExtraBlanks();
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN { RemoveExtraBlanks }
  Blank := ' ';
  LineEnd := '#';
  { помечаем конец текста в очереди }
  AddQ(LineEnd);
  HeadQ(Ch);
  { удаляем пробелы }
  WHILE Ch <> LineEnd
  DO
    BEGIN
      { удаляем пробелы }
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ();
          HeadQ(Ch);
        END;
      { читаем слово }
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
      DO
        BEGIN
          AddQ(Ch);
          DelQ();
          HeadQ(Ch);
        END;
      { удаляем пробелы }
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ();
          HeadQ(Ch);
        END;
      { Вставляем пробел между словами }
      IF Ch <> LineEnd
      THEN
         AddQ(Blank);
    END;
  { удаяем LineEnd из очереди }
  DelQ();
END; { RemoveExtraBlanks }

BEGIN { TestRemove }
  CreateQ();
  WRITE('Вход:');
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(OUTPUT, Ch);
      AddQ(Ch);
    END;
  WRITELN();
  RemoveExtraBlanks();
  WRITE('Выход:');
  HeadQ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      DelQ();
      HeadQ(Ch);
    END;
  WRITELN();
  DeleteQ();
END. { TestRemove }
