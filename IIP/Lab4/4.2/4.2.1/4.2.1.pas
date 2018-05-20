// echo 'Dear Paul#' | ./4.2.1

PROGRAM SarahRevere (INPUT, OUTPUT);
{ Печать сообщения о том как идут британцы, в зависимости от того, первым во входе встречается 'land' или 'sea'. }
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN { SarahRevere }
  { DP-1.1 инициализация W1, W2, W3, W4, Looking }
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := 'Y';
  WHILE Looking = 'Y'
  DO
    BEGIN
      { DP-1.2 Двигать окно, проверять конец данных }
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN { Конец данных }
        BEGIN
          Looking := 'N';
          WRITE(W1, W2, W3, W4);
        END
      ELSE
        WRITE(W1, W2, W3, W4, ',');
      { Проверка окна для  'land' }
      { Проверка окна для 'sea' }
    END;
  WRITELN;
  { создать сообщение Sarah }
END. { Sarah revere }
