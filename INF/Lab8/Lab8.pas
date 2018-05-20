unit Lab8;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, Buttons, Grids;

type
	TForm1 = class(TForm)
		ED1: TEdit; ED2: TEdit; ED3: TEdit;
		LAB1: TLabel; LAB2: TLabel; LAB3: TLabel;
		Button1: TButton; Button2: TButton; Button3: TButton; Button4: TButton; Button5: TButton; BB1: TBitBtn;
		OD1: TOpenDialog; SD1: TSaveDialog;
		SG1: TStringGrid;
    ED4: TEdit;
    Label1: TLabel;
    Button6: TButton;
		procedure FormCreate(Sender: TObject);
		procedure Button5Click(Sender: TObject);
		procedure Button4Click(Sender: TObject);
		procedure Button1Click(Sender: TObject);
		procedure Button2Click(Sender: TObject);
		procedure Button3Click(Sender: TObject);
		//procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure BB1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

type
	TBook = record
		Naz: string;
		Avt: string;
		God: string;
	end;

var
	Form1 : TForm1;
	TFile : TextFile;
	Book : array[1..100] of TBook;
	Char1 : char;
	FName, SaveTitle, Message1, Message2, Message3, String1, String2, String3 : string;
	Trig1, Trig2, Count1, Count2, RCount1 : integer;

implementation

{$R *.dfm}

// Имеется список книг. Каждая запись списка содержит: фамилию автора, название книги, год издания.
// Вывести информацию о книгах, в названии которых встречается ключевое слово (ввести с клавиатуры).

procedure TForm1.FormCreate(Sender: TObject);
begin
	ED1.Focused;
	RCount1 := 0;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
	Trig1 := 0;
	if (Length(ED1.Text) = 0) then begin Trig1 := 1; Message1 := 'Введите название книги. '; end
	else Message1 := '';
	if (Length(ED2.Text) = 0) then begin Trig1 := 1; Message2 := 'Введите фамилию автора. '; end
	else Message2 := '';
	if (Length(ED3.Text) = 0) then begin Trig1 := 1; Message3 := 'Введите год издания. '; end
	else Message3 := '';
	if (Trig1 = 1) then
		begin
			SaveTitle := Application.Title;
			Application.Title := '';
			Message1 := Message1 + Message2 + Message3;
			ShowMessage(Message1);
			Application.Title := SaveTitle;
		end
	else
		begin
			RCount1 := RCount1 + 1;
			with Book[RCount1] do
				begin
					Naz := ED1.Text;
					Avt := ED2.Text;
					God := ED3.Text;
				end;
			if (SG1.Cells[0, 0] = '') then
				with Book[RCount1] do begin SG1.Cells[0, 0] := Naz + ' ' + Avt + ' ' + God; end
			else
				begin
					SG1.RowCount := SG1.RowCount + 1;
					with Book[RCount1] do begin SG1.Cells[0, SG1.RowCount - 1] := Naz + ' ' + Avt + ' ' + God; end;
				end;
			ED1.Text := ''; ED2.Text := ''; ED3.Text := '';
			ED1.SetFocus;
		end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
	for Count1 := 0 to SG1.RowCount - 1 do SG1.Rows[Count1].Clear;
	SG1.RowCount := 1;
	String1 := AnsiUpperCase(ED4.Text);
	for Count1 := 1 to RCount1 do
		begin
			String2 := AnsiUpperCase(Book[Count1].Naz);
			if (Pos(String1, String2) > 0) then
				begin
					if (SG1.Cells[0, 0] = '') then
						with Book[Count1] do begin SG1.Cells[0, 0] := Naz + ' ' + Avt + ' ' + God; end
					else
						begin
							SG1.RowCount := SG1.RowCount + 1;
							with Book[Count1] do begin SG1.Cells[0, SG1.RowCount - 1] := Naz + ' ' + Avt + ' ' + God; end;
						end;
				end;
		end;
	Button5.Hide;
	ED4.SetFocus;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
	if SD1.Execute then
		begin
			FName:= SD1.FileName;
			if (Length(Fname) > 0) then
				begin
					AssignFile(TFile, FName);
					Rewrite(TFile);
					for Count1 := 1 to RCount1 do
						begin
							WriteLn(TFile, Book[Count1].Naz, ';', Book[Count1].Avt, ';', Book[Count1].God , ';');
						end;
					CloseFile(TFile);
				end;
		end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
	if OD1.Execute then
		begin
			FName := OD1.FileName;
			if (Length(FName) > 0) then
				begin
					AssignFile(TFile, FName);
					Reset(TFile);
					for Count1 := 0 to SG1.RowCount - 1 do SG1.Rows[Count1].Clear;
					SG1.RowCount := 1;
					for Count1 := 1 to RCount1 do
						with Book[Count1] do
							begin
								Naz := '';
								Avt := '';
								God := '';
							end;
					RCount1 := 0;
					Count1 := 0;
					repeat
						Trig2 := 0; Count2 := 1;
						ReadLn(TFile, String1);
						RCount1 := RCount1 + 1;
						Count1 := Count1 + 1;
						SG1.RowCount := SG1.RowCount + 1;
						for Trig1 := 1 to Length(String1) do
							begin
								Char1 := String1[Trig1];
								if (Char1 = ';') then
									begin
										Count2 := 1;
										if (Trig2 = 0) then
											begin
												Book[Count1].Naz := String3;
												SG1.Cells[0, Count1 - 1] := SG1.Cells[0, Count1 - 1] + Book[Count1].Naz + ' ';
											end;
										if (Trig2 = 1) then
											begin
												Book[Count1].Avt := String3;
												SG1.Cells[0, Count1 - 1] := SG1.Cells[0, Count1 - 1] + Book[Count1].Avt + ' ';
											end;
										if (Trig2 = 2) then
											begin
												Book[Count1].God := String3;
												SG1.Cells[0, Count1 - 1] := SG1.Cells[0, Count1 - 1] + Book[Count1].God;
											end;
										Trig2 := Trig2 + 1;
										String3 := '';
									end
								else String3 := String3 + Char1;
								Count2 := Count2 + 1;
							end;
					until Eof(TFile);
					SG1.RowCount := SG1.RowCount - 1;
					Button5.Show;
					CloseFile(TFile);
				end;
		end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
	for Count1 := 0 to SG1.RowCount - 1 do SG1.Rows[Count1].Clear;
	SG1.RowCount := 1;
	for Count1 := 1 to RCount1 do
		with Book[Count1] do
			begin
				Naz := '';
				Avt := '';
				God := '';
			end;
	RCount1 := 0;
	Button5.Show;
end;

procedure TForm1.BB1Click(Sender: TObject);
begin
	CloseFile(TFile);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
	for Count1 := 0 to SG1.RowCount - 1 do SG1.Rows[Count1].Clear;
	SG1.RowCount := 1;
	for Count1 := 1 to RCount1 do
		with Book[Count1] do
				if (SG1.Cells[0, 0] = '') then SG1.Cells[0, 0] := Naz + ' ' + Avt + ' ' + God
				else
					begin
						SG1.RowCount := SG1.RowCount + 1;
						SG1.Cells[0, SG1.RowCount - 1] := Naz + ' ' + Avt + ' ' + God;
					end;
	Button5.Show;
end;

end.
