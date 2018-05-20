// echo 'HI OUT THERE#' | ./2.3.1

PROGRAM Less(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WRITE(' Строка без пробелов до символа # выглядит так - ');
  WHILE Ch <> '#' 
  DO 
    BEGIN 
      IF Ch <> ' '
      THEN
        WRITE(Ch);
      READ(Ch);
    END;
  WRITELN;
END.

