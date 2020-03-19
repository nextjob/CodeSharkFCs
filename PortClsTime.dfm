object FrmPortClsTm: TFrmPortClsTm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Port Close Timer'
  ClientHeight = 120
  ClientWidth = 166
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 129
    Height = 16
    Caption = 'Seconds To Port Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SecToClsLBL: TLabel
    Left = 80
    Top = 38
    Width = 7
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StopTimerBtn: TButton
    Left = 48
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Stop Timer'
    TabOrder = 0
    OnClick = StopTimerBtnClick
  end
end
