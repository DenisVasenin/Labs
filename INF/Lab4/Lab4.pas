unit Lab4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  int1, int2 : integer;
  flt1 : real;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
// ��������� ��������� ����������� �� ����� ������� �� 0 �� 50 �������� � ����� 5 ��������
// � ����������� �� ����� ����������.
// F = 1,8 * C + 32
begin
  Memo1.Clear;
  int2 := 0;
  while (int1 <= 50) do
    begin
      flt1 := 1.8 * int1 + 32;
      Memo1.Lines[int2] := Memo1.Lines[int2] + 'C-' + IntToStr(int1) + '; F-' + FloatToStr(flt1) + '... ';
      int1 := int1 + 5;
      if (int1 mod 20 = 0) then
      begin
        Memo1.Lines.Add('');
        int2 := int2 + 1;
      end;
    end;
  int1 := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
// ��������� ������� ����� ������ ���� � �����, ������ 1000 ������. ������ ����� ������ ������
// ������������� �� 2% �� ��������� �����. ���������� ����� ������ ����� 3-9 �������.
begin
  Memo1.Clear;
  int2 := 0;
  flt1 := 1000;
  for int1 := 1 to 9 do
    begin
      flt1 := flt1 + (flt1 * 0.02);
      if (int1 > 2) then
        begin
          Memo1.Lines[int2] := Memo1.Lines[int2] + '���. - ' + IntToStr(int1) + ';  ���. - ' + FloatToStr(flt1);
          Memo1.Lines.Add('');
          int2 := int2 + 1;
        end;
    end;
  int1 := 0;
end;

end.
