object Form1: TForm1
  Left = 712
  Top = 104
  Width = 654
  Height = 634
  HorzScrollBar.Color = clScrollBar
  HorzScrollBar.ParentColor = False
  Caption = #1042#1072#1088#1080#1072#1085#1090' 19'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object LAB1: TLabel
    Left = 8
    Top = 8
    Width = 169
    Height = 33
    AutoSize = False
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080':'
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object LAB2: TLabel
    Left = 8
    Top = 56
    Width = 170
    Height = 33
    AutoSize = False
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1072#1074#1090#1086#1088#1072':'
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object LAB3: TLabel
    Left = 8
    Top = 104
    Width = 170
    Height = 33
    AutoSize = False
    Caption = #1043#1086#1076' '#1080#1079#1076#1072#1085#1080#1103':'
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object Label1: TLabel
    Left = 8
    Top = 160
    Width = 126
    Height = 20
    Caption = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
  end
  object ED1: TEdit
    Left = 184
    Top = 10
    Width = 337
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ED2: TEdit
    Left = 184
    Top = 58
    Width = 337
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object ED3: TEdit
    Left = 184
    Top = 106
    Width = 337
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 560
    Width = 153
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 560
    Width = 153
    Height = 33
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 536
    Top = 152
    Width = 97
    Height = 33
    Caption = #1053#1072#1081#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button4Click
  end
  object BB1: TBitBtn
    Left = 536
    Top = 560
    Width = 98
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BB1Click
    Kind = bkClose
  end
  object Button5: TButton
    Left = 536
    Top = 40
    Width = 97
    Height = 65
    Caption = #1042#1085#1077#1089#1090#1080' '#1074' '#1089#1087#1080#1089#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    WordWrap = True
    OnClick = Button5Click
  end
  object Button3: TButton
    Left = 536
    Top = 384
    Width = 97
    Height = 65
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 8
    WordWrap = True
    OnClick = Button3Click
  end
  object SG1: TStringGrid
    Left = 8
    Top = 200
    Width = 514
    Height = 345
    ColCount = 1
    DefaultColWidth = 1000
    FixedColor = clWindow
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goDrawFocusSelected]
    TabOrder = 9
  end
  object ED4: TEdit
    Left = 184
    Top = 152
    Width = 337
    Height = 28
    TabOrder = 10
  end
  object Button6: TButton
    Left = 536
    Top = 288
    Width = 97
    Height = 65
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1057#1087#1080#1089#1086#1082
    TabOrder = 11
    WordWrap = True
    OnClick = Button6Click
  end
  object OD1: TOpenDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt|'#1042#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 384
    Top = 560
  end
  object SD1: TSaveDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 344
    Top = 560
  end
end
