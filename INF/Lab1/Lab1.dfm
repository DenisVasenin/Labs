object Form1: TForm1
  Left = 863
  Top = 270
  BiDiMode = bdLeftToRight
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Calculator'
  ClientHeight = 274
  ClientWidth = 456
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 18
    Top = 193
    Width = 75
    Height = 25
    Caption = '1'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 106
    Top = 193
    Width = 75
    Height = 25
    Caption = '2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 194
    Top = 193
    Width = 75
    Height = 25
    Caption = '3'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 18
    Top = 153
    Width = 75
    Height = 25
    Caption = '4'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 106
    Top = 153
    Width = 75
    Height = 25
    Caption = '5'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 194
    Top = 153
    Width = 75
    Height = 25
    Caption = '6'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 18
    Top = 113
    Width = 75
    Height = 25
    Caption = '7'
    TabOrder = 6
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 106
    Top = 113
    Width = 75
    Height = 25
    Caption = '8'
    TabOrder = 7
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 194
    Top = 113
    Width = 75
    Height = 25
    Caption = '9'
    TabOrder = 8
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 106
    Top = 233
    Width = 75
    Height = 25
    Caption = '0'
    TabOrder = 9
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 18
    Top = 233
    Width = 75
    Height = 25
    Caption = ','
    TabOrder = 10
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 194
    Top = 233
    Width = 75
    Height = 25
    Caption = '='
    TabOrder = 11
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 282
    Top = 113
    Width = 75
    Height = 25
    Caption = '+'
    TabOrder = 12
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 282
    Top = 153
    Width = 75
    Height = 25
    Caption = '-'
    TabOrder = 13
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 282
    Top = 193
    Width = 75
    Height = 25
    Caption = 'x'
    TabOrder = 14
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 282
    Top = 233
    Width = 75
    Height = 25
    Caption = '/'
    TabOrder = 15
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 18
    Top = 73
    Width = 75
    Height = 25
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1105
    Caption = 'AC'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = Button17Click
  end
  object Button18: TButton
    Left = 106
    Top = 73
    Width = 75
    Height = 25
    Hint = #1044#1086#1073#1074#1080#1090#1100' '#1074' '#1087#1072#1084#1103#1090#1100
    Caption = 'MI'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnClick = Button18Click
  end
  object Button19: TButton
    Left = 192
    Top = 72
    Width = 75
    Height = 25
    Hint = #1048#1079#1074#1083#1077#1095#1100' '#1080#1079' '#1087#1072#1084#1103#1090#1080
    Caption = 'MO'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    OnClick = Button19Click
  end
  object Button20: TButton
    Left = 280
    Top = 72
    Width = 75
    Height = 25
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1082
    Caption = '/-/'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    OnClick = Button20Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 8
    Width = 425
    Height = 49
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '')
    MaxLength = 45
    ParentFont = False
    TabOrder = 20
  end
  object Button21: TButton
    Left = 368
    Top = 72
    Width = 75
    Height = 25
    Caption = 'f'
    TabOrder = 21
    OnClick = Button21Click
  end
  object Button22: TButton
    Left = 368
    Top = 112
    Width = 75
    Height = 25
    Caption = 'pow'
    TabOrder = 22
    OnClick = Button22Click
  end
  object Button23: TButton
    Left = 368
    Top = 152
    Width = 75
    Height = 25
    Caption = 'sqrt'
    TabOrder = 23
    OnClick = Button23Click
  end
  object Button24: TButton
    Left = 368
    Top = 192
    Width = 75
    Height = 25
    Caption = 'sin'
    TabOrder = 24
    OnClick = Button24Click
  end
  object Button25: TButton
    Left = 368
    Top = 232
    Width = 75
    Height = 25
    Caption = 'cos'
    TabOrder = 25
    OnClick = Button25Click
  end
end
