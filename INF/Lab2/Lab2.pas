unit Lab2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  strg : string;
  bool : boolean;
  mod1, mod2, mod3, mod4, mod5, int1, int2 : integer;
  res, num1, num2, num3 : extended;
  
const
  pi = 3.14;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
// Определить суммы двух первых и двух последних цифр целого четырехзначного числа.
begin
  mod1 := 0; mod2 := 0; mod3 := 0; mod5:= 0;
  case mod4 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := 'Введите целое четырехзначное число.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod4 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      if (length(strg) = 4) then
      begin
        bool := TryStrToInt(strg, int1);
        if (bool = TRUE) then
        begin
          int1 := StrToInt(strg[1]);
          int2 := StrToInt(strg[2]);
          Memo1.Lines[0] := 'Сумма первых двух = ' + IntToStr(int1 + int2);
          int1 := StrToInt(strg[3]);
          int2 := StrToInt(strg[4]);
          Memo1.Lines[1] := 'Сумма последних двух = ' + IntToStr(int1 + int2);
          mod4 := 0;
        end        else
        begin
          Memo1.Lines[1] := 'Ошибка. Введите число.';
          mod4 := 0;
        end;
      end
      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod4 := 0;
      end;
    end;
  end; // case end
end;

end.
