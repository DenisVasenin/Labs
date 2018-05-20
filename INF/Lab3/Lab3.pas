unit Lab3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  strg, strg1 : string;
  bool : boolean;
  mod1, mod2, mod3, mod4, int1, int2 : integer;
  res1, res2, res3, num1, num2, num3, num4 : extended;
  
const
  pi = 3.14;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
// ���� ������ � ����� ��� �� ������ ����������. �������� ������ �� ���� ��� ����� ������� ���������?
// p = m / v
begin
  mod2 := 0; mod3 := 0; mod4 := 0;
  case mod1 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := '������� ����� ������� ����.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod1 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num1);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := '������� ����� ������� ����.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod1 := 2;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod1 := 0;
      end;
    end;
  2:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num2);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := '������� ����� ������� ����.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod1 := 3;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod1 := 0;
      end;
    end;
  3:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num3);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := '������� ����� ������� ����.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod1 := 4;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod1 := 0;
      end;
    end;
  4:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num4);
      if (bool = TRUE) then
      begin
        res1 := num1 / num2;
        res2 := num3 / num4;
        Memo1.Clear;
        Memo1.Lines.Add('');
        if (res1 = res2) then Memo1.Lines[1] := '��������� ��� ���������.'
        else
          if (res1 > res2) then Memo1.Lines[1] := '������ ���� ����� ������� ���������.'
          else Memo1.Lines[1] := '������ ���� ����� ������� ���������.';
        mod1 := 0;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod1 := 0;
      end;
    end;
  end; // case end
end;

procedure TForm1.Button2Click(Sender: TObject);
// ���� ��� ����� �����. ���� ����� �� �����, �� �������� ������ ������, ������ �������� �� ��������.
// ���� �����, �� �������� ��� ������.
begin
  mod1 := 0; mod3 := 0; mod4 := 0;
  case mod2 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := '������� ������ �����.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod2 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      bool := TryStrToInt(strg, int1);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := '������� ������ �����.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod2 := 2;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� ����� �����.';
        mod2 := 0;
      end;
    end;
  2:begin
      strg := Memo1.Lines[1];
      bool := TryStrToInt(strg, int2);
      if (bool = TRUE) then
      begin
        if (int1 = int2) then
        begin
          int1 := 0; int2 := 0;
          Memo1.Lines[0] := '������ ����� - ' + IntToStr(int1);
          Memo1.Lines[1] := '������ ����� - ' + IntToStr(int2);
        end
        else
          if (int1 > int2) then
          begin
            int2 := int1;
            Memo1.Lines[0] := '������ ����� - ' + IntToStr(int1);
            Memo1.Lines[1] := '������ ����� - ' + IntToStr(int2);
          end
          else
          begin
            int1 := int2;
            Memo1.Lines[0] := '������ ����� - ' + IntToStr(int1);
            Memo1.Lines[1] := '������ ����� - ' + IntToStr(int2);
          end;
        mod2 := 0;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� ����� �����.';
        mod2 := 0;
      end;
    end;  end; // case end
end;

procedure TForm1.Button3Click(Sender: TObject);
// ������ ������ �����, ������� ��������, ��� ������� ������� ��������������.
// ���������� ����� ������ ����� ������� �������.
// S�� = pi*r^2, S�� = A*A, S�� = A*B, S�� = sqrt(p*(p-A)(p-B)(p-C)), p = (A+B+C)/2
//
// ����� ����������� - ������ ����� ��� ������� ��������.
begin
  mod1 := 0; mod2 := 0; mod4 := 0;
  case mod3 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := '������� ������ �����.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod3 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num1);
      if (bool = TRUE) then
      begin
        res1 := pi * sqr(num1);
        Memo1.Clear;
        Memo1.Lines[0] := '������� ������� ��������.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod3 := 2;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod3 := 0;
      end;
    end;
  2:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num2);
      if (bool = TRUE) then
      begin
        res2 := sqr(num2);
        if (res1 = res2) then strg1 := '����� � ��������'
        else
          if (res1 < res2) then
          begin
            res1 := res2;
            strg1 := '��������';
          end
          else strg1 := '�����';
        Memo1.Clear;
        Memo1.Lines[0] := '������� ������ ������� ��������������.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod3 := 3;
      end
      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod3 := 0;
      end;
    end;
  3:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num1);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := '������� ������ ������� ��������������.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod3 := 4;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod3 := 0;
      end;
    end;
  4:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num2);
      if (bool = TRUE) then
      begin
        res3 := num1 * num2;
        if (res1 = res3) then
          if (res2 = res3) then strg1 := '������� ����� ���������';
        if (res3 > res1) then strg1 := '��������������';
        Memo1.Clear;
        Memo1.Lines.Add('');
        Memo1.Lines[1] := '���������� ������� � ' + strg1 + '.';
        mod3 := 0;
      end
      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod3 := 0;
      end;
    end;
  end; // case end
end;

procedure TForm1.Button4Click(Sender: TObject);
// �� ������ ���� ������� ��� �������� � ��������� ���������. 1984 ��� - ��� ����� (������ �����).
// ���� - �����, ������, �����, �����, �������, ����, ������, ����, ��������, ������, ������, ������.
// ����� ���� / 12 = ���������� �����
begin
  mod1 := 0; mod2 := 0; mod3 := 0;
  case mod4 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := '������� ���.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod4 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      bool := TryStrToInt(strg, int1);
      if (bool = TRUE) then
      begin
        int2 := int1 mod 12;
        Memo1.Lines[0] := '������� ���.';
        Memo1.Clear;
        Memo1.Lines.Add('');
        case int2 of
        0: Memo1.Lines[1] := '��� ��������.';
        1: Memo1.Lines[1] := '��� ������.';
        2: Memo1.Lines[1] := '��� ������.';
        3: Memo1.Lines[1] := '��� ������.';
        4: Memo1.Lines[1] := '��� �����.';
        5: Memo1.Lines[1] := '��� ������.';
        6: Memo1.Lines[1] := '��� �����.';
        7: Memo1.Lines[1] := '��� �����.';
        8: Memo1.Lines[1] := '��� �������.';
        9: Memo1.Lines[1] := '��� ����.';
        10: Memo1.Lines[1] := '��� ������.';
        11: Memo1.Lines[1] := '��� ����.';
        end;
        mod4 := 0;
      end      else
      begin
        Memo1.Lines[1] := '������. ������� �����.';
        mod4 := 0;
      end;
    end;
  end; // case end
end;

end.


