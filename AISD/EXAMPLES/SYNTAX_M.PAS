Program Syntax;  { ������ ���������� ᪮���, �⥪ - ���ᨢ�� }
  Var
     stek:array [1..80] of char;
     top,kon: integer;
     vir: string[80];  { ��室��� ��ࠦ���� }
     i,n: integer;
     ch,b,pr: char;
  Procedure Dob(a:char);
    { ���������� � �⥪; a-������塞� ᨬ��� }
    Begin
      top:=top+1;
      stek[top]:=a
    End;
  Procedure Udal(a:char; var pr:char);
    { �᪫�祭�� �� �⥪�; pr='e'-�ਧ��� �訡�� }
    Begin
      pr:='o';
      if top=0 then pr:='e'
      else
        case a of
          ')': if stek[top]<>'(' then pr:='e';
          ']': if stek[top]<>'[' then pr:='e';
          '}': if stek[top]<>'{' then pr:='e';
        end;
      if pr<>'e' then top:=top-1;
      { 㤠����� ������� �� ���設� }
    End;
  Begin    { ��砫� �᭮���� �ணࠬ�� }
    Writeln('������ ��ࠦ����');
    Readln(vir);
    top:=0;
    n:=length(vir);   { ����� ��ࠦ���� }
    For i:=1 to n  do
      begin
        ch:=vir[i];    { ��।��� ᨬ��� }
        case ch of
          '(','[','{':   Dob(ch);
    { ���������� � �⥪ ���뢠�饩 ᪮��� }
           ')',']','}':
             begin
               Udal(ch,pr);
    { �஢�ઠ ���設� �⥪�; 㤠�����, �᫨ ��� �訡�� }
               if pr='e' then
                 begin
                   Writeln('�訡�� � ����樨 ',i);
                   Readln;    { ��㧠 }
                   Exit       { ��室 �� �ணࠬ��}
                 end
             end
        end
      end;
    if top<>0 then
      (* � ���� �� ���⮩ �⥪ *)
      Writeln('��� ��᫥���� ����뢠��� ᪮���')
    else
      Writeln('�� � ���浪� !!!');
    Readln    { ������⥫쭠� ��㧠 }
  End.
