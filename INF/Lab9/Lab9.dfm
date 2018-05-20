object Form1: TForm1
  Left = 971
  Top = 104
  Width = 395
  Height = 543
  Caption = #1042#1072#1088#1080#1072#1085#1090' 10'
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
  object SG1: TStringGrid
    Left = 8
    Top = 8
    Width = 369
    Height = 305
    ColCount = 3
    DefaultColWidth = 120
    FixedCols = 0
    RowCount = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 472
    Width = 113
    Height = 33
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object MEM1: TMemo
    Left = 80
    Top = 336
    Width = 241
    Height = 129
    BorderStyle = bsNone
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '                   x^3                                 x^(2n+1)'
      'S(x) = x - -------- +  ...  + (-1)^n * ---------------- '
      
        '                     3                                      (2n+' +
        '1)'
      ''
      'Y(x) = arctg x'
      ''
      'n=15 ; h=|(xn-xk)|/10 ; xn=0,1 ; xk=0.5')
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object BB1: TBitBtn
    Left = 272
    Top = 472
    Width = 105
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Kind = bkClose
  end
end
