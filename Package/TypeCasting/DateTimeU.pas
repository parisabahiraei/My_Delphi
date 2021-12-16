unit DateTimeU;

interface
Uses
    Windows,VCL.Controls,IniFiles,Classes,SysUtils,System.UITypes,
    FMX.Dialogs,EnterCurrentDateU,VCL.Mask,MaskUtils,TypeCastU;

 Type
  TDateFormat =(ShortDate , LongDate);
  TJDate = record
     Year , Month , Day : Integer;
   End;
  TDDate=class(TComponent)
  private
    function StrtoTJDate(S: String): TJdate;
  public
    MDate: TDate;
    SDate:String;
    function GetSDate: String;
    function GetJDate: String;
    function GetJ_Date: String;
    function GetJDateTime: String;
    Function DateToJalali(DD : TDate):String;
    procedure gregorian_to_jalali(g_y, g_m, g_d: integer; var jy, jm,jd: integer);
    procedure jalali_to_gregorian(j_y, j_m, j_d: integer; var Gy, Gm,Gd: integer);
    function DistanceDays(S1, S2: string): integer;

  Protected
    _DateFormat : TDateFormat;
  Published
   Property DateFormat : TDateFormat Read _DateFormat Write _DateFormat;


  End;
     Function DayOfWeekToStrJalali(Day:Integer):String;
     Function DayOfWeekToStr(Day:Integer):String;
     Function SysTimeToStr(Systime:TSystemTime;DateFormat:TDateFormat):String;
     Function StrToSystemTime(Tim:String;DateFormat:TDateFormat):TSystemTime;
     Procedure Register;

var
     FormatSetting : TFormatSettings;
    g_days_in_month : array[0..11] of byte = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    j_days_in_month : array[0..11] of byte = (31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29);


implementation


Procedure Register;
begin
  RegisterComponents('Standard',[TDDate]);
eNd;

Function SysTimeToStr(Systime:TSystemTime;DateFormat:TDateFormat):String;
var
  Sy,Sm,Sd: String;
  DT:TDateTime;

begin
 If DateFormat=LongDate then
   begin
    try
     DT:=SystemTimeToDateTime(SysTime);
    except
      dt:=0;
    end;
    DateTimeToString(Result,FormatSetting.LongDateFormat,DT);
   end
 Else
   begin
      Sy:=IntToStr(Systime.wYear);
      Sm:=IntToStr(Systime.wMonth);
      Sd:=IntToStr(Systime.wDay);
       if StrToInt(Sm)<10 then  Sm:='0'+Sm;
       if StrToInt(Sd)<10 then  Sd:='0'+Sd;


    Result:=Sy+'/'+Sm+'/'+SD;
//    DateTimeToString(Result,FormatSetting.ShortDateFormat,DT);
   end;
End;

Function  StrToSystemTime(Tim:String;DateFormat:TDateFormat):TSystemTime;
var
  S:String;
  DT:TDateTime;
  T:TSystemTime;
begin
GetLocalTime(T);
case DateFormat of
  ShortDate:
    begin
      DT:=now;
      dt:=StrToDateTime(Tim);
      DateTimeToSystemTime(Dt,T);
      Result.wYear:=T.wYear;
      Result.wMonth:=T.wMonth;
      Result.wDay:=T.wDay;
    End;
  LongDate:
   begin
    s:=copy(Tim,0,4);
    T.wYear:=StrToInt(s);
    s:=Copy(Tim,6,2);
    T.wMonth:=StrToInt(s);
    s:=copy(Tim,9,2);
    T.wDay:=StrToInt(s);
    Result:=T;
   ENd;

 ENd;{Case}
End;

   {
Procedure CorrectSysteim(var T:TSystemTime);
var
  Changed:Boolean;
begin
With T do
  repeat
    Changed:=false;
    If (wMonth<7)and(wDay>31) Then
     begin
       wDay:=wDay-31;
       inc(wMonth);
       Changed:=true;
     End;
    If (wMonth<12)and(wMonth>6)and(wDay>30) Then
     begin
       wDay:=wDay-30;
       inc(wMonth);
       Changed:=true;
     End;
    If (wMonth=12)And(wDay>29) Then
     begin
       wDay:=wDay-29;
       inc(wYear);
       wMonth:=1;
       Changed:=true;
     End;
   until not Changed;

End;
  }

  function TDDate.StrtoTJDate(S:String):TJdate;
  var
   Ars : ArStr;
  begin
   Ars:=ExtractString(S,'/');
   if length(Ars)<3 then
    begin
      MessageDlg('Error in Convert to Date ',TMsgDlgType.mtError,mbOKCancel,0);
      Exit;
    end;

    if Length(Ars[0])<4 then
       Result.Year:=1300+StrToInt(Ars[0])
     else
       Result.Year:=StrToInt(Ars[0]);

       Result.Month:=StrToInt(Ars[1]);
       Result.Day:=StrToInt(Ars[2]);




  end;

  Function TDDate.DistanceDays(S1,S2 : string):integer;
  var
   A,B  : TJDate;
  I: Integer;
  begin
   a:=StrtoTJDate(S1);
   B:=StrtoTJDate(S2);
   Result:=0;
   if A.Year=B.Year then
     begin
      Result:=A.Day-B.Day;

      for I := B.Month to A.Month-1 do
        begin
         if i<=6 then
               Result:=Result+31
         else
           if I<12 then
                Result:=Result+30
            else if I=12  then
                  Result:=Result+29;
        end;



     end;
   if a.Year>B.Year then
    begin
      Result:=A.Day-B.Day;

      for I := B.Month to 12 do
        begin
         if i<=6 then
               Result:=Result+31
         else
           if I<12 then
                Result:=Result+30
            else if I=12  then
                  Result:=Result+29;
        end;
      for I := 1 to A.Month-1 do
        begin
         if i<=6 then
               Result:=Result+31
         else
           if I<11 then
                Result:=Result+30
            else if I=12  then
                  Result:=Result+29;
        end;

        Result:=Result+365*(A.Year-B.Year-1);


    end;



  end;

Function TDDate.GetSDate:String;
var
  T:TSystemTime;
  Jy,Jm,Jd : Integer;
  S:String;
begin
GetLocalTime(T);
gregorian_to_jalali(T.wYear,t.wMonth,T.wDay,Jy,jm,jd);

s:=IntToStr(Jy);

if jm<10 then
 S:=S+'_0'+IntToStr(jm)
else
 s:=s+'_'+IntToStr(Jm);

if jd<10 then
 S:=S+'_0'+IntToStr(jd)
else
 s:=s+'_'+IntToStr(Jd);


Result:=S;


end;

function TDDate.GetJDateTime:String;
var
  m: TSystemTime;
  jy,jm,jd : Integer;
  s,S1,S2:string;
begin
 GetLocalTime(m);
 gregorian_to_jalali(m.wYear,m.wMonth,m.wDay,jy,jm,jd);
 S1:=IntToStr(Jm);
 S2:=IntToStr(Jd);
  if Jm<10 then S1:='0'+S1;
  if JD<10 then S2:='0'+S2;

 s:= IntToStr(jy)+'/'+S1+'/'+S2+' '
    +IntToStrM(m.wHour,2)+':'+IntToStrM(m.wMinute,2)+':'+IntToStrm(m.wSecond,2);
  Result:=s;
end;

function TDDate.GetJ_Date:String;
var
  m: TSystemTime;
  jy,jm,jd : Integer;
  s,S1,S2:string;
begin
 GetLocalTime(m);
 gregorian_to_jalali(m.wYear,m.wMonth,m.wDay,jy,jm,jd);
  S1:=IntToStr(Jm);
  S2:=IntToStr(Jd);
  if Jm<10 then S1:='0'+S1;
  if JD<10 then S2:='0'+S2;



 s:= IntToStr(jy)+'_'+S1+'_'+S2;
//    +IntToStr(m.wHour)+':'+IntToStr(m.wMinute)+':'+IntToStr(m.wSecond);
  Result:=s;
end;

function TDDate.DateToJalali(DD: TDate): String;
var
  m: TSystemTime;
  jy,jm,jd : Integer;
  S1,S2:string;
begin

// GetLocalTime(m);

 DateTimeToSystemTime(DD,m);

 gregorian_to_jalali(m.wYear,m.wMonth,m.wDay,jy,jm,jd);
  S1:=IntToStr(Jm);
  S2:=IntToStr(Jd);
  if Jm<10 then S1:='0'+S1;
  if JD<10 then S2:='0'+S2;



 Result:= IntToStr(jy)+'/'+S1+'/'+S2;
end;

function TDDate.GetJDate:String;
var
  m: TSystemTime;
  jy,jm,jd : Integer;
  s,S1,S2:string;
begin
 GetLocalTime(m);
 gregorian_to_jalali(m.wYear,m.wMonth,m.wDay,jy,jm,jd);
  S1:=IntToStr(Jm);
  S2:=IntToStr(Jd);
  if Jm<10 then S1:='0'+S1;
  if JD<10 then S2:='0'+S2;



 s:= IntToStr(jy)+'/'+S1+'/'+S2;
//    +IntToStr(m.wHour)+':'+IntToStr(m.wMinute)+':'+IntToStr(m.wSecond);
  Result:=s;
end;

Procedure TDDate.gregorian_to_jalali (g_y, g_m, g_d: integer; var jy,jm,jd : integer);
var
    j_np,i,j_day_no,g_day_no,gy,gm,gd : Integer;
begin



   gy := g_y-1600;
   gm := g_m-1;
   gd := g_d-1;

   g_day_no := 365*gy+((gy+3) div 4)-((gy+99) div 100)+ ((gy+399) div 400);

   for i:=0 to gm-1 do
         g_day_no := g_day_no+g_days_in_month[i];

   if ((gm>1) and ((((gy mod 4)=0) and ((gy mod 100)<>0)) or ((gy mod 400)=0))) Then
//      /* leap and after Feb */
      inc(g_day_no);
   g_day_no := g_day_no+ gd;

   j_day_no := g_day_no-79;

   j_np := (j_day_no div 12053); //* 12053 = 365*33 + 32/4 */
   j_day_no :=( j_day_no mod 12053);

   jy := 979+33*j_np+4*(j_day_no div 1461); //* 1461 = 365*4 + 4/4 */

   j_day_no := (j_day_no mod 1461);

   if (j_day_no >= 366)   then
   begin
      jy :=jy+ ((j_day_no-1) div 365);
      j_day_no := ((j_day_no-1)mod 365);
   ENd;

//   for ($i = 0; $i < 11 && $j_day_no >= $j_days_in_month[$i]; ++$i)
   for i := 0 to  11  do
   //&& $j_day_no >= $j_days_in_month[$i]; ++$i)
     begin
      if j_day_no < j_days_in_month[i] then
        break;
      j_day_no := j_day_no- j_days_in_month[i];
     end;

   jm := i+1;
   jd := j_day_no+1;

//   return array($jy, $jm, $jd);
End;



Procedure TDDate.jalali_to_gregorian(j_y, j_m, j_d: integer; Var gy,gm,gd : integer);
var
 g_days_in_month,J_days_in_month : Array[0..11] of byte;
 j_day_no,I,g_day_no,Jy,Jm,Jd,K : Integer;
 Leap : Boolean;
begin
    g_days_in_month[0] := 31;
    g_days_in_month[1] := 28;
    g_days_in_month[2] := 31;
    g_days_in_month[3] := 30;
    g_days_in_month[4] := 31;
    g_days_in_month[5] := 30;
    g_days_in_month[6] := 31;
    g_days_in_month[7] := 31;
    g_days_in_month[8] := 30;
    g_days_in_month[9] := 31;
    g_days_in_month[10] := 30;
    g_days_in_month[11] := 31;

    j_days_in_month[0] := 31;
    j_days_in_month[1] := 31;
    j_days_in_month[2] := 31;
    j_days_in_month[3] := 31;
    j_days_in_month[4] := 31;
    j_days_in_month[5] := 31;
    j_days_in_month[6] := 30;
    j_days_in_month[7] := 30;
    j_days_in_month[8] := 30;
    j_days_in_month[9] := 30;
    j_days_in_month[10] := 30;
    j_days_in_month[11] := 29;



   jy := j_y-979;
   jm := j_m-1;
   jd := j_d-1;

   j_day_no := 365*jy + (Jy div 33)*8 + ((jy mod 33)+3 div 4);
   for i:=0 to jm-1 do
      j_day_no :=j_day_no+ j_days_in_month[i];

   j_day_no :=j_day_no+jd;

   g_day_no := j_day_no+79;

   gy := 1600 + 400*(g_day_no div 146097); // 146097 = 365*400 + 400/4 - 400/100 + 400/400
   g_day_no := g_day_no mod 146097;

   leap := true;
   if (g_day_no >= 36525) then //* 36525 = 365*100 + 100/4 */
   begin
      dec(g_day_no);
      gy :=gy+ 100*(g_day_no div  36524); //* 36524 = 365*100 + 100/4 - 100/100 */
      g_day_no := g_day_no mod 36524;

      if (g_day_no >= 365) then
         inc(g_day_no)
      else
         leap := false;
   End;

   gy :=gy+ 4*(g_day_no div 1461); //* 1461 = 365*4 + 4/4 */
   g_day_no := g_day_no mod 1461;

   if (g_day_no >= 366) then
    begin
      leap := false;

      dec(g_day_no);
      gy :=gy+ (g_day_no div 365);
      g_day_no := g_day_no mod 365;
   End;
    g_Day_no := g_day_no -12;
   i:=0;
   while (g_day_no >= g_days_in_month[i]) or (((i = 1) and (leap))) do
   begin
   k:=0;
    if (i=1)and(Leap) then    k:=1;
      g_day_no:=g_day_no-(g_days_in_month[i]+k);
      inc(i);
   end;



//   for i := 0  $g_day_no >= $g_days_in_month[$i] + ($i == 1 && $leap); $i++)
//      $g_day_no -= $g_days_in_month[$i] + ($i == 1 && $leap);
   gm := i+1;
   gd := g_day_no+1;

//   return array($gy, $gm, $gd);

End;


Function DayOfWeekToStrJalali(Day:Integer):String;
begin
 Result:='';
 case Day of
   0: Result:='شنبه';
   1: Result:='یک شنبه';
   2: Result:='دوشنبه';
   3: Result:='سه‌شنبه';
   4: Result:='چهارشنبه';
   5: Result:='پنج‌شنبه';
   6: Result:='جمعه';
  ENd;

eNd;


Function DayOfWeekToStr(Day:Integer):String;
begin
 Result:='';
 case Day of
   0: Result:='Sunday';
   1: Result:='Monday';
   2: Result:='Tusday';
   3: Result:='Wednesday';
   4: Result:='Thursday';
   5: Result:='Friday';
   6: Result:='Saturday';
  ENd;

eNd;



end.
