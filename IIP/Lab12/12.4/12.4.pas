//Разработайте программу, которая удаляет пробелы в начале строки до первого не-пробела, 
//в конце строки после последнего не-пробела и удаляет лишние (более одного) пробелы между словами.

PROGRAM Prog(INPUT, OUTPUT);
VAR
  Prev, Curr: CHAR;
BEGIN
  IF NOT EOLN(INPUT) // если не пустая строка
  THEN
    BEGIN
      READ(Curr);
      WHILE (Curr = ' ') AND (NOT EOLN(INPUT)) // пропускаем все пробелы до первого символа или конца строки
      DO
        READ(Curr);
      IF (Curr <> ' ') // если был встречен символ - выводим
      THEN
        WRITE(Curr);
    END;
  WHILE NOT EOLN(INPUT) // если строка еще не пуста
  DO
    BEGIN
      Prev := Curr; // предыдущий символ = текущий символ
      READ(Curr); // читаем следующий символ
      IF (Curr <> ' ')
      THEN
        IF (Prev <> ' ')
        THEN
          WRITE(Curr) // выводим текущий символ при значении пары "$$"
        ELSE
          WRITE(Prev, Curr); // выводим оба символа при значении пары "_$"
    END;
  WRITE('#'); // для проверки оконечных пробелов
  WRITELN;
END.
