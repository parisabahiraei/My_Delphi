unit EnterCurrentDateU;

interface

uses WinApi.Windows, SysUtils, Classes, VCL.Graphics, VCL.Forms, VCL.Controls, VCL.StdCtrls,
  Vcl.ExtCtrls,VCL.Buttons, VCL.Mask,VCL.Dialogs,Inifiles,MaskUtils;

type
  TCurrentDateDlg = class(TForm)
    Label1: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel1: TPanel;
    Year_Edit: TLabeledEdit;
    Month_Edit: TLabeledEdit;
    Day_Edit: TLabeledEdit;
    procedure MaskEdit11Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   Function Enter(FileName:String):Integer;
    procedure Save(FileName,Sy,Sm,Sd:String);
  end;

var
  CurrentDateDlg: TCurrentDateDlg;
    SDate:String;

implementation

{$R *.dfm}
 Uses DateTimeU;

Procedure TCurrentDateDlg.Save;
var
  W:TIniFile;
  MDate:TDate;
  yy,mm,dd:Integer;

begin
 MDate:=Now;
  yy:=StrToInt(Sy);
  MM:=StrToInt(Sm);
  DD:=StrToInt(Sd);
    if mm<10 then  Sm:='0'+Sm;
    if DD<10 then  Sd:='0'+Sd;



 SDate:=Sy+'/'+Sm+'/'+Sd;
 w:=TIniFile.Create(FileName);
   With W do
    begin
      WriteString('Mil','Date',DateToStr(MDate));
      WriteString('Hejri','Date',SDate);
    End;
 w.Free;
eNd;

Function TCurrentDateDlg.Enter;
Label Start;
var
  T:TSystemTime;
  Sd,Sm,Sy:String;
begin
  CurrentDateDlg:=TCurrentDateDlg.Create(Application);
  Start:
  If CurrentDateDlg.ShowModal=mrOk Then
   begin
//        GetLocalTime(T);
//        T.wYear:=StrToInt(CurrentDateDlg.Year_Edit.Text);
//        T.wMonth:=StrToInt(CurrentDateDlg.Month_Edit.Text);
//        T.wDay:=StrToInt(CurrentDateDlg.Day_Edit.Text);
//        SDate:=SysTimeToStr(T,ShortDate);

        SY:=(CurrentDateDlg.Year_Edit.Text);
        SM:=(CurrentDateDlg.Month_Edit.Text);
        SD:=(CurrentDateDlg.Day_Edit.Text);

    Save(FileName,Sy,Sm,Sd);

    Result:=mrOk;
   ENd
  Else
   begin
     MessageDlg('Enter Current Hejri date',mtWarning,mbOKCancel,0);
     Goto Start;
   eNd;
eNd;


procedure TCurrentDateDlg.MaskEdit11Change(Sender: TObject);
begin
//SDate:=MaskEdit1.Text;
end;

end.

