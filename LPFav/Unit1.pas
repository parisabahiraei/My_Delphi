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
    BitBtn4: TBitBtn;
    Image2: TImage;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    function sort(Input: Ari): Ari;
    procedure BitBtn5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  matrix, matrixx, matrixxx: TBitMat;
  bit: TBitmap;


implementation

// Function TimageFilter.Sorti(Input: Ari;UpNotDown : Boolean):Ari;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute() then
  begin
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
  end;

end;

// average
procedure TForm1.BitBtn2Click(Sender: TObject);
var
  I, j, x, y: integer;

begin
  bit := TBitmap.Create;
  bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Image2Mat(bit, matrix);

  matrixx.Lines := matrix.Lines;
  matrixx.Pixels := matrix.Pixels;
  matrixx.colr := True;

  setlength(matrixx.Red, matrix.Lines, matrix.Pixels);
  setlength(matrixx.Green, matrix.Lines, matrix.Pixels);
  setlength(matrixx.Blue, matrix.Lines, matrix.Pixels);

  for I := 1 to matrix.Pixels - 2 do
    for j := 1 to matrix.Lines - 2 do
    begin
      for x := -1 to 1 do
        for y := -1 to 1 do
        begin
          matrixx.Red[j, I] := matrixx.Red[j, I] +
            trunc((1 / 9) * matrix.Red[j + x, I + y]);
          matrixx.Green[j, I] := matrixx.Green[j, I] +
            trunc((1 / 9) * matrix.Green[j + x, I + y]);
          matrixx.Blue[j, I] := matrixx.Blue[j, I] +
            trunc((1 / 9) * matrix.Blue[j + x, I + y]);
        end;

    end;

  matrix := BitMatAssign(matrixx);

end;

// show average
procedure TForm1.BitBtn3Click(Sender: TObject);

begin

  ImagePr1.Mat2Image(matrix, bit);
  Image1.Picture.Bitmap.Assign(bit);
  bit.free;

end;

// make pic noisy
procedure TForm1.BitBtn4Click(Sender: TObject);
var
n, noise: integer;
 I, j: integer;
begin
  bit := TBitmap.Create;
  bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Image2Mat(bit, matrix);
  ImagePr1.MakeBW(matrix);
  matrix.colr := False;

  noise := trunc((20 / 100) * matrix.Pixels * matrix.Lines);

  for n := 1 to noise do
  begin
    I := Random(matrix.Pixels);
    j := Random(matrix.Lines);
    matrix.Picture[j, I] := 255;
  end;

  ImagePr1.Mat2Image(matrix, bit);
  Image1.Picture.Bitmap.Assign(bit);
  bit.free;

end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var
  x, y, p, max: integer;
  AR: Ari;
   I, j: integer;
begin
  setlength(AR, 9);

  bit := TBitmap.Create;
  bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Image2Mat(bit, matrix);
  ImagePr1.MakeBW(matrix);
  matrix.colr := False;

  matrixxx.Lines := matrix.Lines;
  matrixxx.Pixels := matrix.Pixels;
  matrixxx.colr := False;
  setlength(matrixxx.Picture, matrix.Lines, matrix.Pixels);

  for I := 1 to matrix.Pixels - 2 do
    for j := 1 to matrix.Lines - 2 do
    begin
      p := 0;
      for x := -1 to 1 do
        for y := -1 to 1 do
        begin
          AR[p] := matrix.Picture[j + x, I + y];
          p := p + 1;
        end;

      //AR := imageFilter1.sorti(AR, True);
      AR := sort(AR);
      matrixxx.Picture[j, I] := AR[4];

    end;
  matrix := BitMatAssign(matrixxx);

  ImagePr1.Mat2Image(matrix, bit);
  Image2.Picture.Bitmap.Assign(bit);
  bit.free;
end;

function TForm1.sort(Input: Ari): Ari;
var
  l, max, index: integer;
   I, j: integer;
begin
  l := length(Input);
  setlength(Result, l);

  for I := (l - 1) downto 0 do
  begin
    index := 0;
    max := -1;
    for j := (l - 1) downto 0 do
    begin
      if Input[j] > max then
      begin
        max := Input[j];
        index := j;
      end;
    end;
    Result[I] := max;
    Input[index] := -1;

  end;

end;

end.
