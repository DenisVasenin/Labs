{ Сортирует символы из INPUT }
PROGRAM InsertionSort(INPUT, OUTPUT);
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  Range = 0 .. Max;
  Rec = RECORD
          Key: CHAR;
          Next: Range;
        END;
  RecArray = ARRAY [1 .. Max] OF Rec;
VAR
  Arr: RecArray;
  First: Range;
  Index: INTEGER;
  Extra: CHAR;

{ Печать списка начиная с Arr[First] }
PROCEDURE Print(VAR Arr: RecArray; VAR First: Range);
VAR
  Index: Range;
BEGIN
  Index := First;
  WHILE Index <> ListEnd
  DO
    BEGIN
      WRITE(OUTPUT, Arr[Index].Key);
      Index := Arr[Index].Next;
    END;
  WRITELN(OUTPUT);
END;

{ сортировка вставками }
PROCEDURE Sort(VAR Arr: RecArray; VAR First: Range);
VAR
  Prev, Curr: Range;
  Found: BOOLEAN;
BEGIN
  Prev := 0;
  Curr := First;
  Found := FALSE;
  WHILE (Curr <> 0) AND NOT Found
  DO
    IF Arr[Index].Key > Arr[Curr].Key
    THEN
      BEGIN
        Prev := Curr;
        Curr := Arr[Curr].Next;
      END
    ELSE
      Found := TRUE;
  Arr[Index].Next := Curr;
  IF Prev = 0
  THEN
    First := Index
  ELSE
    Arr[Prev].Next := Index;
END;

BEGIN { InsertionSort }
  First := 0;
  Index := 0;
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      Index := Index + 1;
      IF Index > Max
      THEN
        BEGIN
          READ(Extra);
          WRITELN(OUTPUT, 'Сообщение содержит: ', Extra, '. Игнорируем.');
        END
      ELSE
        BEGIN
          READ(Arr[Index].Key);
          Sort(Arr, First);
        END;
    END;
    { Печать списка начиная с Arr[First] }
    Print(Arr, First);
END. { InsertionSort }
