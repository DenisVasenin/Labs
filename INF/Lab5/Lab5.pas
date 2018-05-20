unit Lab5;

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
		procedure Button1Click(Sender: TObject);
		procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ED1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	Form1: TForm1;
	int1, int2, int3, mod1 : integer;
	strg : string;
	bool : boolean;
	mas : array[0..11] of integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
// Одномерный массив размерности 12 заполнить случайными числами на отрезке [-25;25].
// Найти сумму положительных элементов массива меньше 10.
begin
  LAB1.Caption := '';
  ED1.Clear;
  for int1 := 0 to 1 do
  	begin
    	SG1.Rows[int1].Clear;
    end;
  randomize;
	for int1 := 0 to 11 do
		begin
			mas[int1] := -25 + random(51);
			SG1.Cells[int1, 0] := IntToStr(mas[int1]);
		end;
	for int1 := 0 to 11 do
		begin
			if (mas[int1] > 0) and (mas[int1] < 10) then
				begin
        	SG1.Cells [int1, 1] := 'V';
					int2 := int2 + mas[int1];
				end;
		end;
	if (int2 > 0) then
  	begin
			LAB1.Caption := 'Сумма положительных элементов меньше 10 равна ' + IntToStr(int2) + '.';
    end
  else
  	begin
			LAB1.Caption := 'Нет подходящих элементов.';
    end;
	int1 := 0; int2 := 0; int3 := 0; mod1 := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
// Одномерный массив размерности 12 заполнить случайными числами на отрезке [-25;25].
// Определить, существует ли пара соседних элементов массива, сумма которых равна N.
begin
	strg := ED1.Text;
	LAB1.Caption := '';
  ED1.Clear;
  for int1 := 0 to 1 do
  	begin
    	SG1.Rows[int1].Clear;
    end;
	case mod1 of
	0:begin
		LAB1.Caption := 'Введите N и нажмите кнопку.';
		ED1.SetFocus;
		mod1 := 1;
	end;
	1:begin
		bool := TryStrToInt(strg, int3);
    LAB1.Caption := 'N = ' + IntToStr(int3) + '.';
		if (bool = TRUE) then
			begin
				randomize;
				for int1 := 0 to 11 do
					begin
						mas[int1] := -25 + random(51);
						SG1.Cells[int1, 0] := IntToStr(mas[int1]);
					end;
        for int1 := 1 to 11 do
					begin
						int2 := mas[int1] + mas[int1 - 1];
						if (int2 = int3) then
            	begin
              	SG1.Cells[int1, 1] := 'V';
                SG1.Cells[int1-1, 1] := 'V';
                mod1 := 0;
              end;
            int2 := 0;
          end;
          if (mod1 > 0) then LAB1.Caption := 'Подходящих пар не найдено.';
        int1 := 0; int2 := 0; int3 := 0; mod1 := 0;
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
end;

procedure TForm1.ED1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if (Key = 13) then Button2Click(Sender);
end;

end.

