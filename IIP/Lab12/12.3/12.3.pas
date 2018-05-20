// (V1 < V2 -> V1 := V2) | (V1 > V2 -> V2 := V1) | (V1 = V2 -> )

PROGRAM Prog(INPUT, OUTPUT);
VAR
  V1, V2: CHAR;
BEGIN
  READ(V1, V2);
  IF (V1 < V2)
  THEN
    V1 := V2
  ELSE
    IF (V1 > V2)
    THEN
      V2 := V1;
  WRITELN(V1, V2);
END.
