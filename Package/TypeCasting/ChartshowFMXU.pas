unit ChartshowFMXU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.Menus;

type
  TChartFormFMX = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddSsries(N: Integer);
  end;



implementation

{$R *.fmx}

procedure TChartFormFMX.MenuItem1Click(Sender: TObject);
begin
Close;
end;

procedure TChartFormFMX.MenuItem2Click(Sender: TObject);
begin
Chart1.CopyToClipboardBitmap;

end;

procedure TChartFormFMX.AddSsries;
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
