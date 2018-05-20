unit MatFun;

interface
	uses Math;
	function Arctg(X: extended): extended;
	function SRange(X: extended): extended;

implementation

function Arctg(X: extended) : extended;
	begin
		Result := Arctan(X);
	end;

function SRange(X: extended): extended;
	var
		S: extended;
		Count1, i: integer;
	const
		n: integer = 15;
	begin
		Count1 := 1; S := X;
		while (Count1 < n) do
			begin
				if (Count1 mod 2 = 0) then i := 1 else i := -1;
				S := S + i * (Power(X, 2*Count1+1)/(2*Count1+1));
				Count1 := Count1 + 1;
			end;
		Result := S;
	end;
end.
