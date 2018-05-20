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
// Программа переводит температуру по шкале Цельсия от 0 до 50 градусов с шагом 5 градусов
// в температуру по шкале Фаренгейта.
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
// Гражданин первого марта открыл счет в банке, вложив 1000 рублей. Каждый месяц размер вклада
// увеличивается на 2% от имеющейся суммы. Определить сумму вклада через 3-9 месяцев.
begin
  Memo1.Clear;
  int2 := 0;
  flt1 := 1000;
  for int1 := 1 to 9 do
    begin
      flt1 := flt1 + (flt1 * 0.02);
      if (int1 > 2) then
        begin
          Memo1.Lines[int2] := Memo1.Lines[int2] + 'Мес. - ' + IntToStr(int1) + ';  Сум. - ' + FloatToStr(flt1);
          Memo1.Lines.Add('');
          int2 := int2 + 1;
        end;
    end;
  int1 := 0;
end;

end.
