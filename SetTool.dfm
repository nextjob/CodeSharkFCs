object SetToolFRM: TSetToolFRM
  Left = 0
  Top = 0
  Caption = 'Set Tool'
  ClientHeight = 464
  ClientWidth = 202
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 81
    Height = 74
    Alignment = taLeftJustify
    TabOrder = 0
    VerticalAlignment = taAlignTop
    object Label2: TLabel
      Left = 8
      Top = 1
      Width = 65
      Height = 13
      Caption = 'Tool Direction'
    end
    object rbCW: TRadioButton
      Left = 8
      Top = 20
      Width = 49
      Height = 17
      Caption = 'CW'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbCCW: TRadioButton
      Left = 8
      Top = 43
      Width = 41
      Height = 17
      Caption = 'CCW'
      TabOrder = 1
    end
  end
  object RadiusEdt: TLabeledEdit
    Left = 8
    Top = 112
    Width = 81
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'Tool Radius'
    TabOrder = 1
    Text = '1.00'
  end
  object VertFeedEdt: TLabeledEdit
    Left = 8
    Top = 152
    Width = 81
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Vert Feed Rate'
    TabOrder = 2
    Text = '0'
  end
  object HorzFeedEdt: TLabeledEdit
    Left = 8
    Top = 190
    Width = 81
    Height = 21
    EditLabel.Width = 75
    EditLabel.Height = 13
    EditLabel.Caption = 'Horz Feed Rate'
    TabOrder = 3
    Text = '0'
  end
  object OffsetExtraEdt: TLabeledEdit
    Left = 8
    Top = 228
    Width = 81
    Height = 21
    EditLabel.Width = 63
    EditLabel.Height = 13
    EditLabel.Caption = 'Offset Extra '
    TabOrder = 4
    Text = '0'
  end
  object RapidSafeSpaceEdt: TLabeledEdit
    Left = 8
    Top = 267
    Width = 81
    Height = 21
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = 'Rapid Safety Space'
    TabOrder = 5
    Text = '0'
  end
  object ClearanceEdt: TLabeledEdit
    Left = 8
    Top = 312
    Width = 121
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'Clearance '
    TabOrder = 6
    Text = '0'
  end
  object StartDepthEdt: TLabeledEdit
    Left = 8
    Top = 352
    Width = 121
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Start Depth'
    TabOrder = 7
    Text = '0'
  end
  object StepdownEdt: TLabeledEdit
    Left = 8
    Top = 392
    Width = 121
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'Step down'
    TabOrder = 8
    Text = '.001'
  end
  object FinalDepthEdt: TLabeledEdit
    Left = 8
    Top = 435
    Width = 121
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'Final Depth'
    TabOrder = 9
    Text = '-.001'
  end
  object Panel2: TPanel
    Left = 95
    Top = 8
    Width = 97
    Height = 74
    Alignment = taLeftJustify
    Caption = 'Tool Path'
    TabOrder = 10
    VerticalAlignment = taAlignTop
    object rbOnLine: TRadioButton
      Left = 7
      Top = 15
      Width = 73
      Height = 17
      Caption = 'On Line'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbRightofLine: TRadioButton
      Left = 8
      Top = 30
      Width = 81
      Height = 17
      Caption = 'Right of Line'
      TabOrder = 1
    end
    object rbLeftofLine: TRadioButton
      Left = 7
      Top = 45
      Width = 81
      Height = 17
      Caption = 'Left of Line'
      TabOrder = 2
    end
  end
end
