program Heshir;
{ ���� � ����祭��� � ������� ��஢���� �������� ��஡�஢����� }
  Uses
    crt;
  Const
    p=13;       { ���⮥ �᫮ }
    raz=5;      { �᫮ ����⮪ ���᪠ }
  Type
    index=0..p;
    str=string[20];
    word=record
           key: integer;
           name: str;
           count: integer;    { �᫮ ����祭�� }
         end;
  Var
    t: array[0..p] of word; { ���ᨢ ��� ���⠭���� }
    k: integer;             { ���� ���᪠ }
    namer: str;
    ind, h: index;
    i, kolz: integer;       { �������⢮ ����ᥩ � ⠡��� }
    b: boolean;
  {========================================================================}
  { ���� � ����祭��� � ������� ��஢���� �������� ��஡�஢�����.  }
  {========================================================================}
  Procedure Seach(k:integer; var ind: index);
    Begin
      if kolz>=p
        then
          begin
            Writeln('������ ��९������ !');
            Exit;
          end;
      h:=k mod p;
      For i:=1 to raz do
        begin
          Writeln('����� ��। ��ࠡ�⪮� �����: ');
          Writeln('h=',h,' count=',t[h].count,' name= ',t[h].name);
          Writeln('�������⢮ ����ᥩ(kolz): ',kolz);
          if (k=t[h].key) or (t[h].count=0){ ��諨 ���⮥ ���� � ⠡��� }
            then
              begin
                t[h].count:=t[h].count+1;
                if t[h].count=1     { ������ ����� }
                  then
                    kolz:=kolz+1;
                t[h].name:=namer;
                t[h].key:=k;
                ind:=h;
                Exit
              end
            else
              h:=(h+i*i) mod p
        end;
      Writeln('�� ',raz,' ����⮪ �� ��諨 ����� � ���� � ⠡��� !');
    End;{===Seach===}
  {========================================================================}
  {                   �᭮���� �ணࠬ��.                                  }
  {========================================================================}
  Begin
    ClrScr;
    For i:=0 to p do
      begin
        t[i].count:=0;
        t[i].name:=('��������� !')
      end;
    kolz:=0;
    b:=true;
    While b do
      begin
        Write('������ ��।��� ���� ');
        Readln(k);
        if k<>0
          then
            begin
              Write('������ ��� ');
              Readln(namer);
              Seach(k,ind);
              Writeln
            end
          else
            b:=false
      end;
  End.
