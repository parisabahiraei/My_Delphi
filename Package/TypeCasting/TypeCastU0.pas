




































unit TypecastU;

interface

Uses

    WinApi.Windows,ChartshowU,VCL.Graphics,VCL.Dialogs,
    SysUtils,Classes,Math,WinInet,FMX.Graphics,System.UITypes;

 type

 {1 dimension}
//    TpointInt = Record
//       X,Y:Integer;
//     ENd;

    TpointRe = Record
       X,Y : Real;
    End;
     TPoint3 = record
       X,Y,Z: Integer;
     end;

     TPoint3F = record
       X,Y,Z: Real;
     end;

    TIObject = record
      Xmin,Ymin,Xmax,Ymax,Area:Integer;
    End;
    Comreal=record
      X:Real;
      Y:real;
    End;

   Ari=array of integer;
   Ari64 = array of int64;
   Ar6i= Array[1..6] of Integer;
   Are= array  of real;
   Are_48= array  of Real48;
   ArByte =array of byte;
   ArWord= Array of word;
   ArBoolean = Array of Boolean;
   ArComReal=Array of Comreal;
   ArStr = Array of String;
   ArExteneded = Array of Extended;
   ArColor = Array of TColor;
   ArPoint = array of TPoint;
   ArPointF = array of TpointRe;
   ArPoint3F = array of TPoint3F;
   ArAlphaColor = Array of TAlphaColor;

 {2 Dimension}
   Ari2=Array of Ari;
   Are2=Array of Are;
   Are2_48=Array of Are_48;
   ArByte2=Array of ArByte;
   ArBoolean2 = Array of ArBoolean;
   ArCompReal2=Array of ArComReal;
   ArStr2 = Array of ArStr;
     TMbyteArray = Array[0..32767] of PByteArray;
     PRGBTripleArray = Array of PRGBTriple;
     ArPoint2 = array of ArPoint;
     ArPointF2 = Array of ArPointF;
     ArPoint3F2 = Array of ArPoint3F;
     ArAlphaColor2 = Array of ArAlphaColor;
  {3 Dimension}
   Ari3=Array of Ari2;
   Are3=Array of Are2;
   ArByte3=Array of ArByte2;
   ArBoolean3 = Array of ArBoolean2;
   ArCompReal3=Array of ArCompReal2;

  {4 Dimension}
   Ari4=Array of Ari3;
   Are4=Array of Are3;
   ArByte4=Array of ArByte3;
   ArBoolean4 = Array of ArBoolean3;
   ArCompReal4=Array of ArCompReal3;

   TBitMat = Record
      Pixels,Lines:integer;
      Colr:Boolean;
      Picture,Red,Green,Blue:ArByte2;
      Hue,Sat,Int:Are2;
   End;

    ArBitMat= Array of Tbitmat;

    TChartShow=TChartForm;

    TTypeCast=class(TComponent)
  private

     Public
       ChartShoW:TChartForm;
      function Find2PointAngle(A, B: TPoint): Real;
      function findNextPoint(currentPoint: TPoint;R, TetaRadian: Real): TPoint;

      procedure MakeEllipse(X, Y, a, b, Rteta: integer; Color: TColor;
          var Bit: vcl.graphics.TBitmap);
      procedure FindCircle(A, B, C: Tpoint; var CEnter: Tpoint;
          var Radius: Integer);

    ENd;

   Procedure Register;

  Procedure LineFromTo(ACanvas : vcl.graphics.TCanvas; FromPoint,ToPoint : TPoint;AColor:TColor;AWidth:Integer);
  Function CreateChart(Name:String;SeriesNumber,TagN:Byte):TChartShow;
  Function IsOdd(N:integer):boolean;
  Function IsEven(N:integer):boolean;
  Function Are2Assign(A:Are2):Are2;
  Function ArByte2Assign(A:ArByte2):ArByte2;
  Function BitMatAssign(BitMa: Tbitmat): Tbitmat;
  function Ari2Assign(A: Ari2): Ari2;
  function AriAssign(A: Ari): Ari;
  Function Distance(A,B: Tpoint):Integer;
  Function DistanceF(A,B: TpointRe):Integer;
  Function Distance3(A,B: TPoint3F):real;
  Function CurrencyToStr(C:Int64):String;
  Function DeleteSpace(S:String):String;
  Function DelSpace(S:String;C:Char):String;
  Function InttoStrFarsi(N:integer):String;
  Function IntToStr5(N: Integer): string;
  Function IntToStrM(N,Count: Integer): string;
  Function DegToRad(A : Double):Double;
  PROCEDURE DrawPieSlice(CONST Canvas: vcl.graphics.TCanvas;
            CONST Center: TPoint;CONST Radius: INTEGER;CONST StartDegrees, StopDegrees: Double);
  Function BinToInt(S:String):Integer;
  Function IsInAri(Inp : Ari; N:Integer):Boolean;
  Function IsInArstring(Ars : ArStr; S:string):Boolean;
  function CorrectArs(Ars : Arstr):ArStr;
  Function ExtractString(S:String;Sep:Char):ArStr;
  Function Sign(N:Integer):Integer;
  function SignF(R:Real):Integer;
  procedure Delay(msecs:Cardinal);
  function GetInetFile (const fileURL, FileName: String): boolean;
  function GetDirection(X,Y: Single): Single;
  function RandomNumber(L , m , N : Integer):Ari;
  procedure FMXdrawPixel (bitmap : TBitmap; colors : ArAlphaColor2);
  Function FMXGetPixel(Bitmap : TBitmap):ArAlphaColor2;

 var
  ChartExist:Array of boolean;


implementation

uses VCL.Forms;

Procedure Register;
begin
  RegisterComponents('Standard', [TTypeCast]);
ENd;


procedure FMXdrawPixel (bitmap : TBitmap; colors : ArAlphaColor2);
var vBitMapData  : TBitmapData;
   i,j : Integer;
begin
  if bitmap.Map(TMapAccess.maWrite, vBitMapData) then
    begin
    try

      for I := 0 to bitmap.Width-1 do
       for J := 0 to bitmap.Height-1 do
            vBitmapData.SetPixel(i, j, colors[j,i]);

    finally
       bitmap.Unmap(vBitMapData);
    end;
    end;
end;

Function FMXGetPixel(Bitmap : TBitmap):ArAlphaColor2;
var vBitMapData  : TBitmapData;
     i,j : Integer;
 begin
  if bitmap.Map(TMapAccess.maWrite, vBitMapData) then
    begin
    try
      SetLength(Result,Bitmap.Height,Bitmap.Width);
      for I := 0 to Bitmap.Width-1 do
        for J := 0 to  Bitmap.Height-1 do
          Result[j,i]:=vBitmapData.GetPixel(i,j);

    finally
       bitmap.Unmap(vBitMapData);
    end;
    end;

 end;


 function RandomNumber(L ,m, N : Integer):Ari;
  var
   W : Integer;
  I,J: Integer;
  Flag : Boolean;
  begin
    SetLength(Result,L);
      for I := 0 to L-1 do
        Result[i]:=-1;
     for I := 0 to L-1 do
       begin

        repeat
         flag:=true;
         W:=Random(N-m)+M;
          for J := 0 to I-1 do
            begin
             if Result[j]=W then
               Flag:=False;
            end;

        until Flag;
        Result[i]:=W;
       end;


  end;



  function GetDirection(X,Y: Single): Single;

   begin
      if x<>0 then
         Result:=ArcTan(Y/x)
      else
         Result:=pi/2;

     if x<0 then
      Result:=pi+Result;

     if y<0 then
       Result:=Result-2*pi;

   end;


function GetInetFile (const fileURL, FileName: String): boolean;
 const
   BufferSize = 1024;
 var
   hSession, hURL: HInternet;
   Buffer: array[1..BufferSize] of Byte;
   BufferLen: DWORD;
   f: File;
   sAppName: string;
 begin
  result := false;
  sAppName := ExtractFileName(Application.ExeName) ;
  hSession := InternetOpen(PChar(sAppName), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0) ;
  try
   hURL := InternetOpenURL(hSession, PChar(fileURL), nil, 0, 0, 0) ;
   try
    AssignFile(f, FileName) ;
    Rewrite(f,1) ;
    repeat
     InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen) ;
     BlockWrite(f, Buffer, BufferLen)
    until BufferLen = 0;
    CloseFile(f) ;
    result := True;
   finally
    InternetCloseHandle(hURL)
   end
  finally
   InternetCloseHandle(hSession)
  end
 end;

procedure Delay(msecs:Cardinal);
var
   FirstTickCount: Cardinal;
begin
     FirstTickCount:=GetTickCount;
     repeat
           //Application.ProcessMessages;
     until ((GetTickCount-FirstTickCount) >= (msecs));
end;

Function DegToRad(A : Double):Double;
begin
  Result:=A/180*pi ;
end;

  Function Sign(N:Integer):Integer;
   begin
     Result:=1;
     if N<0 then Result:=-1;
   end;

  function SignF(R:Real):Integer;
   begin
     Result:=1;
     if R<0 then Result:=-1;
   end;

Function IsInAri(Inp : Ari; N:Integer):Boolean;
var
  I: Integer;
    begin
     Result:=False;
      for I := 0 to Length(Inp)-1 do
       begin
         if N=Inp[i] then
          begin
            Result:=True;
            Exit;
          end;

       end;
    end;


Function IsInArstring(Ars : ArStr; S:string):Boolean;
var
  I: Integer;
    begin
     Result:=False;
      for I := 0 to Length(Ars)-1 do
       begin
         if S=Ars[i] then
          begin
            Result:=True;
            Exit;
          end;

       end;
    end;

function CorrectArs(Ars : ArStr):ArStr;
var
  L,I: Integer;

begin
 SetLength(Result,0);
  for I := 0 to Length(Ars)-1 do
   begin
      if Ars[i]<>'' then
        begin
          L:=Length(Result);
          SetLength(Result,L+1);
          Result[l]:=Ars[i];
        end;
   end;

end;

  Function ExtractString(S:String;Sep:Char):ArStr;
    var
      K,I,Im: Integer;
       C:Char;
   begin

     Im:=0;
     K:=1;
     SetLength(Result,1);
     Result[0]:='';
     for I := 1 to Length(s) do
      begin
        if S[i]=Sep then
          begin
            K:=1;
            inc(im);
            SetLength(Result,Im+1);
          end
        else
         begin
//           if S[i]<>' ' then
            begin
              K:=Length(Result[im])+1;
              SetLength(Result[im],K);
              Result[im][k]:=S[i];
            end;
         end;

      end;

   end;

PROCEDURE DrawPieSlice(CONST Canvas:vcl.graphics.TCanvas;
CONST Center: TPoint;
CONST Radius: INTEGER;
CONST StartDegrees, StopDegrees: Double);
CONST
Offset = 0; // to make 0 degrees start to the right
VAR
X1,X2,X3,X4: INTEGER;
Y1,Y2,Y3,Y4: INTEGER;
BEGIN
X1 := Center.X - Radius;
Y1 := Center.Y - Radius;

X2 := Center.X + Radius;
Y2 := Center.Y + Radius;

// negative signs on "Y" values to correct for "flip" from normal
// math defintion for "Y" dimension
X3 := Center.X + Round( Radius*COS( DegToRad(Offset+StartDegrees) ) );
Y3 := Center.y - Round( Radius*SIN( DegToRad(Offset+StartDegrees) ) );

X4 := Center.X + Round( Radius*COS( DegToRad(Offset+StopDegrees) ) );
Y4 := Center.y - Round( Radius*SIN( DegToRad(Offset+StopDegrees) ) );

Canvas.Pie(X1,Y1, X2,Y2, X3,Y3, X4,Y4);

END {Pie};

function BinToInt(S:String):Integer;
var
 I,K,N : Integer;
begin
K:=1;
N :=0;
 for I := length(s) Downto 1 do
   begin
     if S[i]='1' then
       begin
         n:=N+K;
       end;
     K:=2*K;
   end;

 Result:=N;
end;


function InttoStrFarsi(N:integer):String;
var
 SS,Res:String;
  I: Integer;
 function change(S:String):String;
  begin
    Result:=char(Ord('۰')+strtoint(S));

  end;
begin
 SS:=IntToStr(N);
 Res:='';
 for I := 1 to Length(ss) do
  begin
    Res:=Res+change(SS[i]);

  End;
   Result:=Res;

End;

function IntToStr5(N: Integer): string;
var
 s : string;
begin
 s:='';
  if N<10000 then   s:=s+'0';
  if N<1000 then   s:=s+'0';
  if N<100 then   s:=s+'0';
  if N<10 then   s:=s+'0';

     Result:=S+IntToStr(N);
end;

function IntToStrM(N,Count: Integer): string;
var
 s : string;
 k: Integer;
  I: Integer;
begin
 s:='';
  k:=trunc(power(10,Count-1));

  for I := 1 to Count-1 do
    begin
      if N<K then
        S:=S+'0';
      k:=trunc(k/10);
    end;
     Result:=S+IntToStr(N);
end;

Procedure LineFromTo(ACanvas : vcl.graphics.TCanvas; FromPoint,ToPoint : TPoint;AColor:TColor;AWidth:Integer);
begin
 ACanvas.Pen.Color:=AColor;
 ACanvas.Pen.Width:=AWidth;
 ACanvas.MoveTo(FromPoint.X,FromPoint.Y);
 ACanvas.LineTo(ToPoint.X,ToPoint.Y);
end;

Function DeleteSpace(S:String):String;
var
  Im,I: Integer;
begin
   for I := Length(S) Downto 1 do
    begin
      if S[i]<>' ' then
       begin
        Im:=i;
        break;
       end;
    end;

   Delete(S,Im+1,length(s)-im+1);
  Result:=S;
end;

Function DelSpace(S:String;C:Char):String;
var
  Im,I: Integer;
begin
 Result:='';
   for I :=1 to  Length(S) do
    begin
      if S[i]<>C then
       begin
        Result:=Result+S[i];
       end;
    end;
end;


Function CreateChart;
var
  a:TChartShow;
  I: Integer;
begin
    A:=TChartShow.Create(Application);
    A.Visible:=true;
    A.Chart1.Visible:=true;
    A.Caption:=Name;
    A.Chart1.Title.Text[0]:=name;
    a.Tag:=TagN;
    SetLength(ChartExist,TagN+1);
    ChartExist[TagN]:=true;
     for I := 0 to SeriesNumber-1 do
       a.AddSsries(SeriesNumber);

    Result:=a;

End;

Function CurrencyToStr(C:Int64):String;
var
  S,S1:String;
  A:integer;
begin
  S:='';
//  A:=C;

  Repeat
   A:=C mod 1000;
   C:=trunc(c/1000);
   S1:=IntToStr(A);
   if (a<10)and(C>0) then     S1:='0'+S1;
   if (a<100)And(C>0) then    S1:='0'+S1;
   if (a=0)and(c>0) then   S1:='000';

   S:=S1+','+S;
  Until ((A=0)And(C=0));


  Result:=Copy(S,3,Length(s)-3);
end;



Procedure TTypeCast.FindCircle(A,B,C: Tpoint;var CEnter : Tpoint;var Radius : Integer);
 var
  M,N,K1,K2 : real;
 begin
 try
  if (B.y=A.Y)then
   begin
     B.y:=B.y+1;
   end;
  if C.y=B.Y then
   begin
     c.Y:=C.Y+1;
   end;

  
  M:=-(B.X-A.x)/(b.Y-a.Y);
  N:=-(C.X-B.X)/(C.Y-B.Y);

  K1:=(A.Y+B.Y)/2-M*(A.X+B.X)/2;
  K2:=(b.Y+c.Y)/2-N*(b.X+c.X)/2;

  CEnter.X:=trunc((K2-K1)/(M-N));
  CEnter.Y:=trunc(m*(K2-K1)/(M-N)+K1);

  Radius:=Distance(CEnter,a)+1;
 except

 end;

 End;

Function DistanceF(A, B: TpointRe): integer;
begin
 //
 Result:=trunc(Sqrt(Sqr(A.x-B.X)+Sqr(A.Y-B.Y)));
end;

Function Distance(A, B: Tpoint): integer;
begin
 //
 Result:=trunc(Sqrt(Sqr(A.x-B.X)+Sqr(A.Y-B.Y)));
end;

Function Distance3(A, B: TPoint3F): real;
begin
 //
 Result:=(Sqrt(Sqr(A.x-B.X)+Sqr(A.Y-B.Y)+SQR(A.z-B.Z)));
end;



function TTypeCast.Find2PointAngle(A,B : TPoint):Real;
begin
 Result:=0;
if A.X=B.X then
 begin
  if b.Y>a.Y then
    Result:=Pi/2;
  if b.Y<a.Y then
    Result:=-pi/2;
   if A.Y=b.Y  then
    Result:=0;
  exit;
 end;

 Result:=ArcTan((a.Y-b.Y)/(a.X-b.X));
 if (A.X>B.X)and(B.Y>=A.Y) then
   Result:=Result+pi;
 if (A.X>b.X)and(A.Y>b.Y) then
   Result:=Result-pi;
end;

function TTypeCast.findNextPoint(currentPoint: TPoint;R,TetaRadian : Real):TPoint;
begin
   Result.X:=trunc(currentPoint.X+R*Cos(TetaRadian));
   Result.Y:=Trunc(currentPoint.Y+R*Sin(TetaRadian));
end;



Procedure TTypeCast.MakeEllipse(X,Y,a,b,Rteta:integer;Color:TColor;var Bit:vcl.graphics.TBitmap);
var
  m,n,i,j:integer;
  Rx,Ry,Rc:real;
  Teta:Real;
begin
Teta:=Rteta/180*pi;
 With Bit.Canvas do
    For i:=X-a-100 to X+A+100 do
     for j:=Y-b-100 to Y+B+100 do
      begin
       try
         m:=i-X;
         n:=J-Y;
            Rx:=(M*M)*((Cos(Teta)*Cos(Teta)/(a*a))+(Sin(Teta)*Sin(Teta)/(b*b)));
            Ry:=(N*N)*((Sin(Teta)*Sin(Teta)/(a*a))+(Cos(Teta)*Cos(Teta)/(b*b)));
            Rc:=M*N*Sin(2*Teta)*(1/(B*B)-1/(A*A));
          If (Rx+Ry+Rc)<1 Then
           Pixels[i,j]:=Color;
       Except
       ENd;
      End;
ENd;



Function IsOdd(N:integer):boolean;
begin
 Result:=(N mod 2)=1;
eNd;

Function IsEven(N:integer):boolean;
begin
 Result:=(N mod 2)=0;
eNd;

{ TBitMat }

Function ArByte2Assign(A:ArByte2):ArByte2;
var
  i,j:integer;
begin
If Length(A)>0 Then
 begin
   SetLength(Result,length(A),Length(A[0]));
    For i:=0 to length(A)-1 do
     For j:=0 to Length(A[0])-1 do
      Result[i,j]:=a[i,j];
 End
Else
 SetLength(Result,0,0);

eNd;

Function Are2Assign(A:Are2):Are2;
var
  M,N,i,j:integer;
begin
 M:=Length(a);
 N:=Length(a[0]);
   SetLength(Result,M,N);
    For i:=0 to M-1 do
     For j:=0 to N-1 do
      Result[i,j]:=a[i,j];

eNd;

function BitMatAssign(BitMa: Tbitmat): Tbitmat;
begin
  //
  Result.Pixels:=BitMa.Pixels;
  Result.Lines:=BitMa.Lines;
  Result.Colr:=BitMa.Colr;

  If not BitMa.Colr Then
   Result.Picture:=ArByte2Assign(BitMa.Picture)
  Else
   begin
     Result.Red:=ArByte2Assign(BitMa.Red);
     Result.Green:=ArByte2Assign(BitMa.Green);
     Result.Blue:=ArByte2Assign(BitMa.Blue);
   End;

end;


function AriAssign(A: Ari): Ari;
var
  i:integer;
begin
  setlength(Result,length(A));
   For i:=0 to Length(A)-1 do
    Result[i]:=A[i];

end;

function Ari2Assign(A: Ari2): Ari2;
var
  i:integer;
begin
 SetLength(Result,Length(a));
   For i:=0 to Length(a)-1 do
    Result[i]:=AriAssign(a[i]);

end;

end.

