unit ImagePrU;

interface

Uses
  windows,
  FMX.Types,
  FMX.Graphics,
  vcl.ComCtrls,
  vcl.Extctrls,
  vcl.Forms,
  SysUtils,
  vcl.Graphics,
  vcl.Imaging.jpeg,
  vcl.controls,
  vcl.Dialogs,
  vcl.clipbrd,
  TypeCastU,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  system.UITypes,
  // VCLTee.Chart,
  Classes;

type
  TImagePr = class(TComponent)

  Private
    Function inport(a: word): word;
    Procedure outportb(a: word; b: word);
    Procedure SaveBmpB(Filename: Pchar; Picture: ArByte2;
      pixels, lines: integer);
    Procedure SaveBmpC(Filename: Pchar; BitMa: TBitMat);
    Procedure DllOpenBmp(Filename: Pchar; var BitMa: TBitMat; var kk: integer);
    Procedure DllOpenBmp1(Filename: Pchar; var BitMa: TBitMat);
    function doZoomOut2(Input: ArByte2): ArByte2;
    // function FMXImage2Pointer(Bit: FMX.Types.Tbitmap): PRGBTripleArray;

  public
    BitMat: TBitMat;
    Bi: TBitmap;
    Typecast: TTypeCast;
    Procedure CreateBi;
    Procedure FMX2VCL(b: FMX.Graphics.TBitmap; Res: vcl.Graphics.TBitmap);
    Procedure VCL2FMX(b: vcl.Graphics.TBitmap; Res: FMX.Graphics.TBitmap);
    // procedure FMXImage2mat(Bi: FMX.Types.Tbitmap; var BitMa: TBitMat);

    function Are2ToGrayBitmat(A: Are2): Tbitmat;
    procedure PGM2Mat(const Filename: STRING; var Mat: TBitMat);
    Procedure BiLoadFromFile(Filename: String);
    function Mat2Gray(Input: Are2): ArByte2;
    function inttobyte1(a: integer): char;
    Function inttobyte2(a: integer): char;
    Function inttobyte3(a: integer): char;
    Function inttobyte4(a: integer): char;
    Function hex(aa: char): string;
    Function Extent(Filename: Pchar): Pchar;
    Function bytetoint(b1, b2, b3, b4: char): integer;
    Function Distance(a, b, C, D: integer): integer;
    Procedure Pixel(x, y: word; C: byte);
    procedure DllSetmat(var BitMa: TBitMat);
    Procedure Image2Mat(Bi: TBitmap; var BitMa: TBitMat);
    procedure Image2MatFMX(Bi: FMX.Graphics.TBitmap; var BitMa: TBitMat);
    Procedure MakeBW(var BitMa: TBitMat);
    procedure MakeUnBW(var BitMa: TBitMat);
    procedure ChangeBW(var BitMa: TBitMat);
    Function Image2Pointer(Bit: TBitmap; var MByteArray: TMbyteArray)
      : PRGBTripleArray;
    Procedure Mat2Image(BitMa: TBitMat; Bit: TBitmap);
    procedure Mat2ImageFMX(BitMa: TBitMat; Bit: FMX.Graphics.TBitmap);
    Procedure MakeImage(Bi: TBitmap; Path: String);
    procedure MakeImageX(Bi: TBitmap);
    procedure MakeImageXX(Bi: TBitmap);
    Procedure SavebmpMa(Filename: String; BitMa: TBitMat);
    Function Doresize(pic: ArByte2; P, l: integer): ArByte2;
    Procedure ResizeX(Var BitMa: TBitMat; P, l: integer);
    Procedure StrechMat(var BitMa: TBitMat; P, l: integer; hidImage: TImage);
    Procedure StrechImg(var Bit: TBitmap; P, l: integer);
    procedure Getinfo(Filename: String; var P, l: integer);
    procedure ColorCutter(var BitMa: TBitMat; Colors: Ar6i; Offset: byte);
    function ASsignBitMat(biMa: TBitMat): TBitMat;
    procedure SaveMatAsJpeg(Filename: String; BitMa: TBitMat);
    Function AssignArbyte2(a: ArByte2): ArByte2;
    procedure DrawHistogram(BitMa: TBitMat; Chart: TChart; var Re, Gr, Bl: Ari);
    function MixTwoBitMats(BitMa1, BitMa2: TBitMat): TBitMat;
    procedure unrgb(AColor: TColor; var rr, gg, bb: byte);
    procedure ZoomOut2X(var BitMa: TBitMat);
    Procedure RemoveFromBitMatX(Left, Top, Right, Botton: integer;
      var BitMa: TBitMat);
    function RemoveFromBitMat(Left, Top, Right, Botton: integer;
      Input: ArByte2): ArByte2;
    procedure Mat2ImageFMX1(BitMa: TBitMat; Bit: FMX.Graphics.TBitmap);
  Published

  End;

Procedure Register;

implementation

Procedure Register;
begin
  RegisterComponents('ImageProcessing', [TImagePr]);
ENd;

Function TImagePr.ASsignBitMat(biMa: TBitMat): TBitMat;
var
  i, j: integer;
begin
  Result.pixels := biMa.pixels;
  Result.lines := biMa.lines;
  Result.Colr := biMa.Colr;
  DllSetmat(Result);
  If Result.Colr Then
    For i := 0 to Result.lines - 1 do
      For j := 0 to Result.pixels - 1 do
      begin
        Result.Red[i, j] := biMa.Red[i, j];
        Result.Green[i, j] := biMa.Green[i, j];
        Result.Blue[i, j] := biMa.Blue[i, j];
      ENd
  Else
    For i := 0 to Result.lines - 1 do
      For j := 0 to Result.pixels - 1 do
        Result.Picture[i, j] := biMa.Picture[i, j];
End;

procedure TImagePr.BiLoadFromFile;
begin
  Bi.LoadFromFile(Filename);
end;

Function TImagePr.MixTwoBitMats(BitMa1, BitMa2: TBitMat): TBitMat;
var
  Res: TBitMat;
  j, k: integer;
begin
  Res := ASsignBitMat(BitMa1);
  Res.lines := 2 * BitMa1.lines;
  DllSetmat(Res);
  for j := 0 to BitMa1.lines - 1 do
    for k := 0 to BitMa1.pixels - 1 do
    begin
      Res.Picture[j * 2, k] := BitMa1.Picture[j, k];
      Res.Picture[2 * j + 1, k] := BitMa2.Picture[j, k];
    end;
  Result := Res;
end;

Procedure TImagePr.MakeUnBW(var BitMa: TBitMat);
var
  i, j: integer;
begin
  With BitMa do
    If Colr Then
    begin
      setlength(Picture, lines, pixels);
      BitMa.Colr := True;
      For i := 0 to lines - 1 do
        For j := 0 to pixels - 1 do
        begin
          Red[i, j] := Picture[i, j];
          Green[i, j] := Picture[i, j];
          Blue[i, j] := Picture[i, j];
        end;
    End;
End;

Procedure TImagePr.MakeBW(var BitMa: TBitMat);
var
  i, j: integer;
begin
  With BitMa do
    If Colr Then
    begin
      setlength(Picture, lines, pixels);
      BitMa.Colr := false;
      For i := 0 to lines - 1 do
        For j := 0 to pixels - 1 do
          Picture[i, j] := trunc((Red[i, j] + Green[i, j] + Blue[i, j]) / 3);
    End;
End;

Procedure TImagePr.ChangeBW(var BitMa: TBitMat);
var
  i, j: integer;
begin
  With BitMa do
    If Colr Then
    begin
      setlength(Picture, lines, pixels);
      BitMa.Colr := false;
      For i := 0 to lines - 1 do
        For j := 0 to pixels - 1 do
          Picture[i, j] := trunc((Red[i, j] + Green[i, j] + Blue[i, j]) / 3);
      setlength(Red, 0, 0);
      setlength(Green, 0, 0);
      setlength(Blue, 0, 0);

    End;
End;

Procedure TImagePr.outportb(a: word; b: word);
begin
  { asm
    mov dx,a;
    mov ax,b;
    out dx,ax
    End;
  }
End;

Function TImagePr.inport(a: word): word;
var
  t: word;
begin
  { asm
    push dx
    push ax
    mov dx,a;
    in ax,dx
    mov t,ax
    pop ax
    pop dx
    End;
    inport:=t;
  }
End;

Procedure TImagePr.Pixel(x, y: word; C: byte); assembler;
asm
  mov ah,0ch
  mov al,c
  mov dx,x
  mov cx,y
  int 10h
End;

function TImagePr.inttobyte1(a: integer): char;
begin
  inttobyte1 := chr(a mod 256);
End;

Function TImagePr.inttobyte2(a: integer): char;
begin
  inttobyte2 := chr(trunc(a / 256) mod 256);
End;

Function TImagePr.inttobyte3(a: integer): char;
begin
  inttobyte3 := chr(trunc(a / 65536) mod 256);
End;

Function TImagePr.inttobyte4(a: integer): char;
begin
  inttobyte4 := chr(trunc(a / 16777216) mod 256);
End;

Function TImagePr.Extent(Filename: Pchar): Pchar;
var
  i: integer;
  flag: boolean;
  s: String;
begin
  flag := false;

  For i := length(Filename) downTo length(Filename) - 5 Do
  begin
    If Filename[i] = '.' then
      flag := True;
    If flag = false Then
      s := upcase(Filename[i]) + s;
  End;
  Extent := Pchar(s);
End;

Procedure TImagePr.SaveBmpB(Filename: Pchar; Picture: ArByte2;
  pixels, lines: integer);
type
  by = Pchar;
VAR
  bbb, m, i, j: integer;
  f: File;
  cltb: array [1 .. 1024] of byte;
  _header: array [1 .. 14] of char;
  _File_Dir: Array [1 .. 40] of char;
  buff: by;
begin
  bbb := pixels - 4 * trunc(pixels / 4);
  pixels := pixels - bbb;
  _header[1] := #$42;
  _header[2] := #$4D;
  _header[3] := inttobyte1(pixels * lines + 1078);
  _header[4] := inttobyte2(lines * pixels + 1078);
  _header[5] := inttobyte3(lines * pixels + 1078);
  _header[6] := inttobyte4(lines * pixels + 1078);
  { SIZE OF fILE }

  _header[7] := #$00;
  _header[8] := #$00;
  _header[9] := #$00;
  _header[10] := #$00;
  _header[11] := #$36;
  _header[12] := #$04;
  _header[13] := #$00;
  _header[14] := #$00;

  _File_Dir[1] := #$28;
  _File_Dir[2] := #$00;
  _File_Dir[3] := #$00;
  _File_Dir[4] := #$00;

  _File_Dir[5] := inttobyte1(pixels);
  _File_Dir[6] := inttobyte2(pixels);
  _File_Dir[7] := inttobyte3(pixels);
  _File_Dir[8] := inttobyte4(pixels);

  _File_Dir[9] := inttobyte1(lines);
  _File_Dir[10] := inttobyte2(lines);
  _File_Dir[11] := inttobyte3(lines);
  _File_Dir[12] := inttobyte4(lines);

  _File_Dir[13] := #$01;
  _File_Dir[14] := #$00;
  _File_Dir[15] := #$08;
  _File_Dir[16] := #$00;

  _File_Dir[17] := #$00;
  _File_Dir[18] := #$00;
  _File_Dir[19] := #$00;
  _File_Dir[20] := #$00;

  _File_Dir[21] := #$00;
  _File_Dir[22] := #$00;
  _File_Dir[23] := #$00;
  _File_Dir[24] := #$00;

  _File_Dir[25] := #$C4;
  _File_Dir[26] := #$0E;
  _File_Dir[27] := #$00;
  _File_Dir[28] := #$00;

  _File_Dir[29] := #$C4;
  _File_Dir[30] := #$0E;
  _File_Dir[31] := #$00;
  _File_Dir[32] := #$00;

  _File_Dir[33] := #$00;
  _File_Dir[34] := #$01;
  _File_Dir[35] := #$00;
  _File_Dir[36] := #$00;

  _File_Dir[37] := #$00;
  _File_Dir[38] := #$00;
  _File_Dir[39] := #$00;
  _File_Dir[40] := #$00;

  assignfile(f, Filename);
  rewrite(f, 1);
  For i := 1 To 1024 do
  begin
    cltb[i] := trunc(i / 4);
  End;
  m := 0;
  getmem(buff, pixels * lines + 1);
  for i := 0 To lines - 1 do
    for j := 0 to pixels - 1 do
    begin
      buff[m] := char(Picture[lines - i, j]);
      m := m + 1;
    End;
  blockwrite(f, _header, sizeof(_header));
  blockwrite(f, _File_Dir, sizeof(_File_Dir));
  blockwrite(f, cltb, sizeof(cltb));
  blockwrite(f, buff^, pixels * lines);
  freemem(buff);
  CloseFile(f);
end;

Procedure TImagePr.SaveBmpC(Filename: Pchar; BitMa: TBitMat);
type
  by = Pchar;
VAR
  tic, m, i, j: integer;
  f: File;
  _header: array [1 .. 14] of char;
  _File_Dir: Array [1 .. 40] of char;
  buff: by;
begin
  with BitMa do
  begin
    _header[1] := #$42;
    _header[2] := #$4D;
    _header[3] := inttobyte1(pixels * lines + 1078);
    _header[4] := inttobyte2(lines * pixels + 1078);
    _header[5] := inttobyte3(lines * pixels + 1078);
    _header[6] := inttobyte4(lines * pixels + 1078);

    _header[7] := #$00;
    _header[8] := #$00;
    _header[9] := #$00;
    _header[10] := #$00;
    _header[11] := #$36;
    _header[12] := #$04;
    _header[13] := #$00;
    _header[14] := #$00;

    _File_Dir[1] := #$28;
    _File_Dir[2] := #$00;
    _File_Dir[3] := #$00;
    _File_Dir[4] := #$00;

    _File_Dir[5] := inttobyte1(pixels);
    _File_Dir[6] := inttobyte2(pixels);
    _File_Dir[7] := inttobyte3(pixels);
    _File_Dir[8] := inttobyte4(pixels);

    _File_Dir[9] := inttobyte1(lines);
    _File_Dir[10] := inttobyte2(lines);
    _File_Dir[11] := inttobyte3(lines);
    _File_Dir[12] := inttobyte4(lines);

    _File_Dir[13] := #$01;
    _File_Dir[14] := #$00;
    _File_Dir[15] := #$08;
    _File_Dir[16] := #$00;

    _File_Dir[17] := #$00;
    _File_Dir[18] := #$00;
    _File_Dir[19] := #$00;
    _File_Dir[20] := #$00;

    _File_Dir[21] := #$00;
    _File_Dir[22] := #$00;
    _File_Dir[23] := #$00;
    _File_Dir[24] := #$00;

    _File_Dir[25] := #$C4;
    _File_Dir[26] := #$0E;
    _File_Dir[27] := #$00;
    _File_Dir[28] := #$00;

    _File_Dir[29] := #$C4;
    _File_Dir[30] := #$0E;
    _File_Dir[31] := #$00;
    _File_Dir[32] := #$00;

    _File_Dir[33] := #$00;
    _File_Dir[34] := #$01;
    _File_Dir[35] := #$00;
    _File_Dir[36] := #$00;

    _File_Dir[37] := #$00;
    _File_Dir[38] := #$00;
    _File_Dir[39] := #$00;
    _File_Dir[40] := #$00;

    _header[3] := inttobyte1(pixels * lines * 3 + 54);
    _header[4] := inttobyte2(lines * pixels * 3 + 54);
    _header[5] := inttobyte3(lines * pixels * 3 + 54);
    _header[6] := inttobyte4(lines * pixels * 3 + 54);

    _header[12] := #$00;
    _File_Dir[15] := #$18;
    _File_Dir[25] := #$20;
    _File_Dir[26] := #$2E;
    _File_Dir[29] := #$20;
    _File_Dir[30] := #$2E;
    _File_Dir[34] := #$00;

    assignfile(f, Filename);
    rewrite(f, 1);
    m := 0;

    getmem(buff, pixels * lines * 3);
    tic := pixels mod 4;

    for i := 0 To lines - 1 do
    begin
      for j := 0 to pixels - 1 do
      begin
        buff[m] := char(Blue[lines - i, j]);
        inc(m);
        buff[m] := char(Green[lines - i, j]);
        inc(m);
        buff[m] := char(Red[lines - i, j]);
        inc(m);
      End;
      inc(m, tic);
    ENd;
    blockwrite(f, _header, sizeof(_header));
    blockwrite(f, _File_Dir, sizeof(_File_Dir));
    blockwrite(f, buff^, pixels * lines * 3);
    CloseFile(f);
    freemem(buff);
  End;
end;

Function TImagePr.bytetoint(b1, b2, b3, b4: char): integer;
var
  m: integer;
begin
  m := Ord(b1) + $100 * Ord(b2) + $10000 * Ord(b3) + $1000000 * Ord(b4);
  bytetoint := m;
End;

procedure TImagePr.DllSetmat(var BitMa: TBitMat);
begin
  With BitMa DO
    If Colr Then
    begin
      setlength(Red, 0);
      setlength(Green, 0);
      setlength(Blue, 0);
      setlength(Green, lines, pixels);
      setlength(Blue, lines, pixels);
      setlength(Red, lines, pixels);
    End
    Else
      setlength(Picture, lines, pixels);
End;

Procedure TImagePr.unrgb(AColor: TColor; var rr, gg, bb: byte);
begin
  rr := (AColor);
  gg := (trunc(AColor / $100));
  bb := (trunc(AColor / $10000));
End;

Procedure TImagePr.VCL2FMX(b: vcl.Graphics.TBitmap; Res: FMX.Graphics.TBitmap);
var
  ST: TMemoryStream;
begin
  ST := TMemoryStream.Create;
  b.SaveToStream(ST);
  Res.LoadFromStream(ST);
  ST.Free;

end;

Procedure TImagePr.FMX2VCL(b: FMX.Graphics.TBitmap; Res: vcl.Graphics.TBitmap);
var
  data: FMX.Graphics.TBitmapData;
  i, j: integer;
  AlphaColor: TAlphaColor;
begin
  Res := vcl.Graphics.TBitmap.Create;
  Res.SetSize(b.Width, b.Height);
  if (b.Map(TMapAccess.Readwrite, data)) then
    try
      for i := 0 to data.Height - 1 do
      begin
        for j := 0 to data.Width - 1 do
        begin
          AlphaColor := data.GetPixel(j, i);
          Res.Canvas.pixels[j, i] := RGB(TAlphaColorRec(AlphaColor).R,
            TAlphaColorRec(AlphaColor).G, TAlphaColorRec(AlphaColor).b);
        end;
      end;
    finally
      b.Unmap(data);
    end;

  { var
    ST: TMemoryStream;
    begin
    res:=vcl.Graphics.TBitmap.Create;
    Res.Width:=b.Width;
    Res.Height:=b.Height;

    ST := TMemoryStream.Create;
    b.SaveToStream(ST);
    Res.LoadFromStream(ST);
    ST.Free;
  }
end;

Procedure TImagePr.DllOpenBmp1(Filename: Pchar; var BitMa: TBitMat);
begin
  { ima:=Timage.create(mainform);
    ima.Picture.LoadFromFile(Filename);
    ima.AutoSize:=true;
    With  BitMa do
    begin
    colr:=true;
    pixels:=Ima.Width;
    lines:=Ima.Height;
    DllSetmat(BitMa);
    For i:=0 to lines-1 do
    For j:=0 to pixels-1 do
    begin
    unrgb(Ima.Canvas.Pixels[j,i],red[i,j],green[i,j],blue[i,j]);
    End;
    End;
    ima.Free;
  }
End;

Procedure TImagePr.DllOpenBmp(Filename: Pchar; var BitMa: TBitMat;
  var kk: integer);
type
  arry2ofbyte = array [1 .. 2] of byte;

label
  a1, a2, a3;
var
  tici, tic, size, n, a, i, j, m: integer;
  f: File;
  buff: Pchar;

  Function doub(b2, b1: char): word;
  begin
    doub := Ord(b1) + 256 * Ord(b2);
  End;

  Function divi(b: char): arry2ofbyte;
  var
    a1, a2: byte;
  begin
    a2 := trunc(Ord(b) / 16);
    a1 := Ord(b) - 16 * a2;
    divi[1] := a1;
    divi[2] := a2;
  End;

begin
  assignfile(f, Filename);
  reset(f, 1);
  size := FileSize(f);
  getmem(buff, size);
  blockread(f, buff^, size);
  CloseFile(f);
  m := bytetoint(buff[10], buff[11], buff[12], buff[13]);
  BitMa.pixels := bytetoint(buff[18], buff[19], buff[20], buff[21]);
  BitMa.lines := bytetoint(buff[22], buff[23], buff[24], buff[25]);
  kk := bytetoint(buff[28], buff[29], #0, #0);
  // a:=2*m;
  case kk of
    4:
      begin
        BitMa.Colr := false;
        for i := 0 to 15 do
        begin
          If ((buff[4 * i + 54] <> buff[4 * i + 55]) Or
            (buff[4 * i + 54] <> buff[4 * i + 56]) or
            (buff[4 * i + 55] <> buff[4 * i + 56])) Then
          begin
            BitMa.Colr := True;
            goto a1;
          End;
        End;

      a1:
        BitMa.pixels := BitMa.pixels + 7;
        BitMa.lines := BitMa.lines + 7;
        setlength(BitMa.Picture, BitMa.lines, BitMa.pixels);
        With BitMa do
        begin
          if not(Colr) then
            For i := 0 To lines - 1 do
              For j := 0 To pixels - 1 Do
              begin
                Picture[lines - i, j] := Ord(buff[m - 1]);
                m := m + 1;
              End
          else

          begin
            n := 1;
            For i := 0 To lines - 1 do
              For j := 0 To pixels - 1 Do
              begin
                Blue[lines - i, j] := Ord(buff[4 * divi(buff[m - 1])[n] + 54]);
                Green[lines - i, j] := Ord(buff[4 * divi(buff[m - 1])[n] + 55]);
                Red[lines - i, j] := Ord(buff[4 * divi(buff[m - 1])[n] + 56]);
                If n = 1 Then
                  n := 2
                Else
                begin
                  n := 1;
                  m := m + 1;
                End;
              End;
          End;
        ENd;
      End;
    8:
      With BitMa do
      begin
        Colr := false;
        for i := 0 to 255 do
        begin
          If ((buff[4 * i + 54] <> buff[4 * i + 55]) Or
            (buff[4 * i + 54] <> buff[4 * i + 56]) or
            (buff[4 * i + 55] <> buff[4 * i + 56])) Then
          begin
            Colr := True;
            goto a2;
          End;
        End;
      a2:
        DllSetmat(BitMa);

        if not(Colr) then
          For i := 0 To lines - 1 do
            For j := 0 To pixels - 1 Do
            begin
              Picture[lines - i, j] := Ord(buff[m]);
              inc(m);
            End
        else
        begin
          tic := pixels mod 4;
          For i := 0 To lines - 1 do
          begin
            For j := 0 To pixels - 1 Do
            begin
              tici := Ord(buff[m - 1]);
              Blue[lines - i, j] := Ord(buff[4 * tici + 54]);
              Green[lines - i, j] := Ord(buff[4 * tici + 55]);
              Red[lines - i, j] := Ord(buff[4 * tici + 56]);
              inc(m);
            End;
            inc(m, tic);
          End;
        End;
      ENd;
    16:
      With BitMa do
      begin
        Colr := false;
        for i := 0 to trunc(Exp(kk * ln(2))) - 1 do
        begin
          If ((buff[4 * i + 54] <> buff[4 * i + 55]) Or
            (buff[4 * i + 54] <> buff[4 * i + 56]) or
            (buff[4 * i + 55] <> buff[4 * i + 56])) Then
          begin
            Colr := True;
            goto a3;
          End;
        End;
      a3:
        if not(Colr) then
          For i := 0 To lines - 1 do
            For j := 0 To pixels - 1 Do
            begin
              Picture[lines - i, j] := Ord(buff[m - 1]);
              m := m + 1;
            End
        else
        begin
          // setmat(LL,PP);
          DllSetmat(BitMa);
          For i := 0 To lines - 1 do
            For j := 0 To pixels - 1 Do
            begin
              a := doub(buff[m], buff[m - 1]);
              Red[lines - i, j] := Ord(buff[4 * a + 55]);
              Green[lines - i, j] :=
                ((abs(Ord(buff[4 * a + 55]) + Ord(buff[4 * a + 57]))));
              Blue[lines - i, j] := Ord(buff[4 * a + 56]);
              m := m + 2;
            End;
        End;
      ENd;
    24:
      With BitMa do
      begin
        Colr := True;
        tic := pixels mod 4;
        DllSetmat(BitMa);

        For i := 0 To lines - 1 do
        begin
          For j := 0 To pixels - 1 Do
          begin
            Blue[lines - i, j] := Ord(buff[m]);
            inc(m);
            Green[lines - i, j] := Ord(buff[m]);
            inc(m);
            Red[lines - i, j] := Ord(buff[m]);
            inc(m);
          end;
          m := m + tic;
        End;
      End;
  End;

  freemem(buff);
End;

Function TImagePr.Distance(a, b, C, D: integer): integer;
var
  aa: integer;
begin
  aa := Sqr((a - C) * (a - C) + (b - D) * (b - D));
  Distance := aa;
End;

{ Procedure TImagePr.FMX2VCL(B:FMX.Types.Tbitmap;Res: vcl.Graphics.TBitmap);
  //var
  //  ST : TMemoryStream;
  //  Bit : vcl.Graphics.TBitmap;
  //   Jp : TJPEGImage;
  //  MyFormat : Word;
  //  AData:NativeUInt;
  //  APalette : HPALETTE;
  begin
  //  Jp:=TJPEGImage.Create;
  //  jp.Assign(B);
  //   Res.Assign(Jp);
  //    b.
  //    b.SaveToClipboardFormat(MyFormat,AData,APalette);
  //    ClipBoard.SetAsHandle(MyFormat,AData);
  //  ShowMessage('hello');
  { Bit := vcl.Graphics.TBitmap.Create;
  ST:=TMemoryStream.Create;
  b.SaveToStream(St);
  Bit.LoadFromStream(St);
  Res.Assign(Bit);
  Bit.Free;
  ST.Free;
}

{ { B.SaveToFile('Temp.bmp');
  Res.LoadFromFile('Temp.bmp');

  end;
}

{ {
  Procedure TImagePr.FMXImage2mat(Bi:FMX.Types.Tbitmap;var BitMa:TBitMat);
  var
  prgb:PRGBTripleArray;
  i,j:integer;
  r,g,b:Byte;
  begin

  With BitMa do
  begin
  Pixels:=Bi.Width;
  Lines:=Bi.Height;
  prgb:=FMXImage2Pointer(Bi);

  Colr:=false;
  For j:=0 to Bi.Height-1 do
  For i:=0 to Bi.Width-1 do
  begin
  R:=prgb[j]^.rgbtRed;
  G:=prgb[j]^.rgbtGreen;
  B:=prgb[j]^.rgbtBlue;
  If (abs(r-g)>1)Or(Abs(r-b)>1) THen
  Colr:=true;
  inc(prgb[j]);
  End;
  DllSetmat(BitMa);
  prgb:=FMXImage2Pointer(Bi);
  If Colr Then
  For j:=0 to Bi.Height-1 do
  For i:=0 to Bi.Width-1 do
  begin
  Red[j,i]:=prgb[j]^.rgbtRed;
  Green[j,i]:=prgb[j]^.rgbtGreen;
  Blue[j,i]:=prgb[j]^.rgbtBlue;
  inc(prgb[j]);
  ENd
  Else
  For j:=0 to Bi.Height-1 do
  For i:=0 to Bi.Width-1 do
  begin
  Picture[j,i]:=prgb[j]^.rgbtRed;
  inc(prgb[j]);
  ENd;
  //  Bb.Free;
  End;


  ENd;

}

Procedure TImagePr.Image2MatFMX(Bi: FMX.Graphics.TBitmap; var BitMa: TBitMat);
var
  data: FMX.Graphics.TBitmapData;
  i, j: integer;
  AlphaColor: TAlphaColor;
begin
  // Res:=VCL.Graphics.TBitmap.Create;
  BitMa.pixels := Bi.Width;
  BitMa.lines := Bi.Height;
  BitMa.Colr := True;
  DllSetmat(BitMa);

  if (Bi.Map(TMapAccess.Readwrite, data)) then
    try
      for i := 0 to data.Height - 1 do
      begin
        for j := 0 to data.Width - 1 do
        begin
          AlphaColor := data.GetPixel(j, i);
          BitMa.Red[i, j] := TAlphaColorRec(AlphaColor).R;
          BitMa.Green[i, j] := TAlphaColorRec(AlphaColor).G;
          BitMa.Blue[i, j] := TAlphaColorRec(AlphaColor).b;

        end;
      end;
    finally
      Bi.Unmap(data);
    end;

  { var
    vclBi :  vcl.graphics.TBitmap;
    begin
    vclBi:=vcl.Graphics.TBitmap.Create;
    FMX2VCL(Bi,vclBi);
    vclBi.PixelFormat:=pf24bit;
    Image2Mat(vclBi,BitMa);
  }
end;

Procedure TImagePr.Image2Mat(Bi: TBitmap; var BitMa: TBitMat);
var
  prgb: PRGBTripleArray;
  i, j: integer;
  R, G, b: byte;
  mb: TMbyteArray;
begin
  if Bi.PixelFormat = pf24bit then

    With BitMa do
    begin
      pixels := Bi.Width;
      lines := Bi.Height;
//        ShowMessage(IntToStr(Pixels)+'--'+IntToStr(Lines));

      prgb := Image2Pointer(Bi, mb);

      Colr := false;
      For j := 0 to Bi.Height - 1 do
        For i := 0 to Bi.Width - 1 do
        begin
          R := prgb[j]^.rgbtRed;
          G := prgb[j]^.rgbtGreen;
          b := prgb[j]^.rgbtBlue;
          If (abs(R - G) > 1) Or (abs(R - b) > 1) THen
            Colr := True;
          inc(prgb[j]);
        End;
      DllSetmat(BitMa);
      prgb := Image2Pointer(Bi, mb);
      If Colr Then
        For j := 0 to Bi.Height - 1 do
          For i := 0 to Bi.Width - 1 do
          begin
            Red[j, i] := prgb[j]^.rgbtRed;
            Green[j, i] := prgb[j]^.rgbtGreen;
            Blue[j, i] := prgb[j]^.rgbtBlue;
            inc(prgb[j]);
          ENd
      Else
        For j := 0 to Bi.Height - 1 do
          For i := 0 to Bi.Width - 1 do
          begin
            Picture[j, i] := prgb[j]^.rgbtRed;
            inc(prgb[j]);
          ENd;
    End;

  if Bi.PixelFormat = pf8bit then
    With BitMa do
    begin
      pixels := Bi.Width;
      lines := Bi.Height;
      prgb := Image2Pointer(Bi, mb);

      Colr := false;
      DllSetmat(BitMa);
      For j := 0 to Bi.Height - 1 do
        For i := 0 to Bi.Width - 1 do
        begin
          Picture[j, i] := mb[j][i];
          // inc(mb[j]);
        ENd;
    End;

ENd;

{ Function TImagePr.FMXImage2Pointer(Bit:FMX.Types.Tbitmap):PRGBTripleArray;
  var
  MByteArray:TMbyteArray;
  j:integer;
  begin
  {  SetLength(Result,Bit.Height);
  for j := 0 to Bit.Height -1 do
  begin
  MByteArray[j] := Bit.ScanLine[j];
  Result[j]:=PrgbTriple(MByteArray[j]);
  End;
}
// end;

Function TImagePr.Image2Pointer(Bit: TBitmap; var MByteArray: TMbyteArray)
  : PRGBTripleArray;
var

  j: integer;
begin
  setlength(Result, Bit.Height);

  for j := 0 to Bit.Height - 1 do
  begin
    MByteArray[j] := Bit.ScanLine[j];
    Result[j] := PrgbTriple(MByteArray[j]);
  End;
end;

Procedure TImagePr.SaveMatAsJpeg(Filename: String; BitMa: TBitMat);
var
  Bit: TImage;
  Jp: TJpegImage;
begin
  Bit := TImage.Create(Application);
  Jp := TJpegImage.Create;
  Mat2Image(BitMa, Bit.Picture.Bitmap);
  Jp.Assign(Bit.Picture.Graphic);
  Jp.SaveToFile(Filename);
  Bit.Free;
  Jp.Free;
ENd;

procedure TImagePr.StrechImg(var Bit: TBitmap; P, l: integer);
var
  b: TBitmap;
begin
  b := TBitmap.Create;
  b.Width := P;
  b.Height := l;

  b.Canvas.StretchDraw(Rect(0, 0, P, l), Bit);

  Bit.Assign(b);

  b.Free;
end;

procedure TImagePr.StrechMat;
var
  b1, b2: TBitmap;
begin
  b1 := TBitmap.Create;
  b2 := TBitmap.Create;

  b1.Assign(hidImage.Picture.Graphic);
  b2.Assign(hidImage.Picture.Graphic);
  Mat2Image(BitMa, b1);

  b2.Width := trunc(P);
  b2.Height := trunc(l);

  b2.Canvas.StretchDraw(Rect(0, 0, b2.Width, b2.Height), b1);

  Image2Mat(b2, BitMa);

  b1.Free;
  b2.Free;

end;

procedure TImagePr.MakeImageXX(Bi: TBitmap);
var
  Jp: TJpegImage;
begin
  Jp := TJpegImage.Create;
  Jp.Assign(Bi);

  Bi.Assign(Jp);

  Jp.Free;
end;

procedure TImagePr.MakeImageX(Bi: TBitmap);
var
  b: TBitmap;
  Sr, Ds: TRect;
begin
  b := TBitmap.Create;
  Sr := Rect(0, 0, Bi.Width, Bi.Height);
  Ds := Rect(0, 0, Bi.Width, Bi.Height);

  b.Width := Bi.Width;
  b.Height := Bi.Height;
  b.Canvas.CopyRect(Ds, Bi.Canvas, Sr);

  Bi.Assign(b);
  b.Free;
end;

procedure TImagePr.MakeImage(Bi: TBitmap; Path: String);
var
  Jp: TJpegImage;
begin
  Jp := TJpegImage.Create;
  Jp.Assign(Bi);
  try
    Jp.SaveToFile(Path + 'temp.jpg');
    Jp.LoadFromFile(Path + 'Temp.Jpg');
  except
    Jp.SaveToFile('temp.jpg');
    Jp.LoadFromFile('Temp.Jpg');
  end;
  Bi.Assign(Jp);
  Jp.Free;
end;

procedure TImagePr.PGM2Mat(CONST Filename: STRING; var Mat: TBitMat);
var
  PGMStream: TFileStream;
  s: String;
  PGMWidth: CARDINAL;
  PGMHeight: CARDINAL;
  PGMBuffer: ARRAY [0 .. 65535] OF byte;
  W: word;
  i, j: integer;
  FUNCTION GetNextPGMLine: STRING;
  VAR
    C: char;
  BEGIN
    Result := '';
    REPEAT
      PGMStream.Read(C, 1);
      IF C <> #$0A THEN
        Result := Result + C UNTIL C = #$0A;
      // Look for Line Feed used in UNIX file
    END { GetNextPGMLine };
    begin
      PGMStream := TFileStream.Create(Filename, fmOpenRead);
      TRY
        PGMStream.Seek(0, soFromBeginning);
        s := GetNextPGMLine;
        Delete(s, 1, POS(' ', s));
        PGMWidth := StrToInt(COPY(s, 1, POS(' ', s) - 1));
        Delete(s, 1, POS(' ', s));
        PGMHeight := StrToInt(COPY(s, 1, POS(' ', s) - 1)); // StrToInt(s);

        Mat.pixels := PGMWidth;
        Mat.lines := PGMHeight;
        Mat.Colr := True;
        DllSetmat(Mat);
        Mat.Colr := false;
        DllSetmat(Mat);

        PGMStream.Seek(PGMStream.size - PGMHeight * PGMWidth * 2,
          soFromBeginning);
        FOR j := 0 TO PGMHeight - 1 DO
        BEGIN
          PGMStream.Read(PGMBuffer, PGMWidth * 2);

          FOR i := 0 TO PGMWidth - 1 DO
          BEGIN
            Mat.Red[j, i] := PGMBuffer[2 * i + 1];
            Mat.Green[j, i] := PGMBuffer[2 * i];
            Mat.Blue[j, i] := PGMBuffer[2 * i];

            W := PGMBuffer[2 * i + 1] + 256 * PGMBuffer[2 * i];
            Mat.Picture[j, i] := trunc(W / 65535 * 255);

          END;

        end;

      finally
        PGMStream.Free
      end;

    end;

  procedure TImagePr.Mat2ImageFMX(BitMa: TBitMat; Bit: FMX.Graphics.TBitmap);
    var
      data: TBitmapData;
      i, j: integer;
      AlphaColor: TAlphaColor;
    begin
      // Res:=VCL.Graphics.TBitmap.Create;
      // BitMa.Pixels:=Bi.Width;
      // BitMa.Lines:=Bi.Height;
      // BitMa.Colr:=True;
      // DllSetmat(BitMa);
      // Bit:=FMX.Graphics.TBitmap.Create;
      Bit.SetSize(0, 0);
      Bit.SetSize(BitMa.pixels, BitMa.lines);


      if (Bit.Map(TMapAccess.Readwrite, data)) then
        if BitMa.Colr then
          for i := 0 to BitMa.lines - 1 do
          begin
            for j := 0 to BitMa.pixels - 1 do
            begin
              AlphaColor:=TAlphaColorRec.Black;
              TAlphaColorRec(AlphaColor).R := BitMa.Red[i, j];
              TAlphaColorRec(AlphaColor).G := BitMa.Green[i, j];
              TAlphaColorRec(AlphaColor).b := BitMa.Blue[i, j];

              data.SetPixel(j, i, AlphaColor);

            end;
          end
        else
          for i := 0 to BitMa.lines - 1 do
          begin
            for j := 0 to BitMa.pixels - 1 do
            begin
              AlphaColor:=TAlphaColorRec.Black;

              TAlphaColorRec(AlphaColor).R := BitMa.Picture[i, j];
              TAlphaColorRec(AlphaColor).G := BitMa.Picture[i, j];
              TAlphaColorRec(AlphaColor).b := BitMa.Picture[i, j];

              data.SetPixel(j, i, AlphaColor);

            end;
          end;

      // finally
      Bit.Unmap(data);

    end;

    Procedure TImagePr.Mat2ImageFMX1(BitMa: TBitMat; Bit: FMX.Graphics.TBitmap);
    var
      VCLBit: vcl.Graphics.TBitmap;
    begin
      //
      VCLBit := vcl.Graphics.TBitmap.Create;
      Mat2Image(BitMa, VCLBit);
      // VCLBit.PixelFormat:=pf24bit;

      // Bit:=FMX.Graphics.TBitmap.Create;

      VCL2FMX(VCLBit, Bit);
      VCLBit.Free;

    end;

    Procedure TImagePr.Mat2Image(BitMa: TBitMat; Bit: TBitmap);
    var
      prgb: PRGBTripleArray;
      i, j: integer;
      mb: TMbyteArray;
    begin
      With BitMa do
      begin
        If (pixels = 0) or (lines = 0) Then
        begin
          MessageDlg('No Picture Matrix In ', mtError, mbOKCancel, 0);
          Exit;
        ENd;
        // Bit.Assign(Image.Picture.Graphic);

        Bit.Width := BitMa.pixels;
        Bit.Height := BitMa.lines;
        prgb := Image2Pointer(Bit, mb);
        IF BitMa.Colr THen
          For j := 0 to Bit.Height - 1 do
            For i := 0 to Bit.Width - 1 do
            begin
              prgb[j]^.rgbtRed := Red[j, i];
              prgb[j]^.rgbtGreen := Green[j, i];
              prgb[j]^.rgbtBlue := Blue[j, i];
              inc(prgb[j]);
            End
        Else
          For j := 0 to Bit.Height - 1 do
            For i := 0 to Bit.Width - 1 do
            begin
              prgb[j]^.rgbtRed := Picture[j, i];
              prgb[j]^.rgbtGreen := Picture[j, i];
              prgb[j]^.rgbtBlue := Picture[j, i];
              inc(prgb[j]);
            End;
      End;
    End;

    Function TImagePr.Are2ToGrayBitmat(A:Are2):Tbitmat;
    var
     i,j,l , P : Integer;
     Ma , Mi : Real;
    begin
    //
     l:=length(A);
     p := Length(A[0]);
      Ma:=-1000000;
      Mi:=1000000;

      for I := 0 to l-1 do
        for J := 0 to p-1 do
           begin
             if A[i,j]>ma then    Ma:=A[i,j];
             if A[i,j]<mi then    Mi:=A[i,j];

           end;

      for I := 0 to l-1 do
        for J := 0 to p-1 do
           begin
             A[i,j]:=(A[i,j]-mi)/(ma-mi)*255;

           end;

     with Result do
      begin
        Lines:=l;
        Pixels:=p;
        Colr:=False;
        SetLength(Picture,l,p);
          for I := 0 to l-1 do
            for J := 0 to p-1 do
               begin
                 Picture[i,j]:=trunc(A[i,j]);

               end;
      end;

    end;


    Procedure TImagePr.SavebmpMa(Filename: String; BitMa: TBitMat);
    begin
      With BitMa do

        If not(Colr) THen
        begin
          SaveBmpB(Pchar(Filename), Picture, pixels, lines);
        End
        Else
        begin
          SaveBmpC(Pchar(Filename), BitMa);
        End;
    ENd;

    Function TImagePr.hex(aa: char): string;
    var
      base, i: integer;
      s: string;
      a: integer;
    begin
      a := Ord(aa);
      s := '';
      i := trunc(a / 16);
      If i > 9 Then
        s := s + chr(64 + (i - 9))
      Else
        s := s + inttostr(i);
      base := a mod 16;
      i := base;
      If i > 9 Then
        s := s + chr(64 + (i - 9))
      Else
        s := s + inttostr(i);
      hex := s;
    End;

    procedure TImagePr.Getinfo(Filename: String; var P, l: integer);
    var
      fileheader: TBitmapfileheader;
      infoheader: TBitmapinfoheader;
      s: TFileStream;
    begin
      s := TFileStream.Create(Filename, fmOpenRead);
      try
        s.Read(fileheader, sizeof(fileheader));
        s.Read(infoheader, sizeof(infoheader));
      finally
        s.Free;
      end;
      P := infoheader.biWidth;
      l := infoheader.biHeight;
    end;

    Function TImagePr.Doresize(pic: ArByte2; P, l: integer): ArByte2;

    var
      pix, lin, k, i, j, f: integer;
      n, Wx: real;
      Rpic, ar: ArByte2;
    begin
      lin := length(pic);
      pix := length(pic[0]);

      setlength(ar, lin, P);
      n := (pix) / P;
      f := Round(1 / n);
      For k := 0 to lin - 1 Do
      begin
        For i := 0 to P - f - 1 do
        begin
          j := trunc(i * n);
          Wx := i * n - j;
          ar[k, i] := trunc((pic[k, j] * (1 - Wx) + pic[k, j + 1] * Wx));
        End;
        for i := 0 to f - 1 do

          ar[k, P - 1 - i] := pic[k, pix - 1];
      end;

      setlength(Rpic, l, P);
      n := (lin) / l;
      f := Round(1 / n);
      For k := 0 to P - 1 Do
      Begin
        For i := 0 to l - f - 1 do
        begin
          j := trunc(i * n);
          Wx := i * n - j;
          Rpic[i, k] := trunc(ar[j, k] * (1 - Wx) + ar[j + 1, k] * Wx);
        End;
        for i := 0 to f - 1 do
          Rpic[l - 1 - f, k] := ar[lin - 1, k];
      End;
      Result := Rpic;
    End;

    procedure TImagePr.DrawHistogram(BitMa: TBitMat; Chart: TChart;
      var Re, Gr, Bl: Ari);
    var

      i, j: integer;
    begin
      With BitMa do
      begin
        setlength(Re, 256);
        If Colr Then
        begin
          setlength(Gr, 256);
          setlength(Bl, 256);
          for i := 0 to pixels - 1 do
            for j := 0 to lines - 1 do
            begin
              Re[Red[j, i]] := Re[Red[j, i]] + 1;
              Gr[Green[j, i]] := Gr[Green[j, i]] + 1;
              Bl[Blue[j, i]] := Bl[Blue[j, i]] + 1;
            end;
        end
        Else
        begin
          for i := 0 to pixels - 1 do
            for j := 0 to lines - 1 do
              Re[Picture[j, i]] := Re[Picture[j, i]] + 1;

        end;

        If Colr Then
        begin
          Chart.Series[0].Clear;
          Chart.Series[1].Clear;
          Chart.Series[2].Clear;
          for i := 0 to 256 - 1 do
          begin
            Chart.Series[0].Add(Re[i], '', clRed);
            Chart.Series[1].Add(Gr[i], '', clGreen);
            Chart.Series[2].Add(Bl[i], '', clBlue);
          end
        end
        Else
        begin
          Chart.Series[0].Clear;
          for i := 0 to 256 - 1 do
            Chart.Series[0].Add(Re[i], '', clBlack);

        end;
      end; { With BitMa }
    end;

    procedure TImagePr.ColorCutter(Var BitMa: TBitMat; Colors: Ar6i;
      Offset: byte);
    var
      j, i: integer;
      a: Ar6i;
      Hu: byte;
    begin
      // FilterC.Dorgb2hsi(BitMa);
      a := Colors;
      With BitMa do
      begin
        For i := 0 to lines - 1 do
          For j := 0 to pixels - 1 do
          begin
            Hu := trunc(hue[i, j]);
            Hu := Hu + Offset;

            If (Hu < a[1]) Or (Hu > a[2]) or (Sat[i, j] < a[3]) Or
              (Sat[i, j] > a[4]) or (int[i, j] < a[5]) Or
              (int[i, j] > a[6]) Then
            begin
              Red[i, j] := 0;
              Green[i, j] := 0;
              Blue[i, j] := 0;
            End;
          End;
      End;
    end;

    procedure TImagePr.CreateBi;
    begin
      Bi := TBitmap.Create;
    end;

    procedure TImagePr.ResizeX(var BitMa: TBitMat; P, l: integer);
    begin
      with BitMa do
        If not Colr then
          Picture := Doresize(Picture, P, l)
        Else
        begin
          Red := Doresize(Red, P, l);
          Green := Doresize(Green, P, l);
          Blue := Doresize(Blue, P, l);
        ENd;

      BitMa.pixels := P;
      BitMa.lines := l;
    end;

    function TImagePr.RemoveFromBitMat(Left, Top, Right, Botton: integer;
      Input: ArByte2): ArByte2;
    var
      i: integer;
      j: integer;
    begin
      setlength(Result, length(Input) - Top - Botton,
        length(Input[0]) - Left - Right);

      for j := Top to length(Input) - Botton - 1 do
        for i := Left to length(Input[0]) - Right - 1 do
        begin
          Result[j - Top, i - Left] := Input[j, i];

        end;

    end;

    Procedure TImagePr.RemoveFromBitMatX(Left, Top, Right, Botton: integer;
      var BitMa: TBitMat);
    begin
      with BitMa do
      begin
        If not Colr then
          Picture := RemoveFromBitMat(Left, Top, Right, Botton, Picture)
        Else
        begin
          Red := RemoveFromBitMat(Left, Top, Right, Botton, Red);
          Green := RemoveFromBitMat(Left, Top, Right, Botton, Green);
          Blue := RemoveFromBitMat(Left, Top, Right, Botton, Blue);
        ENd;
        pixels := pixels - Left - Right;
        lines := lines - Top - Botton;

      end;

    end;

    Procedure TImagePr.ZoomOut2X(var BitMa: TBitMat);
    begin
      with BitMa do
        If not Colr then
          Picture := doZoomOut2(Picture)
        Else
        begin
          Red := doZoomOut2(Red);
          Green := doZoomOut2(Green);
          Blue := doZoomOut2(Blue);
        ENd;

      BitMa.pixels := trunc(BitMa.pixels / 2);
      BitMa.lines := trunc(BitMa.lines / 2);

    end;

    function TImagePr.doZoomOut2(Input: ArByte2): ArByte2;
    var
      i, j, W, h: integer;
    begin
      setlength(Result, trunc(length(Input) / 2), trunc(length(Input[0]) / 2));
      for i := 0 to length(Result) - 1 do
        for j := 0 to length(Result[0]) - 1 do
        begin
          Result[i, j] := Input[2 * i, 2 * j];
        end;

    end;

    function TImagePr.Mat2Gray(Input: Are2): ArByte2;
    var
      Imin, Imax: real;
      i: integer;
      j: integer;
      Re: ArByte2;
    begin
      Imin := 1000000;
      Imax := 0;
      setlength(Re, length(Input), length(Input[0]));

      for i := 0 to length(Input) - 1 do
        for j := 0 to length(Input[0]) - 1 do
        begin
          if Imin > Input[i, j] then
            Imin := Input[i, j];
          if Imax < Input[i, j] then
            Imax := Input[i, j];

        end;

      for i := 0 to length(Input) - 1 do
        for j := 0 to length(Input[0]) - 1 do
        begin
          Re[i, j] := trunc((Input[i, j] - Imin) / (Imax - Imin) * 255);

        end;
      Result := Re;

    end;

    function TImagePr.AssignArbyte2(a: ArByte2): ArByte2;
    var
      i, j: integer;
    begin
      setlength(Result, length(a), length(a[0]));

      For j := 0 to length(a) - 1 do
        For i := 0 to length(a[0]) - 1 do
          Result[j, i] := a[j, i];

    end;

end.
