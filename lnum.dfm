object FrmLN: TFrmLN
  Left = 219
  Top = 197
  BorderStyle = bsSizeToolWin
  Caption = 'Line Numbers'
  ClientHeight = 160
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 377
    Height = 57
    Caption = 'Options'
    TabOrder = 0
    object RBIns: TRadioButton
      Left = 16
      Top = 17
      Width = 89
      Height = 25
      Caption = '&Insert'
      TabOrder = 0
      OnClick = RBInsClick
    end
    object RBRmv: TRadioButton
      Left = 272
      Top = 17
      Width = 73
      Height = 25
      Caption = '&Remove'
      TabOrder = 1
      OnClick = RBRmvClick
    end
  end
  object GBoxOps: TGroupBox
    Left = 0
    Top = 58
    Width = 377
    Height = 68
    TabOrder = 1
    object lblstrt: TLabel
      Left = 64
      Top = 16
      Width = 99
      Height = 13
      Caption = 'Starting Line Number'
    end
    object lblinc: TLabel
      Left = 66
      Top = 41
      Width = 62
      Height = 13
      Caption = 'Increment By'
    end
    object SEditStart: TSpinEdit
      Left = 8
      Top = 11
      Width = 49
      Height = 22
      EditorEnabled = False
      MaxValue = 1000
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
    object SEditInc: TSpinEdit
      Left = 8
      Top = 37
      Width = 49
      Height = 22
      EditorEnabled = False
      MaxValue = 100
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object CBoxLead: TCheckBox
      Left = 256
      Top = 14
      Width = 113
      Height = 17
      Caption = '&Leading Zeros'
      TabOrder = 2
    end
    object CBoxAdd: TCheckBox
      Left = 256
      Top = 40
      Width = 113
      Height = 17
      Caption = '&Add Spaces'
      TabOrder = 3
    end
  end
  object ButOk: TButton
    Left = 226
    Top = 132
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = ButOkClick
  end
  object ButCancl: TButton
    Left = 301
    Top = 132
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = ButCanclClick
  end
end
