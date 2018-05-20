PROGRAM CountReverse(INPUT,OUTPUT);
USES
  Count3;
VAR
  Ch1, Ch2, Ch3, V100, V10, V1, State: CHAR;

BEGIN { CountReverse }
  Start();
  State := '0';
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch1);
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch2);
  WHILE (NOT EOLN(INPUT))
  DO
    BEGIN
      READ(INPUT, Ch3);
      IF ((Ch2 < Ch1) AND (Ch2 < Ch3)) OR ((Ch2 > Ch1) AND (Ch2 > Ch3))
      THEN
        IF State = '0'
        THEN
          BEGIN
            CheckOverflow(State);
            IF (State = '1')
            THEN
              WRITELN('Произошло переполнение счетчика.')
            ELSE
              Bump();
          END;
      Ch1 := Ch2;
      Ch2 := Ch3;
    END;
  Value(V100, V10, V1);
  WRITELN('Количество реверсов: ', V100, V10, V1);
END. { CountReverse }
