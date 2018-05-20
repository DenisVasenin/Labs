object Form1: TForm1
  Left = 750
  Top = 104
  Width = 579
  Height = 618
  Caption = #1042#1072#1088#1080#1072#1085#1090' 19'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LAB1: TLabel
    Left = 80
    Top = 432
    Width = 417
    Height = 105
    Alignment = taCenter
    AutoSize = False
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object LB1: TListBox
    Left = 8
    Top = 88
    Width = 553
    Height = 329
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    ScrollWidth = 1
    TabOrder = 0
    OnClick = LB1Click
  end
  object BB1: TBitBtn
    Left = 232
    Top = 552
    Width = 115
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Kind = bkClose
  end
  object ED1: TEdit
    Left = 8
    Top = 8
    Width = 553
    Height = 73
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ED1Click
    OnKeyPress = ED1KeyPress
  end
end
