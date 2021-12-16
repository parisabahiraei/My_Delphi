object CurrentDateDlg: TCurrentDateDlg
  Left = 289
  Top = 299
  BorderStyle = bsDialog
  Caption = 'Current Date  Dialog'
  ClientHeight = 117
  ClientWidth = 215
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 124
    Height = 13
    Caption = 'Enter current Hejri date : '
  end
  object OKBtn: TButton
    Left = 131
    Top = 35
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 129
    Top = 83
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 3
    Top = 24
    Width = 120
    Height = 89
    TabOrder = 2
    object Year_Edit: TLabeledEdit
      Left = 51
      Top = 8
      Width = 58
      Height = 21
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'Year : '
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object Month_Edit: TLabeledEdit
      Left = 51
      Top = 32
      Width = 58
      Height = 21
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Month : '
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object Day_Edit: TLabeledEdit
      Left = 51
      Top = 56
      Width = 58
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Dayr : '
      LabelPosition = lpLeft
      TabOrder = 2
    end
  end
end
