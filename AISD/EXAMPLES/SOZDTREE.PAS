Program SozdTree;  { ᮧ����� � ��室� ����୮�� ��ॢ� }
  uses crt;
  Type
    ukaz=^uzel;
    uzel=record
           key: integer;
           left,right: ukaz;
         end;
  Var
    kon,root: ukaz;
    k,l,n: integer;
    prizn: char;
  Procedure Sozd(t:ukaz);
    Begin
      if t<>nil then
        begin
          Write('������ ����� ���設� ');
          Readln(t^.key);
          Write('� ���設� ',t^.key,
                ' ������� ���� ��(�/�) ? ');
          Readln(prizn);
          if prizn='�' then t^.left:=nil
          else
            begin
              Writeln('���室�� � ������ ��� ���設� ',t^.key);
              New(kon);
              t^.left:=kon
            end;
          Sozd(t^.left);
          Write('� ���設� ',t^.key,
                ' ������� �ࠢ� ��(�/�) ? ');
          Readln(prizn);
          if prizn='�' then t^.right:=nil
          else
            begin
              Writeln('���室�� � �ࠢ��� ��� ���設� ',t^.key);
              New(kon);
              t^.right:=kon
            end;
          Sozd(t^.right)
        end
    End;
  Procedure PechPr(t:ukaz);
    Begin
      if t<>nil then
        Begin
          Writeln('���設� ',t^.key);
          PechPr(t^.left);
          PechPr(t^.right);
        end
    End;
  Procedure PechPo(t:ukaz);
    Begin
      if t<>nil then
        Begin
          PechPo(t^.left);
          PechPo(t^.right);
          Writeln('���設� ',t^.key);
        end
    End;
  Procedure PechIn(t:ukaz);
    Begin
      if t<>nil then
        Begin
          PechIn(t^.left);
          Writeln('���設� ',t^.key);
          PechIn(t^.right);
        end
    End;
  Begin
    Clrscr;
    New(root);
    Sozd(root);
    Writeln('��ॢ� ᮧ���� !');
    Readln;   { ��㧠 }
    PechPr(root);
    Writeln('����� � ���浪� ᢥ��� ���� ');
    Readln;
    PechPo(root);
    Writeln('����� � ���浪� ᭨�� ����� ');
    Readln;
    PechIn(root);
    Writeln('����� � ���浪� ᫥�� ���ࠢ� ');
    Readln
  End.
