unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  R, G, B: array of array of Byte;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  bit: TBitmap;
  I: Integer;
  J: Integer;
  cc: TColor;
begin
  if OpenDialog1.Execute() then
  begin
    Image1.Picture.LoadFromFile(OpenDialog1.filename);
    bit := TBitmap.Create;
    bit.Assign(Image1.Picture.Graphic);

    SetLength(R, bit.Height, bit.Width);
    SetLength(G, bit.Height, bit.Width);
    SetLength(B, bit.Height, bit.Width);

    for I := 0 to bit.Width - 1 do
      for J := 0 to bit.Height - 1 do
      begin
        cc := bit.Canvas.Pixels[I, J];
        R[J, I] := cc;
        G[J, I] := trunc(cc / 256);
        B[J, I] := trunc(cc / 256 / 256);

      end;

    bit.free;
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  I: Integer;
  J: Integer;
begin
  for I := 0 to Length(R) - 1 do
    for J := 0 to Length(R[0] ) - 1do
    begin
      R[I, J] := 0;
    end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  bit: TBitmap;
  I: Integer;
  J: Integer;
  cc: TColor;

begin
  bit := TBitmap.Create;
  bit.Width := Length(R[0]);
  bit.Height := Length(R);
  for I := 0 to Length(R) - 1 do
    for J := 0 to Length(R[0]) - 1 do
    begin
      cc := R[i, j] + G[i, j] * 256 + B[i, j] * 256 * 256;
      bit.Canvas.Pixels[j, i] := cc;
    end;

  Image1.Picture.Bitmap.Assign(bit);

  bit.free;
end;

end.
