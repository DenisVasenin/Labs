// echo '1' | ./6.1
// echo '2' | ./6.1
// echo '3' | ./6.1

{ Модифицируйте программу PaulRevere из задания 4.1.а, уменьшив количество условных операторов, используя логические операции.}

PROGRAM PaulRevere(INPUT, OUTPUT);
{ Печать соответствующего сообщения ,зависящего от величины на входе:  '...by land'  для 1;  '...by sea'  для 2; иначе печать ссобщения об ошибке }
VAR
  Lanterns: CHAR;
BEGIN { PaulRevere }
  { Read Lanterns }
  READ(Lanterns);
  { Issue Paul Revere's message }
  IF (Lanterns > '2') OR (Lanterns < '1')
  THEN
    WRITELN('The North Church shows only ''', Lanterns, '''.')
  ELSE
    BEGIN
      WRITE('The British are coming by ');
      IF Lanterns = '1'
      THEN
        WRITELN('land.')
      ELSE
        WRITELN('sea.')
    END;
END. { PaulRevere }
