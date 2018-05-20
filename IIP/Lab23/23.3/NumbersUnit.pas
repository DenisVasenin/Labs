UNIT NumbersUnit;

INTERFACE

FUNCTION ReadNumber(VAR FIn: TEXT): INTEGER;

IMPLEMENTATION

TYPE
  States = (Start, Accept, Error, Warning);
VAR
  MaximumInt, MaximumCount: INTEGER;
  CompareState: States;

{ читает цифру из файла и возвращает её, либо -1 }
FUNCTION ReadDigit(VAR FIn: TEXT): INTEGER;
VAR
  Ch: CHAR;
  Result: INTEGER;
BEGIN { ReadDigit }
  Result := -1;
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      READ(FIn, Ch);
      IF (Ch >= '0') AND (Ch <= '9')
      THEN
        CASE Ch OF
          '0': Result := 0;
          '1': Result := 1;
          '2': Result := 2;
          '3': Result := 3;
          '4': Result := 4;
          '5': Result := 5;
          '6': Result := 6;
          '7': Result := 7;
          '8': Result := 8;
          '9': Result := 9;
        END;
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

{ поразрядное сравнение чисел для ReadNumber }
PROCEDURE CompareNumbers(VAR NumDigit, MaxDigit: INTEGER);
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
PROCEDURE GetNumber(VAR FIn: TEXT; VAR Result, DigitCount, MaxInt, MaxCount: INTEGER);
VAR
  NumDigit, MaxDigit: INTEGER;
BEGIN { GetNumber }
  IF NOT EOLN(FIn) AND (CompareState <> Error)
  THEN
    BEGIN
      NumDigit := ReadDigit(FIn);
      MaxCount := MaxCount - 1;
      IF (NumDigit < 0) OR (MaxCount < 0)
      THEN
        CompareState := Error
      ELSE
        BEGIN
          MaxDigit := MaxInt DIV GetPow(MaxCount);
          MaxInt := MaxInt - (MaxDigit * GetPow(MaxCount));
          CompareNumbers(NumDigit, MaxDigit);
        END;
      GetNumber(FIn, Result, DigitCount, MaxInt, MaxCount);
      IF (CompareState <> Error)
      THEN
        BEGIN
          Result := Result + NumDigit * GetPow(DigitCount);
          DigitCount := DigitCount + 1;
        END;
    END;
END; { GetNumber }

{ читает целое положительное число из файла и возвращает его, либо -1, если число больше максимально допустимого.
число должно находиться в отдельной строке, не содержащей нецифровых символов }
FUNCTION ReadNumber(VAR FIn: TEXT): INTEGER;
VAR
  Result, DigitCount, MaxInt, MaxCount: INTEGER;
BEGIN { ReadNumber }
  CompareState := Start;
  MaxInt := MaximumInt;
  MaxCount := MaximumCount;
  Result := 0;
  DigitCount := 0;
  IF NOT EOLN(FIn)
  THEN
    GetNumber(FIn, Result, DigitCount, MaxInt, MaxCount)
  ELSE
    CompareState := Error;
  IF (CompareState = Error) OR ((DigitCount = MaximumCount) AND (CompareState = Warning))
  THEN
    ReadNumber := -1
  ELSE
    ReadNumber := Result;
END; { ReadNumber }

BEGIN
  { инициализация глобальных переменных }
  MaximumInt := MAXINT;
  MaximumCount := GetDigitCount(MaximumInt);
END.
