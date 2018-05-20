PROGRAM MathTools(INPUT, OUTPUT);
USES
  IsSimpleUnit, Equation2Unit;
VAR
  State: BOOLEAN;
  Action: CHAR;
  Tmp: TEXT;

{ вывод справки }
PROCEDURE ShowHelp(VAR FOut: TEXT);
BEGIN
  WRITELN(FOut, 's <A> <B> <C> - решение квадратного уровнения');
  WRITELN(FOut, 'p <number> - проверка числа на простоту');
  WRITELN(FOut, 'h – отображение help');
  WRITELN(FOut, 'e - выход');
END;

{ чтение аргументов из INPUT и подготовка для передачи их в модуль }
PROCEDURE ReadArguments(VAR FIn, Tmp: TEXT);
VAR
  Ch, Ch1: CHAR;
BEGIN
  REWRITE(Tmp);
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      REPEAT
        READ(FIn, Ch);
      UNTIL (Ch <> ' ') OR EOLN(FIn);
      Ch1 := Ch;
      WHILE NOT EOLN(FIn)
      DO
        BEGIN
          CASE Action OF
            's':
              BEGIN
                IF (Ch IN ['0' .. '9']) AND ((Ch1 = '-') OR (Ch1 = '.'))
                THEN
                  WRITE(Tmp, Ch1, Ch)
                ELSE
                  IF Ch IN ['0' .. '9']
                  THEN
                    WRITE(Tmp, Ch)
                  ELSE
                    IF (Ch <> '.')
                    THEN
                      WRITE(Tmp, ' ');
                Ch1 := Ch;
              END;
            'p': WRITE(Tmp, Ch);
          END;
          READ(FIn, Ch);
        END;
    END;
  IF (Ch IN ['0' .. '9']) AND (Ch1 = '-')
  THEN
    WRITELN(Tmp, Ch1, Ch)
  ELSE
    IF (Ch IN ['0' .. '9'])
    THEN
      WRITELN(Tmp, Ch);
  RESET(Tmp);
END;

{ очистка INPUT }
PROCEDURE CleanInput(VAR FIn: TEXT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(FIn)
  DO
    READ(FIn, Ch);
  READ(FIn, Ch);
END;

BEGIN { MathTools }
  ASSIGN(Tmp, 'TMP');
  REWRITE(Tmp);
  State := TRUE;
  ShowHelp(OUTPUT);
  WHILE State
  DO
    BEGIN
      WRITE(OUTPUT, 'math-tools>');
      READ(Action);
      IF (Action = 's') OR (Action = 'p') OR (Action = 'h') OR (Action = 'e')
      THEN
        CASE Action OF
          's':
            BEGIN
              ReadArguments(INPUT, Tmp);
              Solve2(Tmp, OUTPUT);
            END;
          'p':
            BEGIN
              ReadArguments(INPUT, Tmp);
              IsPrime(Tmp, OUTPUT);
            END;
          'h': ShowHelp(OUTPUT);
          'e': State := FALSE;
        END;
      CleanInput(INPUT)
    END;
  CLOSE(Tmp);
  ERASE(Tmp);
END. { MathTools }
