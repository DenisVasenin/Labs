PROGRAM LexicCompare(INPUT, OUTPUT);

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{ Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2 соответственно. Фактические параметры, соответствующие F1 и F2, 
должны быть различными }
VAR 
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE NOT(EOLN(F1) OR EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN 
        {Ch1 < Ch2 или F1 короче F2}
        Result := '1';
      IF (Ch1 > Ch2)
      THEN 
        {Ch1 > Ch2 или F2 короче F1}
        Result := '2';
    END;
  IF (Result = '0')
  THEN
    IF NOT EOLN(F1)
    THEN
      Result := '2';
    IF NOT EOLN(F2)
    THEN
      Result := '1';
  WRITELN(Result);
END; {Lexico}

VAR
  F1, F2: TEXT;
  Result: CHAR;
BEGIN
  ASSIGN(F1, 'file1');
  ASSIGN(F2, 'file2');
  Lexico(F1, F2, Result);
  CLOSE(F1);
  CLOSE(F2);
END.
