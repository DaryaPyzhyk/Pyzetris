object PlayForm: TPlayForm
  Left = 652
  Top = 143
  Width = 536
  Height = 423
  AutoSize = True
  Caption = 'PlayForm'
  Color = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 384
    Height = 384
  end
  object GameOver: TLabel
    Left = 400
    Top = 232
    Width = 42
    Height = 13
    Caption = 'GO ONE'
  end
  object Label2: TLabel
    Left = 488
    Top = 224
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 432
    Top = 320
  end
end
