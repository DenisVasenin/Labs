object Form1: TForm1
  Left = 601
  Top = 158
  Width = 525
  Height = 199
  Caption = #1042#1072#1088#1080#1072#1085#1090' 10'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    517
    172)
  PixelsPerInch = 96
  TextHeight = 13
  object LAB1: TLabel
    Left = 55
    Top = 72
    Width = 401
    Height = 46
    Alignment = taCenter
    Anchors = []
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object Button1: TButton
    Left = 48
    Top = 128
    Width = 129
    Height = 33
    Hint = 
      #1054#1076#1085#1086#1084#1077#1088#1085#1099#1081' '#1084#1072#1089#1089#1080#1074' '#1088#1072#1079#1084#1077#1088#1085#1086#1089#1090#1080' 12 '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1084#1080' '#1095#1080#1089#1083#1072#1084#1080' '#1085#1072 +
      ' '#1086#1090#1088#1077#1079#1082#1077' [-25;25].'#13#1053#1072#1081#1090#1080' '#1089#1091#1084#1084#1091' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1084#1072#1089#1089#1080#1074#1072' '#1084 +
      #1077#1085#1100#1096#1077' 10.'
    Caption = #1047#1072#1076#1072#1085#1080#1077' 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 344
    Top = 128
    Width = 121
    Height = 33
    Hint = 
      #1054#1076#1085#1086#1084#1077#1088#1085#1099#1081' '#1084#1072#1089#1089#1080#1074' '#1088#1072#1079#1084#1077#1088#1085#1086#1089#1090#1080' 12 '#1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1084#1080' '#1095#1080#1089#1083#1072#1084#1080' '#1085#1072 +
      ' '#1086#1090#1088#1077#1079#1082#1077' [-25;25].'#13#1054#1087#1088#1077#1076#1077#1083#1080#1090#1100', '#1089#1091#1097#1077#1089#1090#1074#1091#1077#1090' '#1083#1080' '#1087#1072#1088#1072' '#1089#1086#1089#1077#1076#1085#1080#1093' '#1101#1083#1077#1084#1077 +
      #1085#1090#1086#1074' '#1084#1072#1089#1089#1080#1074#1072', '#1089#1091#1084#1084#1072' '#1082#1086#1090#1086#1088#1099#1093' '#1088#1072#1074#1085#1072' N.'
    Caption = #1047#1072#1076#1072#1085#1080#1077' 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button2Click
  end
  object SG1: TStringGrid
    Left = 8
    Top = 8
    Width = 495
    Height = 53
    Anchors = []
    ColCount = 12
    DefaultColWidth = 40
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goVertLine, goHorzLine]
    ParentFont = False
    TabOrder = 2
  end
  object ED1: TEdit
    Left = 198
    Top = 131
    Width = 121
    Height = 27
    Anchors = []
    AutoSize = False
    BiDiMode = bdLeftToRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnKeyDown = ED1KeyDown
  end
end
