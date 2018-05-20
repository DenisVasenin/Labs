// echo '5' | ./2.2.2
// echo 'A5' | ./2.2.2

PROGRAM What(INPUT, OUTPUT);
VAR 
  Ch: CHAR;
BEGIN 
  WRITE('Ведите символ: ');
  READ(Ch); 
  IF '0' <= Ch 
  THEN 
    IF Ch <= '9' 
    THEN 
      WRITELN(Ch, ' - символ цифра')
    ELSE 
      WRITELN(Ch, ' - символ не цифра')
  ELSE 
    WRITELN(Ch, ' - символ не цифра');
END.