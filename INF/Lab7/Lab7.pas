unit Lab7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    LB1: TListBox;
    BB1: TBitBtn;
    LAB1: TLabel;
    ED1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ED1Click(Sender: TObject);
    procedure ED1KeyPress(Sender: TObject; var Key: Char);
    procedure LB1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
	int1, int2 : integer;
	strng1, strng2 : string;
	char1 : char;

implementation

{$R *.dfm}

// Дана строка произвольного текста, слова разделены пробелами.
// Поменять местами первую и последнюю буквы каждого слова.

procedure TForm1.FormCreate(Sender: TObject);
begin
	ED1.Text := 'Введите текст сюда и нажмите Enter.';
	LAB1.Caption := 'Задание: Дана строка произвольного текста, слова разделены пробелами. Поменять местами первую и последнюю буквы каждого слова.';
end;

procedure TForm1.ED1Click(Sender: TObject);
begin
	ED1.Text := '';
end;

procedure TForm1.ED1KeyPress(Sender: TObject; var Key: Char);
begin
	if (Key = #13) then
		begin
			LB1.Items.Add(ED1.Text);
			ED1.Text := '';
		end;
end;

procedure TForm1.LB1Click(Sender: TObject);
begin
	strng1 := LB1.Items[LB1.ItemIndex] + ' ';
	LAB1.Caption := '';
	while Length(strng1) > 0 do
		begin
			int2 := Pos(' ', strng1);
			strng2 := Copy(strng1, 1, int2-1);
			Delete(strng1, 1, int2);
			int2 := Length(strng2);
			char1 := strng2[1];
			strng2[1] := strng2[int2];
			strng2[int2] := char1;
			LAB1.Caption := LAB1.Caption + strng2 + ' ';
		end;
end;

end.
