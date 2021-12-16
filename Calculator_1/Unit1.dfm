object calculator: Tcalculator
  Left = 0
  Top = 0
  Caption = 'calculator'
  ClientHeight = 514
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object natijeh: TLabel
    Left = 227
    Top = 202
    Width = 26
    Height = 13
  end
  object firstnum: TEdit
    Left = 227
    Top = 95
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object secondnum: TEdit
    Left = 227
    Top = 142
    Width = 137
    Height = 21
    TabOrder = 1
  end
  object sum: TButton
    Left = 418
    Top = 174
    Width = 137
    Height = 41
    Caption = '+'
    TabOrder = 2
    OnClick = sumClick
  end
  object diffrence: TButton
    Left = 418
    Top = 226
    Width = 137
    Height = 36
    Caption = '-'
    TabOrder = 3
    OnClick = diffrenceClick
  end
  object multiply: TButton
    Left = 418
    Top = 268
    Width = 137
    Height = 41
    Caption = '*'
    TabOrder = 4
    OnClick = multiplyClick
  end
  object taghsim: TButton
    Left = 418
    Top = 315
    Width = 137
    Height = 37
    Caption = '/'
    TabOrder = 5
    OnClick = taghsimClick
  end
end
