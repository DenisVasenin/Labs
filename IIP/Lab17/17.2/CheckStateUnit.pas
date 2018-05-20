{ Модуль }
UNIT CheckStateUnit;

INTERFACE
  PROCEDURE CheckState(VAR Ch, State: CHAR);

IMPLEMENTATION

  PROCEDURE CheckState(VAR Ch, State: CHAR);
  BEGIN
    { после точки состояние больше не меняется }
    IF (State <> 'P')
    THEN
      BEGIN
        { проверка на недопустимый символ }
        IF (Ch <> ' ')
        THEN
          State := 'T';
        { проверка на конец последовательности символов }
        IF (State = 'L') AND (Ch = ' ')
        THEN
          State := 'N';
        { проверка на букву }
        IF ((Ch > 'a') AND (Ch < 'z')) OR ((Ch > 'A') AND (Ch < 'Z'))
        THEN
          State := 'L';
        { проверка на запятую }
        IF (Ch = ',')
        THEN
          State := 'C';
        { проверка на точку }
        IF (Ch = '.')
        THEN
          State := 'P';
      END;
  END;

BEGIN

END.
