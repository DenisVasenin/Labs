PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  FCrypt: TEXT;
  Space: CHAR;

PROCEDURE Initialize(VAR FCrypt: TEXT; VAR Code: Chiper);
{Присвоить Code шифр замены}
VAR
  Ch: CHAR;
  Tmp: ARRAY [1 .. 3] OF CHAR;
  Counter: INTEGER;
BEGIN {Initialize}
  { инициализация массива Code }
  FOR Ch := 'A' TO 'Z' DO
    Code[Ch] := Ch;
  { считывание шифра из файла }
  WHILE NOT EOF(FCrypt)
  DO
    BEGIN
      IF NOT EOLN(FCrypt)
      THEN
        BEGIN
          READ(FCrypt, Tmp[1]);
          Tmp[3] := Tmp[1];
          FOR Counter := 2 TO 3
          DO
            IF NOT EOLN(FCrypt)
            THEN
              READ(FCrypt, Tmp[Counter]);
          { заменить в Code буквы от A до Z, если они есть в файле с шифром }
          IF (Tmp[1] >= 'A') AND (Tmp[1] <= 'Z')
          THEN
            Code[Tmp[1]] := Tmp[3]
          ELSE
            IF Tmp[1] = ' '
            THEN
              Space := Tmp[3];
        END;
      READLN(FCrypt);
    END;
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; VAR StrLen: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO StrLen
  DO
    IF (S[Index] IN ['A' .. 'Z'])
    THEN
      WRITE(Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE(Space)
      ELSE
        WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  ASSIGN(FCrypt, 'CRPT');
  RESET(FCrypt);
  Space := ' ';
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
      Encode(Msg, I);
    END
END.  {Encryption}
