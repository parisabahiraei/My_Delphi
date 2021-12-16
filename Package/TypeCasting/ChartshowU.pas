unit chartShowU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ExtCtrls, VCL.Menus, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart;

type
  TChartForm = class(TForm)
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    CopyToClipboard1: TMenuItem;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    procedure CopyToClipboard1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure AddSsries(n:Integer);
  end;


implementation

{$R *.dfm}


Uses TypeCastU;

procedure TChartForm.CopyToClipboard1Click(Sender: TObject);
begin
Chart1.CopyToClipboardBitmap;
end;

procedure TChartForm.Close1Click(Sender: TObject);
begin
Close;
end;

procedure TChartForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ChartExist[Tag]:=false;
Action:=caFree;
end;

procedure TChartForm.AddSsries;
var
  S: TChartSeries;
  i: integer;
begin
  For i := 0 to N - 1 do
  begin
    S := TChartSeries.Create(Application);
    S := TLineSeries.Create(Application);
    S.ParentChart := Chart1;
    S.ColorEachPoint := true;

  ENd;

end;

end.
