unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  TypecastU, ImFilterU, ImagePrU, Vcl.Imaging.jpeg, VclTee.TeeGDIPlus,
  VclTee.TeEngine, VclTee.Series, VclTee.TeeProcs, VclTee.Chart;

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
    TeeGDIPlus1: TTeeGDIPlus;
    Series2: TLineSeries;
    Series3: TLineSeries;
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
  matrix: TBitMat;
  bit: TBitmap;
  graphRed, graphGreen, graphBlue: array of Double;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute() then
  begin
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var

  I: Integer;
  j: Integer;
begin
  bit := TBitmap.Create;
  bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Image2Mat(bit, matrix);
  for I := 0 to matrix.Pixels - 1 do
    for j := 0 to matrix.Lines - 1 do
    begin
      graphRed[matrix.Red[j, I]] := graphRed[matrix.Red[j, I]] + 1;
      graphGreen[matrix.Green[j, I]] := graphGreen[matrix.Green[j, I]] + 1;
      graphBlue[matrix.Blue[j, I]] := graphBlue[matrix.Blue[j, I]] + 1;

    end;
//    Chart1.Series[2].Add(graphRed);
  // bit.free;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
// var
// bit: TBitmap;
begin

  // bit := TBitmap.Create;
  // bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Mat2Image(matrix, bit);
  Image1.Picture.Bitmap.Assign(bit);

  bit.free;
end;

end.
