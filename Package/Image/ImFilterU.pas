





























unit ImFilterU;

interface

Uses
  ImagePrU,
  vcl.Dialogs,
  vcl.Forms,math,
  Windows,
  SysUtils,
  vcl.Graphics,
  TypeCastU,
  Classes;


 type
    TimageFilter=class(TComponent)
       procedure AverageX(var BitMa: TBitMat);
       procedure AverageSX(var BitMa: TBitMat; L: Integer);
       procedure MeanX(var BitMa: TBitMat);
       procedure GaussianX(var BitMa: TBitMat);
       procedure CannyX(var BitMa: TBitMat);
       procedure MakeBinX(var BitMa: TBitMat; Lav: Integer);
       Procedure ExHistogramX(var BitMa:TBitMat);
       procedure HighBroostX(var BitMa: TBitMat;Alpha:real);
       Procedure HemorfingX(Var BitMa : Tbitmat);

       Procedure DoHSI2RGB(var BitMa:TBitMat);
//       procedure Dorgb2hsi(var BitMa:TBitMat);
       Procedure RGB2HSI(var BitMa:TBitMat);
       Procedure SinHistogramX_up(var Bitma:TBitMat;Level:Integer);
       Procedure SinHistogramX_Down(var Bitma:TBitMat);
       procedure BrightnessX_Down(var Bitma: TBitMat; C: Byte);
       procedure BrightnessX_Up(var Bitma: TBitMat; C: Byte);
       procedure Invert(var BitMa: TBitMat);
       procedure MakePicAdditiveSaltyNoisy(Rate: Integer; var BitMa: TBitMat);
       procedure MakePicCheckered(Size, Ample: integer; var BitMa: TBitmat);
       Procedure DoTriming(leftt,topp,widthh,heightt:integer;var BitMa:TBitMat);
       Procedure  Area(lav:integer;var BitMa:TBitMat);
       function CalcArea(Sx, Sy, lav: integer; var BitMa: TBitMat): TIObject;
       Procedure DoInt(Value:integer;var BitMa:TBitMat);
       procedure DelPixelsX(var BitMa: TBitMat);
       procedure LineThiningX(var BitMa: TBitMat);
       procedure LaplasX(var BitMa: TBitMat);
       procedure F1_8_1X(var BitMa: TBitMat);
       procedure F1_4_1X(var BitMa: TBitMat);
       procedure Frei_ChanX(var BitMa: TBitMat);
       procedure SabelX(var BitMa: TBitMat);
       procedure PrewittX(var BitMa: TBitMat);
       procedure DelPixels2X(var BitMa: TBitMat);
       Function FindObject(BitMa:TBitMat;var A,B : TPoint):Boolean;
       Procedure FindObjectCenter(BitMa: TBitMat; var Left,Top: Word);
       procedure Sharpen(sbm, tbm: TBitmap; alpha: Single);
       procedure IntCancelationX(var BitMa: TBitMat);
       function Sumation(BitMa1, BitMa2: TBitMat;a,b:real): TBitMat;
    function DifferentX(BitMa1, BitMa2: TBitMat): Tbitmat;

     function Canny(Input: ArByte2): ArByte2;
     Function Average(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function Gaussian(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function DelPixels(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function DelPixels2(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function DoOR(r,g,b:ArByte2;pixels,lines,lav:integer):ArByte2;
     Function ExHistogram(picture:ArByte2;pixels,lines:integer):ArByte2;
     Procedure ExHistogramC(var BitMa:TBitMat);
     Function F1_4_1(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function F1_8_1(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function Frei_Chan(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function Hemorfing(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function HighBrust(picture:ArByte2;Alpha:real;pixels,lines:integer):ArByte2;
     Function Laplas(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function LineThining(Picture:ArByte2):ArByte2;
     Function MakeBin(picture:ArByte2;lav:integer):ArByte2;
     Function MakeBinBoolean(picture:ArByte2;lav:integer):ArBoolean2;
     Function MakeBooleanMat(picture:ArBoolean2):ArByte2;
     Function Prewitt(picture:ArByte2;pixels,lines:integer):ArByte2;
     Function Sabel(picture:ArByte2;pixels,lines:integer):ArByte2;
     function SinHistogram_up(Input: ArByte2;Level : Byte): ArByte2;
     function SinHistogram_Down(Input: ArByte2): ArByte2;
     function Br_Downi(Input: ArByte2; C: Byte): ArByte2;
     function Br_Upi(Input: ArByte2; C: Byte): ArByte2;
     function Delation(input: ArBooLean2; N: byte): ArBoolean2;
     function Erosion(input: ArBooLean2; N: byte): ArBoolean2;
     procedure MakePicGaussyNoisy(Rate: Integer; V: Byte;var BitMa: TBitMat);
     procedure NextPoint(BitMa: TBitMat; Lav: integer; var i, j,n: integer);
     function Rotate(Bitmat: TBitMat; Teta: Real): TBitMat;
     function Sorti(Input: Ari; UpNotDown: Boolean): Ari;
    function Mean(picture: ArByte2; pixels, lines: integer): ArByte2;
    function CalcAreaPoint(A, B: Tpoint):Integer ;
    procedure WaterNoiseX(var BitMa: TBitMat; N: Integer);
    procedure DoRGB2HSI(R, G, B: byte; var Hue, Sat, Int: real);
    procedure rgb2hsi1(var BitMa: TBitMat);
    function MeanArPicX(ArPics: ArBitMat; StartFrame, StopFrame : Integer): Tbitmat;
    function Rotate90(Input: ArByte2): ArByte2;
    procedure Rotate90X(var BitMa: TBitMat);
    function Rotate_90(Input: ArByte2): ArByte2;
    procedure Rotate_90X(var BitMa: TBitMat);
    function MirrorH(Input: ArByte2): ArByte2;
    function MirrorV(Input: ArByte2): ArByte2;
    procedure MirrorHX(var BitMa: TBitMat);
    procedure MirrorVX(var BitMa: TBitMat);
    procedure Rotate180X(var BitMa: TBitMat);
    function Rotate180(Input: ArByte2): ArByte2;
     function DoSkewXR(pic: ArByte2; P1, P2: integer): ArByte2;
    procedure SkewXR(var BitMa: TBitMat; P1, P2: Integer);
     function DoSkewXL(pic: ArByte2; P1, P2: integer): ArByte2;
    procedure SkewXL(var BitMa: TBitMat; P1, P2: Integer);
     function DoSkewYD(pic: ArByte2; L1, L2: integer): ArByte2;
    procedure SkewYD(var BitMa: TBitMat; L1, L2: Integer);
     function DoSkewYU(pic: ArByte2; L1, L2: integer): ArByte2;
    procedure SkewYU(var BitMa: TBitMat; L1, L2: Integer);
     function REqHistogram(Picture: ArByte2; Window,Level : Integer): ArByte2;
    procedure REqHistogramX(var BitMa: TBitMat; Window,Level : Integer);
    function Totalpoints(BitMa: TbitMat): Real;
    function AverageS(Picture: Arbyte2; L: Integer): ArByte2;
    function FindObjectRect(BitMa: TBitMat; var A, B, C, D: TPoint): Boolean;
    function CalcDeviationValue(Picture: ArByte2; x, y, Wx,
      Wy: integer): integer;
    procedure MakeWhiteX(var BitMa: TBitMat; Lav: Integer);
    function MakeWhite(Picture: ArByte2; lav: Integer): ArByte2;
    procedure ExtendHistogramX(var Mat: TbitMat; Max, Min: Integer);
    function ExtendHistogram(Picture: ArByte2; MAx, Min: integer): ArByte2;
    procedure LBPx(var BitMat: TBitMat);
    procedure Prewitt2X(var BitMa: TBitMat);
    function ProjectX(BItmat: Tbitmat): Ari;
    function ProjectY(BItmat: Tbitmat): Ari;
    function LineThiningS(var BitMa: TBitMat): Integer;

  private
    ImagePr: TimagePr;
    function CheckLBP(A, B: Byte): Byte;
    function DoLBP(Ar: Arbyte2): Arbyte2;
    function Prewitt2(picture: ArByte2): ArByte2;
    procedure pro1(Picture: ArByte2; var Sn: Integer);
    procedure pro2(Picture: ArByte2; var Sn: Integer);
    function LineThiningStep(Picture: ArByte2; var Sn: Integer): ArByte2;
    end;

   Procedure Register;


implementation
//uses Main;


Procedure Register;
begin
  RegisterComponents('ImageProcessing', [TimageFilter]);
ENd;

procedure TimageFilter.Sharpen(sbm, tbm: TBitmap; alpha: Single);
//to sharpen, alpha must be >1.
//pixelformat pf24bit 
//sharpens sbm to tbm 
var 
  i, j, k: integer;
  sr: array[0..2] of PByte; 
  st: array[0..4] of pRGBTriple; 
  tr: PByte; 
  tt, p: pRGBTriple; 
  beta: Single;
  inta, intb: integer; 
  bmh, bmw: integer; 
  re, gr, bl: integer;
  BytesPerScanline: integer;

begin 
  //sharpening is blending of the current pixel 
  //with the average of the surrounding ones, 
  //but with a negative weight for the average 
  Assert((sbm.Width > 2) and (sbm.Height > 2), 'Bitmap must be at least 3x3');
  Assert((alpha > 1) and (alpha < 6), 'Alpha must be >1 and <6'); 
  beta := (alpha - 1) / 5; //we assume alpha>1 and beta<1 
  intb := round(beta * $10000); 
  inta := round(alpha * $10000); //integer scaled alpha and beta
  sbm.PixelFormat := pf24bit;
  tbm.PixelFormat := pf24bit; 
  tbm.Width := sbm.Width; 
  tbm.Height := sbm.Height; 
  bmw := sbm.Width - 2; 
  bmh := sbm.Height - 2; 
  BytesPerScanline := (((bmw + 2) * 24 + 31) and not 31) div 8; 

  tr := tbm.Scanline[0]; 
  tt := pRGBTriple(tr); 

  sr[0] := sbm.Scanline[0]; 
  st[0] := pRGBTriple(sr[0]); 
  for j := 0 to bmw + 1 do 
  begin 
    tt^ := st[0]^; 
    inc(tt); inc(st[0]); //first row unchanged 
  end; 

  sr[1] := PByte(integer(sr[0]) - BytesPerScanline); 
  sr[2] := PByte(integer(sr[1]) - BytesPerScanline); 
  for i := 1 to bmh do 
  begin 
    Dec(tr, BytesPerScanline); 
    tt := pRGBTriple(tr); 
    st[0] := pRGBTriple(integer(sr[0]) + 3); //top 
    st[1] := pRGBTriple(sr[1]); //left 
    st[2] := pRGBTriple(integer(sr[1]) + 3); //center 
    st[3] := pRGBTriple(integer(sr[1]) + 6); //right 
    st[4] := pRGBTriple(integer(sr[2]) + 3); //bottom 
    tt^ := st[1]^; //1st col unchanged 
    for j := 1 to bmw do 
    begin 
    //calcutate average weighted by -beta 
      re := 0; gr := 0; bl := 0; 
      for k := 0 to 4 do 
      begin 
        re := re + st[k]^.rgbtRed; 
        gr := gr + st[k]^.rgbtGreen; 
        bl := bl + st[k]^.rgbtBlue; 
        inc(st[k]); 
      end; 
      re := (intb * re + $7FFF) shr 16; 
      gr := (intb * gr + $7FFF) shr 16; 
      bl := (intb * bl + $7FFF) shr 16; 

    //add center pixel weighted by alpha 
      p := pRGBTriple(st[1]); //after inc, st[1] is at center 
      re := (inta * p^.rgbtRed + $7FFF) shr 16 - re; 
      gr := (inta * p^.rgbtGreen + $7FFF) shr 16 - gr; 
      bl := (inta * p^.rgbtBlue + $7FFF) shr 16 - bl; 

    //clamp and move into target pixel 
      inc(tt); 
      if re < 0 then 
        re := 0 
      else 
        if re > 255 then 
          re := 255; 
      if gr < 0 then 
        gr := 0 
      else 
        if gr > 255 then 
          gr := 255; 
      if bl < 0 then 
        bl := 0 
      else 
        if bl > 255 then 
          bl := 255; 
      //this looks stupid, but avoids function calls 

      tt^.rgbtRed := re; 
      tt^.rgbtGreen := gr; 
      tt^.rgbtBlue := bl; 
    end; 
    inc(tt); 
    inc(st[1]); 
    tt^ := st[1]^; //Last col unchanged 
    sr[0] := sr[1]; 
    sr[1] := sr[2]; 
    Dec(sr[2], BytesPerScanline); 
  end; 
  // copy last row 
  Dec(tr, BytesPerScanline); 
  tt := pRGBTriple(tr); 
  st[1] := pRGBTriple(sr[1]); 
  for j := 0 to bmw + 1 do 
  begin 
    tt^ := st[1]^; 
    inc(tt); inc(st[1]); 
  end; 
end;

Function TimageFilter.DoOR(r,g,b:ArByte2;pixels,lines,lav:integer):ArByte2;
var
        i,j:integer;
        p:ArByte2;
begin
Setlength(p,lines,pixels);
 For i:=0 to Lines-1 do
  For j:=0 to pixels-1 do
  begin
      If (r[i,j]>lav)Or(g[i,j]>lav)Or(b[i,j]>lav) Then
       p[i,j]:=255 Else p[i,j]:=0;
  End;
  door:=p;

End;

Procedure TimageFilter.MakeBinX(var BitMa : TBitMat;Lav : Integer);
begin
 if BitMa.Colr then
  begin
   BitMa.Red:=MakeBin(BitMa.Red,lav);
   BitMa.Green:=MakeBin(BitMa.Green,lav);
   BitMa.Blue:=MakeBin(BitMa.Blue,lav);
  end
 else
    BitMa.Picture:=MakeBin(BitMa.Picture,lav);
end;

function TimageFilter.MakeBooleanMat(picture: ArBoolean2): ArByte2;
var
   i,j:integer;
 begin
 SetLength(Result,length(picture),length(picture[0]));

  For i:=0 to Length(picture)-1 do
   For j:=0 to Length(picture[0])-1 do
    begin
       If (picture[i,j]) Then
         Result[i,j]:=255
       else
         Result[i,j]:=0;
    End;

end;

Function TimageFilter.MakeBin(Picture:ArByte2;lav:Integer):ArByte2;
var
   i,j:integer;
 begin
 SetLength(Result,length(picture),length(picture[0]));

  For i:=0 to Length(picture)-1 do
   For j:=0 to Length(picture[0])-1 do
    begin
       If (picture[i,j])>lav Then
         Result[i,j]:=255
       else
         Result[i,j]:=0;
    End;
 End;

function TimageFilter.MakeBinBoolean(picture: ArByte2; lav: integer): ArBoolean2;
var
   i,j:integer;
 begin
 SetLength(Result,length(picture),length(picture[0]));

  For i:=0 to Length(picture)-1 do
   For j:=0 to Length(picture[0])-1 do
    begin
       If (picture[i,j])>lav Then
         Result[i,j]:=true
       else
         Result[i,j]:=false;
    End;

end;

Procedure TimageFilter.MakeWhiteX(var BitMa : TBitMat;Lav : Integer);
begin
 if BitMa.Colr then
  begin
   BitMa.Red:=MakeWhite(BitMa.Red,lav);
   BitMa.Green:=MakeWhite(BitMa.Green,lav);
   BitMa.Blue:=MakeWhite(BitMa.Blue,lav);
  end
 else
    BitMa.Picture:=MakeWhite(BitMa.Picture,lav);
end;



Function TimageFilter.MakeWhite(Picture:ArByte2;lav:Integer):ArByte2;
var
   i,j:integer;
 begin
 SetLength(Result,length(picture),length(picture[0]));

  For i:=0 to Length(picture)-1 do
   For j:=0 to Length(picture[0])-1 do
    begin
       If (picture[i,j])>lav Then
         Result[i,j]:=255
       else
         Result[i,j]:=picture[i,j];
    End;
 End;

 Function TimageFilter.Sorti(Input: Ari;UpNotDown : Boolean):Ari;
   var
    T,L,J,i:integer;
   begin
    L:=Length(Input);
    SetLength(Result,L);
    If UpNotDown then
     begin
       For j:=0 to L-1 do
        For i:=0 to L-2 do
          If Input[i]>input[i+1] Then
           begin
            t:=input[i];
            Input[i]:=input[i+1];
            Input[I+1]:=T;
           End;
     End
    Else
       For j:=0 to L-1 do
        For i:=0 to L-2 do
          If Input[i]<input[i+1] Then
           begin
            t:=input[i];
            Input[i]:=input[i+1];
            Input[I+1]:=T;
           End;
       Result:=Input;
   eNd;


Function TimageFilter.Mean(picture:ArByte2;pixels,lines:integer):ArByte2;
var
 p:ArByte2;
 i,j,m:integer;
 Temp : Ari;
begin
SetLength(Result,length(picture),length(picture[0]));
SetLength(Temp,9);
p:=picture;

 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   begin
    Temp[0]:=p[i-1,j-1];
    Temp[1]:=p[i-1,j];
    Temp[2]:=p[i-1,j+1];
    Temp[3]:=p[i,j-1];
    Temp[4]:=p[i,j];
    Temp[5]:=p[i,j+1];
    Temp[6]:=p[i+1,j-1];
    Temp[7]:=p[i+1,j];
    Temp[8]:=p[i+1,j+1];
    Sorti(Temp,true);

   Result[i,j]:=temp[4];

   end;
for I := 0 to lines- 1 do
 begin
  Result[i,0]:=p[i,0];
  Result[i,pixels-1]:=p[i,pixels-1];
 end;

for J := 0 to pixels- 1 do
  begin
    Result[0,j]:=p[0,j];
    Result[lines-1,j]:=p[lines-1,j];
  end;
End;

Function TimageFilter.AverageS(Picture : Arbyte2; L : Integer):ArByte2;
var
  p: ArByte2;
  S,i,j,k,KK,n,m : Integer;
begin
n:=2*L+1;
m:=N*N;
 p:=Picture;
  SetLength(Result,length(Picture),length(Picture[0]));
 for I := 0 to Length(Picture)- 1 do
   for J := 0 to L- 1 do
     begin
       Result[i,j]:=p[i,j];
       Result[i,Length(Picture[0])-j-1]:=p[i,Length(Picture[0])-j-1];
     end;

 for I := 0 to Length(Picture[0])- 1 do
   for J := 0 to L- 1 do
     begin
       Result[j,i]:=p[j,i];
       Result[Length(Picture)-j-1,i]:=p[Length(Picture)-j-1,i];
     end;



  for I := L to Length(Picture)- l-1 do
    for J := L to Length(Picture[0])- l-1 do
      begin
         S:=0;
          for k := -l to L do
            for KK := -l to L do
              begin
                s:=s+picture[i+k,J+kk];
              end;
          s:=trunc(s/m);
          Result[i,j]:=S;
      end;


end;

Function TimageFilter.Average(picture:ArByte2;pixels,lines:integer):ArByte2;
var
 mat:array[1..3,1..3] of integer;
 p:ArByte2;
 i,j,m:integer;

begin
m:=9;
mat[1,1]:=1;mat[1,2]:=1;mat[1,3]:=1;
mat[2,1]:=1;mat[2,2]:=1;mat[2,3]:=1;
mat[3,1]:=1;mat[3,2]:=1;mat[3,3]:=1;
SetLength(Result,length(picture),length(picture[0]));
p:=picture;

for I := 0 to lines- 1 do
 begin
  Result[i,0]:=p[i,0];
  Result[i,pixels-1]:=p[i,pixels-1];
 end;

for J := 0 to pixels- 1 do
  begin
    Result[0,j]:=p[0,j];
    Result[lines-1,j]:=p[lines-1,j];
  end;



 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   Result[i,j]:=(trunc(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                         (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                         (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m));
// Result:=picture;
End;

Function TimageFilter.Rotate(Bitmat : TBitMat;Teta : Real):TBitMat;
Var
    mat : tbitmat;
  ii,jj,I: Integer;
  J,m,n: Integer;
  Fm1,Fn1,Fm,Fn,Mr,Nr,TetaR : Real;
  F,F1,F2,F3,F4: Real;
         lSine : extended;          // sine used in rotation
         lCosine : extended;        // cosine used in rotation
   X1,X2,X3,Y1,Y2,Y3,lNewWidth,lNewHeight,lMinx,lMiny,lMaxX,lMaxY
   ,lSourceX,lSourceY
    : LongInt;
begin
 TetaR:=Teta/180*pi;

         lSine := Sin(TetaR);
         lCosine := Cos(TetaR);

         // compute the size of the new bitmap being created
         X1 := Round(-Bitmat.Pixels* lSine);
         Y1 := Round(Bitmat.Lines * lCosine);
         X2 := Round(Bitmat.Pixels * lCosine - Bitmat.Lines * lSine);
         Y2 := Round(Bitmat.Lines * lCosine + Bitmat.Pixels * lSine);
         X3 := Round(Bitmat.Pixels * lCosine);
         Y3 := Round(Bitmat.Pixels * lSine);

         // figure out the max/min size of the new bitmap
         lMinX := Min(0, Min(X1, Min(X2, X3)));
         lMinY := Min(0, Min(Y1, Min(Y2, Y3)));
         lMaxX := Max(X1, Max(X2, X3));
         lMaxY := Max(Y1, Max(Y2, Y3));

         // set the new bitmap width/height
         lNewWidth := lMaxX - lMinX;
         lNewHeight := lMaxY - lMinY;




 mat.Colr:=Bitmat.Colr;
 mat.Pixels:=lNewWidth;
 mat.Lines:=lNewHeight;
 ImagePr.DllSetmat(mat);

  for J := 0 to mat.Pixels - 1 do
   for I := 0 to Mat.Lines - 1 do
    begin
               lSourceX := Round((J + lMinX) * lCosine + (I + lMinY) * lSine);
               lSourceY := Round((I + lMinY) * lCosine - (J + lMinX) * lSine);

               If (lSourceX >= 0) And (lSourceX < Bitmat.Pixels) And
               (lSourceY >= 0) And (lSourceY < Bitmat.Lines) Then
                begin
                 if mat.Colr then
                  begin
                    Mat.Red[i,j]:=BitMat.Red[lSourceY,lSourceX];
                    Mat.Green[i,j]:=BitMat.Green[lSourceY,lSourceX];
                    Mat.Blue[i,j]:=BitMat.Blue[lSourceY,lSourceX];
                  end
                 else
                    Mat.Picture[i,j]:=BitMat.Picture[lSourceY,lSourceX];

                end
               else
                begin
                 if mat.Colr then
                  begin
                    Mat.Red[i,j]:=255;
                    Mat.Green[i,j]:=255;
                    Mat.Blue[i,j]:=255;
                  end
                 else
                    Mat.Picture[i,j]:=255;


                end;



{     jj:=Trunc(mat.Lines/2-j);
     ii:=Trunc(i-mat.Pixels/2);

     Mr:=(jJ*Cos(TetaR)-iI*Sin(TetaR));
     Nr:=(jj*sin(TetaR)+Ii*Cos(TetaR));
     m:=trunc(mr);
     N:=trunc(Nr);
     if M<=0 then Dec(M);
     if N<=0 then Dec(N);

     Fm1:=Mr-m;
     Fn1:=Nr-n;
     Fm:=1-Fm1;
     Fn:=1-Fn1;
       F1:=Sqrt(Fm*Fm+Fn*Fn);
       F2:=sqrt(Fm1*Fm1+Fn*Fn);
       F3:=sqrt(Fm*Fm+Fn1*Fn1);
       F4:=sqrt(Fm1*Fm1+Fn1*Fn1);
       F:=F1+F2+F3+F4;

     m:=Trunc(mat.Lines/2-m);
     N:=Trunc(N+mat.Pixels/2);

     if (M>=0)and(N>=0)and(M<mat.Lines-1)and(N<mat.Pixels-1) then
      begin
       if mat.Colr then
        begin
         mat.Red[j,i]:=trunc((F1*BitMat.Red[m,n]+F2*BitMat.Red[m+1,n]+F3*BitMat.Red[m,n+1]+F4*BitMat.Red[m+1,n+1])/f);
         mat.Green[j,i]:=trunc((F1*BitMat.Green[m,n]+F2*BitMat.Green[m+1,n]+F3*BitMat.Green[m,n+1]+F4*BitMat.Green[m+1,n+1])/f);
         mat.Blue[j,i]:=trunc((F1*BitMat.Blue[m,n]+F2*BitMat.Blue[m+1,n]+F3*BitMat.Blue[m,n+1]+F4*BitMat.Blue[m+1,n+1])/f);
         End
        Else
         mat.Picture[j,i]:=trunc((F1*BitMat.Picture[m,n]+F2*BitMat.Picture[m+1,n]+F3*BitMat.Picture[m,n+1]+F4*BitMat.Picture[m+1,n+1])/f);

      end;
      }

    end;
    Result:=mat;
end;

Procedure TimageFilter.IntCancelationX(var BitMa:TBitMat);
var
  K:integer;
  I: Integer;
  J: Integer;
begin
   With BitMa do
    If Colr then
     for I := 0 to Lines - 1 do
      for J := 0 to Pixels - 1 do
      begin
       K:=Red[i,j]+Green[i,j]+Blue[i,j];
       if k>0 then
        begin
         Red[i,j]:=trunc(255*Red[i,j]/K);
         Green[i,j]:=trunc(255*Green[i,j]/K);
         Blue[i,j]:=trunc(255*Blue[i,j]/K);
        end
       else
        begin
         Red[i,j]:=0;
         Green[i,j]:=0;
         Blue[i,j]:=0;
        end;
      ENd;
End;

Function TimageFilter.Sumation(BitMa1,BitMa2:TBitMat;a,b:real):TBitMat;
var
  K:integer;
  I: Integer;
  J: Integer;
begin
 if (BitMa1.Colr<>BitMa2.Colr)or(BitMa1.Pixels<>BitMa2.Pixels)or(BitMa1.Lines<>BitMa2.Lines) then
  begin
    MessageDlg('Dimension error',mtError,mbOKCancel,0);
    exit;
  end;

 Result.Pixels:=BitMa1.Pixels;
 Result.Lines:=BitMa1.Lines;
  Result.Colr:=BitMa1.Colr;

  With Result DO
    If Colr Then
     begin
       setlength(Green,Lines,Pixels);
       setlength(blue,Lines,Pixels);
       setlength(RED,Lines,Pixels);
     End Else
       setlength(Picture,Lines,Pixels);



   With Result do
    If Colr then
     for I := 0 to Lines - 1 do
      for J := 0 to Pixels - 1 do
      begin
         Red[i,j]:=trunc((a*Bitma1.Red[i,j]+b*BitMa2.Red[i,j]));
         Green[i,j]:=trunc((a*Bitma1.Green[i,j]+b*Bitma2.Green[i,j]));
         Blue[i,j]:=trunc((a*Bitma1.Blue[i,j]+b*Bitma2.Blue[i,j]));
      ENd
     Else
     for I := 0 to Lines - 1 do
      for J := 0 to Pixels - 1 do
         Picture[i,j]:=trunc((a*Bitma1.Picture[i,j]+b*BitMa2.Picture[i,j]));
End;

Function TimageFilter.Totalpoints(BitMa : TbitMat):Real;
var
  i,j : Integer;
begin
 Result:=0;
 if not BitMa.Colr then
  begin
    for I := 0 to BitMa.Pixels- 1 do
      for J := 0 to BitMa.Lines- 1 do
        begin
          Result:=Result+BitMa.Picture[j,i];
        end;
      Result:=Result/BitMa.Pixels/BitMa.Lines;

  end
 else
  begin
    for I := 0 to BitMa.Pixels- 1 do
      for J := 0 to BitMa.Lines- 1 do
        begin
          Result:=Result+BitMa.Red[j,i];
          Result:=Result+BitMa.Green[j,i];
          Result:=Result+BitMa.Blue[j,i];
        end;
      Result:=Result/BitMa.Pixels/BitMa.Lines/3;

  end;


end;

Function TimageFilter.DifferentX(BitMa1,BitMa2:TBitMat):Tbitmat;
var
  K:integer;
  I: Integer;
  J: Integer;
begin
 if (BitMa1.Colr<>BitMa2.Colr)or(BitMa1.Pixels<>BitMa2.Pixels)or(BitMa1.Lines<>BitMa2.Lines) then
  begin
    MessageDlg('Dimension error',mtError,mbOKCancel,0);
    exit;
  end;

 Result.Pixels:=BitMa1.Pixels;
 Result.Lines:=BitMa1.Lines;
  Result.Colr:=BitMa1.Colr;

  With Result DO
    If Colr Then
     begin
       setlength(Green,Lines,Pixels);
       setlength(blue,Lines,Pixels);
       setlength(RED,Lines,Pixels);
     End Else
       setlength(Picture,Lines,Pixels);



   With Result do
    If Colr then
     for I := 0 to Lines - 1 do
      for J := 0 to Pixels - 1 do
      begin
         Red[i,j]:=ABS((Bitma1.Red[i,j]-BitMa2.Red[i,j]));
         Green[i,j]:=ABS((Bitma1.Green[i,j]-Bitma2.Green[i,j]));
         Blue[i,j]:=ABS((Bitma1.Blue[i,j]-Bitma2.Blue[i,j]));
      ENd
     Else
     for I := 0 to Lines - 1 do
      for J := 0 to Pixels - 1 do
         Picture[i,j]:=Abs((Bitma1.Picture[i,j]-BitMa2.Picture[i,j]));
End;

Procedure TimageFilter.WaterNoiseX(var BitMa:TBitMat;N:Integer);
var
  I,II,JJ:Integer;
  R,G,B:Byte;
begin
 Randomize;
   With BitMa do
    If not Colr then
     begin
       for I := 0 to N- 1 do
         begin
          II:=Random(BitMa.Lines-1)+1;
          JJ:=Random(BitMa.Pixels);
          B:=Picture[ii,jj];
          Picture[ii,jj]:=Picture[ii-1,jj];
          Picture[ii-1,jj]:=B;
         end;
     end
    Else
     begin
       for I := 0 to N- 1 do
         begin
          II:=Random(BitMa.Lines-1)+1;
          JJ:=Random(BitMa.Pixels);
           R:=Red[ii,jj];
           G:=Green[ii,jj];
           B:=Blue[ii,jj];

           Red[ii,jj]:=Red[ii-1,jj];
           Green[ii,jj]:=Green[ii-1,jj];
           Blue[ii,jj]:=Blue[ii-1,jj];

           Red[ii-1,jj]:=R;
           Green[ii-1,jj]:=G;
           Blue[ii-1,jj]:=B;

          II:=Random(BitMa.Lines);
          JJ:=Random(BitMa.Pixels-1)+1;
           R:=Red[ii,jj];
           G:=Green[ii,jj];
           B:=Blue[ii,jj];

           Red[ii,jj]:=Red[ii,jj-1];
           Green[ii,jj]:=Green[ii,jj-1];
           Blue[ii,jj]:=Blue[ii,jj-1];

           Red[ii,jj-1]:=R;
           Green[ii,jj-1]:=G;
           Blue[ii,jj-1]:=B;

         end;
     ENd;
End;

Function TimageFilter.Rotate_90(Input: ArByte2): ArByte2;
var
  i,j : Integer;
begin
 SetLength(Result,length(Input[0]),length(Input));

 for I := 0 to Length(Input)- 1 do
   for J := 0 to Length(Input[0])- 1 do
     begin
       Result[j,i]:=input[i,Length(Input[0])- 1-j];
     end;
end;

Function TimageFilter.Rotate90(Input: ArByte2): ArByte2;
var
  i,j : Integer;
begin
 SetLength(Result,length(Input[0]),length(Input));

 for I := 0 to Length(Input)- 1 do
   for J := 0 to Length(Input[0])- 1 do
     begin
       Result[j,i]:=input[Length(Input)- 1-i,j];
     end;
end;

Function TimageFilter.Rotate180(Input: ArByte2): ArByte2;
var
  i,j : Integer;
begin
 SetLength(Result,length(Input),length(Input[0]));

 for I := 0 to Length(Input)- 1 do
   for J := 0 to Length(Input[0])- 1 do
     begin
       Result[i,j]:=input[Length(Input)- 1-i,Length(Input[0])- 1-j];
     end;
end;

Procedure TimageFilter.Rotate_90X(var BitMa :TBitMat);
var
  temp : Integer;
begin
   With BitMa do
   begin
    If not Colr then
     Picture:=Rotate_90(Picture)
    Else
     begin
      Red:=Rotate_90(Red);
      Green:=Rotate_90(Green);
      Blue:=Rotate_90(Blue);
     ENd;
    temp:=Pixels;
    Pixels:=Lines;
    Lines:=temp;

   end;
end;

Procedure TimageFilter.Rotate90X(var BitMa :TBitMat);
var
  temp : Integer;
begin
   With BitMa do
   begin
    If not Colr then
     Picture:=Rotate90(Picture)
    Else
     begin
      Red:=Rotate90(Red);
      Green:=Rotate90(Green);
      Blue:=Rotate90(Blue);
     ENd;
    temp:=Pixels;
    Pixels:=Lines;
    Lines:=temp;

   end;
end;

Procedure TimageFilter.Rotate180X(var BitMa :TBitMat);
var
  temp : Integer;
begin
   With BitMa do
   begin
    If not Colr then
     Picture:=Rotate180(Picture)
    Else
     begin
      Red:=Rotate180(Red);
      Green:=Rotate180(Green);
      Blue:=Rotate180(Blue);
     ENd;

   end;
end;

Procedure TimageFilter.MirrorHX(Var BitMa : TBitMat);
begin
   With BitMa do
   begin
    If not Colr then
     Picture:=Rotate90(Picture)
    Else
     begin
      Red:=MirrorH(Red);
      Green:=MirrorH(Green);
      Blue:=MirrorH(Blue);
     ENd;

   end;
end;

Procedure TimageFilter.MirrorVX(Var BitMa : TBitMat);
begin
   With BitMa do
   begin
    If not Colr then
     Picture:=MirrorV(Picture)
    Else
     begin
      Red:=MirrorV(Red);
      Green:=MirrorV(Green);
      Blue:=MirrorV(Blue);
     ENd;

   end;
end;


Function TimageFilter.MirrorH(Input : ArByte2): ArByte2;
var
  i,j : integer;
begin
SetLength(Result,length(Input),length(Input[0]));

 for I := 0 to Length(Input)- 1 do
   for J := 0 to Length(Input[0])- 1 do
     begin
       Result[i,j]:=input[Length(Input)-i-1,j];

     end;

end;

Function TimageFilter.MirrorV(Input : ArByte2): ArByte2;
var
  i,j : integer;
begin
SetLength(Result,length(Input),length(Input[0]));

 for I := 0 to Length(Input)- 1 do
   for J := 0 to Length(Input[0])- 1 do
     begin
       Result[i,j]:=input[i,Length(Input[0])- 1-j];

     end;

end;


Procedure TimageFilter.AverageX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=Average(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=Average(Red,length(Red[0]),length(Red));
      Green:=Average(Green,length(Green[0]),length(Green));
      Blue:=Average(Blue,length(Blue[0]),length(Blue));
     ENd;
End;

Procedure TimageFilter.AverageSX(var BitMa:TBitMat; L : Integer);
begin
   With BitMa do
    If not Colr then
     Picture:=AverageS(Picture,L)
    Else
     begin
      Red:=AverageS(Red,L);
      Green:=AverageS(Green,L);
      Blue:=AverageS(Blue,L);
     ENd;
End;

Procedure TimageFilter.MeanX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=Mean(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=Mean(Red,length(Red[0]),length(Red));
      Green:=Mean(Green,length(Green[0]),length(Green));
      Blue:=Mean(Blue,length(Blue[0]),length(Blue));
     ENd;
End;

Function TimageFilter.Gaussian(picture:ArByte2;pixels,lines:integer):ArByte2;
var
   mat:array[1..3,1..3] of integer;
   p:ArByte2;
   i,j,m:integer;

begin

m:=16;
mat[1,1]:=1;mat[1,2]:=2;mat[1,3]:=1;
mat[2,1]:=2;mat[2,2]:=4;mat[2,3]:=2;
mat[3,1]:=1;mat[3,2]:=2;mat[3,3]:=1;

setlength(p,lines);

For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels);

 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   picture[i,j]:=(trunc(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                         (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                         (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m));

  Gaussian:=picture;
  End;


procedure TimageFilter.GaussianX(var BitMa: TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=Gaussian(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=Gaussian(Red,length(Red[0]),length(Red));
      Green:=Gaussian(Green,length(Green[0]),length(Green));
      Blue:=Gaussian(Blue,length(Blue[0]),length(Blue));
     ENd;
end;

Procedure TimageFilter.Frei_ChanX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=Frei_Chan(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=Frei_Chan(Red,length(Red[0]),length(Red));
      Green:=Frei_Chan(Green,length(Green[0]),length(Green));
      Blue:=Frei_Chan(Blue,length(Blue[0]),length(Blue));
     ENd;
End;


Function TimageFilter.Frei_Chan(picture:ArByte2;pixels,lines:integer):ArByte2;

  var
   pat,mat:array[1..3,1..3] of real;
   p,pr:ArByte2;
   p1,p2:byte;
   i,j:integer;
   r2,m:real;

begin
r2:=Sqrt(2);
m:=2+r2;
 mat[1,1]:=1; mat[1,2]:=0; mat[1,3]:=-1;
 mat[2,1]:=r2; mat[2,2]:=0; mat[2,3]:=-r2;
 mat[3,1]:=1; mat[3,2]:=0; mat[3,3]:=-1;

 pat[1,1]:=-1; pat[1,2]:=-r2; pat[1,3]:=-1;
 pat[2,1]:=0; pat[2,2]:=0; pat[2,3]:=0;
 pat[3,1]:=1; pat[3,2]:=r2; pat[3,3]:=1;

setlength(p,lines);
 For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels);
 setlength(pr,lines,pixels);
{ setlength(p1,lines+1,pixels+1);
 Setlength(p2,lines+1,pixels+1);
 }
 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   begin
            p1:=(trunc(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                          (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                        (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m));

            p2:=(trunc(((p[i-1,j-1])*pat[1,1]+(p[i-1,j])*pat[1,2]+(p[i-1,j+1])*pat[1,3]+
                          (p[i,j-1])*pat[2,1]+(p[i,j])*pat[2,2]+(p[i,j+1])*pat[2,3]+
                        (p[i+1,j-1])*pat[3,1]+(p[i+1,j])*pat[3,2]+(p[i+1,j+1])*pat[3,3])/m));

      pr[i,j]:=p1*p1+p2*p2;
   ENd;

 Frei_Chan:=pr;
End;

Procedure TimageFilter.Prewitt2X(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=Prewitt2(Picture)
    Else
     begin
      Red:=Prewitt2(Red);
      Green:=Prewitt2(Green);
      Blue:=Prewitt2(Blue);
     ENd;
End;


Procedure TimageFilter.PrewittX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=Prewitt(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=Prewitt(Red,length(Red[0]),length(Red));
      Green:=Prewitt(Green,length(Green[0]),length(Green));
      Blue:=Prewitt(Blue,length(Blue[0]),length(Blue));
     ENd;
End;

Function TimageFilter.Prewitt2(picture:ArByte2):ArByte2;
  var
   pat,mat:array[1..3,1..3] of integer;
   p,pr:ArByte2;
   p1,p2:byte;
   i,j,m:integer;
   Pixels,Lines,K : Integer;

begin
m:=3;
Lines:=Length(picture);
Pixels:=Length(picture[0]);



setlength(p,lines);
 For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels);
 setlength(pr,lines,pixels);

 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   begin
            p1:=abs(P[i-1,j]-p[i,j]);
            P2:=abs(P[i,j-1]-p[i,j]);

{            p1:=abs(trunc(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                          (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                        (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m));

            p2:=abs(trunc(((p[i-1,j-1])*pat[1,1]+(p[i-1,j])*pat[1,2]+(p[i-1,j+1])*pat[1,3]+
                          (p[i,j-1])*pat[2,1]+(p[i,j])*pat[2,2]+(p[i,j+1])*pat[2,3]+
                        (p[i+1,j-1])*pat[3,1]+(p[i+1,j])*pat[3,2]+(p[i+1,j+1])*pat[3,3])/m));
 }
      K:=P1+p2;// p1*p1+p2*p2;
      if K>255 then K:=255;
      if k<0 then k:=0;

     Pr[i,j]:=k;

   ENd;

 Result:=pr;
End;

Function TimageFilter.Prewitt(picture:ArByte2;pixels,lines:integer):ArByte2;
  var
   pat,mat:array[1..3,1..3] of integer;
   p,pr:ArByte2;
   p1,p2:byte;
   i,j,m:integer;
   K : Integer;

begin
m:=3;
 mat[1,1]:=1; mat[1,2]:=0; mat[1,3]:=-1;
 mat[2,1]:=1; mat[2,2]:=0; mat[2,3]:=-1;
 mat[3,1]:=1; mat[3,2]:=0; mat[3,3]:=-1;

 pat[1,1]:=-1; pat[1,2]:=-1; pat[1,3]:=-1;
 pat[2,1]:=0; pat[2,2]:=0; pat[2,3]:=0;
 pat[3,1]:=1; pat[3,2]:=1; pat[3,3]:=1;

setlength(p,lines);
 For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels);
 setlength(pr,lines,pixels);

 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   begin
            p1:=abs(trunc(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                          (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                        (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m));

            p2:=abs(trunc(((p[i-1,j-1])*pat[1,1]+(p[i-1,j])*pat[1,2]+(p[i-1,j+1])*pat[1,3]+
                          (p[i,j-1])*pat[2,1]+(p[i,j])*pat[2,2]+(p[i,j+1])*pat[2,3]+
                        (p[i+1,j-1])*pat[3,1]+(p[i+1,j])*pat[3,2]+(p[i+1,j+1])*pat[3,3])/m));

      K:=P1+p2;// p1*p1+p2*p2;
      if K>255 then K:=255;
      if k<0 then k:=0;

     Pr[i,j]:=k;

   ENd;

 Prewitt:=pr;
End;

Procedure TimageFilter.SabelX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=Sabel(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=Sabel(Red,length(Red[0]),length(Red));
      Green:=Sabel(Green,length(Green[0]),length(Green));
      Blue:=Sabel(Blue,length(Blue[0]),length(Blue));
     ENd;
End;

Function TimageFilter.Sabel(picture:ArByte2;pixels,lines:integer):ArByte2;
  var
   pat,mat:array[1..3,1..3] of integer;
   p:ArByte2;
   p1,p2:byte;
   i,j,m:integer;

begin
m:=4;
mat[1,1]:=-1;mat[1,2]:=-2;mat[1,3]:=-1;
 mat[2,1]:=0; mat[2,2]:=0; mat[2,3]:=0;
 mat[3,1]:=1; mat[3,2]:=2; mat[3,3]:=1;

 pat[1,1]:=1; pat[1,2]:=0; pat[1,3]:=-1;
 pat[2,1]:=2; pat[2,2]:=0; pat[2,3]:=-2;
 pat[3,1]:=1; pat[3,2]:=0; pat[3,3]:=-1;



setlength(p,lines);
 For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels);
{ setlength(p1,lines+1,pixels+1);
 Setlength(p2,lines+1,pixels+1);
 }
 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   begin
            p1:=(trunc(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                          (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                        (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m));

            p2:=(trunc(((p[i-1,j-1])*pat[1,1]+(p[i-1,j])*pat[1,2]+(p[i-1,j+1])*pat[1,3]+
                          (p[i,j-1])*pat[2,1]+(p[i,j])*pat[2,2]+(p[i,j+1])*pat[2,3]+
                        (p[i+1,j-1])*pat[3,1]+(p[i+1,j])*pat[3,2]+(p[i+1,j+1])*pat[3,3])/m));

      picture[i,j]:=p1*p1+p2*p2;
   ENd;

 Sabel:=picture;
End;

Procedure TimageFilter.F1_4_1X(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=F1_4_1(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=F1_4_1(Red,length(Red[0]),length(Red));
      Green:=F1_4_1(Green,length(Green[0]),length(Green));
      Blue:=F1_4_1(Blue,length(Blue[0]),length(Blue));
     ENd;
End;

Function TimageFilter.F1_4_1(picture:ArByte2;pixels,lines:integer):ArByte2;
var
   mat:array[1..3,1..3] of integer;
   p:ArByte2;
   i,j,m:integer;
begin
m:=1;
mat[1,1]:=-2;mat[1,2]:=1;mat[1,3]:=-2;
mat[2,1]:=1;mat[2,2]:=4;mat[2,3]:=1;
mat[3,1]:=-2;mat[3,2]:=1;mat[3,3]:=-2;
//p:=picture;
setlength(p,lines);
 For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels);

 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   picture[i,j]:=(trunc(Abs(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                              (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                             (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m)));
   F1_4_1:=picture;
End;

Procedure TimageFilter.F1_8_1X(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=F1_8_1(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=F1_8_1(Red,length(Red[0]),length(Red));
      Green:=F1_8_1(Green,length(Green[0]),length(Green));
      Blue:=F1_8_1(Blue,length(Blue[0]),length(Blue));
     ENd;
End;

Function TimageFilter.F1_8_1(picture:ArByte2;pixels,lines:integer):ArByte2;
var
   mat:array[1..3,1..3] of integer;
   p:ArByte2;
   i,j,m:integer;
begin
m:=1;
mat[1,1]:=1;mat[1,2]:=1;mat[1,3]:=1;
mat[2,1]:=1;mat[2,2]:=-8;mat[2,3]:=1;
mat[3,1]:=1;mat[3,2]:=1;mat[3,3]:=1;
//p:=picture;
setlength(p,lines);
 For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels+1);

 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   picture[i,j]:=(trunc(Abs(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                              (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                             (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m)));
   F1_8_1:=picture;
End;

function TimageFilter.CheckLBP(A,B : Byte):Byte;
begin
 if A>=B then
   Result:=1
 else
   Result:=0;
end;

Function TimageFilter.DoLBP(Ar : Arbyte2):Arbyte2;
var
 i,j : Integer;
 R,C : Byte;
begin
   SetLength(Result,length(Ar),Length(Ar[0]));
   for I := 1 to length(Ar)- 2 do
     for J := 1 to Length(Ar[0])- 2 do
       begin
         R:=0;
         c:=CheckLBP(Ar[i-1,j-1],Ar[i,j]);R:=2*R+C;
         c:=CheckLBP(Ar[i-1,j],Ar[i,j]);R:=2*R+C;
         c:=CheckLBP(Ar[i-1,j+1],Ar[i,j]);R:=2*R+C;
         c:=CheckLBP(Ar[i,j+1],Ar[i,j]);R:=2*R+C;
         c:=CheckLBP(Ar[i+1,j+1],Ar[i,j]);R:=2*R+C;
         c:=CheckLBP(Ar[i+1,j],Ar[i,j]);R:=2*R+C;
         c:=CheckLBP(Ar[i+1,j-1],Ar[i,j]);R:=2*R+C;
         c:=CheckLBP(Ar[i,j-1],Ar[i,j]);R:=2*R+C;

        Result[i,j]:=R;
       end;
end;

Procedure TimageFilter.LBPx(var BitMat : TBitMat);
begin
 if BitMat.Colr then
  begin
    BitMat.Red:=DoLBP(BitMat.Red);
    BitMat.Green:=DoLBP(BitMat.Green);
    BitMat.Blue:=DoLBP(BitMat.Blue);
  end
 else
  begin
    BitMat.Picture:=DoLBP(BitMat.Picture);
  end;

end;

Procedure TimageFilter.FindObjectCenter(BitMa: TBitMat; var Left,Top: Word);
var
  i,j:integer;
  N,TW,Lw: integer;
  LeftFlag,TopFlag:Boolean;
begin
 Top:=0;
 Left:=0;
 TW:=0;
 LW:=0;
 N:=0;
// LeftFlag:=True;
// TopFlag:=True;
 for J := 4 to BitMa.Lines - 5 do
   begin
//   LeftFlag:=true;
     for I := 4 to BitMa.Pixels - 5 do
       begin
         if BitMa.Picture[j,i]>128 then
          begin
           inc(N);
           Tw:=Tw+J;
           LW:=Lw+I;
          end;
       end;
   end;
  Top:=Trunc(TW/N);
  Left:=trunc(Lw/N);
end;

Function TimageFilter.FindObjectRect(BitMa: TBitMat; var A,B,C,D : TPoint):Boolean;
var
  i,j,Dx : Integer;
begin
 i:=1;j:=0;    {Left - Top}
 Dx:=1;
 repeat
     i:=i-Dx;
     j:=J+Dx;

    if i=0 then
     begin
       Dx:=-Dx;
       inc(j);
     end;

    if J=0 then
     begin
       Dx:=-Dx;
       inc(i);
     end;
 until BitMa.Picture[j,i]>128;
   a.X:=i;
   A.Y:=J;

 i:=BitMa.Pixels-2;           {Right - Top}
 j:=0;
 Dx:=1;
  repeat
    i:=I+Dx;
    j:=J+Dx;

    if i=BitMa.Pixels-1 then
     begin
       Dx:=-Dx;
       Inc(J);
     end;

    if j=0 then
      begin
        Dx:=-Dx;
        Dec(i);
      end;

  until BitMa.Picture[j,i]>128;
    B.X:=i;
    B.Y:=j;

 i:=BitMa.Pixels-2;           {Right - Button}
 j:=BitMa.Lines-1;
 Dx:=1;
  repeat
    i:=I+Dx;
    j:=J-Dx;

    if i=BitMa.Pixels-1 then
     begin
       Dx:=-Dx;
       Dec(J);
     end;

    if j=BitMa.Lines-1 then
      begin
        Dx:=-Dx;
        Dec(i);
      end;

  until BitMa.Picture[j,i]>128;
    C.X:=i;
    C.Y:=j;

 i:=0;           {Lef - Button}
 j:=BitMa.Lines-2;
 Dx:=1;
  repeat
    i:=I+Dx;
    j:=J+Dx;

    if i=0 then
     begin
       Dx:=-Dx;
       Dec(J);
     end;

    if j=BitMa.Lines-1 then
      begin
        Dx:=-Dx;
        Inc(i);
      end;

  until BitMa.Picture[j,i]>128;
    D.X:=i;
    D.Y:=j;


end;


Function TimageFilter.FindObject(BitMa: TBitMat; var A,B : TPoint):Boolean;
var
  i,j:integer;
  FoundFlag, LeftFlag,TopFlag:Boolean;
begin
 a.Y:=1000000; {top}
 A.x:=1000000; {left}
 B.X:=0;  {Right}
 B.Y:=0;  {Bottom}
 LeftFlag:=True;
 TopFlag:=True;
 FoundFlag := False;
 for J := 4 to BitMa.Lines - 5 do
   begin
   LeftFlag:=true;
     for I := 4 to BitMa.Pixels - 5 do
       begin
         if BitMa.Picture[j,i]>128 then
          begin
            FoundFlag:=true;
            if i<A.x then A.X:=i;
            if i>B.X then B.X:=i;

            if j<A.Y then A.Y:=j;
            if J>B.Y then B.Y:=j;
          end;
       end;
   end;
  RESULT := FoundFlag;
end;

Procedure TimageFilter.HighBroostX(var BitMa :TBitMat;Alpha:Real);
begin
   With BitMa do
    If not Colr then
     Picture:=HighBrust(Picture,Alpha,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=HighBrust(Red,Alpha,length(Red[0]),length(Red));
      Green:=HighBrust(Green,Alpha,length(Green[0]),length(Green));
      Blue:=HighBrust(Blue,Alpha,length(Blue[0]),length(Blue));
     ENd;



end;

Function TimageFilter.HighBrust(picture:ArByte2;Alpha:real;pixels,lines:integer):ArByte2;
var
   mat:array[1..3,1..3] of real;
   p:ArByte2;
   i,j,t:integer;
   m:real;
begin
m:=alpha*8;
mat[1,1]:=1;mat[1,2]:=1;mat[1,3]:=1;
mat[2,1]:=1;mat[2,2]:=-9*Alpha+1;mat[2,3]:=1;
mat[3,1]:=1;mat[3,2]:=1;mat[3,3]:=1;
SetLength(Result,length(picture),length(picture[0]));
p:=picture;

//setlength(p,lines);
// For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels);

for I := 0 to lines- 1 do
 begin
  Result[i,0]:=p[i,0];
  Result[i,pixels-1]:=p[i,pixels-1];
 end;

for J := 0 to pixels- 1 do
  begin
    Result[0,j]:=p[0,j];
    Result[lines-1,j]:=p[lines-1,j];
  end;


 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   begin
   t:=trunc(Abs(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                              (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                             (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m));
       If t>255 Then t:=255;
    Result[i,j]:=t;
   ENd;
//   HighBrust:=picture;
End;

Procedure TimageFilter.LaplasX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=DelPixels(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=Laplas(Red,length(Red[0]),length(Red));
      Green:=Laplas(Green,length(Green[0]),length(Green));
      Blue:=Laplas(Blue,length(Blue[0]),length(Blue));
     ENd;
End;

Function TimageFilter.Laplas(picture:ArByte2;pixels,lines:integer):ArByte2;

var
   mat:array[1..3,1..3] of integer;
   p:ArByte2;
   i,j:integer;
   m:real;

begin
m:=1;
mat[1,1]:=0;mat[1,2]:=-1;mat[1,3]:=0;
mat[2,1]:=-1;mat[2,2]:=4;mat[2,3]:=-1;
mat[3,1]:=0;mat[3,2]:=-1;mat[3,3]:=0;
//p:=picture;
setlength(p,lines);
 For i:=0 To Lines-1 do   p[i]:=copy(picture[i],0,pixels);

 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   picture[i,j]:=(trunc(abs(((p[i-1,j-1])*mat[1,1]+(p[i-1,j])*mat[1,2]+(p[i-1,j+1])*mat[1,3]+
                            (p[i,j-1])*mat[2,1]+(p[i,j])*mat[2,2]+(p[i,j+1])*mat[2,3]+
                            (p[i+1,j-1])*mat[3,1]+(p[i+1,j])*mat[3,2]+(p[i+1,j+1])*mat[3,3])/m)));
    Laplas:=picture;
End;

Procedure TimageFilter.CannyX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=Canny(Picture)
    Else
     begin
      Red:=Canny(Red);
      Green:=Canny(Green);
      Blue:=Canny(Blue);
     ENd;
eNd;

Function TimageFilter.Canny(Input : ArByte2):ArByte2;
var
   p:ArByte2;
   i,j,m1,m2,m3,m4:integer;
   Pix,Lin:Word;

begin
Lin:=Length(Input);
Pix:=Length(Input[0]);
setlength(Result,Lin,Pix);
// For i:=0 To Lin-1 do   p[i]:=copy(Input[i],0,Pix);
//
// For j:=0 to Lin-1 do for i:=0 to Pix-1 do Input[j,i]:=0;
p:=Input;
  m1:=4;
  m2:=8;
  m3:=12;
  m4:=20;
  For j:=4 to Lin-5 do
  begin
    For i:=4 to Pix-5 do
       begin

         if ((Abs((p[j,i])-(p[j,i-1]))>m1)And (Abs((p[j,i])-(p[j,i-2]))>m2)And(abs((p[j,i])-(p[j,i-3]))>m3)And(abs((p[j,i])-(p[j,i-4]))>m4)
          And(Abs((p[j,i])-(p[j,i+1]))>=m1)And (Abs((p[j,i])-(p[j,i+2]))>=M2)And(Abs((p[j,i])-(p[j,i+3]))>=m3)And(abs((p[j,i])-(p[j,i+4]))>=m4))

          or((abs((p[j,i])-(p[j-1,i]))>M1)And(Abs((p[j,i])-(p[j-2,i]))>M2)And(Abs((p[j,i])-(p[j-3,i]))>m3)And(Abs((p[j,i])-(p[j-4,i]))>M4)
          And(abs((p[j,i])-(p[j+1,i]))>=m1)And(Abs((p[j,i])-(p[j+2,i]))>=m2)And(Abs((p[j,i])-(p[j+3,i]))>=m3)And(Abs((p[j,i])-(p[j+4,i]))>=m4))
           then Result[j,i]:=255;
       End;
   End;
End;

Procedure TimageFilter.LineThiningX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=LineThining(Picture)
    Else
     begin
      Red:=LineThining(Red);
      Green:=LineThining(Green);
      Blue:=LineThining(Blue);
     ENd;
End;

Function TimageFilter.LineThiningS(var BitMa:TBitMat):Integer;
var
 Sn : Integer;
begin
   With BitMa do
    If not Colr then
     Picture:=LineThiningStep(Picture,Sn)
    Else
     begin
      Red:=LineThiningStep(Red,Sn);
      Green:=LineThiningStep(Green,Sn);
      Blue:=LineThiningStep(Blue,Sn);
     ENd;

   Result:=Sn;
End;


Procedure TimageFilter.pro1(Picture:ArByte2; var Sn : Integer);
var
   Pixels,Lines ,  s,n,y,x:integer;
   pp9,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8:integer;
     bol:array of array of boolean;
begin
 Lines:=Length(Picture);
 Pixels:=Length(Picture[0]);

 setlength(bol,lines,pixels);
 for y:=0 to Lines-1 do for x:=0 to pixels-1 do bol[y,x]:=false;

for y:=1 to Lines-2 do
 for X:=1 to Pixels-2 do
  begin
    If (picture[y,x])>200 Then pp1:=1 Else pp1:=0;
     If pp1=1 Then
     begin
    If (picture[y-1,x])>200 Then pp2:=1 Else pp2:=0;
    If (picture[y-1,x+1])>200 Then pp3:=1 Else pp3:=0;
    If (picture[y,x+1])>200 Then pp4:=1 Else pp4:=0;
    If (picture[y+1,x+1])>200 Then pp5:=1 Else pp5:=0;
    If (picture[y+1,x])>200 Then pp6:=1 Else pp6:=0;
    If (picture[y+1,x-1])>200 Then pp7:=1 Else pp7:=0;
    If (picture[y,x-1])>200 Then pp8:=1 Else pp8:=0;
    If (picture[y-1,x-1])>200 Then pp9:=1 Else pp9:=0;
      n:=pp2+pp3+pp4+pp5+pp6+pp7+pp8+pp9;
       If ((n<=6 )And(n>=2)) Then
        begin
         s:=0;
          If pp2>pp9 then s:=s+1;
          If pp3>pp2 then s:=s+1;
          If pp4>pp3 then s:=s+1;
          If pp5>pp4 then s:=s+1;
          If pp6>pp5 then s:=s+1;
          If pp7>pp6 then s:=s+1;
          If pp8>pp7 then s:=s+1;
          If pp9>pp8 then s:=s+1;
          If s=1 Then
          begin
            If ((pp2*pp4*pp6=0)And(pp4*pp6*pp8=0)) Then
            begin
              bol[y,x]:=true;
              sn:=sn+1;
            End;
          End;
        End;
     End;
  End;
  for y:=0 to Lines-1 do
  for x:=0 to pixels-1 do
   begin
    If bol[y,x] Then
     begin
        picture[y,x]:=0;
     End;
   End;

End;

Procedure TimageFilter.pro2(Picture:ArByte2; var Sn : Integer);
var
   PIxels,Lines,s,n,y,x:integer;
   pp9,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8:integer;
   bol:array of array of boolean;
begin
 Lines:=Length(Picture);
 Pixels:=Length(Picture[0]);
 setlength(bol,lines,pixels);

 for y:=0 to Lines-1 do for x:=0 to pixels-1 do bol[y,x]:=false;

 for y:=1 to Lines-2 do
  for X:=1 to Pixels-2 do
  begin
    If (picture[y,x])>200 Then pp1:=1 Else pp1:=0;
     If pp1=1 Then
     begin
    If (picture[y-1,x])>200 Then pp2:=1 Else pp2:=0;
    If (picture[y-1,x+1])>200 Then pp3:=1 Else pp3:=0;
    If (picture[y,x+1])>200 Then pp4:=1 Else pp4:=0;
    If (picture[y+1,x+1])>200 Then pp5:=1 Else pp5:=0;
    If (picture[y+1,x])>200 Then pp6:=1 Else pp6:=0;
    If (picture[y+1,x-1])>200 Then pp7:=1 Else pp7:=0;
    If (picture[y,x-1])>200 Then pp8:=1 Else pp8:=0;
    If (picture[y-1,x-1])>200 Then pp9:=1 Else pp9:=0;
      n:=pp2+pp3+pp4+pp5+pp6+pp7+pp8+pp9;
       If ((n<=6 )And(n>=2)) Then
        begin
         s:=0;
          If pp2>pp9 then s:=s+1;
          If pp3>pp2 then s:=s+1;
          If pp4>pp3 then s:=s+1;
          If pp5>pp4 then s:=s+1;
          If pp6>pp5 then s:=s+1;
          If pp7>pp6 then s:=s+1;
          If pp8>pp7 then s:=s+1;
          If pp9>pp8 then s:=s+1;
          If s=1 Then
          begin
            If ((pp2*pp4*pp8=0)And(pp2*pp6*pp8=0)) Then
            begin
              bol[y,x]:=true;
              sn:=sn+1;
            End;
          End;
        End;
     End;
  End;
  for y:=0 to Lines-1 do for x:=0 to pixels-1 do
   begin
    If bol[y,x] Then
     begin
        picture[y,x]:=0;
     End;
   End;

End;



Function TimageFilter.LineThining(Picture:ArByte2):ArByte2;
var
   Sn:integer;


begin

repeat
Sn:=0;
 Pro1(Picture,Sn);
 Pro2(Picture,Sn);
until Sn=0;

Result:=picture;
end;


Function TimageFilter.LineThiningStep(Picture:ArByte2; var Sn: Integer):ArByte2;
begin

Sn:=0;
 Pro1(Picture,Sn);
 Pro2(Picture,Sn);

Result:=picture;
end;


Procedure TimageFilter.DelPixelsX(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=DelPixels(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=DelPixels(Red,length(Red[0]),length(Red));
      Green:=DelPixels(Green,length(Green[0]),length(Green));
      Blue:=DelPixels(Blue,length(Blue[0]),length(Blue));
     ENd;
End;


Function TimageFilter.DelPixels(picture:ArByte2;pixels,lines:integer):ArByte2;
var
        y,x:integer;

begin
 for y:=1 to Lines-2 do
 For x:=1 to Pixels-2 do
 begin
    If (Picture[y,x])>128 then
     begin
         If (((Picture[y+1,x])<128)And
             ((Picture[y+1,x-1])<128)And
             ((Picture[y,x-1])<128)And
             ((Picture[y-1,x-1])<128)And
             ((Picture[y-1,x])<128)And
             ((Picture[y-1,x+1])<128)And
             ((Picture[y,x+1])<128)And
             ((Picture[y+1,x+1])<128)) Then
          Picture[y,x]:=0;
     End;
 End;
 DelPixels:=picture;
 End;

Procedure TimageFilter.DelPixels2X(var BitMa:TBitMat);
begin
   With BitMa do
    If not Colr then
     Picture:=DelPixels2(Picture,length(Picture[0]),length(Picture))
    Else
     begin
      Red:=DelPixels2(Red,length(Red[0]),length(Red));
      Green:=DelPixels2(Green,length(Green[0]),length(Green));
      Blue:=DelPixels2(Blue,length(Blue[0]),length(Blue));
     ENd;
End;

Function TimageFilter.DelPixels2(picture:ArByte2;pixels,lines:integer):ArByte2;
var
        n,m,y,x:integer;

begin
 for y:=1 to Lines-2 do
 For x:=1 to Pixels-2 do
 begin
   n:=(picture[y,x]);
    If (Picture[y,x])>128 then
     begin
     m:=0;
           If  (n-(Picture[y+1,x])>50) Then m:=m+1;
         If  (n-(Picture[y+1,x-1])>50) Then m:=m+1;
           If  (n-(Picture[y,x-1])>50) Then m:=m+1;
         If  (n-(Picture[y-1,x-1])>50) Then m:=m+1;
           If  (n-(Picture[y-1,x])>50) Then m:=m+1;
         If  (n-(Picture[y-1,x+1])>50) Then m:=m+1;
           IF  (n-(Picture[y,x+1])>50) Then m:=m+1;
         IF  (n-(Picture[y+1,x+1])>50) Then m:=m+1;
       If m<4 Then
          Picture[y,x]:=0;
     End;
 End;
 DelPixels2:=picture;
 End;

Procedure TimageFilter.REqHistogramX(var BitMa:TBitMat; Window,Level : Integer);
begin
   With BitMa do
    If not Colr then
     Picture:=REqHistogram(Picture,Window,Level)
    Else
     begin
      Red:=REqHistogram(Red,Window,Level);
      Green:=REqHistogram(Green,Window,Level);
      Blue:=REqHistogram(Blue,Window,Level);
     ENd;
End;

Function TimageFilter.CalcDeviationValue(Picture: ArByte2; x,y,Wx,Wy: integer):integer;
var
  i,j : Integer;
  Ma , Mi : Integer;
begin
Result:=0;
Ma:=0;
Mi:=1000000;
 for I := x-Wx to X+Wx- 1 do
   for J := Wy-15 to y+Wy- 1 do
    if (i<Length(Picture))and(j<Length(Picture[0])) then
     begin
       if Picture[j,i]>Ma then Ma:=Picture[j,i];
       if Picture[j,i]<Mi then Mi:=Picture[j,i];

     end;
      Result:=Ma-Mi;
end;

Function TimageFilter.REqHistogram(Picture : ArByte2; Window,Level : Integer):ArByte2;
var
  W,i,j,x,y : Integer;
   Mi , Ma : Integer;
begin
 SetLength(Result,length(Picture),length(Picture[0]));
 W:=Window;
 for I := w to Length(Picture)- W-1 do
   for J := w to Length(Picture[0])- W-1 do
     begin
      Mi := 1000000;
      Ma:=0;
        for X := -w to w do
          for Y := -w to w do
            begin
              if mi>picture[i+x,j+y] then  Mi:=picture[i+x,j+y];
              if ma<picture[i+x,j+y] then  Ma:=picture[i+x,j+y];

            end;
      if abs(Ma-Mi)>Level then
           Result[i,j]:=trunc((picture[i,j]-Mi)/(Ma-Mi)*255)
      else
        Result[i,j]:=picture[i,j];
     end;

for I := 0 to Length(Picture)- 1 do
   for J := 0 to W- 1 do
      begin
        Result[i,j]:=255;
        Result[i,Length(Picture[0])-j-1]:=255;
      end;

    for j := 0 to Length(Picture[0])- 1 do
     for I := 0 to W- 1 do
       begin
         Result[i,j]:=255;
         Result[Length(Picture)-i-1,j]:=255;
       end;


{   l:=Length(Picture[0])-1;
   for I := 0 to Length(Picture)- 1 do
     begin
       Result[i,0]:=picture[i,0];
       Result[i,L]:=picture[i,L];
     end;

    L:=Length(Picture)-1;
    for J := 0 to Length(Picture[0])- 1 do
      begin
        Result[0,j]:=picture[0,j];
        Result[L,j]:=picture[l,j];
      end;
  }
end;



 Function TimageFilter.ExHistogram(picture:ArByte2;pixels,lines:integer):ArByte2;
 const
     band=5;
     less=20;
   label e2,e11;
var
   min,max,x,y,i,ii:integer;
   sum:array[0..255] of integer;
   m:real;
   flag:boolean;
begin
   max:=0;
   min:=256;
   For i:=0 to 255 do Sum[i]:=0;
   for y:=0 to lines-1 do
   for x:=0 to pixels-1 do
      sum[(picture[y,x])]:=Sum[(picture[y,x])]+1;

      For i:=0 to 255 do
      If sum[i]>less Then
      begin
      flag:=true;
       For ii:=1 to band Do
        If Sum[i+ii]<less then
          flag:=false;
        If flag then begin min:=i;goto e11;End;
      End;

 e11:
  For i:=255 Downto 0 do
    If sum[i]>less Then
    begin
     flag:=true;
     For ii:=1 to band Do If sum[i-ii]<less Then Flag:=false;
     If flag Then  begin max:=i;goto e2;End;
    End;

 e2:

     For y:=0 to Lines-1 do
     For x:=0 to Pixels-1 do
      begin
       m:=(picture[y,x]-min)*255/(max-min);
       If m>255 Then m:=255;
       If m<0 Then m:=0;
       Picture[y,x]:=trunc(m);
      End;
          ExHistogram:=picture;
end;

Procedure TimageFilter.ExtendHistogramX(var Mat : TbitMat; Max,Min : Integer);
begin
if Mat.Colr then
 begin
   Mat.Red:=ExtendHistogram(Mat.Red,Max,Min);
   Mat.Green:=ExtendHistogram(Mat.Green,Max,Min);
   Mat.Blue:=ExtendHistogram(Mat.Blue,Max,Min);
 end
else
 begin
   Mat.Picture:=ExtendHistogram(Mat.Picture,Max,Min);

 end;


end;

Function TimageFilter.ExtendHistogram(Picture : ArByte2;MAx,Min : integer ):ArByte2;
var
 I,J : Integer;
 m: real;
begin
SetLength(Result,length(Picture),length(Picture[0]));

 for I := 0 to Length(Picture)- 1 do
  for J := 0 to Length(Picture[0])- 1 do
    begin
       m:=(picture[i,j]-min)*255/(max-min);
       If m>255 Then m:=255;
       If m<0 Then m:=0;
       Result[i,j]:=trunc(m);


    end;



end;

 Procedure  TimageFilter.ExHistogramC(var Bitma:TBitMat);
 const
     band=5;
     less=20;
   label e21,e22,e23,e11,e12,e13;
var
   min,max,x,y,i,ii:integer;
   minA,maxA:array[1..3] of integer;
   GSum,BSum,Rsum:array[0..255] of integer;
   m:real;
   flag:boolean;
begin
   For i:=0 to 255 do begin RSum[i]:=0;GSum[i]:=0;BSum[i]:=0;End;
   for y:=0 to Bitma.Lines-1 do
   for x:=0 to BitMa.Pixels-1 do
     begin
      Rsum[(Bitma.Red[y,x])]:=  RSum[(BitMa.Red[y,x])]+1;
      Gsum[(Bitma.Green[y,x])]:=GSum[(BitMa.Green[y,x])]+1;
      Bsum[(Bitma.Blue[y,x])]:= BSum[(BitMa.Blue[y,x])]+1;
     End;

     {RMin}
     For i:=0 to 255 do
     If Rsum[i]>less Then
      begin
      flag:=true;
       For ii:=1 to band Do
         If RSum[i+ii]<less then flag:=false;
        If flag then
         begin
           mina[1]:=i;
           goto e11;
         End;
      End;
     {GMin}
e11: For i:=0 to 255 do If Gsum[i]>less Then
      begin
      flag:=true;
       For ii:=1 to band Do If GSum[i+ii]<less then flag:=false;
        If flag then begin mina[2]:=i;goto e12;End;
      End;
     {BMin}
E12:For i:=0 to 255 do If Bsum[i]>less Then
      begin
      flag:=true;
       For ii:=1 to band Do If BSum[i+ii]<less then flag:=false;
        If flag then begin mina[3]:=i;goto e13;End;
      End;

 e13:

 {Max}
  For i:=255 Downto 0 do  If Rsum[i]>less Then
    begin
     flag:=true;
     For ii:=1 to band Do If Rsum[i-ii]<less Then  Flag:=false;
     If flag Then  begin maxa[1]:=i;goto e21;End;
    End;
 {Max}
e21:For i:=255 Downto 0 do  If Gsum[i]>less Then
    begin
     flag:=true;
     For ii:=1 to band Do If Gsum[i-ii]<less Then  Flag:=false;
     If flag Then  begin maxa[2]:=i;goto e22;End;
    End;
 {Max}
e22:For i:=255 Downto 0 do  If Bsum[i]>less Then
    begin
     flag:=true;
     For ii:=1 to band Do If Bsum[i-ii]<less Then  Flag:=false;
     If flag Then  begin maxa[3]:=i;goto e23;End;
    End;

 e23:

 If mina[1]<mina[2] Then min:=Mina[1] Else min:=mina[2];
 If min>mina[3] Then min:=mina[3];

 If maxa[1]>maxa[2] Then max:=maxa[1] Else max:=maxa[2];
 If max<maxa[3] Then max:=maxa[3];


     For y:=0 to BitMa.Lines-1 do
      For x:=0 to BitMa.Pixels-1 do
      begin
         m:=(BitMa.Red[y,x]-min)*255/(max-min);
         If m>255 Then m:=255;If m<0 Then m:=0;
         BitMa.Red[y,x]:=trunc(m);

         m:=(BitMa.green[y,x]-min)*255/(max-min);
         If m>255 Then m:=255;If m<0 Then m:=0;
         BitMa.Green[y,x]:=trunc(m);

         m:=(Bitma.Blue[y,x]-min)*255/(max-min);
         If m>255 Then m:=255;If m<0 Then m:=0;
         BitMa.Blue[y,x]:=trunc(m);

      End;

end;

Procedure TimageFilter.Invert(var BitMa:TBitMat );
var
  X,Y:integer;
begin
 With BitMa do
 If not(colr) THen
   For y:=0 to Lines-1 do For x:=0 to Pixels-1 do
    picture[y,x]:=(255-(picture[y,x]))
    Else
   For y:=0 to Lines-1 do For x:=0 to pixels-1 do
    begin
     Red[y,x]:=(255-(red[y,x]));
     Green[y,x]:=(255-(Green[y,x]));
     Blue[y,x]:=(255-(Blue[y,x]));
    End;   
eNd;

Procedure TimageFilter.DoRGB2HSI(R,G,B:byte; var Hue,Sat,Int : real);
var
     m,n,m1,mm,rr,gg,bb:real;

begin
   rr:=(R)/255;
   gg:=(G)/255;
   bb:=(B)/255;

   mm:=rr; If mm>gg Then mm:=gg; If mm>bb Then mm:=bb;

    Int:=240*(RR+GG+BB)/3;
   If Int>1e-7 Then
    Sat:=240*(1-3/(rr+gg+bb)*mm);
   If Sat>1e-7 Then
   begin
       m:=(rr-gg)*(rr-gg)+(rr-bb)*(gg-bb);
       m1:=0.5*((rr-gg)+(RR-bb))/sqrt(m);
       n:=arccos(m1);
       Hue:=n/(2*pi)*240;
       If bb>gg Then
          Hue:=240-Hue;
   End;

end;



Procedure TimageFilter.RGB2HSI(var BitMa:TBitMat);
var
   mm,rr,gg,bb:real;
   x,y:integer;
   n,m,m1:real;

 Procedure Sethsi;
 begin
       setlength(BitMa.Int,BitMa.Lines,BitMa.Pixels);
       setlength(BitMa.Hue,BitMa.Lines,BitMa.Pixels);
       setlength(BitMa.Sat,BitMa.Lines,BitMa.Pixels);
 End;

begin
 sethsi;
 For y:=0 to BitMa.Lines-1 do
  for x:=0 to BitMa.Pixels-1 do
   begin
     BitMa.Int[y,x]:=0;BitMa.Sat[y,x]:=0;BitMa.Hue[y,x]:=0;
     With BitMa do
      Dorgb2hsi(Red[y,x],Green[y,x],Blue[y,x],Hue[y,x],Sat[y,x],Int[y,x]);
   End;
end;


procedure TimageFilter.rgb2hsi1(var BitMa:TBitMat);
var
   mm,rr,gg,bb:real;
   x,y:integer;
   n,m,m1:real;

begin
// sethsi(l,p);
 With Bitma do
 begin
   setlength(Int,Lines,Pixels);
   setlength(Sat,Lines,Pixels);
   setlength(Hue,Lines,Pixels);
   For y:=0 to Lines-1 do
    for x:=0 to Pixels-1 do
     begin
     Int[y,x]:=0;Sat[y,x]:=0;Hue[y,x]:=0;
     rr:=(red[y,x])/256;
     gg:=(green[y,x])/256;
     bb:=(blue[y,x])/256;
  //   mm:=Min(rr,gg,bb);
     mm:=rr;
     If mm>gg Then mm:=gg;
     If mm>bb Then mm:=bb;
      Int[y,x]:=240*(RR+GG+BB)/3;

     If Int[y,x]>1e-7 Then
      Sat[y,x]:=240*(1-3/(rr+gg+bb)*mm)
     else
      Sat[y,x]:=0;



     If Sat[y,x]>1e-7 Then
     begin
         m:=(gg-rr)*(GG-rr)+(gg-bb)*(rr-bb);
         m1:=0.5*((rr-gg)+(rr-bb))/sqrt(m);
         n:=arccos(m1);
         Hue[y,x]:=n/(2*pi)*240;
         If bb>rr Then
             Hue[y,x]:=240-hue[y,x];
     End
    else
     Hue[y,x]:=0;
     End;
   ENd;
end;


Procedure TimageFilter.MakePicAdditiveSaltyNoisy(Rate:Integer;var BitMa:TBitMat);
var
  m,n,i,j,x,y:Integer;
  picbool:ArBoolean2;

      Function MakeNoisy(X:Byte):Byte;
       var
         k:integer;
       begin
         K:=trunc(X+Random(256)-127);
         If k<0 Then k:=0;
          If k>255 Then k:=255;
          Result:=k;
       ENd;


begin
with BitMa do
begin
SetLength(picbool,Lines,Pixels);

For i:=0 to Lines-1 do
 for j:=0 to Pixels-1 do
  picbool[i,j]:=false;


If Rate=0 tHen
 begin
  x:=0;
  y:=0;
 End
Else
 begin
  x:=round(Pixels/(100/Rate));
  y:=Round(Lines/(100/Rate));
 ENd;
 Randomize;
 For i:=0 to Y-1 do
  For j:=0 to X-1 do
   begin
   repeat
    M:=random(Pixels);
    N:=Random(Lines);
   until not picbool[n,m];
    If Colr then
     begin
      Red[n,m]:=MakeNoisy(red[n,m]);
      Green[n,m]:=MakeNoisy(green[n,m]);
      Blue[n,m]:=MakeNoisy(Blue[n,m]);
     end
   else
      Picture[n,m]:=MakeNoisy(picture[n,m]);
    picbool[n,m]:=true;

   End;
ENd;
end;


Procedure TimageFilter.MakePicGaussyNoisy(Rate:Integer;V:Byte;var BitMa:TBitMat);
var
  m,n,i,j,x,y:Integer;
  picbool:ArBoolean2;

      Function MakeGaussy(X,Vari:Byte):Byte;
       var
         k:integer;
       begin
         K:=trunc(X+Randg(0,Vari));
         If k<0 Then k:=0;
          If k>255 Then k:=255;
          Result:=k;
       ENd;

begin
with BitMa do
begin
SetLength(picbool,Lines,Pixels);

For i:=0 to Lines-1 do
 for j:=0 to Pixels-1 do
  picbool[i,j]:=false;


If Rate=0 tHen
 begin
  x:=0;
  y:=0;
 End
Else
 begin
  x:=round(Pixels/(100/Rate));
  y:=Round(Lines/(100/Rate));
 ENd;
 Randomize;
 For i:=0 to Y-1 do
  For j:=0 to X-1 do
   begin
   repeat
    M:=random(Pixels);
    N:=Random(Lines);
   until not picbool[n,m];
    If Colr then
     begin
      Red[n,m]:=MakeGaussy(red[n,m],V);
      Green[n,m]:=MakeGaussy(green[n,m],V);
      Blue[n,m]:=MakeGaussy(Blue[n,m],v);
     end
      else
       begin
         Picture[n,m]:=MakeGaussy(picture[n,m],V);
       ENd;
     picbool[n,m]:=true;

   End;
ENd;
end;


Procedure TimageFilter.DoHSI2RGB(var BitMa:TBitMat);
var
   ss,hh,ii:real;
   n1,n2,n3,x,y:integer;


begin
//HAdiof.DllSetmat(BitMa);


For y:=0 to BitMa.Lines-1 do
 For x:=0 to BitMa.Pixels-1 do
begin
     ss:=BitMa.sat[y,x]/256;
     hh:=BitMa.hue[y,x]/256*2*pi;
     ii:=BitMa.Int[y,x]/256;

     n1:=round(255*(1-ss)*ii);
     n2:=round(255*(1+ss*cos(hh)/cos(Pi/3-hh))*ii);
     n3:=round(255*3*ii-(n1+n2));
 If (hh<2*pi/3) Then
   begin
      BitMa.Blue[y,x]:=(n1);
      BitMa.Red[y,x]:=(n2);
      BitMa.Green[y,x]:=(n3);
   End;
  If (hh>2*pi/3)And(hh<4*pi/3) Then
  begin
   hh:=hh-2*pi/3;
     n2:=round(255*(1+ss*cos(hh)/cos(Pi/3-hh))*ii);
     n3:=round(255*3*ii-(n1+n2));
      BitMa.Red[y,x]:=(n1);
      BitMa.Green[y,x]:=(n2);
      BitMa.Blue[y,x]:=(n3);
   End;
   If hh>4*pi/3 then
   begin
    hh:=hh-4*pi/3;
     n2:=round(255*(1+ss*cos(hh)/cos(Pi/3-hh))*ii);
     n3:=round(255*3*Ii-(n1+n2));
       BitMa.Green[y,x]:=(n1);
       BitMa.Blue[y,x]:=(n2);
       BitMa.Red[y,x]:=(n3);
   End;
 End;
End;

Procedure TimageFilter.Area(lav:integer;var BitMa:TBitMat);
var
   Sum,n,x,y,i,j:integer;
   p1,p2:ArByte2;

 Procedure Next(var i,j,n:integer);
 label l0,l1,l2,l3,l4,l5,l6,l7;
 var
    m:integer;
    flag:boolean;
 begin
    flag:=false;
    n:=n+5;
    n:=n-8*trunc(n/8);
    m:=n;
    case m of
     0: goto l0;
     1: goto l1;
     2: goto l2;
     3: goto l3;
     4: goto l4;
     5: goto l5;
     6: goto l6;
     7: goto l7;
    End;
    L0:flag:=true;If (J<BitMa.Pixels-1)ANd((p1[i,j+1])>10) then begin n:=0;i:=i;j:=j+1;Exit;End;
    L1:If (i>1)And(J<BitMa.Pixels-1)And((p1[i-1,j+1])>10) then begin n:=1;i:=i-1;j:=j+1;Exit;End;
    L2:If (I>1)             And((p1[i-1,j])>10)   then begin n:=2;i:=i-1;j:=j;Exit;End;
    L3:If (I>1)And(J>1)     And((p1[i-1,j-1])>10) then begin n:=3;i:=i-1;j:=j-1;Exit;End;
    L4:If         (J>1)     And((p1[i,j-1])>10)   then begin n:=4;i:=i;  j:=j-1;Exit;End;
    L5:If (I<BitMa.Lines-1)And(J>1) ANd((p1[i+1,j-1])>10) then begin n:=5;i:=i+1;j:=j-1;Exit;End;
    L6:If (I<BitMa.Lines-1)         And((p1[i+1,j])>10)   then begin n:=6;i:=i+1;j:=j;Exit;End;
    L7:If (I<BitMa.Lines-1)And(j<BitMa.Pixels-1)And((p1[i+1,j+1])>10) then begin n:=7;i:=i+1;j:=j+1;Exit;End;


   If not(flag) then goto l0 ;
   i:=0;j:=0;
End;




begin
  setlength(p1,BitMa.Lines);
   Setlength(p2,BitMa.Lines);

   For i:=0 to BitMa.Lines-1 do
    begin
        p1[i]:=copy(BitMa.Picture[i],0,BitMa.Pixels);
        p2[i]:=copy(BitMa.Picture[i],0,BitMa.Pixels);
    end;
    i:=2;
    repeat
     i:=i+1;j:=2;
     repeat
     j:=j+1;
     If (p1[i,j])>10 then
      begin
       n:=4;
       Sum:=0;
       x:=i;
       y:=j;
       repeat
          p1[x,y]:=0;
          p2[x,y]:=0;
          Sum:=Sum+1;
          Next(X,Y,N);
       until (X=0)And(Y=0);

       If Sum<lav then
        begin
         For x:=0 to BitMa.Lines-1 do
           BitMa.Picture[x]:=copy(p2[x],0,BitMa.Pixels);
         End
          Else
          begin
         For x:=0 to BitMa.Lines-1 do
            p2[x]:=copy(BitMa.Picture[x],0,BitMa.Pixels);
          End;

      End;
     until j=BitMa.Pixels-3;
    until i=BitMa.Lines-3;
//   Area:=pic;
End;

Function TimageFilter.CalcAreaPoint(A,B : Tpoint):Integer;
var
  i:integer;
begin
 Result:=abs((A.X-B.X)*(A.Y-B.Y));

end;

 Procedure TimageFilter.NextPoint(BitMa:TBitMat;Lav:integer; var i,j,n:integer);
 label l0,l1,l2,l3,l4,l5,l6,l7;
 var
    m:integer;
    flag:boolean;
    p1:ArByte2;
 begin
   p1:=BitMa.Picture;
    flag:=false;
    n:=n+5;
    n:=n mod 8;//n-8*trunc(n/8);
    m:=n;
    case m of
     0: goto l0;
     1: goto l1;
     2: goto l2;
     3: goto l3;
     4: goto l4;
     5: goto l5;
     6: goto l6;
     7: goto l7;
    End;
    L0:flag:=true;If (J<BitMa.Pixels-1)ANd((p1[i,j+1])>lav) then begin n:=0;i:=i;j:=j+1;Exit;End;
    L1:If (i>1)And(J<BitMa.Pixels-1)And((p1[i-1,j+1])>Lav) then begin n:=1;i:=i-1;j:=j+1;Exit;End;
    L2:If (I>1)             And((p1[i-1,j])>Lav)   then begin n:=2;i:=i-1;j:=j;Exit;End;
    L3:If (I>1)And(J>1)     And((p1[i-1,j-1])>Lav) then begin n:=3;i:=i-1;j:=j-1;Exit;End;
    L4:If         (J>1)     And((p1[i,j-1])>Lav)   then begin n:=4;i:=i;  j:=j-1;Exit;End;
    L5:If (I<BitMa.Lines-1)And(J>1) ANd((p1[i+1,j-1])>Lav) then begin n:=5;i:=i+1;j:=j-1;Exit;End;
    L6:If (I<BitMa.Lines-1)         And((p1[i+1,j])>Lav)   then begin n:=6;i:=i+1;j:=j;Exit;End;
    L7:If (I<BitMa.Lines-1)And(j<BitMa.Pixels-1)And((p1[i+1,j+1])>Lav) then begin n:=7;i:=i+1;j:=j+1;Exit;End;
   If not(flag) then goto l0 ;
       i:=0;j:=0;
End;


Function TimageFilter.CalcArea(Sx,Sy,lav:integer;var BitMa:TBitMat):TIObject;
var
   Sum,n,x,y,i,j:integer;

begin
    j:=Sx;
    i:=Sy;
       Sum:=0;
    Result.Xmin:=1000;
    Result.Ymin:=1000;
    Result.Xmax:=-1;
    Result.Ymax:=-1;
     If (BitMa.Picture[i,j])>Lav then
      begin
       n:=4;
       x:=i;
       y:=j;
         {First Lakke}
       repeat
         If X<Result.Ymin Then Result.Ymin:=X;
         If X>Result.Ymax Then Result.Ymax:=X;
         If Y<Result.Xmin Then Result.Xmin:=Y;
         If Y>Result.Xmax Then Result.Xmax:=Y;

          BitMa.Picture[x,y]:=round(lav/2);
          Sum:=Sum+1;
          NextPoint(BitMa,lav,X,Y,N);
       until (X=0)And(Y=0);
      End;
      
 Result.Area:=Sum;
End;

Function TimageFilter.Hemorfing(picture:ArByte2;pixels,lines:integer):ArByte2;
const
   alpha = 1.9;
var
   mat:array[1..3,1..3] of real;
   i,j:integer;
   bb,aa:Are2;
   m:real;

begin
m:=alpha*3;
mat[1,1]:=1;mat[1,2]:=1;mat[1,3]:=1;
mat[2,1]:=1;mat[2,2]:=-9*Alpha+1;mat[2,3]:=1;
mat[3,1]:=1;mat[3,2]:=1;mat[3,3]:=1;
//p:=picture;
setlength(aa,lines,pixels);
setlength(bb,lines,pixels);

 for i:=0 TO lines-1 do
  For j:=0 TO pixels-1 Do
  If picture[i,j]>0 Then
     aa[i,j]:=ln(picture[i,j])
   Else
      aa[i,j]:=ln(1e-6);

 for  i:=1 to Lines-2 do
  For j:=1 to Pixels-2 do
   bb[i,j]:=(trunc(Abs(((aa[i-1,j-1])*mat[1,1]+(aa[i-1,j])*mat[1,2]+(aa[i-1,j+1])*mat[1,3]+
                              (aa[i,j-1])*mat[2,1]+(aa[i,j])*mat[2,2]+(aa[i,j+1])*mat[2,3]+
                             (aa[i+1,j-1])*mat[3,1]+(aa[i+1,j])*mat[3,2]+(aa[i+1,j+1])*mat[3,3])/m)));

 for i:=0 TO lines-1 do
  For j:=0 TO pixels-1 Do
     aa[i,j]:=Exp(bb[i,j]);

  For i:=0 to lines-1 do
   For j:=0 TO pixels-1 do
   picture[i,j]:=trunc(aa[i,j]);
   Hemorfing:=picture;
End;

procedure TimageFilter.HemorfingX(var BitMa: Tbitmat);
begin
With BitMa do
If not(colr) Then
    picture:=Hemorfing(picture,pixels,lines)
Else
 begin
   Red:=Hemorfing(Red,pixels,lines);
   Green:=Hemorfing(Green,pixels,lines);
   Blue:=Hemorfing(Blue,pixels,lines);
 End;

end;

Procedure TimageFilter.DoInt(value:integer;var BitMa:TBitMat);
var
        i,j:integer;
        c:real;
begin

 for i:=0 To BitMa.Lines-1 do
  For j:=0 To BitMa.Pixels-1 DO
   begin
       c:=(BitMa.RED[i,j]+BitMa.green[i,j]+BitMa.blue[i,j]);
   If c>Value Then
    begin
       BitMa.Red[i,j]:=trunc(BitMa.Red[i,j]/c*255);
       BitMa.Green[i,j]:=trunc(BitMa.Green[i,j]/c*255);
       BitMa.Blue[i,j]:=trunc(BitMa.Blue[i,j]/c*255);
    End
     Else
      begin
         BitMa.Red[i,j]:=0;
         BitMa.Green[i,j]:=0;
         BitMa.Blue[i,j]:=0;
      End;
   ENd;
end;

function TimageFilter.ProjectX(BItmat : Tbitmat):Ari;
var
  i,j : Integer;
begin
SetLength(Result,0);
SetLength(Result,BItmat.Pixels);
 for I := 0 to BItmat.Pixels-1 do
   begin
    for j := 0 to BItmat.Lines-1 do
        Result[i]:=Result[i]+BItmat.Picture[j,i];
    Result[i]:=Trunc(result[i]/BItmat.Lines);
   end;


end;

function TimageFilter.ProjectY(BItmat : Tbitmat):Ari;
var
  i,j : Integer;
begin
SetLength(Result,0);
SetLength(Result,BItmat.Lines);
 for j := 0 to BItmat.Lines-1 do
   begin
      for I := 0 to BItmat.Pixels-1 do
        Result[j]:=Result[j]+BItmat.Picture[j,i];
   end;


end;

Procedure TimageFilter.DoTriming(leftt,topp,widthh,heightt:integer;var BitMa:TBitMat);
var
   m,n,i,j:integer;
   p1,p2,p3:ArByte2;

begin
   m:=topp;
   n:=leftt;

   If not(BitMa.Colr) Then
     begin
       P1:=BitMa.Picture;
       For j:=0 to Heightt-1 do
       For i:=0 to Widthh-1 do
        BitMa.Picture[j,i]:=p1[j+m,i+n];
         BitMa.Pixels:=widthh;
         BitMa.Lines:=heightt;
      SetLength(BitMa.Picture,BitMa.Lines,BitMa.Pixels);
     End
   else
    begin
    p1:=BitMa.Red;
    p2:=BitMa.Green;
    p3:=BitMa.Blue;
      For j:=0 to Heightt-1 do
      For i:=0 to Widthh-1 do
      begin
       BitMa.Red[j,i]:=p1[j+m,i+n];
       BitMa.Green[j,i]:=p2[j+m,i+n];
       BitMa.Blue[j,i]:=p3[j+m,i+n];
       End;
   BitMa.Pixels:=Widthh;
   BitMa.Lines:=Heightt;
      SetLength(BitMa.Red,BitMa.Lines,BitMa.Pixels);
      SetLength(BitMa.Green,BitMa.Lines,BitMa.Pixels);
      SetLength(BitMa.Blue,BitMa.Lines,BitMa.Pixels);
   End;

ENd;


Function TimageFilter.SinHistogram_up(Input:ArByte2;Level : Byte):ArByte2;
var
   c,x,y:integer;
   M:Real;
begin
 SetLength(Result,length(Input),length(Input[0]));
   For y:=0 to Length(Input)-1 do
    for x:=0 to Length(Input[0])-1 do
    begin
      c:=input[y,x];
      m:=(c-Level)/256;
      if M<-0.5 then M:=-0.5;
      if M>0.5  then M:=0.5;


      Result[y,x]:=(trunc(128*(1+sin((M*Pi)))));
    End;
end;


Function TimageFilter.SinHistogram_Down(Input:ArByte2):ArByte2;
var
   c,x,y:integer;
   rr:real;
begin
 SetLength(Result,length(Input),length(Input[0]));
   For y:=0 to Length(Input)-1 do
    for x:=0 to Length(Input[0])-1 do
    begin
     c:=(Input[y,x]);
     rr:=(c-128)/128;
     Result[y,x]:=(trunc(256/pi*(pi/2+ArcSin(rr))));
    End;
End;    

procedure TimageFilter.SinHistogramX_Down(var Bitma: TBitMat);
begin
 With Bitma do
   If not Colr THen
    Picture:=SinHistogram_Down(Picture)
   Else
    begin
      Red:=SinHistogram_Down(Red);
      Green:=SinHistogram_Down(Green);
      Blue:=SinHistogram_Down(Blue);
    End;
end;

procedure TimageFilter.SinHistogramX_up(var Bitma: TBitMat;Level:Integer);
begin
 With Bitma do
   If not Colr THen
    Picture:=SinHistogram_up(Picture,Level)
   Else
    begin
      Red:=SinHistogram_up(Red,Level);
      Green:=SinHistogram_up(Green,Level);
      Blue:=SinHistogram_up(Blue,level);
    End;
end;


Function TimageFilter.Br_Downi(Input:ArByte2;C:Byte):ArByte2;
var
   x,y:integer;
begin
 SetLength(Result,length(Input),length(Input[0]));
   For y:=0 to Length(Input)-1 do
    for x:=0 to Length(Input[0])-1 do
       If Input[y,x]>C then Result[y,x]:=Input[y,x]-C
        Else
         Result[y,x]:=0;

end;


Function TimageFilter.Br_Upi(Input:ArByte2;C:Byte):ArByte2;
var
   x,y:integer;
begin
 SetLength(Result,length(Input),length(Input[0]));
   For y:=0 to Length(Input)-1 do
    for x:=0 to Length(Input[0])-1 do
       If Input[y,x]<(255-C) then Result[y,x]:=C+Input[y,x]
       Else Result[y,x]:=(255);
end;

procedure TimageFilter.BrightnessX_Down(var Bitma: TBitMat;C:Byte);
begin
 With Bitma do
   If not Colr THen
    Picture:=Br_Downi(Picture,c)
   Else
    begin
      Red:=Br_Downi(Red,c);
      Green:=Br_Downi(Green,c);
      Blue:=Br_Downi(Blue,c);
    End;
end;

procedure TimageFilter.BrightnessX_Up(var Bitma: TBitMat;C:Byte);
begin
 With Bitma do
   If not Colr THen
    Picture:=Br_Upi(Picture,c)
   Else
    begin
      Red:=Br_Upi(Red,c);
      Green:=Br_Upi(Green,c);
      Blue:=Br_Upi(Blue,c);
    End;
end;


Function TimageFilter.Erosion(input:ArBooLean2;N:byte):ArBoolean2;
var
  i,j,x,y:integer;
begin
SetLength(Result,length(Input),length(input[0]));
 For i:=N to Length(input)-N-1 do
  For j:=N to length(input[0])-N-1 do
   begin
     Result[i,j]:=input[i,j];
     If input[i,j] then
      For x:=-N+1 to N-1 do
       for y:=-N+1 to N-1 do
        begin
           If not input[i+x,j+y] then
            Result[i,j]:=false;
        ENd;
   End;
ENd;

Function TimageFilter.Delation(input:ArBooLean2;N:byte):ArBoolean2;
var
  i,j,x,y:integer;

begin
SetLength(Result,length(Input),length(input[0]));
 For i:=N to Length(input)-N-1 do
  For j:=N to length(input[0])-N-1 do
   begin
     Result[i,j]:=input[i,j];
     If not input[i,j] then
      For x:=-N+1 to N-1 do
       for y:=-N+1 to N-1 do
        begin
           If input[i+x,j+y] then
            Result[i,j]:=true;
        ENd;
   End;
ENd;


Procedure TimageFilter.MakePicCheckered(Size,Ample:integer;var BitMa:TBitmat);
var
  i,j,k:integer;
  Picty:Ari2;
begin
    SetLength(Picty,BitMa.Lines,BitMa.Pixels);
   With BitMa do
   For j:=0 to Lines-1 do
    For i:=0 to Pixels-1 do
     begin
      k:=trunc((I+J)) mod 2;
        If (K mod 2)=0 Then Picty[i,j]:=-Ample
      Else                  Picty[i,j]:=+Ample;

     ENd;
   With BitMa do
   For j:=0 to Lines-1 do
    For i:=0 to Pixels-1 do
     begin
      k:=trunc((Picture[i,j]+ Picty[i,j])/2);
         If k<0 Then k:=0;   If k>255 Then k:=255;
      Picture[i,j]:=k;
     ENd;
ENd;

procedure TimageFilter.ExHistogramX(var BitMa: TBitMat);
begin
If BitMa.Colr then
 ExHistogramC(BitMa)
Else
 With BitMa Do
  picture := ExHistogram(Picture , Pixels,Lines);
end;

Function TimageFilter.MeanArPicX(ArPics : ArBitMat; StartFrame, StopFrame : Integer):Tbitmat;
var
  L,K,i,j : Integer;
  R,G,B,Pic  : Ari2;
begin
 l:=Length(ArPics);
 SetLength(R,0,0);
 SetLength(G,0,0);
 SetLength(B,0,0);
 SetLength(Pic,0,0);
     Result:=BitMatAssign(ArPics[0]);

 if ArPics[0].Colr then
  begin
  SetLength(R,ArPics[0].Lines,ArPics[0].Pixels);
  SetLength(G,ArPics[0].Lines,ArPics[0].Pixels);
  SetLength(B,ArPics[0].Lines,ArPics[0].Pixels);
     for k := StartFrame to StopFrame- 1 do
       begin
        for I := 0 to ArPics[0].Pixels- 1 do
         for J := 0 to ArPics[0].Lines- 1 do
           begin
              R[j,i]:=R[j,i]+ArPics[k].Red[j,i];
              G[j,i]:=G[j,i]+ArPics[k].Green[j,i];
              B[j,i]:=B[j,i]+ArPics[k].Blue[j,i];
           end;
       end;
     l:=StopFrame-StartFrame;
        for I := 0 to ArPics[0].Pixels- 1 do
         for J := 0 to ArPics[0].Lines- 1 do
           begin
             Result.Red[j,i]:=trunc(R[j,i]/L);
             Result.Green[j,i]:=trunc(G[j,i]/L);
             Result.Blue[j,i]:=trunc(B[j,i]/L);

           end;

  end
 Else
  begin
  SetLength(Pic,ArPics[0].Lines,ArPics[0].Pixels);
     for k := 0 to L- 1 do
       begin
        for I := 0 to ArPics[0].Pixels- 1 do
         for J := 0 to ArPics[0].Lines- 1 do
           begin
              Pic[j,i]:=Pic[j,i]+ArPics[k].Picture[j,i];
           end;
       end;
        for I := 0 to ArPics[0].Pixels- 1 do
         for J := 0 to ArPics[0].Lines- 1 do
           begin
             Result.Picture[j,i]:=trunc(Pic[j,i]/l);

           end;

  end;

end;

Procedure TimageFilter.SkewXR(var BitMa : TBitMat; P1,P2 : Integer);
begin
 if BitMa.Colr then
  begin
    BitMa.Red:=DoSkewXR(BitMa.Red,P1,P2);
    BitMa.Green:=DoSkewXR(BitMa.Green,P1,P2);
    BitMa.Blue:=DoSkewXR(BitMa.Blue,P1,P2);
  end
 Else
  begin
    BitMa.Picture:=DoSkewXR(BitMa.Picture,P1,P2);
  end;
  BitMa.Pixels:=Max(P1,P2);

end;

Procedure TimageFilter.SkewXL(var BitMa : TBitMat; P1,P2 : Integer);
begin
 if BitMa.Colr then
  begin
    BitMa.Red:=DoSkewXL(BitMa.Red,P1,P2);
    BitMa.Green:=DoSkewXL(BitMa.Green,P1,P2);
    BitMa.Blue:=DoSkewXL(BitMa.Blue,P1,P2);
  end
 Else
  begin
    BitMa.Picture:=DoSkewXL(BitMa.Picture,P1,P2);
  end;
  BitMa.Pixels:=Max(P1,P2);

end;

Procedure TimageFilter.SkewYD(var BitMa : TBitMat; L1,L2 : Integer);
begin
 if BitMa.Colr then
  begin
    BitMa.Red:=DoSkewYD(BitMa.Red,L1,L2);
    BitMa.Green:=DoSkewYD(BitMa.Green,L1,L2);
    BitMa.Blue:=DoSkewYD(BitMa.Blue,L1,L2);
  end
 Else
  begin
    BitMa.Picture:=DoSkewYD(BitMa.Picture,L1,L2);
  end;
  BitMa.Lines:=Max(L1,L2);

end;

Procedure TimageFilter.SkewYU(var BitMa : TBitMat; L1,L2 : Integer);
begin
 if BitMa.Colr then
  begin
    BitMa.Red:=DoSkewYU(BitMa.Red,L1,L2);
    BitMa.Green:=DoSkewYU(BitMa.Green,L1,L2);
    BitMa.Blue:=DoSkewYU(BitMa.Blue,L1,L2);
  end
 Else
  begin
    BitMa.Picture:=DoSkewYU(BitMa.Picture,L1,L2);
  end;
  BitMa.Lines:=Max(L1,L2);

end;


Function TimageFilter.DoSkewXR(pic:ArByte2;P1,P2:integer):ArByte2;
var
   pix,lin,k,i,j,F:integer;
   MaxX : Integer;
   P,n,Wx:real;

begin
 MaxX:=Max(P1,P2);
 lin:=Length(Pic);
 pix:=length(Pic[0]);
   setlength(Result,Lin,MaxX);
    For k:=0 to lin-1 Do
     begin
      P:=K*((p2-p1)/lin)+P1;

     n:=(Pix)/P;
     f:=Round(1/N);
       for I := 0 to MaxX- 1 do
          Result[k,i]:=255;
     For i:=0 to trunc(P-f)-1 do
      begin
          j:=trunc(i*n);
          Wx:=I*N-J;
          Result[k,i]:=trunc((pic[k,j]*(1-Wx)+pic[k,j+1]*Wx));
        End;

      for I := 0 to f- 1 do
         Result[K,trunc(P)-1-i]:=pic[k,pix-1];
     end;


//       Result:=Ar;
End;

Function TimageFilter.DoSkewXL(pic:ArByte2;P1,P2:integer):ArByte2;
var
   pix,lin,k,i,j,F:integer;
   MaxX : Integer;
   P,n,Wx:real;
begin
 MaxX:=Max(P1,P2);
 lin:=Length(Pic);
 pix:=length(Pic[0]);
   setlength(Result,Lin,MaxX);
    For k:=0 to lin-1 Do
     begin
      P:=K*((p2-p1)/lin)+P1;

     n:=(Pix)/P;
     f:=Round(1/N);
        for I := 0 to MaxX- 1 do
           Result[k,i]:=255;
     For i:=Maxx-trunc(P) to trunc(MaxX)-1 do
      begin
          j:=trunc(n*(i-MaxX+P));
          Wx:=N*(i-MaxX+p)-J;
          Result[k,i]:=trunc((pic[k,j]*(1-Wx)+pic[k,j+1]*Wx));
        End;

//      for I := 0 to f- 1 do
//         Ar[K,trunc(P)-1-i]:=pic[k,pix-1];
     end;
End;

Function TimageFilter.DoSkewYD(pic:ArByte2;L1,L2:integer):ArByte2;
var
   pix,lin,k,i,j,F:integer;
   MaxY : Integer;
   L,n,Wx:real;
begin
 MaxY:=Max(L1,L2);

 lin:=Length(Pic);
 pix:=length(Pic[0]);

   setlength(Result,MaxY,pix);

     For k:=0 to pix-1 Do
    Begin
      L:=K*((L2-L1)/pix)+L1;

     n:=(Lin)/l;
     F:=Round(1/N);
      for I := 0 to MaxY- 1 do
         Result[i,k]:=255;
     For i:=0 to trunc(l)-f-1 do
      begin
          j:=trunc(i*n);
          Wx:=I*N-J;
          Result[i,k]:=trunc(pic[j,k]*(1-Wx)+pic[j+1,k]*Wx);
      End;
     for I := 0 to F- 1 do
       Result[trunc(L)-1-f,k]:=pic[Lin-1,k];
    End;
End;

Function TimageFilter.DoSkewYU(pic:ArByte2;L1,L2:integer):ArByte2;
var
  T, pix,lin,k,i,j,F:integer;
   MaxY : Integer;
   T1,T2,L,n,Wx:real;
begin
 MaxY:=Max(L1,L2);
 lin:=Length(Pic);
 pix:=length(Pic[0]);
   setlength(Result,MaxY,pix);
     For k:=0 to pix-1 Do
    Begin
      L:=K*((L2-L1)/pix)+L1;
     n:=(Lin)/l;
     F:=Round(1/N);
      for I := 0 to MaxY- 1 do
         Result[i,k]:=255;
     For i:=MaxY-trunc(L) to MaxY-f-1 do
      begin
          j:=trunc(n*(i-MaxY+L));

          Wx:=N*(i-MaxY+L)-J;
          Result[i,k]:=Trunc(pic[j,k]*(1-Wx)+pic[j+1,k]*Wx);
      End;
     for I := 0 to F- 1 do
       Result[trunc(L)-1-f,k]:=pic[Lin-1,k];
    End;
End;

end.



