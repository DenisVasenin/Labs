Program TreeStek;
{ ࠡ�� � ��ॢ��: 1) ᮧ����� ᢥ��� ����(४����)    }
{                   2) ����� ᢥ��� ���� � � �⥪�� }
{                   3) ����� ᭨�� ����� � � �⥪�� }
  Uses Crt;
  type
    ukaz=^usel;
    usel=record
           key: integer;
           left,right: ukaz
         end;
  var
    root,kon: ukaz;
    k,l,n: integer;
    ch: char;
  Procedure SozdPr(t:ukaz; n:integer);
    Begin
      if t<>nil then
        begin
          Write(' ������ ����� ������ �뭠 ���設� ',n,' ');
          Readln(k);
          if k=0 then t^.left:=nil
          else
            begin
              New(kon);
              kon^.key:=k;
              t^.left:=kon
            end;
          SozdPr(t^.left,k);
          Write(' ������ ����� �ࠢ��� �뭠 ���設� ',n,' ');
          Readln(l);
          if l=0 then t^.right:=nil
          else
            begin
              New(kon);
              kon^.key:=l;
              t^.right:=kon
            end;
          SozdPr(t^.right,l)
        end
      End;
      Procedure PechPrSt(t:ukaz);
        Type
          point=^stek;
          stek=record
                 ver:  ukaz;
                 next: point;
                 ns:   integer  { ���.�뭠,�� ���.��諨 ���� }
               end;
        Var
          top,kon: point;
          k:ukaz;
        Procedure Dob(p:ukaz);
          Begin
            New(kon);
            kon^.ver:=p;
            kon^.next:=top;
            kon^.ns:=0;
            top:=kon;
          End;
        Procedure Udal;
          Begin
            kon:=top;
            top:=top^.next;
            Dispose(kon);
          End;
        Begin     { ��砫� ��楤��� PechPrSt }
          top:=nil;
          k:=t;
          Dob(k); { ����ᥭ�� � �⥪ ���� }
          Writeln('���設� ',top^.ver^.key);
          While top<>nil do
            begin
              top^.ns:=top^.ns+1;
              case top^.ns of
                1: if  top^.ver^.left<>nil then
                     begin
                       Dob(top^.ver^.left);
                       Writeln('���設� ',top^.ver^.key);
                     end;
                2: if top^.ver^.right<>nil then
                     begin
                       Dob(top^.ver^.right);
                       Writeln('���設� ',top^.ver^.key);
                     end;
                3: Udal
              end;
            end;
      End;
      Procedure PechPoSt(t:ukaz);
        Type
          point=^stek;
          stek=record
                 ver:  ukaz;
                 next: point;
                 ns:   integer  { ���.�뭠,�� ���.��諨 ���� }
               end;
        Var
          top,kon: point;
          k:ukaz;
        Procedure Dob(p:ukaz);
          Begin
            New(kon);
            kon^.ver:=p;
            kon^.next:=top;
            kon^.ns:=0;
            top:=kon;
          End;
        Procedure Udal;
          Begin
            kon:=top;
            top:=top^.next;
            Dispose(kon);
          End;
        Begin     { ��砫� ��楤��� PechPoSt }
          top:=nil;
          k:=t;
          Dob(k); { ����ᥭ�� � �⥪ ���� }
          While top<>nil do
            begin
              top^.ns:=top^.ns+1;
              case top^.ns of
                1: if  top^.ver^.left<>nil then
                       Dob(top^.ver^.left);
                2: if top^.ver^.right<>nil then
                       Dob(top^.ver^.right);
                3: begin
                     Writeln('���設� ',top^.ver^.key);
                     Udal;
                   end;
              end;
            end;
      End;
      Procedure PechInSt(t:ukaz);
        Type
          point=^stek;
          stek=record
                 ver:  ukaz;
                 next: point;
                 ns:   integer  { ���.�뭠,�� ���.��諨 ���� }
               end;
        Var
          top,kon: point;
          k:ukaz;
        Procedure Dob(p:ukaz);
          Begin
            New(kon);
            kon^.ver:=p;
            kon^.next:=top;
            kon^.ns:=0;
            top:=kon;
          End;
        Procedure Udal;
          Begin
            kon:=top;
            top:=top^.next;
            Dispose(kon);
          End;
        Begin     { ��砫� ��楤��� PechInSt }
          top:=nil;
          k:=t;
          Dob(k); { ����ᥭ�� � �⥪ ���� }
          While top<>nil do
            begin
              top^.ns:=top^.ns+1;
              case top^.ns of
                1: if  top^.ver^.left<>nil then
                       Dob(top^.ver^.left);
                2: begin
                     Writeln('���設� ',top^.ver^.key);
                     if top^.ver^.right<>nil then
                       Dob(top^.ver^.right);
                   end;
                3: Udal;
              end;
            end;
      End;
      Begin     { ��砫� �᭮���� �ணࠬ�� }
        ClrScr;
        New(root);
        Write('������ ����� ��୥��� ���設� ');
        Readln(n);
        if n=0 then Exit;
        root^.key:=n;
        SozdPr(root,n);
        Writeln('���� �����祭 !');
        Readln;
        PechPrSt(root);  { ����� � ���浪� ᢥ���-���� }
        Writeln('����� ᢥ���-���� !');
        Readln;
        PechPoSt(root);  { ����� � ���浪� ᭨��-����� }
        Writeln('����� ᭨��-����� !');
        PechInSt(root);  { ����� � ���浪� ᫥��-���ࠢ� }
        Writeln('����� ᫥��-���ࠢ� !');
        Writeln('��� � �� !');
        Readln
      End.
