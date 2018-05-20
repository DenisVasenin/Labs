unit Lab1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, XPMan;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Memo1: TMemo;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  num1, num2, res, mem: extended;
  mode, mode1, block : integer;
  bool : boolean;
  strg : string;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines[0] := 'ст. Пенкин С.В. гр. ИВТ-11';
  Memo1.Lines[1] := 'Нажмите AC.';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '1'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '2'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '3'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '4'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '5'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '6'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '7'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '8'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '9'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + '0'
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  if (block = 1) then
  Memo1.Lines[1] := Memo1.Lines[1] + ','
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) then
    begin
      mode := 1;
      Memo1.Lines[0] := Memo1.Lines[1] + ' + ';
      Memo1.Lines[1] := '';
    end
    else Memo1.Lines[1] := 'Недопустимая операция.';
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) then
    begin
      mode := 2;
      Memo1.Lines[0] := Memo1.Lines[1] + ' - ';
      Memo1.Lines[1] := '';
    end
    else Memo1.Lines[1] := 'Недопустимая операция.';
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) then
    begin
      mode := 3;
      Memo1.Lines[0] := Memo1.Lines[1] + ' * ';
      Memo1.Lines[1] := '';
    end
    else Memo1.Lines[1] := 'Недопустимая операция.';
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) then
    begin
      mode := 4;
      Memo1.Lines[0] := Memo1.Lines[1] + ' / ';
      Memo1.Lines[1] := '';
    end
    else Memo1.Lines[1] := 'Недопустимая операция.';
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num2);
    if (bool = TRUE) then
      case mode of
      1:begin
          res := num1 + num2;
          Memo1.Lines[1] := FloatToStr(res);
          Memo1.Lines[0] := '';
        end;
      2:begin
          res := num1 - num2;
          Memo1.Lines[1] := FloatToStr(res);
          Memo1.Lines[0] := '';
        end;
      3:begin
          res := num1 * num2;
          Memo1.Lines[1] := FloatToStr(res);
          Memo1.Lines[0] := '';
        end;
      4:begin
          if (num2 = 0) then
          begin
            Memo1.Lines[1] := 'Ошибка, деление на 0.';
            Memo1.Lines[0] := '';
          end
          else
          begin
            res := num1 / num2;
            Memo1.Lines[1] := FloatToStr(res);
            Memo1.Lines[0] := '';
          end;
        end;
      end
      else
      begin
        Memo1.Lines[1] := 'Недопустимая операция.';
        Memo1.Lines[0] := '';
      end;
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  block := 1; mode1 := 0;
  num1 := 0; num2 := 0; res := 0;
  Memo1.Lines[1] := '';
  Memo1.Lines[0] := '';
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) then
    begin
      mem := num1;
    end
    else Memo1.Lines[1] := 'Недопустимая операция.';
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  if (block = 1) then Memo1.Lines[1] := FloatToStr(mem)
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) then
    begin
      num1 := num1 * (-1);
      Memo1.Lines[1] := FloatToStr(num1);
    end
    else Memo1.Lines[1] := 'Недопустимая операция.'
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) and (num1 >= 0) then
    begin
      num1 := sqrt(num1);
      Memo1.Lines[1] := FloatToStr(num1);
    end
    else
    begin
      Memo1.Lines[0] := '';
      Memo1.Lines[1] := 'Недопустимая операция.'
    end;
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) and (num1 >= 0) then
    begin
      num1 := sqrt(num1);
      Memo1.Lines[1] := FloatToStr(num1);
    end
    else
    begin
      Memo1.Lines[0] := '';
      Memo1.Lines[1] := 'Недопустимая операция.'
    end;
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) then
    begin
      num1 := sin(num1);
      Memo1.Lines[1] := FloatToStr(num1);
    end
    else
    begin
      Memo1.Lines[0] := '';
      Memo1.Lines[1] := 'Недопустимая операция.'
    end;
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    strg := Memo1.Lines[1];
    bool := TryStrToFloat(strg, num1);
    if (bool = TRUE) then
    begin
      num1 := cos(num1);
      Memo1.Lines[1] := FloatToStr(num1);
    end
    else
    begin
      Memo1.Lines[0] := '';
      Memo1.Lines[1] := 'Недопустимая операция.'
    end;
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  if (block = 1) then
  begin
    case mode1 of
    0:begin
        Memo1.Lines[0] := 'Введите X';
        Memo1.Lines[1] := '';
        mode1 := mode1 + 1;
      end;
    1:begin
        strg := Memo1.Lines[1];
        bool := TryStrToFloat(strg, num1);
        if (bool = TRUE) then
        begin
          Memo1.Lines[0] := 'Введите Y';
          Memo1.Lines[1] := '';
          mode1 := mode1 + 1;
        end
        else
        begin
          Memo1.Lines[0] := '';
          Memo1.Lines[1] := 'Недопустимая операция.'
        end;
      end;
    2:begin
        strg := Memo1.Lines[1];
        bool := TryStrToFloat(strg, num2);
        if (bool = TRUE) then
        begin
        // (sin(x) * cos(y)) / (sin^2(x) * cos^2(y))
          res := (sin(num1) * cos(num2)) / ((sin(num1) * sin(num1)) * (cos(num2) * cos(num2)));
          Memo1.Lines[0] := '';
          Memo1.Lines[1] := FloatToStr(res);
          mode1 := 0; 
        end
        else
        begin
          Memo1.Lines[0] := '';
          Memo1.Lines[1] := 'Недопустимая операция.';
          mode1 := 0;
        end;
      end;
    end;
  end
  else
  begin
    Memo1.Lines[0] := '';
    Memo1.Lines[1] := 'Нажмите AC.';
  end;
end;

end.
