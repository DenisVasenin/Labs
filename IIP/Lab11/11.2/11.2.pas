PROGRAM Last(INPUT, OUTPUT);
VAR
    Ch: CHAR;
BEGIN
    WHILE NOT EOLN(INPUT)
    DO
        BEGIN
            READ(Ch);
            IF EOLN(INPUT)
            THEN
                WRITELN(Ch);
        END;
END.