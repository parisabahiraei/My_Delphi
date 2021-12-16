object ProcessForm: TProcessForm
  Left = 399
  Top = 519
  BorderStyle = bsToolWindow
  Caption = 'Processing ...'
  ClientHeight = 146
  ClientWidth = 324
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 21
    Width = 61
    Height = 13
    Caption = 'Processing : '
  end
  object Label2: TLabel
    Left = 296
    Top = 19
    Width = 14
    Height = 13
    Caption = '0%'
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 3
    Height = 13
    Caption = ' '
  end
  object Label4: TLabel
    Left = 296
    Top = 80
    Width = 14
    Height = 13
    Caption = '0%'
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 48
    Width = 289
    Height = 17
    TabOrder = 0
  end
  object ProgressBar2: TProgressBar
    Left = 24
    Top = 104
    Width = 289
    Height = 17
    TabOrder = 1
  end
  object StopBtn: TBitBtn
    Left = 120
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = StopBtnClick
  end
end
