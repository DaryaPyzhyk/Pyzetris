object Menu: TMenu
  Left = 659
  Top = 249
  Width = 526
  Height = 460
  Caption = 'Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Play: TButton
    Left = 192
    Top = 88
    Width = 75
    Height = 25
    Caption = #1048#1075#1088#1072#1090#1100
    TabOrder = 0
    OnClick = PlayClick
  end
  object Rules: TButton
    Left = 192
    Top = 136
    Width = 75
    Height = 25
    Caption = #1055#1088#1072#1074#1080#1083#1072
    TabOrder = 1
    OnClick = RulesClick
  end
  object Exit: TButton
    Left = 192
    Top = 216
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = ExitClick
  end
  object RecordTable: TButton
    Left = 176
    Top = 176
    Width = 105
    Height = 25
    Caption = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1082#1086#1088#1076#1086#1074
    TabOrder = 3
  end
end
