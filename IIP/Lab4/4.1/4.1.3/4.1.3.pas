// echo '1' | ./4.1.3
// echo '2' | ./4.1.3
// echo '3' | ./4.1.3

PROGRAM PaulRevere(INPUT, OUTPUT);
{ Печать соответствующего сообщения ,зависящего от величины на входе:  '...by land'  для 1;  '...by sea'  для 2; иначе печать ссобщения об ошибке }
VAR
  Lanterns: CHAR;
BEGIN { PaulRevere }
  { Read Lanterns }
  READ(Lanterns);
  { Issue Paul Revere's message }
  IF Lanterns = '1'
  THEN
  WRITELN('The British are coming by land.')
  ELSE
    IF Lanterns = '2'
    THEN
      WRITELN('The British are coming by sea.')
    ELSE
      IF Lanterns = '3'
      THEN
        WRITELN('British are coming by air.')
      ELSE
        WRITELN('The North Church shows only ''', Lanterns, '''.')
END. { PaulRevere }
