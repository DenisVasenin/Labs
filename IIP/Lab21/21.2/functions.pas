UNIT Functions;

INTERFACE

TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1 .. 31;
  Date =  RECORD
            Mo: Month;
            Day: DayNum;
          END;
  FileOfDate = FILE OF Date;

PROCEDURE ReadDate (VAR FIn: TEXT; VAR D: Date);
PROCEDURE CopyFile(VAR FIn, FOut: FileOfDate);
PROCEDURE Sort(VAR F1: FileOfDate; VAR D1: Date);
PROCEDURE CopyOut(VAR FIn: FileOfDate);

IMPLEMENTATION

{ прочитать месяц из файла }
PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN { ReadMonth }
  READ(FIn, Ch1, Ch2, Ch3);
  IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
  IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
  IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
  IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
  IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
  IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
    ELSE Mo := NoMonth;
END; { ReadMonth }

{ вывести месяц в файл }
PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
BEGIN { WriteMonth }
  IF Mo = Jan THEN WRITE('JAN') ELSE
  IF Mo = Feb THEN WRITE('FEB') ELSE
  IF Mo = Mar THEN WRITE('MAR') ELSE
  IF Mo = Apr THEN WRITE('APR') ELSE
  IF Mo = May THEN WRITE('MAY') ELSE
  IF Mo = Jun THEN WRITE('JUN') ELSE
  IF Mo = Jul THEN WRITE('JUL') ELSE
  IF Mo = Aug THEN WRITE('AUG') ELSE
  IF Mo = Sep THEN WRITE('SEP') ELSE
  IF Mo = Oct THEN WRITE('OCT') ELSE
  IF Mo = Nov THEN WRITE('NOV') ELSE
  IF Mo = Dec THEN WRITE('DEC')
    ELSE WRITE('NoMonth');
END; { WriteMonth }

{ вывести дату в файл }
PROCEDURE WriteDate(VAR FOut: TEXT; VAR D: Date);
BEGIN { WriteDate }
  WriteMonth(FOut, D.Mo);
  WRITE(FOut, D.Day:3);
END; { WriteDate }

{ прочитать дату из файла }
PROCEDURE ReadDate (VAR FIn: TEXT; VAR D: Date);
BEGIN { ReadDate }
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      ReadMonth(FIn, D.Mo);
      READ(FIn, D.Day);
    END
  ELSE
    D.Mo := NoMonth;
  READLN(FIn);
END; { ReadDate }

{ копировать один файл в другой }
PROCEDURE CopyFile(VAR FIn, FOut: FileOfDate);
VAR
  D: Date;
BEGIN { CopyFile }
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      READ(FIn, D);
      WRITE(FOut, D);
    END;
END; { CopyFile }

{ переписать один FileOfDate в другой с сортировкой }
PROCEDURE Sort(VAR F1: FileOfDate; VAR D1: Date);
VAR
  Copying: BOOLEAN;
  D2: Date;
  F2: FileOfDate;
BEGIN { Sort }
  ASSIGN(F2, 'TF.DAT');
  RESET(F1);
  REWRITE(F2);
  Copying := TRUE;
  WHILE NOT EOF(F1) AND Copying
  DO
    BEGIN
      READ(F1, D2);
      IF (D1.Mo > D2.Mo) OR ((D1.Mo = D2.Mo) AND (D1.Day >= D2.Day))
      THEN
        WRITE(F2, D2)
      ELSE
        Copying := FALSE;
    END;
  IF Copying
  THEN
    WRITE(F2, D1)
  ELSE
    WRITE(F2, D1, D2);
  CopyFile(F1, F2);
  RESET(F2);
  REWRITE(F1);
  CopyFile(F2, F1);
  CLOSE(F2);
  ERASE(F2);
END; { Sort }

{ вывести FIn в OUTPUT }
PROCEDURE CopyOut(VAR FIn: FileOfDate);
VAR
  D: Date;
BEGIN { CopyOut }
  RESET(FIn);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      READ(FIn, D);
      WriteDate(OUTPUT, D);
      WRITELN(OUTPUT);
    END;
END; { CopyOut }

BEGIN
END.
