unit Lab6;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, Grids, ExtCtrls;

type
	TForm1 = class(TForm)
		Button1: TButton;
		Button2: TButton;
    SG1: TStringGrid;
		ED1: TEdit;
		LAB1: TLabel;
    SG2: TStringGrid;
		procedure Button1Click(Sender: TObject);
		procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ED1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure SG2DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);

	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	Form1: TForm1;
	int1, int2, int3, int4, mod1 : integer;
  doub : double;
  bool : boolean;
	strg : string;
	mass : array[0..9, 0..9] of integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
// Двумерный массив размерности 10х10 заполнить случайными числами на отрезке [-25;25].
// Определить среднее арифметическое элементов каждой строки.
// Результат представить в виде одномерного массива
// Вывести исходный массив и полученый на печать.
begin
  LAB1.Caption := '';
  ED1.Clear;
  for int1 := 0 to 9 do
  	begin
    	SG1.Rows[int1].Clear;
      SG2.Rows[int1].Clear;
    end;
  randomize;
	for int1 := 0 to 9 do
  	begin
  		for int2 := 0 to 9 do
				begin
					mass[int2, int1] := -25 + random(51);
					SG1.Cells[int2, int1] := IntToStr(mass[int2, int1]);
        	doub := doub + mass[int2, int1];
        end;
      doub := doub / 10;
			SG2.Cells[int1, 0] := FloatToStr(doub);
      doub := 0;
    end;
	int1 := 0; int2 := 0; int4 := 0; mod1 := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
// Двумерный массив размерности 10х10 заполнить случайными числами на отрезке [-25;25].
// Обнулить элементы массива, сумма индексов которых равна Н.
// Вывести исходный массив и полученный на печать.
begin
	int4 := 0;
	strg := ED1.Text;
	LAB1.Caption := '';
  ED1.Clear;
  for int1 := 0 to 9 do
  	begin
    	SG1.Rows[int1].Clear;
      SG2.Rows[int1].Clear;
    end;
	case mod1 of
	0:begin
		LAB1.Caption := 'Введите H и нажмите кнопку.';
		ED1.SetFocus;
		mod1 := 1;
	end;
	1:begin
  	int4 := 1;
		bool := TryStrToInt(strg, int3);
		if (bool = TRUE) then
			begin
      	LAB1.Caption := 'H = ' + IntToStr(int3) + '.';
				randomize;
				for int1 := 0 to 9 do
        	begin
        		for int2 := 0 to 9 do
							begin
              	mass[int2, int1] := -25 + random(51);
								SG1.Cells[int2, int1] := IntToStr(mass[int2, int1]);
							end;
          end;
        for int1 := 0 to 9 do
        	begin
        		for int2 := 0 to 9 do
							begin
              	if (int1 + int2 + 2 = int3) then
                	begin
                  	mass[int2, int1] := 0;
                  end;
								SG2.Cells[int2, int1] := IntToStr(mass[int2, int1]);
							end;
          end;
        int1 := 0; int2 := 0; mod1 := 0;
			end		else
			begin
				LAB1.Caption := 'Ошибка. Введите целое число.';
				mod1 := 0;
			end;
		end;
	end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
	LAB1.Caption := 'Описание заданий в хинтах кнопок.';
  int4 := 0;
end;

procedure TForm1.ED1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if (Key = 13) then Button2Click(Sender);
end;

procedure TForm1.SG1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
	if (ACol + ARow) = 0 then
  	begin
    	SG1.Canvas.Brush.Color := clWhite;
      SG1.Canvas.Font.Color := clBlack;
      SG1.Canvas.FillRect(Rect);
      SG1.Canvas.TextOut(Rect.Left, Rect.Top+2, SG1.Cells[ACol, ARow]);
    end;
  if (int4 = 0) then
  	begin
			SG1.Canvas.Brush.Color := clWhite;
      SG1.Canvas.FillRect(Rect);
      SG1.Canvas.TextOut(Rect.Left, Rect.Top+2, SG1.Cells[ACol, ARow]);
    end;
  if ((ACol + ARow + 2) = int3) and (int4 = 1) then
  	begin
    	SG1.Canvas.Brush.Color := clYellow;
      SG1.Canvas.FillRect(Rect);
      SG1.Canvas.TextOut(Rect.Left, Rect.Top+2, SG1.Cells[ACol, ARow]);
    end;
end;

procedure TForm1.SG2DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
	if (ACol + ARow) = 0 then
  	begin
      SG2.Canvas.Brush.Color := clWhite;
      SG2.Canvas.Font.Color := clBlack;
      SG2.Canvas.FillRect(Rect);
      SG2.Canvas.TextOut(Rect.Left, Rect.Top+2, SG2.Cells[ACol, ARow]);
    end;
  if (int4 = 0) then
  	begin
      SG2.Canvas.Brush.Color := clWhite;
      SG2.Canvas.FillRect(Rect);
      SG2.Canvas.TextOut(Rect.Left, Rect.Top+2, SG2.Cells[ACol, ARow]);
    end;
  if ((ACol + ARow + 2) = int3) and (int4 = 1) then
  	begin
      SG2.Canvas.Brush.Color := clYellow;
      SG2.Canvas.FillRect(Rect);
      SG2.Canvas.TextOut(Rect.Left, Rect.Top+2, SG2.Cells[ACol, ARow]);
    end;
end;

end.

