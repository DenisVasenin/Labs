// инвертировать матрицу NхM относительно побочной диагонали

program program5;

	{$H+}

uses 
	Strings,
	Crt;

const 
	Hint = ' Инвертировать можно только квадратную матрицу. Количество строк задается аргументом row=значение. Количество столбцов задается аргументом col=значение. Значение должно быть положительным числом больше 1-го, не более 99-ти. В противном случае используется значение по умолчанию (10). При большом размере матрица может не влезть в ширину экрана - не пугайтесь. Проверка аргументов идет до первого валидного аргумента. Ручное заполнение массива задается аргументом hand. В противном случае массив заполняется автоматически. Числа в массиве должны быть целыми, не более 4-х знаков.';
	
Type
	Massive = array of array of integer;

procedure Logo();
begin
	WriteLn('');
	WriteLn('                ============================');
	WriteLn('');
	WriteLn('                  XX  XX  YY  YY  NN    NN  ');
	WriteLn('                   XXXX    YYYY   NNNN  NN  ');
	WriteLn('                    XX      YY    NN NN NN  ');
	WriteLn('                   XXXX     YY    NN  NNNN  ');
	WriteLn('                  XX  XX    YY    NN    NN  ');
	WriteLn('');
	WriteLn('');
	WriteLn('                 Пенкин Станислав гр ИВТ-11 ');
	WriteLn('');
	WriteLn('                ============================');
	WriteLn('');
	WriteLn('  Инвертировать матрицу NхM относительно побочной диагонали');
	WriteLn('');
end;

procedure Output(Row: integer; Col: integer; var Mass: Massive);
var 
	TempInt1, Count, Count1, Count2, Count3: integer;
begin
	for Count := 0 to Row-1 do begin
		for Count1 := 0 to Col-1 do Write(Mass[Count, Count1]:5, ' ');
		WriteLn();
		WriteLn();
	end;
	WriteLn('');
	Count2 := 0;
	for Count := 0 to Row-1 do begin
		Inc(Count2); 
		Count3 := Row-(Count+1);
		for Count1 := 0 to (Col - Count2-1) do begin
			TempInt1 := Mass[Count, Count1];
			Mass[Count, Count1] := Mass[Count+Count3, Count1+Count3];
			Mass[Count+Count3, Count1+Count3] := TempInt1;
			Dec(Count3);
		end;
	end;
	for Count := 0 to Row-1 do begin
		for Count1 := 0 to Col-1 do Write(Mass[Count, Count1]:5, ' ');
		WriteLn();
		WriteLn();
	end;
end;


Var 
	Mass: Massive;
	Row, Col, Count, Count1, Count2, TempInt1: integer;
	Input, TempStr1, TempStr2: string;
Begin
	Row := 10; Col := 10; Count := 0; Count1 := 0; Count2 := 0;
	Logo();
	for Count := 1 to ParamCount do begin
		if (Pos('help', ParamStr(Count)) <> 0) then begin
			Count1 := 1;
			WriteLn(Hint);
			break;
		end;
	end;
	if (Count1 <> 1) then begin
		for Count := 1 to ParamCount do begin 
			if (Pos('hand', ParamStr(Count)) <> 0) then begin
				Input := Copy('hand', 1, 4);
				break;
			end;
		end;
		for Count := 1 to ParamCount do begin
			if (Pos('row=', ParamStr(Count)) <> 0) then begin
				if (Length(ParamStr(Count)) > 6) then begin
					WriteLn(' Количество строк выбрано автоматически (10). Для справки запустите программу с аргументом help.');
					break;
				end
				else begin 
					TempStr1 := Copy(ParamStr(Count), 5, Length(ParamStr(Count)));
					Val(TempStr1, TempInt1, Count1);
					if (Count1 = 0) then begin
						Row := TempInt1;
						if (Row > 0) then break;
					end;
				end;
			end;
		end;
		if (Row < 2) then begin
				WriteLn(' Количество строк выбрано автоматически (10). Для справки запустите программу с аргументом help.');
				Row := 10;
		end;
		for Count := 1 to ParamCount do begin
			if (Pos('col=', ParamStr(Count)) <> 0) then begin
				if (Length(ParamStr(Count)) > 6) then begin
					WriteLn(' Количество столбцов выбрано автоматически (10). Для справки запустите программу с аргументом help.');
					break;
				end
				else begin
					TempStr1 := Copy(ParamStr(Count), 5, Length(ParamStr(Count))); 
					Val(TempStr1, TempInt1, Count1);
					if (Count1 = 0) then begin
						Col := TempInt1;
						if (Col > 0) then break;
					end;
				end;
			end;
		end;
		if (Col < 2) then begin
			WriteLn(' Количество столбцов выбрано автоматически (10). Для справки запустите программу с аргументом help.');
			Col := 10;
		end;
		if (Row <> Col) then begin
			WriteLn(' Матрица не квадратная - количество строк и столбцов выбрано автоматически (10).');
			Row := 10; Col := 10;
		end;
		SetLength(Mass,Row,Col);
		if (Pos('hand', Input) <> 0) then begin
			for Count := 0 to Row-1 do begin
				WriteLn(' Заполнение ', Count+1, '-й строки. Введите ', Col, ' чисел не более 4-x знаков:');
				Count1 := 0;
				while (Count1 < Col) do begin
					Write(' Введите ', Count1+1, ' число: ');
					Readln(TempStr1);
					TempStr2 := Copy(TempStr1, 1, Length(TempStr1)); 
					Val(TempStr2, TempInt1, Count2);
					if (Count2 = 0) and (Length(TempStr1) < 5) then begin
						Mass[Count, Count1] := TempInt1;
						Count2 := -1;
						Inc(Count1);
					end
					else WriteLn(' Ошибка, не верное значение. Введите число еще раз. Для справки запустите программу с аргументом help.');
				end;
				WriteLn('');
			end;
			if (Count2 = -1) then Output(Row, Col, Mass);
			WriteLn('')
		end
		else begin
			WriteLn(' Матрица была заполнена автоматически. Для справки запустите программу с аргументом help.');
			Writeln('');
			randomize();
			for Count := 0 to Row-1 do begin
				for Count1 := 0 to Col-1 do Mass[Count, Count1] := random(1000);
			end;
			Output(Row, Col, Mass);
		end;
	end;
	Mass := NIL;
	WriteLn('Нажмите Enter.');
	ReadLn();
End.
