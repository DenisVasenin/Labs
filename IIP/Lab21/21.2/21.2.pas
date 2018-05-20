PROGRAM SortDate(INPUT, OUTPUT);
USES
  Functions;
VAR
  D: Date;
  DateFile: FileOfDate;
  FIn: TEXT;
BEGIN { SortDate }
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(FIn, 'FI.TXT');
  RESET(FIn);
  REWRITE(DateFile);
  { копируем из FIn в DateFile первую дату }
  D.Mo := NoMonth;
  WHILE NOT EOF(FIn) AND (D.Mo = NoMonth)
  DO
    ReadDate(FIn, D);
  IF (D.Mo <> NoMonth)
  THEN
    WRITE(DateFile, D);
  { читаем все оставшиеся даты и сортируем }
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      ReadDate(FIn, D);
      IF (D.Mo <> NoMonth)
      THEN
        Sort(DateFile, D);
    END;
  { выводим DateFile в OUTPUT }
  CopyOut(DateFile);
  CLOSE(FIn);
  CLOSE(DateFile);
  ERASE(DateFile);
END. { SortDate }
