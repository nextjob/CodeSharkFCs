object FrmTR: TFrmTR
  Left = 284
  Top = 222
  BorderStyle = bsSizeToolWin
  Caption = 'Tool Renumber'
  ClientHeight = 130
  ClientWidth = 291
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
  object RGrpFunc: TRadioGroup
    Left = 2
    Top = 3
    Width = 81
    Height = 89
    Caption = 'Function'
    Items.Strings = (
      'Add'
      'Subtract'
      'Multiply')
    TabOrder = 0
  end
  object GBvl: TGroupBox
    Left = 87
    Top = 3
    Width = 74
    Height = 89
    Caption = 'Value'
    TabOrder = 1
    object SEditVlu: TSpinEdit
      Left = 8
      Top = 37
      Width = 57
      Height = 22
      EditorEnabled = False
      MaxValue = 1000
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
  end
  object RGrpMd: TRadioGroup
    Left = 165
    Top = 3
    Width = 124
    Height = 89
    Caption = 'Modify'
    Items.Strings = (
      'T codes only'
      'T, H, D codes')
    TabOrder = 2
  end
  object Butok: TButton
    Left = 159
    Top = 96
    Width = 65
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = ButokClick
  end
  object Butcncl: TButton
    Left = 224
    Top = 96
    Width = 65
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = ButcnclClick
  end
end
