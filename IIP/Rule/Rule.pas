{
SR1. <адрес> ::= <список идентификаторов>@<список идентификаторов>
SR2. <список идентификаторов> ::= <идентификатор> | <идентификатор>.<список идентификаторов>
SR3. <идентификатор> ::= <буква> | <цифра> | <цифра><идентификатор> | <буква><идентификатор> 
SR4. <буква> := A | B | C | D | E | F | G | H | I | J | K | L | M 
                | N | O | P | Q | R | S | T | U | V | W | X | Y | Z 
                | a | b | c | d | e | f | g | h | i | j | k | l | m 
                | n | o | p | q | r | s | t | u | v | w | x | y | z
SR5. <цифра > := 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
}

PROGRAM Rule(INPUT, OUTPUT); 
VAR
  Symbol, LastSymbol, MainTrigger, SepTrigger, DogTrigger, BeginTrigger: CHAR; 
BEGIN {Rule}
  WHILE NOT EOF
  DO
    BEGIN
      MainTrigger := '0'; 
      SepTrigger := '0'; 
      DogTrigger := '0'; 
      BeginTrigger := '0'; 
      WHILE NOT EOLN
      DO
        BEGIN
          READ(INPUT, Symbol); 
          LastSymbol := Symbol; 
          WRITE(OUTPUT, Symbol); 
          {СОБАК НЕ ДОЛЖНО БЫТЬ БОЛЬШЕ ОДНОЙ}
          IF Symbol = '@'
          THEN
            BEGIN
              IF DogTrigger = '1'
              THEN
                MainTrigger := '1'; 
              DogTrigger := '1'; 
            END; 
          {ПОСЛЕДОВАТЕЛЬНОСТИ РАЗДЕЛИТЕЛЕЙ НЕДОПУСТИМЫ}
          IF (Symbol = '@') OR (Symbol = '.')
          THEN
            BEGIN
              {ПЕРВЫЙ СИМВОЛ НЕ ДОЛЖЕН БЫТЬ РАЗДЕЛИТЕЛЕМ}
              IF (BeginTrigger = '0')
              THEN
                MainTrigger := '1';
              IF SepTrigger = '1'
              THEN
                MainTrigger := '1'; 
              SepTrigger := '1'; 
            END
          ELSE
            {НЕ ДОЛЖНО БЫТЬ ПОСТОРОННИХ СИМВОЛОВ}
            IF NOT (((Symbol >= 'A') AND (Symbol <= 'Z')) OR ((Symbol >= 'a') AND (Symbol <= 'z')) OR ((Symbol >= '0') AND (Symbol <= '9')))
            THEN
              MainTrigger := '1'
            ELSE
              SepTrigger := '0'; 
          BeginTrigger := '1';
        END; 
      READLN; 
      {ПОСЛЕДНИЙ СИМВОЛ НЕ ДОЛЖЕН БЫТЬ РАЗДЕЛИТЕЛЕМ}
      IF (LastSymbol = '@') OR (LastSymbol = '.')
      THEN
        MainTrigger := '1'; 
      {СОБАК НЕ ДОЛЖНО БЫТЬ МЕНЬШЕ ОДНОЙ}
      IF DogTrigger < '1'
      THEN
        MainTrigger := '1'; 
      IF MainTrigger = '1'
      THEN
        WRITELN('     NO')
      ELSE
        WRITELN('     YES'); 
    END; 
END. {Rule}
