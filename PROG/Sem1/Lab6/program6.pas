program program6;

	{$H+}
	{$I-}

uses 
	Dos,
	Crt;

const 
	Del1 = [#34,#39];
	Del2 = [#9, #10, #13, #32];
	Help = ' Программа открывает файл с исходным текстом на Си и выполняет прописаную в нем директиву #define для этого текста. Путь к исходному файлу и его имя задаются аргументом вида in=/путь/имя. Путь к файлу вывода и его имя задаются аргументом вида out=/путь/имя.';

var
	FileIn, FileOut, FileLog: text;
	Trig, ErrLog, ErrIn, ErrOut, Count, Count1, Row, Len: integer;
	Char1: char; 
	InName, OutName, Temp: string;
	Hour, Min, Sec, Msec: word;
	Def1: array [0..100] of string;
	Def2: array [0..100] of string;
	///// #32 - пробел    #34 - ""    #39 - '' ///// 
// ================================ обработка аргументов ====================================
BEGIN
	Trig := 0; ErrLog := 0; ErrIn := 0; ErrOut := 0; Count := 0; Count1 := 0; Row := 0; Len := 0; Temp := '';
	for Count := 0 to 100 do begin
		Def1[Count] := '';
		Def2[Count] := '';
	end;
	for Count := 1 to ParamCount do begin
		if (Pos('help', ParamStr(Count)) <> 0) then begin
			Trig := 1;
			WriteLn(Help);
			break;
		end;
	end;
	if (Trig <> 1) then begin
		Assign(FileLog, 'Log.txt');
		Rewrite(FileLog);
		if (IOResult <> 0) then begin
			WriteLn(' Ошибка при создании файла лога.');
			ErrLog := 1;
		end;
		for Count := 1 to ParamCount do begin
			if (Pos('in=', ParamStr(Count)) <> 0) then begin
				InName := Copy(ParamStr(Count), 4, Length(ParamStr(Count)));
				Assign(FileIn, InName);
				Reset(FileIn);
				if (IOResult <> 0) then ErrIn := 1
				else begin
					ErrIn := 0;
					break;
				end;
			end;
		end;
		if (ErrIn = 0) then begin 
			if (ErrLog = 0) then begin
				GetTime(Hour, Min, Sec, Msec);
				WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
				WriteLn(FileLog, 'Opening input file ', InName,' successfully.');
			end;
		end
		else begin
			WriteLn(' Ошибка при открытии исходного файла.');
			if (ErrLog = 0) then begin
				GetTime(Hour, Min, Sec, Msec);
				WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
				WriteLn(FileLog, 'Error opening input ', InName, ' file.');
			end;
		end;
		for Count := 1 to ParamCount do begin
			if (Pos('out=', ParamStr(Count)) <> 0) then begin
				OutName := Copy(ParamStr(Count), 5, Length(ParamStr(Count)));
				Assign(FileOut, OutName);
				Rewrite(FileOut);
				if (IOResult <> 0) then ErrOut := 1
				else begin
					ErrOut := 0;
					break;
				end;
			end;
		end;
		if (ErrOut = 0) then begin
			if (ErrLog = 0) then begin
				GetTime(Hour, Min, Sec, Msec);
				WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
				WriteLn(FileLog, 'Opening output file ', OutName, ' successfully.');
			end;
		end
		else begin
			WriteLn(' Ошибка при создании файла вывода.');
			if (ErrLog = 0) then begin
				GetTime(Hour, Min, Sec, Msec);
				WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
				WriteLn(FileLog, 'Error opening output file ', OutName);
			end;
		end;
// =================================== ищет дефайны =================================================
		if (ErrIn = 0) and (ErrOut = 0) then begin
			while(not EoF(FileIn)) do begin
				Read(FileIn, Char1);
				if (Char1 = '#') then begin
					for Count := 1 to 6 do begin
						Read(FileIn, Char1);
						Temp := Temp + Char1;
					end;
					//WriteLn(Temp); //11111111111111111111111111111111111
					if (Pos('define', Temp) <> 0) then begin
						if (ErrLog = 0) then begin
							GetTime(Hour, Min, Sec, Msec);
							WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
							WriteLn(FileLog, 'Define found.');
						end;
						Read(FileIn, Char1);
						while (Char1 in Del2) do Read(FileIn, Char1);
						if (Char1 in Del1) then begin
							if (Char1 = #34) then begin
								repeat
									Def1[Row] := Def1[Row] + Char1;
									Read(FileIn, Char1); 
								until (Char1 = #34);
								Def1[Row] := Def1[Row] + Char1;
							end;
							if (Char1 = #39) then begin
								repeat
									Def1[Row] := Def1[Row] + Char1;
									Read(FileIn, Char1); 
								until (Char1 = #39);
								Def1[Row] := Def1[Row] + Char1;
							end;
							Read(FileIn, Char1);
						end 
						else begin
							while not(Char1 in Del2) do begin
								Def1[Row] := Def1[Row] + Char1;
								Read(FileIn, Char1);
							end;
						end;
						//Writeln(Def1[Row]); // 222222222222222222222222222222222222222222
						while (Char1 in Del2) do Read(FileIn, Char1); 
						if (Char1 in Del1) then begin
							if (Char1 = #34) then begin
								repeat
									Def2[Row] := Def2[Row] + Char1;
									Read(FileIn, Char1); 
								until (Char1 = #34);
								Def2[Row] := Def2[Row] + Char1;
							end;
							if (Char1 = #39) then begin
								repeat
									Def2[Row] := Def2[Row] + Char1;
									Read(FileIn, Char1); 
								until (Char1 = #39);
								Def2[Row] := Def2[Row] + Char1;
							end;
							Read(FileIn, Char1);
						end 
						else begin
							while not(Char1 in Del2) do begin
								Def2[Row] := Def2[Row] + Char1;
								Read(FileIn, Char1);
							end;
						end;
						//Writeln(Def2[Row]); // 333333333333333333333333333333333
						Inc(Row);
					end; 
				end;
				Temp := '';
			end;
			Reset(FileIn);
// ========================== выводит до тела ======================================
			while (Count1 < Row) do begin
				Read(FileIn, Char1);
				Write(FileOut, Char1);
				if (Char1 = '#') then begin
					for Count := 1 to 6 do begin
						Read(FileIn, Char1);
						Temp := Temp + Char1;
					end;
					Write(FileOut, Temp);
					if (Pos('define', Temp) <> 0) then begin
						Read(FileIn, Char1);
						Write(FileOut, Char1);
						while (Char1 in Del2) do begin
							Read(FileIn, Char1); 
							Write(FileOut, Char1);
						end;
						while not(Char1 in Del2) do begin
							Read(FileIn, Char1);
							Write(FileOut, Char1);
						end;
						while (Char1 in Del2) do begin
							Read(FileIn, Char1); 
							Write(FileOut, Char1);
						end;
						while not(Char1 in Del2) do begin
							Read(FileIn, Char1);
							Write(FileOut, Char1);
						end;
						Inc(Count1);
					end; 
				end;
				Temp := '';
			end;
			//WriteLn(FileOut, 'hhhhbhbyhb'); ///444444444444444444444444
// ================================= выводит тело с заменой ======================================================
			while (not EoF(FileIn)) do begin
				Read(FileIn, Char1);
				Trig := 0;
				for Count := 0 to Row-1 do begin
					if (Char1 = Def1[Count, 1]) then begin
						Len := Length(Def1[Count]);
						Temp := Temp + Char1;
						if (Len > 1) then begin
							for Count1 := 1 to Len-1 do begin
								Read(FileIn, Char1);
								Temp := Temp + Char1;
							end;
						end;
						///Writeln(Temp); ///66666666666666666666
						if (Pos(Def1[Count], Temp) <> 0) then begin
							Write(FileOut, Def2[Count]);
							Trig := 1;
							break;
						end 
						else begin Write(FileOut, Temp); Trig:=1; end;
					end;
					Temp := '';
				end;
				if (Trig = 0) and (not EoF(FileIn)) then Write(FileOut, Char1);
			end;
		end;
// =================================================================================================================
		if (ErrIn = 0) then begin
			Close(FileIn);
			if (IOResult <> 0) then begin
				WriteLn(' Ошибка при закрытии исходного файла.');
				if (ErrLog = 0) then begin
					GetTime(Hour, Min, Sec, Msec);
					WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
					WriteLn(FileLog, 'Error closing input file.');
				end;
			end 
			else begin
				if (ErrLog = 0) then begin
					GetTime(Hour, Min, Sec, Msec);
					WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
					WriteLn(FileLog, 'Сlosing input file successfully.');
				end;
			end;
		end;
		if (ErrOut = 0) then begin
			Close(FileOut);
			if (IOResult <> 0) then begin
				WriteLn(' Ошибка при закрытии файла вывода.');
				if (ErrLog = 0) then begin
					GetTime(Hour, Min, Sec, Msec);
					WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
					WriteLn(FileLog, 'Error closing output file.');
				end;
			end 
			else begin
				if (ErrLog = 0) then begin
					GetTime(Hour, Min, Sec, Msec);
					WriteLn(FileLog, Hour,':', Min,':', Sec,':', Msec);
					WriteLn(FileLog, 'Сlosing output file successfully.');
				end;
			end;
		end;
		if (ErrLog = 0) then Close(FileLog);
	end;
END.
