UNIT NumbersUnit;

INTERFACE

FUNCTION ReadNumber(VAR FIn: TEXT): INTEGER;
FUNCTION SumNum(VAR Int1, Int2: REAL): BOOLEAN;
FUNCTION IsMin(VAR Int1, Int2: REAL): REAL;
FUNCTION IsMax(VAR Int1, Int2: REAL): REAL;

IMPLEMENTATION

TYPE
  NumberUnitStates = (Skip, Start, Accept, Error, Warning);
CONST
  MaximumInt = MAXINT;
VAR
  MaximumCount: INTEGER;

{ читает цифру из файла и возвращает её, либо -1 }
FUNCTION ReadDigit(VAR FIn: TEXT): INTEGER;
VAR
  Digit: CHAR;
  Result: INTEGER;
BEGIN { ReadDigit }
  Result := -1;
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      READ(FIn, Digit);
      IF Digit = '0' THEN Result := 0 ELSE
      IF Digit = '1' THEN Result := 1 ELSE
      IF Digit = '2' THEN Result := 2 ELSE
      IF Digit = '3' THEN Result := 3 ELSE
      IF Digit = '4' THEN Result := 4 ELSE
      IF Digit = '5' THEN Result := 5 ELSE
      IF Digit = '6' THEN Result := 6 ELSE
      IF Digit = '7' THEN Result := 7 ELSE
      IF Digit = '8' THEN Result := 8 ELSE
      IF Digit = '9' THEN Result := 9;
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

{ возвращает количество разрядов числа }
FUNCTION GetDigitCount(Num: INTEGER): INTEGER;
VAR
  Result: INTEGER;
BEGIN { GetDigitCount }
  Result := 0;
  WHILE (Num > 0)
  DO
    BEGIN
      Num := Num DIV 10;
      Result := Result + 1;
    END;
  GetDigitCount := Result;
END; { GetDigitCount }

{ поразрядное сравнение чисел }
PROCEDURE CompareNumbers(VAR NumDigit, MaxDigit: INTEGER; VAR CompareState: NumberUnitStates);
BEGIN { CheckState }
  IF (CompareState = Start) AND (NumDigit < MaxDigit)
  THEN
      CompareState := Accept
  ELSE
    IF (CompareState = Start) AND (NumDigit > MaxDigit)
    THEN
      CompareState := Warning;
END; { CheckState }

{ рекурсивная процедура для ReadNumber }
PROCEDURE GetNumber(VAR FIn: TEXT; VAR Result, DigitCount, MaxInt, MaxCount: INTEGER; VAR ReadNumberState: NumberUnitStates);
VAR
  NumDigit, MaxDigit: INTEGER;
BEGIN { GetNumber }
  IF NOT EOLN(FIn) AND (ReadNumberState <> Error)
  THEN
    BEGIN
      NumDigit := ReadDigit(FIn);
      IF (ReadNumberState = Skip) AND (NumDigit > 0)
      THEN
        ReadNumberState := Start;
      IF (ReadNumberState <> Skip)
      THEN
        BEGIN
          MaxCount := MaxCount - 1;
          IF (NumDigit < 0) OR (MaxCount < 0)
          THEN
            ReadNumberState := Error
          ELSE
            BEGIN
              MaxDigit := MaxInt DIV GetPow(MaxCount);
              MaxInt := MaxInt - (MaxDigit * GetPow(MaxCount));
              CompareNumbers(NumDigit, MaxDigit, ReadNumberState);
            END;
        END;
      GetNumber(FIn, Result, DigitCount, MaxInt, MaxCount, ReadNumberState);
      IF (ReadNumberState <> Error) AND (ReadNumberState <> Skip)
      THEN
        BEGIN
          Result := Result + NumDigit * GetPow(DigitCount);
          DigitCount := DigitCount + 1;
        END;
    END;
END; { GetNumber }

{ читает целое положительное число из файла и возвращает его, либо -1, если число некорректно;
  число должно находиться в отдельной строке, не содержащей нецифровых символов }
FUNCTION ReadNumber(VAR FIn: TEXT): INTEGER;
VAR
  ReadNumberState: NumberUnitStates;
  Result, DigitCount, MaxInt, MaxCount: INTEGER;
BEGIN { ReadNumber }
  ReadNumberState := Skip;
  MaxInt := MaximumInt;
  MaxCount := MaximumCount;
  Result := 0;
  DigitCount := 0;
  IF NOT EOLN(FIn)
  THEN
    GetNumber(FIn, Result, DigitCount, MaxInt, MaxCount, ReadNumberState)
  ELSE
    ReadNumberState := Error;
  IF (ReadNumberState = Error) OR ((DigitCount = MaximumCount) AND (ReadNumberState = Warning))
  THEN
    ReadNumber := -1
  ELSE
    ReadNumber := Result;
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
  MaximumCount := GetDigitCount(MaximumInt);
END.
