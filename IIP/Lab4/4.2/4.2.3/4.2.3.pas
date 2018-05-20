// echo 'Dear Paul : I have been #' | ./4.2.3
// echo 'Dear Paul : I have been to Chelsea #' | ./4.2.3
// echo 'Dear Paul : my land lies along the sea #' | ./4.2.3

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
      THEN
        { Конец данных }
        Looking := 'N';
      { DP-1.3 Проверка окна для 'land' }
      IF W1 = 'l'
      THEN
        IF W2 = 'a'
        THEN
          IF W3 = 'n'
          THEN
            IF W4 = 'd'
            THEN
              {'land' найдено}
              Looking := 'L';
      { DP-1.4 Проверка окна для 'sea' }
      IF W2 = 's'
      THEN
        IF W3 = 'e'
        THEN
          IF W4 = 'a'
          THEN
            {'sea' найдено}
            Looking := 'S';
    END;
  { DP-1.5 создать сообщение Sarah }
  IF Looking = 'L'
  THEN
    WRITELN('The British are coming by land.')
  ELSE
    IF Looking = 'S'
    THEN
      WRITELN('The British are coming by sea.')
    ELSE
      WRITELN('Sarah didn''t say');
END. { Sarah revere }
