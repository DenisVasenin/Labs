Program Index;
{ �������� ������ ��� �����஢������ 䠩�� � ���� }
  uses crt;
  Type
    zap=record
          name: string
        end;
    ind=record
          name: string;
          nom: integer
        end;
  Var
    i,m,n,low,high,mid: integer;
    key,namer: string;
    b: boolean;
    zapr: zap;
    indr: ind;
    fzap: file of zap;
    find: file of ind;
    ish:  text;
  Procedure Vvod;
    Begin
      Reset(ish);
      Rewrite(fzap);
      While not eof(ish) do
        begin
          ReadLn(ish,namer);
          zapr.name:=namer;
          Write(fzap,zapr)
        end;
      Close(ish);
      Close(fzap);
    End;
  Procedure SozdInd(var n: integer);
    Begin
      i:=5; m:=0; { ����� ����� � fzap }
      n:=0;       { ����� ����� � find}
      Rewrite(find);
      Reset(fzap);
      While not eof(fzap) do
        begin
          i:=i-1; 
          Read(fzap,zapr);
          if i=0 then
            begin
              indr.name:=zapr.name;
              indr.nom:=m;
              n:=n+1;   { ���稪 �᫠ ����ᥩ � �����᭮� 䠩�� }
              Write(find,indr);
              i:=5
            end;
          m:=m+1
        end;
      Close(find);
      Close(fzap)
    End;
  Procedure Poisk(key: string;  var m: integer);
    { key-���祢�� ��� ��� ���᪠, n-�᫮ ����ᥩ � �����᭮� 䠩�� }
    { m-����� ��������� ����� � ��室��� 䠩��, m=-1 - �� �������  }
    Begin
      Reset(fzap);
      Reset(find);
      low:=0;
      high:=n-1;
      While low<=high do  { ������ ���� ������ }
        begin
          mid:=(low+high) div 2;
          Seek(find,mid);
          Read(find,indr);
          if key=indr.name then
            begin
              low:=mid+1;
              high:=mid
            end
          else if key<indr.name then high:=mid-1
               else low:=mid+1
        end;
      m:=high;
      { ����� low>high }
      { MAX ����� ����� � ������, ��� ���ன name<=key }
      { �᫨ ⠪�� ����� ���, � m=-1 }
      if m >= 0 then
        begin
          Seek(find,m);
          Read(find,indr);
          m:=indr.nom;
        end
      else m:=0;
      Seek(fzap,m);
      Read(fzap,zapr);
      While not eof(fzap) and (zapr.name<key) do
        begin
          Read(fzap,zapr);
          m:=m+1
        end;
      if zapr.name<>key then m:=-1;  { ��� �� ������� }
      Close(fzap);
      Close(find)
    End;
  Begin    { ��砫� �᭮���� �ணࠬ�� }
    Clrscr;
    Writeln;
    Write('������ ��� ��室���� 䠩�� ');
    Readln(namer);
    Assign(ish,namer);
    Assign(fzap,'a');
    Assign(find,'b');
    Vvod;
    SozdInd(n);
    b:=true;
    While b do
      begin
        Write('������ 䠬���� ��� ���᪠ (�ਧ��� ���� - �) ');
        Readln(namer);
        if namer<>'�' then
          begin
            Poisk(namer,m);
            Writeln('m=',m)
          end
        else b:=false
      end;
    Erase(find);
    Erase(fzap)
  End.
