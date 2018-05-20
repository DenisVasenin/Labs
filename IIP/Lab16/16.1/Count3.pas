{ Модуль счетчика от 0 до 999 }
UNIT Count3;
INTERFACE
  PROCEDURE CheckOverflow(VAR State: CHAR); { Проверка переполнения счетчика }
  PROCEDURE Start(); { Сбрасывает счетчик в ноль }
  PROCEDURE Bump(); { Увеличивает счетчик на единицу }
  PROCEDURE Value(VAR V100, V10, V1: CHAR); { Возвращает значение счетчика }
IMPLEMENTATION
  VAR
    Ones, Tens, Hundreds: CHAR;

  { State := 1 при Hundreds = '9', Tens = '9', Ones = '9' }
  PROCEDURE CheckOverflow(VAR State: CHAR);
  BEGIN
    IF (Hundreds = '9') AND (Tens = '9') AND (Ones = '9')
    THEN
      State := '1'
    ELSE
      State := '0';
  END;

  { Digit++, если <9 | Digit := '0', если =9 }
  PROCEDURE NextDigit(VAR Digit: CHAR);
  BEGIN { NextDigit }
    IF Digit = '0' THEN Digit :='1' ELSE
    IF Digit = '1' THEN Digit :='2' ELSE
    IF Digit = '2' THEN Digit :='3' ELSE
    IF Digit = '3' THEN Digit :='4' ELSE
    IF Digit = '4' THEN Digit :='5' ELSE
    IF Digit = '5' THEN Digit :='6' ELSE
    IF Digit = '6' THEN Digit :='7' ELSE
    IF Digit = '7' THEN Digit :='8' ELSE
    IF Digit = '8' THEN Digit :='9' ELSE
    IF Digit = '9' THEN Digit :='0'
  END; { NextDigit }

  { Ones, Tens, Hundreds := '0', '0', '0' }
  PROCEDURE Start();
  BEGIN { Start }
    Ones := '0';
    Tens := '0';
    Hundreds := '0';
  END; { Start }

  { Ones++, Tens++, Hundreds++, если <999 }
  PROCEDURE Bump();
  BEGIN { Bump }
    NextDigit(Ones);
    IF  Ones = '0'
    THEN
      BEGIN
        NextDigit(Tens);
        IF Tens = '0'
        THEN
          BEGIN
            NextDigit(Hundreds);
            IF Hundreds = '0'
            THEN
              BEGIN
                Ones := '9';
                Tens := '9';
                Hundreds := '9';
              END;
          END;
      END;
  END; { Bump }

  { V100 := Hundreds, V10 := Tens, V1 := Ones;}
  PROCEDURE Value(VAR V100, V10, V1: CHAR);
  BEGIN { Value }
    V100 := Hundreds;
    V10 := Tens;
    V1 := Ones;
  END; { Value }

BEGIN

END. { UNIT Count3 }
