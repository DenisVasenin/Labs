PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  FCrypt: TEXT;

PROCEDURE Initialize(VAR FCrypt: TEXT; VAR Code: Chiper);
{Присвоить Code шифр замены}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Initialize}
  { инициализация массива Code }
  FOR Ch1 := ' ' TO 'Z' DO
    Code[Ch1] := Ch1;
  { считывание шифра из файла }
  WHILE NOT EOF(FCrypt)
  DO
    BEGIN
      IF NOT EOLN(FCrypt)
      THEN
        BEGIN
          READ(FCrypt, Ch1);
          IF NOT EOLN(FCrypt)
          THEN
            BEGIN
              READ(FCrypt, Ch2);
              { заменить в Code буквы от A до Z, если они есть в файле с шифром }
              IF Ch2 IN [' ' .. 'Z']
              THEN
                Code[Ch2] := Ch1;
            END;
        END;
      READLN(FCrypt);
    END;
END;  {Initialize}

PROCEDURE Decode(VAR S: Str; VAR StrLen: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Decode}
  FOR Index := 1 TO StrLen
  DO
    IF (S[Index] IN [' ' .. 'Z'])
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN();
END;  {Decode}

BEGIN {Encryption}
  ASSIGN(FCrypt, 'CRPT');
  RESET(FCrypt);
  {Инициализировать Code}
  Initialize(FCrypt, Code);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
        END;
      READLN;
      {распечатать кодированное сообщение}
      Decode(Msg, I);
    END
END.  {Encryption}
