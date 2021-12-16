object ChartForm: TChartForm
  Left = 192
  Top = 357
  Caption = 'Chart'
  ClientHeight = 297
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 445
    Height = 297
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object Chart1: TChart
      Left = 1
      Top = 1
      Width = 443
      Height = 295
      Legend.Visible = False
      Title.Text.Strings = (
        'TChart')
      View3D = False
      Zoom.Pen.Mode = pmNotXor
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TLineSeries
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series2: TLineSeries
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series3: TLineSeries
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 177
    Top = 161
    object Close1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
    object CopyToClipboard1: TMenuItem
      Caption = 'Copy To Clipboard'
      OnClick = CopyToClipboard1Click
    end
  end
end
