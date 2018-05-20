{ Модуль очереди }
UNIT Queue;

INTERFACE
  PROCEDURE CreateQ(); { Создать очередь }
  PROCEDURE DeleteQ(); { Удалить очередь }
  PROCEDURE EmptyQ(); { Очистить очередь }
  PROCEDURE AddQ(VAR Elt: CHAR); { Добавить элемент в конец очереди }
  PROCEDURE DelQ(); { Удалить элемент из начала очереди }
  PROCEDURE HeadQ(VAR Elt: CHAR); { Получить первый элемент очереди }
  PROCEDURE WriteQ(); { Вывести очередь в OUTPUT }

IMPLEMENTATION
  VAR
    Q, Temp: TEXT;

  { копириует строку из F1 в F2 без RESET или REWRITE; таким образом F1 должен быть готов для чтения, а F2 для записи, но прошлые строки у этих файлов могут быть не пусты }
  PROCEDURE CopyOpen(VAR F1, F2: TEXT);
  VAR
    Ch: CHAR;
  BEGIN { CopyOpen }
    WHILE NOT EOLN(F1)
    DO
      BEGIN
        READ(F1, Ch);
        WRITE(F2, Ch);
      END;
  END; { CopyOpen }

  { Q := <,/,R> }
  PROCEDURE EmptyQ();
  BEGIN { EmptyQ }
    REWRITE(Q);
    WRITELN(Q);
  END; { EmptyQ }

  { Q := <,/,R> , Temp := <,/,R> }
  PROCEDURE CreateQ();
  BEGIN { CreateQ }
    ASSIGN(Q, 'Q.TMP');
    ASSIGN(Temp, 'TEMP.TMP');
    REWRITE(Q);
    REWRITE(Temp);
  END; { CreateQ }

  PROCEDURE DeleteQ();
  BEGIN { DeleteQ }
    CLOSE(Q);
    CLOSE(Temp);
    ERASE(Q);
    ERASE(Temp);
  END; { DeleteQ }

  { Q = <,x/,R>, где x строка И Elt = a --> Q = <,xa/,R> }
  PROCEDURE AddQ(VAR Elt: CHAR);
  BEGIN { AddQ }
    REWRITE(Temp);
    RESET(Q);
    CopyOpen(Q, Temp);
    WRITE(Temp, Elt);
    RESET(Temp);
    REWRITE(Q);
    CopyOpen(Temp, Q);
  END; { AddQ }

  { (Q = <,/,R> -->) | (Q = <,ax/,R>, где a символ и x строка  --> Q := <,x/,R> }
  PROCEDURE DelQ();
  VAR
    Ch: CHAR;
  BEGIN { DelQ }
    RESET(Q);
    { удаляем первый элемент из Q };
    IF NOT EOLN(Q)
    THEN
      READ(Q, Ch);
    IF NOT EOF(Q)
    THEN { не пустой }
      BEGIN
        REWRITE(Temp);
        CopyOpen(Q, Temp);
        WRITELN(Temp);
        { копируем Temp в Q }
        RESET(Temp);
        REWRITE(Q);
        CopyOpen(Temp, Q);
        WRITELN(Q);
      END;
  END; { DelQ }

  { (Q = <,/,R> --> Elt := '#') | (Q = <,ax/,R>, где a символ и x строка  --> Elt := 'a' }
  PROCEDURE HeadQ(VAR Elt: CHAR);
  BEGIN { HeadQ }
    RESET(Q);
    IF NOT EOLN(Q)
    THEN
      READ(Q, Elt)
    ELSE
      Elt := '#';
  END; { HeadQ }

  { (Q = <,x/,R> и OUTPUT = <y,,W>, где y и x строка  --> OUTPUT := <y&x/,,W> }
  PROCEDURE WriteQ();
  BEGIN { WriteQ }
    RESET(Q);
    CopyOpen(Q, OUTPUT);
    WRITELN(OUTPUT);
  END; { WriteQ }

BEGIN

END.
