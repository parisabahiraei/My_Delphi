






























unit SystemTimeU;

interface

Uses Windows,Classes,SysUtils;

type
 TSystime=class(TComponent)
   private
    TotalTime:real;
   Public
    Mytime:Real;
    Function Gettime:Real;
    function CalcTime: Real;
    Function ShowTime:String;
    Procedure Reset;
    procedure Init;
    procedure Pause;
    procedure Resume;

  End;

Procedure Register;



implementation


Procedure register;
begin
  RegisterComponents('Standard',[TSystime]);

ENd;
Procedure TSystime.init;
begin
    TotalTime:=0;
    Reset;
ENd;

function Tsystime.GetTime:Real;
 var
        syst:TsystemTime;
 begin
  GetSystemTime(syst);
    Result:=3600*syst.wHour+60*syst.wMinute+syst.wSecond+syst.wMilliseconds/1000;

 End;

 Function TSystime.CalcTime:Real;
 begin
   Result:=Gettime-Mytime+TotalTime;
 end;

 Function Tsystime.ShowTime:String;
 begin
//      Result:='Time : '+FloatToStr(Round(1000*(CalcTime))/1000);
      Result:='TIME : '+FloatToStrF((CalcTime),ffGeneral,4,4);
 End;

 Procedure Tsystime.Reset;
 begin
     Mytime:=GetTime;
 End;

 Procedure TSystime.Pause;
  begin
   TotalTime:=Gettime-Mytime+TotalTime;
  End;

  Procedure TSystime.Resume;
   begin
    Reset;
   ENd;

end.
