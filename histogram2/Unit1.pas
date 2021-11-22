unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  TypecastU, ImFilterU, ImagePrU, Vcl.Imaging.jpeg, VclTee.TeeGDIPlus,
  VclTee.TeEngine, VclTee.Series, VclTee.TeeProcs, VclTee.Chart, Data.DB,
  VclTee.TeeData, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    ImagePr1: TImagePr;
    imageFilter1: TimageFilter;
    TypeCast1: TTypeCast;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    BitBtn4: TBitBtn;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  matrix: TBitMat;
  bit: TBitmap;
  R: byte;
  G: byte;
  B: byte;
  I, j: integer;
  GR: byte;
  GRhist: array of integer;

  Rhist: array of integer;
  Ghist: array of integer;
  Bhist: array of integer;

implementation

{$R *.dfm}

function zeros(width: integer): Ari;
var
  I: integer;
begin
  SetLength(result, width);

  for I := 0 to width - 1 do
  begin
    result[I] := 0;

  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute() then
  begin
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var

  I: integer;
  j: integer;

begin
  bit := TBitmap.Create;

  bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Image2Mat(bit, matrix);
  // Rhist := zeros(256);
  // Ghist := zeros(256);
  // Bhist := zeros(256);
  SetLength(Rhist, 256);
  SetLength(Ghist, 256);
  SetLength(Bhist, 256);

  for I := 0 to matrix.Pixels - 1 do
    for j := 0 to matrix.Lines - 1 do
    begin

      R := matrix.Red[j, I];
      Rhist[R] := Rhist[R] + 1;
      G := matrix.Green[j, I];
      Ghist[G] := Ghist[G] + 1;
      B := matrix.Blue[j, I];
      Bhist[B] := Bhist[B] + 1;

    end;
  // bit.free;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  I: integer;

begin

  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Series[2].Clear;

  for I := 0 to 255 do
  begin
    Chart1.Series[0].Add(Rhist[I]);
    Chart1.Series[1].Add(Ghist[I]);
    Chart1.Series[2].Add(Bhist[I]);
  end;

end;

procedure TForm1.BitBtn4Click(Sender: TObject);

begin

  bit := TBitmap.Create;
  bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Image2Mat(bit, matrix);
  ImagePr1.MakeBW(matrix);

  SetLength(GRhist, 256);

  for I := 0 to matrix.Pixels - 1 do
    for j := 0 to matrix.Lines - 1 do
    begin
      GR := matrix.Picture[j, I];
      GRhist[GR] := GRhist[GR] + 1;

    end;
  Chart1.Series[0].Clear;
  for I := 0 to 255 do
  begin
    Chart1.Series[0].Add(GRhist[I]);

  end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var
  p, l: Extended;
begin
  p := matrix.Pixels;
  l := matrix.Lines;
  for GR := 1 to 255 do
  begin

    GRhist[GR] := GRhist[GR - 1] + GRhist[GR];

  end;
  for GR := 0 to 255 do
  begin

    GRhist[GR] := trunc((GRhist[GR] * 255) / (p * l));

  end;
   Chart2.Series[0].Clear;
    for I := 0 to 255 do
  begin
    Chart2.Series[0].Add(GRhist[I]);

  end;

  for I := 0 to matrix.Pixels - 1 do
    for j := 0 to matrix.Lines - 1 do
    begin
      GR := matrix.Picture[j, I];
      matrix.Picture[j, I]:= GRhist[GR];

    end;
  ImagePr1.Mat2Image(matrix,bit);
  Image1.Picture.Bitmap.Assign(bit);

  bit.free;
end;

end.
