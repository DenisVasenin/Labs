unit Lab3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  strg, strg1 : string;
  bool : boolean;
  mod1, mod2, mod3, mod4, int1, int2 : integer;
  res1, res2, res3, num1, num2, num3, num4 : extended;
  
const
  pi = 3.14;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
// Даны обьемы и массы тел из разных материалов. Материал какого из двух тел имеет большую плотность?
// p = m / v
begin
  mod2 := 0; mod3 := 0; mod4 := 0;
  case mod1 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := 'Введите массу первого тела.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod1 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num1);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := 'Введите обьем первого тела.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod1 := 2;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod1 := 0;
      end;
    end;
  2:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num2);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := 'Введите массу второго тела.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod1 := 3;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod1 := 0;
      end;
    end;
  3:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num3);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := 'Введите обьем второго тела.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod1 := 4;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod1 := 0;
      end;
    end;
  4:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num4);
      if (bool = TRUE) then
      begin
        res1 := num1 / num2;
        res2 := num3 / num4;
        Memo1.Clear;
        Memo1.Lines.Add('');
        if (res1 = res2) then Memo1.Lines[1] := 'Плотность тел одинакова.'
        else
          if (res1 > res2) then Memo1.Lines[1] := 'Первое тело имеет бОльшую плотность.'
          else Memo1.Lines[1] := 'Второе тело имеет бОльшую плотность.';
        mod1 := 0;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod1 := 0;
      end;
    end;
  end; // case end
end;

procedure TForm1.Button2Click(Sender: TObject);
// Даны два целых числа. Если числа не равны, то заменить каждое числом, равным большему из исходных.
// Если равны, то заменить оба нулями.
begin
  mod1 := 0; mod3 := 0; mod4 := 0;
  case mod2 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := 'Введите первое число.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod2 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      bool := TryStrToInt(strg, int1);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := 'Введите второе число.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod2 := 2;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите целое число.';
        mod2 := 0;
      end;
    end;
  2:begin
      strg := Memo1.Lines[1];
      bool := TryStrToInt(strg, int2);
      if (bool = TRUE) then
      begin
        if (int1 = int2) then
        begin
          int1 := 0; int2 := 0;
          Memo1.Lines[0] := 'Первое число - ' + IntToStr(int1);
          Memo1.Lines[1] := 'Второе число - ' + IntToStr(int2);
        end
        else
          if (int1 > int2) then
          begin
            int2 := int1;
            Memo1.Lines[0] := 'Первое число - ' + IntToStr(int1);
            Memo1.Lines[1] := 'Второе число - ' + IntToStr(int2);
          end
          else
          begin
            int1 := int2;
            Memo1.Lines[0] := 'Первое число - ' + IntToStr(int1);
            Memo1.Lines[1] := 'Второе число - ' + IntToStr(int2);
          end;
        mod2 := 0;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите целое число.';
        mod2 := 0;
      end;
    end;  end; // case end
end;

procedure TForm1.Button3Click(Sender: TObject);
// Заданы радиус круга, сторона квадрата, две смежные стороны прямоугольника.
// Определить какая фигура имеет бОльшую площадь.
// Sкр = pi*r^2, Sкв = A*A, Sпр = A*B, Sтр = sqrt(p*(p-A)(p-B)(p-C)), p = (A+B+C)/2
//
// Убрал треугольник - больно много раз клацать придется.
begin
  mod1 := 0; mod2 := 0; mod4 := 0;
  case mod3 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := 'Введите радиус круга.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod3 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num1);
      if (bool = TRUE) then
      begin
        res1 := pi * sqr(num1);
        Memo1.Clear;
        Memo1.Lines[0] := 'Введите сторону квадрата.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod3 := 2;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod3 := 0;
      end;
    end;
  2:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num2);
      if (bool = TRUE) then
      begin
        res2 := sqr(num2);
        if (res1 = res2) then strg1 := 'круга и квадрата'
        else
          if (res1 < res2) then
          begin
            res1 := res2;
            strg1 := 'квадрата';
          end
          else strg1 := 'круга';
        Memo1.Clear;
        Memo1.Lines[0] := 'Введите первую сторону прямоугольника.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod3 := 3;
      end
      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod3 := 0;
      end;
    end;
  3:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num1);
      if (bool = TRUE) then
      begin
        Memo1.Clear;
        Memo1.Lines[0] := 'Введите вторую сторону прямоугольника.';
        Memo1.SetFocus;
        Memo1.Lines.Add('');
        mod3 := 4;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod3 := 0;
      end;
    end;
  4:begin
      strg := Memo1.Lines[1];
      bool := TryStrToFloat(strg, num2);
      if (bool = TRUE) then
      begin
        res3 := num1 * num2;
        if (res1 = res3) then
          if (res2 = res3) then strg1 := 'Площади фигур одинаковы';
        if (res3 > res1) then strg1 := 'прямоугольника';
        Memo1.Clear;
        Memo1.Lines.Add('');
        Memo1.Lines[1] := 'Наибольшая площадь у ' + strg1 + '.';
        mod3 := 0;
      end
      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod3 := 0;
      end;
    end;
  end; // case end
end;

procedure TForm1.Button4Click(Sender: TObject);
// По номеру года вывести его название в восточном календаре. 1984 год - год крысы (начало цикла).
// Года - крысы, коровы, тигра, зайца, дракона, змеи, лошади, овцы, обезьяны, петуха, собаки, свиньи.
// номер года / 12 = порядковый номер
begin
  mod1 := 0; mod2 := 0; mod3 := 0;
  case mod4 of
  0:begin
      Memo1.Clear;
      Memo1.Lines[0] := 'Введите год.';
      Memo1.SetFocus;
      Memo1.Lines.Add('');
      mod4 := 1;
    end;
  1:begin
      strg := Memo1.Lines[1];
      bool := TryStrToInt(strg, int1);
      if (bool = TRUE) then
      begin
        int2 := int1 mod 12;
        Memo1.Lines[0] := 'Введите год.';
        Memo1.Clear;
        Memo1.Lines.Add('');
        case int2 of
        0: Memo1.Lines[1] := 'Год обезьяны.';
        1: Memo1.Lines[1] := 'Год петуха.';
        2: Memo1.Lines[1] := 'Год собаки.';
        3: Memo1.Lines[1] := 'Год свиньи.';
        4: Memo1.Lines[1] := 'Год крысы.';
        5: Memo1.Lines[1] := 'Год коровы.';
        6: Memo1.Lines[1] := 'Год тигра.';
        7: Memo1.Lines[1] := 'Год зайца.';
        8: Memo1.Lines[1] := 'Год дракона.';
        9: Memo1.Lines[1] := 'Год змеи.';
        10: Memo1.Lines[1] := 'Год лошади.';
        11: Memo1.Lines[1] := 'Год овцы.';
        end;
        mod4 := 0;
      end      else
      begin
        Memo1.Lines[1] := 'Ошибка. Введите число.';
        mod4 := 0;
      end;
    end;
  end; // case end
end;

end.


