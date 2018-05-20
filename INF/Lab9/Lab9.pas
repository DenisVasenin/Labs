unit Lab9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, MatFun;

type
  TForm1 = class(TForm)
    SG1: TStringGrid;
    Button1: TButton;
    MEM1: TMemo;
    BB1: TBitBtn;
    procedure FormCreate(Sender: TObject);
		procedure Button1Click(Sender: TObject);
	private
    { Private declarations }
	public
    { Public declarations }
  end;

var
	Form1: TForm1;
	X, h: extended;
	Count1: integer;
const
	Xn: extended = 0.1;
	Xk: extended = 0.5;

implementation

{$R *.dfm}

// Вывести на экран таблицу значений функции Y(x) и её разложения в ряд S(x) для x изменяющихся от xn до xk
// с шагом h=(xn-xk)/10. Близость значений S(x) и Y(x) во всем диапазоне значений x указывает на
// правильность вычисления S(x) и Y(x).
//
// S(x) = x - (x^3 / 3) + ... + (-1)^n * (x^(2n+1) / (2n+1))
// где n=15 ; xn=0,1 ; xk=0.5 ; h=|(xn-xk)|/10
// Y(x) = arctg x

procedure TForm1.FormCreate(Sender: TObject);
begin
	with SG1 do
		begin
			Cells[0, 0] := 'X';
			Cells[1, 0] := 'S(X)';
			Cells[2, 0] := 'Y(X)';
		end;
	h := Abs(Xn - Xk) / 10;
	X := Xn;
	Count1 := 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
	while (X < Xk) do
		begin
			SG1.Cells[0, Count1] := FloatToStr(X);
			SG1.Cells[1, Count1] := FloatToStrF(SRange(X), ffFixed, 8, 6);
			SG1.Cells[2, Count1] := FloatToStrF(Arctg(X), ffFixed, 8, 6);
			X := X + h;
			Count1 := Count1 + 1;
		end;
end;

end.
 