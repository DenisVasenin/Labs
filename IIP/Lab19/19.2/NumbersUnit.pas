UNIT NumbersUnit;

INTERFACE

FUNCTION ReadNumber(VAR FIn: TEXT): INTEGER;
FUNCTION SumNum(VAR Int1, Int2: REAL): BOOLEAN;
FUNCTION IsMin(VAR Int1, Int2: REAL): REAL;
FUNCTION IsMax(VAR Int1, Int2: REAL): REAL;

IMPLEMENTATION

VAR
  MaximumInt = MAXINT;

{ читает цифру из файла и возвращает её, либо -1 }
FUNCTION ReadDigit(VAR FIn: TEXT; VAR Digit: INTEGER): BOOLEAN;
VAR
  Ch: CHAR;
  Result: BOOLEAN;
BEGIN { ReadDigit }
  Result := FALSE;
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      Result := TRUE;
      READ(FIn, Ch);
      IF Ch = '0' THEN Digit := 0 ELSE
      IF Ch = '1' THEN Digit := 1 ELSE
      IF Ch = '2' THEN Digit := 2 ELSE
      IF Ch = '3' THEN Digit := 3 ELSE
      IF Ch = '4' THEN Digit := 4 ELSE
      IF Ch = '5' THEN Digit := 5 ELSE
      IF Ch = '6' THEN Digit := 6 ELSE
      IF Ch = '7' THEN Digit := 7 ELSE
      IF Ch = '8' THEN Digit := 8 ELSE
      IF Ch = '9' THEN Digit := 9
      ELSE
        Result := FALSE;
    END;
  ReadDigit := Result;
END;  { ReadDigit }

{ возвращает 10^Deg }
FUNCTION GetPow(Deg: INTEGER): INTEGER;
VAR
  Result: INTEGER;
BEGIN { GetPow }
  Result := 1;
  WHILE (Deg > 0)
  DO
    BEGIN
      Result := Result * 10;
      Deg := Deg - 1;
    END;
  GetPow := Result;
END; { GetPow }

{ читает целое положительное число из файла и возвращает его, либо -1, если число некорректно;
  число должно находиться в отдельной строке, не содержащей нецифровых символов }
FUNCTION ReadNumber(VAR FIn: TEXT): INTEGER;
VAR
  State: (A, E);
  Num, Digit, DigitCount: INTEGER;
BEGIN { ReadNumber }
  State := A;
  Num := 0;
  DigitCount := 0;
  IF NOT EOLN(FIn)
  THEN
    WHILE NOT EOLN(FIn)
    DO
      BEGIN
        IF ReadDigit(FIn, Digit)
        THEN
          BEGIN
            IF (MaximumInt - Digit) >= Num
            THEN
              Num := Num + Digit;
            DigitCount := DigitCount + 1;
          END;
      END
  ELSE
    State := E;
END; { ReadNumber }

{ сравнить первый аргумент со вторым и вернуть наименьший }
FUNCTION IsMin(VAR Int1, Int2: REAL): REAL;
BEGIN { IsMin }
  IF (Int1 < Int2)
  THEN
    IsMin := Int1
  ELSE
    IsMin := Int2;
END; { IsMin }

{ сравнить первый аргумент со вторым и вернуть наибольший }
FUNCTION IsMax(VAR Int1, Int2: REAL): REAL;
BEGIN { IsMax }
  IF (Int1 < Int2)
  THEN
    IsMax := Int2
  ELSE
    IsMax := Int1;
END; { IsMax }

{ сложить два аргумента и присвоить их сумму первому; при переполнении вернуть FALSE }
FUNCTION SumNum(VAR Int1, Int2: REAL): BOOLEAN;
BEGIN { SumNum }
  IF ((MaximumInt - Int1) < Int2)
  THEN
    SumNum := FALSE
  ELSE
    BEGIN
      Int1 := Int1 + Int2;
      SumNum := TRUE;
    END;
END; { SumNum }

BEGIN
END.
