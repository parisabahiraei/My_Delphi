program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {calculator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tcalculator, calculator);
  Application.Run;
end.
