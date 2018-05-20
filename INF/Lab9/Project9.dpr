program Project9;

uses
  Forms,
  Lab9 in 'Lab9.pas' {Form1},
  MatFun in 'MatFun.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
