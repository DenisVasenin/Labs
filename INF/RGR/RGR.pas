unit RGR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, ExtCtrls, Buttons, Math;

type
  TForm1 = class(TForm)
    IM1: TImage;
    Button1: TButton;
    BB1: TBitBtn;
    ED1: TEdit;
		Label1: TLabel;
    Button3: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
		procedure Button1Click(Sender: TObject);
		procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	Form1: TForm1;
	String1, SaveTitle: string;
	Round, X, Y: extended;
	SCount, ICount, PCount, MaxY, Trig, Trig1, Trig2, Trig3, Count, Count1, Count2, Count3: integer;
	Points: array[1..2, 1..40000] of integer;
	Index: array[1..40000] of integer;
	Shells: array[1..40000] of integer;
	Rounds: array[1..40000] of extended;
	t1, t2: cardinal;

implementation

{$R *.dfm}

function IsLeft(Ind1, Ind2, Ind3 : integer): extended;
begin
	// Result < 0 : Ind3 ëåâåå Ind1-Ind2 ; Result > 0 : Ind3 ïğàâåå Ind1-Ind2
	// (Ind2x - Ind1x) * (Ind3y - Ind1y) - (Ind3x - Ind1x) * (Ind2y - Ind1y)
	Result := (Points[1,Ind2]-Points[1,Ind1])*(Points[2,Ind3]-Points[2,Ind1]) - (Points[1,Ind3]-Points[1,Ind1])*(Points[2,Ind2]-Points[2,Ind1]);
end;

procedure ClearAll;
begin
	Form1.IM1.Canvas.Brush.Color := clWhite;
	Form1.IM1.Canvas.FillRect(Rect(1, 1, Form1.IM1.Width-1, Form1.IM1.Height-1));
	Round := 0; X := 0; Y := 0; SCount:= 0; ICount:= 0; MaxY := 0;
	for Count1 := 1 to 40000 do
		begin
			Points[1, Count1] := 0;
			Points[2, Count1] := 0;
			Shells[Count1] := 0;
			Index[Count1] := 0;
			Rounds[Count1] := 0;
		end;
end;

procedure BlankTitle(String1: string);
begin
	SaveTitle := Application.Title;
	Application.Title := '';	ShowMessage(String1);
	Application.Title := SaveTitle;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
	IM1.Canvas.Brush.Color := clWhite;
	IM1.Canvas.Rectangle(0, 0, 497, 497);
	Trig := 0;
end;

// ================================ GRAHAM ================================
procedure TForm1.Button1Click(Sender: TObject);
begin
	if (Trig = 1) then
		begin
			PCount := 3;
			repeat
					t1 := GetTickCount;
// =============== ÇÀÏÎËÍßÅÌ ================================
					IM1.Canvas.Brush.Color := clRed;
					Randomize;
					for Count1 := 1 to PCount do
						begin
							Points[1, Count1] := RandomRange(20, 477);
							Points[2, Count1] := RandomRange(20, 477);
							if (Count1 > 1) then
								for Count2 := 1 to Count1-1 do
									if (Points[1, Count1] = Points[1, Count2]) then
										while (Points[2, Count1] = Points[2, Count2]) do Points[2, Count1] := RandomRange(20, 477);
							IM1.Canvas.Ellipse(Points[1, Count1]-2, Points[2, Count1]-2, Points[1, Count1]+2, Points[2, Count1]+2);
						end;
// =============== ÂÛÁÈĞÀÅÌ ÏÅĞÂÓŞ ÒÎ×ÊÓ Ñ Ymin =======================
					ICount := 1;
					for Count1 := 2 to PCount do
						begin
							if (Points[2, ICount] < Points[2, Count1]) then ICount := Count1
							else
							if (Points[2, ICount] = Points[2, Count1]) then
								if (Points[1, ICount] > Points[1, Count1]) then ICount := Count1;
							Index[1] := ICount;
						end;
// ====================================================================
// =========== Ñ×ÈÒÀÅÌ ÓÃËÛ ÎÒ ÎÑÈ ÀÁÑÖÈÑÑ È ÇÀÍÎÑÈÌ ÈÕ Â ÌÀÑÑÈÂ ÓÃËÎÂ Rounds ===============
					for Count1 := 1 to PCount do
						begin
							if (Count1 <> Index[1]) then
								begin
									X := Points[1, Count1] - Points[1, Index[1]];
									if (X = 0) then Round := 90
									else
										begin
											Y := Points[2, Index[1]] - Points[2, Count1];
											if (Y = 0) then
												if (Points[1, Count1] < Points[1, Index[1]]) then Round := 180
												else Round := 0
											else
												begin
													Round := arctan(Y/X);
													Round := Round * 180 / pi;
													if (Round < 0) then Round := 180 + Round;
												end;
										end;
									Rounds[Count1] := Round;
								end
							else Rounds[Count1] := 0;
						end;
// ======== ÑÎĞÒÈĞÓÅÌ ÌÀÑÑÈÂ ÓÃËÎÂ ÏÎ ÂÎÇĞÀÑÒÀÍÈŞ È ÇÀÍÎÑÈÌ ÈÍÄÅÊÑÛ ÈÕ ÒÎ×ÅÊ Â ÌÀÑÑÈÂ Index ============
					Rounds[Index[1]] := -1;
					for Count1 := 1 to PCount do
							for Count2 := 1 to PCount do
									if (Rounds[Count2] < 360) then
										begin
											Index[Count1] := Count2;
											for Count3 := Count2 to PCount do
												if (Rounds[Count3] < Rounds[Index[Count1]]) then Index[Count1] := Count3
												else
													if (Rounds[Count3] = Rounds[Index[Count1]]) then
														begin
															if (Rounds[Count3] = 90) then
																if (Points[2, Count3] < Points[2, Index[Count1]]) then Index[Count1] := Count3;
															if (Rounds[Count3] < 90) then
																if (Points[1, Count3] < Points[1, Index[Count1]]) then Index[Count1] := Count3;
															if (Rounds[Count3] > 90) then
																if (Points[2, Count3] > Points[1, Index[Count1]]) then Index[Count1] := Count3;
														end;
											Rounds[Index[Count1]] := 360;
											Break;
										end;
// ====== ÎÁÕÎÄÈÌ ÂÅĞØÈÍÛ, ÏĞÎÂÅĞßÅÌ ÓÃÎË ÏÎÂÎĞÎÒÀ È ÇÀÍÎÑÈÌ ÈÍÄÅÊÑÛ ÏÎÄÕÎÄßÙÈÕ ÂÅĞØÈÍ Â ÌÀÑÑÈÂ Shells =======
					Shells[1] := Index[1]; Shells[2] := Index[2]; SCount := 2; Count1 := 3;
					repeat							if (IsLeft(Shells[SCount-1], Shells[SCount], Index[Count1]) < 0) then								begin									SCount := SCount + 1;									Shells[SCount] := Index[Count1];									Count1 := Count1 + 1;								end							else								begin									Shells[SCount] := 0;									SCount := SCount - 1;								end;					until (Count1 > PCount);// ============= ĞÈÑÓÅÌ ÎÁÎËÎ×ÊÓ ========================
					for Count1 := 2 to SCount do
						begin
							IM1.Canvas.MoveTo(Points[1, Shells[Count1-1]], Points[2, Shells[Count1-1]]);
							IM1.Canvas.LineTo(Points[1, Shells[Count1]], Points[2, Shells[Count1]]);
						end;
					IM1.Canvas.MoveTo(Points[1, Shells[SCount]], Points[2, Shells[SCount]]);
					IM1.Canvas.LineTo(Points[1, Shells[1]], Points[2, Shells[1]]);
//========================================================
					t2 := GetTickCount;
					ShowMessage('Äëÿ ' + IntToStr(PCount) + ' òî÷åê ' + IntToStr(t2-t1) + ' ìëñåê');
					if (Count = 3) then Break
					else
						begin
							if (PCount < 1000) then PCount := PCount + 997
							else PCount := PCount + 1000;
							if (PCount >= Count) then
								begin
									Trig := Trig + 1;
									PCount := Count;
								end;
							if (Trig < 3 ) then ClearAll;
						end;
			until Trig = 3;
			Trig := 0;
		end
	else
		begin
			String1 := 'Ââåäèòå êîëè÷åñòâî òî÷åê è íàæìèòå "Çàïîëíèòü".';
			BlankTitle(String1);
		end;
end;

// ========== ENTER COUNT POINTS =================================
procedure TForm1.Button3Click(Sender: TObject);
begin
	if (ED1.Text = '') then
		begin
			String1 := 'Ââåäèòå êîëè÷åñòâî òî÷åê.';
			BlankTitle(String1);
		end
	else
		Try
			Count := StrToInt(ED1.Text);
			if (Count < 3) or (Count > 30000) then
				begin
					String1 := '×èñëî òî÷åê äîëæíî áûòü áîëüøå 2 è íå áîëüøå 30000.';
					BlankTitle(String1);
				end
			else
				begin
					Trig := 1;
					ClearAll;
				end;
		except
			String1 := 'Ââåäèòå ÷èñëî.';
			BlankTitle(String1);
		end;
end;

//=================================== JAVIS ======================================
procedure TForm1.Button2Click(Sender: TObject);
begin
	if (Trig = 1) then
		begin
			PCount := 3;
			repeat
				t1 := GetTickCount;
// =============== ÇÀÏÎËÍßÅÌ ================================
				//PCount := Count;
				IM1.Canvas.Brush.Color := clRed;
				Randomize;
				for Count1 := 1 to PCount do
					begin
						Points[1, Count1] := RandomRange(20, 477);
						Points[2, Count1] := RandomRange(20, 477);
						if (Count1 > 1) then
							for Count2 := 1 to Count1-1 do
								if (Points[1, Count1] = Points[1, Count2]) then
									while (Points[2, Count1] = Points[2, Count2]) do Points[2, Count1] := RandomRange(20, 477);
						IM1.Canvas.Ellipse(Points[1, Count1]-2, Points[2, Count1]-2, Points[1, Count1]+2, Points[2, Count1]+2);
					end;
// =============== ÂÛÁÈĞÀÅÌ ÏÅĞÂÓŞ ÒÎ×ÊÓ Ñ Ymin =======================
				ICount := 1;
				for Count1 := 2 to PCount do
					begin
						if (Points[2, ICount] < Points[2, Count1]) then ICount := Count1
						else
							if (Points[2, ICount] = Points[2, Count1]) then
								if (Points[1, ICount] > Points[1, Count1]) then ICount := Count1;
						Index[1] := ICount;
					end;
// ====================================================================
				SCount := 2; Shells[1] := Index[1]; Trig1 := 1; Trig2 := 0; Trig3 := 1;
				while (Shells[SCount] <> Shells[1]) do
					begin
						if (Trig3 = 1) then SCount := SCount - 1;
						for Count1 := 1 to PCount do
							begin
								if (SCount < 2) then
									for Count3 := 1 to SCount do
										if (Shells[Count3] <> Count1) then Trig1 := 1
										else begin Trig1 := 0; break; end
								else
									for Count3 := 2 to SCount do
										if (Shells[Count3] <> Count1) then Trig1 := 1
										else begin Trig1 := 0; break; end;
								if (Trig1 = 1) then
									begin
										for Count2 := 1 to PCount do
											if (Count2 <> Count1) and (Count2 <> Shells[SCount]) then
												begin
													if (IsLeft(Shells[SCount], Count1, Count2) > 0) then
														begin
															Trig2 := 0;
															break;
														end
													else Trig2 := 1;
												end;
										if (Trig2 = 1) then
											begin
												SCount := SCount + 1;
												Shells[SCount] := Count1;
												break;
											end;
									end;
							end;
						Trig3 := 0;
					end;
//==================== ĞÈÑÓÅÌ ÎÁÎËÎ×ÊÓ ======================================
				for Count1 := 2 to SCount do
					begin
						IM1.Canvas.MoveTo(Points[1, Shells[Count1-1]], Points[2, Shells[Count1-1]]);
						IM1.Canvas.LineTo(Points[1, Shells[Count1]], Points[2, Shells[Count1]]);
					end;
// ============================================================================
				t2 := GetTickCount;
				ShowMessage('Äëÿ ' + IntToStr(PCount) + ' òî÷åê ' + IntToStr(t2-t1) + ' ìëñåê');
				if (Count = 3) then Break
				else
					begin
						if (PCount < 1000) then PCount := PCount + 997
						else PCount := PCount + 1000;
						if (PCount >= Count) then
							begin
								Trig := Trig + 1;
								PCount := Count;
							end;
						if (Trig < 3 ) then ClearAll;
					end;
			until Trig = 3;
		end
	else
		begin
			String1 := 'Ââåäèòå êîëè÷åñòâî òî÷åê è íàæìèòå "Çàïîëíèòü".';
			BlankTitle(String1);
		end;
end;

end.
