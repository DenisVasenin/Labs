PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  FCrypt: TEXT;
  Space: CHAR;
  CompareSet: SET OF CHAR;

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
            BEGIN
              Code[Tmp[1]] := Tmp[3];
              CompareSet := CompareSet + [Tmp[3]];
            END
          ELSE
            IF Tmp[1] = ' '
            THEN
              BEGIN
                Space := Tmp[3];
                CompareSet := CompareSet + [Tmp[3]];
              END;
        END;
      READLN(FCrypt);
    END;
END;  {Initialize}

PROCEDURE Decode(VAR S: Str; VAR StrLen: INTEGER);
{Выводит символы из Code, соответствующие символам из S}
VAR
  StrLetter: 1 .. Len;
  AlpLetter: 'A' .. 'Z';
BEGIN {Decode}
  FOR StrLetter := 1 TO StrLen
  DO
    IF S[StrLetter] IN CompareSet
    THEN
      IF S[StrLetter] = Space
      THEN
        WRITE(' ')
      ELSE
        BEGIN
          FOR AlpLetter := 'A' TO 'Z'
          DO
            IF S[StrLetter] = Code[AlpLetter]
            THEN
              BEGIN
                WRITE(AlpLetter);
                BREAK;
              END;
        END
    ELSE
      WRITE(S[StrLetter]);
  WRITELN();
END;  {Decode}

BEGIN {Encryption}
  ASSIGN(FCrypt, 'CRPT');
  RESET(FCrypt);
  Space := ' ';
  CompareSet := [];
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
