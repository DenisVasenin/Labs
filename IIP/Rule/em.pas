PROGRAM Email;
VAR
  Ch, State: CHAR;
  // State: B, N (name), H (host), @, 1 (dot name), 2 (dot host), E (error)
BEGIN
  WHILE NOT EOF
  DO
    BEGIN
      State := 'B';
      WHILE NOT EOLN AND (State <> 'E')
      DO
        BEGIN
          READ(Ch);
          IF (Ch >= 'A') AND (Ch <= 'Z') OR (Ch >= 'a') AND (Ch <= 'z') OR (Ch >= '0') AND (Ch <= '9')
          THEN
            IF (State = 'B') OR (State = '1') OR (State = 'N')
            THEN
              State := 'N'
            ELSE
              State := 'H'
          ELSE
            IF (Ch = '@') AND (State = 'N')
            THEN
              State := '@'
            ELSE
              IF (Ch = '.') AND ((State = 'N') OR (State = 'H'))
              THEN
                IF State = 'N'
                THEN
                  State := '1'
                ELSE
                  State := '2'
              ELSE
                State := 'E'
        END;
      IF State = 'H'
      THEN
        WRITELN('yes')
      ELSE
        WRITELN('no');
        
      IF NOT EOF      {Next line}
      THEN
        READLN
    END
END.
