PROGRAM InsertSort2(INPUT, OUTPUT);
TYPE
  NodePtr = ^Node;
  Node = RECORD
          Next: NodePtr;
          Key: CHAR;
         END;
VAR
  FirstPtr, NewPtr, Curr, Prev: NodePtr;

PROCEDURE Print(VAR FirstPtr: NodePtr);
BEGIN
  NewPtr := FirstPtr;
  WHILE NewPtr <> NIL
  DO
    BEGIN
      WRITE(OUTPUT, NewPtr^.Key);
      NewPtr := NewPtr^.Next
    END;
  WRITELN(OUTPUT);
END;

PROCEDURE Sort(VAR NewPtr, Prev, Curr: NodePtr);
VAR
  Found: BOOLEAN;
BEGIN
  Prev := NIL;
  Curr := FirstPtr;
  Found := FALSE;
  WHILE (Curr <> NIL) AND NOT Found
  DO
    IF NewPtr^.Key > Curr^.Key
    THEN
      BEGIN
        Prev := Curr;
        Curr := Curr^.Next;
      END
    ELSE
      Found := TRUE;
  NewPtr^.Next := Curr;
  IF Prev = NIL
  THEN
    FirstPtr := NewPtr
  ELSE
    Prev^.Next := NewPtr;
END;

BEGIN { InsertSort2 }
  FirstPtr := NIL;
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      NEW(NewPtr);
      READ(NewPtr^.Key);
      Sort(NewPtr, Prev, Curr);
    END;
  Print(FirstPtr);
END.  { InsertSort2 }
