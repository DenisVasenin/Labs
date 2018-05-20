// echo '       h  e l l   o     ,  m,y,    f  ri  e     nd   .   ' | ./17.2

PROGRAM KA(INPUT, OUTPUT);
USES
  CheckStateUnit;
VAR
  Ch, State: CHAR;
BEGIN { KA }
  { устанавливаем начальное состояние }
  State := 'B';
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      { если найдена ошибка, то прекращаем анализ }
      IF (State <> 'E') AND (State <> 'T')
      THEN
        BEGIN
          { точка или запятая в начале предложения - ошибка }
          IF ((Ch = ',') OR (Ch = '.')) AND (State = 'B')
          THEN
            BEGIN
              State := 'E';
              WRITE(OUTPUT, 'Ошибка: недопустимый символ в начале предложения.');
            END;
          { если после точки не пробел - ошибка }
          IF (Ch <> ' ') AND (State = 'P')
          THEN
            BEGIN
              State := 'E';
              WRITELN(OUTPUT);
              WRITE(OUTPUT, 'Ошибка: недопустимый символ после точки.');
            END;
          { ',,' или ',.' - ошибка }
          IF ((Ch = ',') OR (Ch = '.')) AND (State = 'C')
          THEN
            BEGIN
              State := 'E';
              WRITELN(OUTPUT);
              WRITE(OUTPUT, 'Ошибка: отсутствует слово между '','' и ''', Ch, '''.');
            END;
          IF (State <> 'E')
          THEN
            BEGIN
              { новый символ после пробела }
              IF (State = 'N') AND (Ch <> ' ')
              THEN
                BEGIN
                  IF (Ch = ',') { если запятая }
                  THEN
                    WRITE(OUTPUT, Ch, ' ')
                  ELSE
                    IF (Ch = '.') { если точка }
                    THEN
                      WRITE(OUTPUT, Ch)
                    ELSE
                      WRITE(OUTPUT, ' ', Ch);
                  CheckState(Ch, State);
                END
              { от начала слова до пробела }
              ELSE
                BEGIN
                  CheckState(Ch, State);
                  IF (State = 'L') OR (Ch = '.') { если буква или точка }
                  THEN
                    WRITE(OUTPUT, Ch);
                  IF (Ch = ',') { если запятая }
                  THEN
                    WRITE(OUTPUT, Ch, ' ');
                END;
            END;
        END;
    END;
  WRITELN(OUTPUT);
  IF (State = 'T')
  THEN
    WRITELN(OUTPUT, 'Ошибка: обнаружен недопустимый символ.')
  ELSE
    IF (State <> 'P') AND (State <> 'E')
    THEN
      WRITELN(OUTPUT, 'Ошибка: отсутствует точка в конце предложения.');
END.  { KA }
