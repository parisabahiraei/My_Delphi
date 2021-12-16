unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tcalculator = class(TForm)
    firstnum: TEdit;
    secondnum: TEdit;
    sum: TButton;
    natijeh: TLabel;
    diffrence: TButton;
    multiply: TButton;
    taghsim: TButton;
    procedure sumClick(Sender: TObject);
    procedure diffrenceClick(Sender: TObject);
    procedure multiplyClick(Sender: TObject);
    procedure taghsimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  calculator: Tcalculator;

implementation

{$R *.dfm}

procedure Tcalculator.diffrenceClick(Sender: TObject);
begin
natijeh.caption:=floattostr(strtofloat(firstnum.text)- strtofloat(secondnum.text));
end;

procedure Tcalculator.multiplyClick(Sender: TObject);
begin
natijeh.caption:=floattostr(strtofloat(firstnum.text)* strtofloat(secondnum.text));
end;

procedure Tcalculator.sumClick(Sender: TObject);
begin;
natijeh.caption:=floattostr(strtofloat(firstnum.text)+ strtofloat(secondnum.text));
end;

procedure Tcalculator.taghsimClick(Sender: TObject);
begin
natijeh.caption:=floattostr(strtofloat(firstnum.text)/ strtofloat(secondnum.text));
end;

end.
