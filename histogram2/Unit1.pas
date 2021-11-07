unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  TypecastU, ImFilterU, ImagePrU, Vcl.Imaging.jpeg, VclTee.TeeGDIPlus,
  VclTee.TeEngine, VclTee.Series, VclTee.TeeProcs, VclTee.Chart, Data.DB,
  VclTee.TeeData;

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
    ChartDataSet1: TChartDataSet;
    SeriesDataSet1: TSeriesDataSet;
    DataSource1: TDataSource;
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
  R: byte;
  G: byte;
  B: byte;

  Rhist: Ari; // pishnahad
  Ghist: Ari;
  Bhist: Ari;

  // Import : TDataImport;

implementation

{$R *.dfm}

function zeros(width: integer): Ari;
var
  I: integer;
begin
  SetLength(result, width);
  // https://stackoverflow.com/questions/6145935/how-to-return-array-from-a-delphi-function

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
  Rhist := zeros(256);
  Ghist := zeros(256);
  Bhist := zeros(256);

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
  bit.free;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  I: integer;
  // var
  // bit: TBitmap;
begin

  // chart1
  // bit := TBitmap.Create;
  // bit.Assign(Image1.Picture.Graphic);
  // ImagePr1.Mat2Image(matrix, bit);
  // Image1.Picture.Bitmap.Assign(bit);

  // SeriesDataSet1.Series := Series1;
  // Series1.DataSources.I:=10;
  // ChartDataSet1. /
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
  Chart1.Series[2].Clear;

  for I := 0 to 255 do
  begin
    Chart1.Series[0].Add(Rhist[I]);
    Chart1.Series[1].Add(Ghist[I]);
    Chart1.Series[2].Add(Bhist[I]);
  end;

  // bit.free;
end;

end.
