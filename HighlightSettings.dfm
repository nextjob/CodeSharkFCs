object FrmHighlighter: TFrmHighlighter
  Left = 0
  Top = 0
  Caption = 'Highlighter Settings'
  ClientHeight = 255
  ClientWidth = 393
  Color = clBtnFace
  TransparentColorValue = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 66
    Height = 13
    Caption = 'G Code String'
  end
  object Label2: TLabel
    Left = 120
    Top = 16
    Width = 69
    Height = 13
    Caption = 'Highlight Color'
  end
  object Label3: TLabel
    Left = 223
    Top = 16
    Width = 66
    Height = 13
    Caption = 'G Code String'
  end
  object Label4: TLabel
    Left = 312
    Top = 16
    Width = 69
    Height = 13
    Caption = 'Highlight Color'
  end
  object Label5: TLabel
    Left = 8
    Top = 35
    Width = 6
    Height = 13
    Caption = '1'
  end
  object Label6: TLabel
    Left = 8
    Top = 64
    Width = 6
    Height = 13
    Caption = '2'
  end
  object Label7: TLabel
    Left = 8
    Top = 94
    Width = 6
    Height = 13
    Caption = '3'
  end
  object Label8: TLabel
    Left = 8
    Top = 121
    Width = 6
    Height = 13
    Caption = '4'
  end
  object Label9: TLabel
    Left = 8
    Top = 148
    Width = 6
    Height = 13
    Caption = '5'
  end
  object Label10: TLabel
    Left = 200
    Top = 35
    Width = 6
    Height = 13
    Caption = '6'
  end
  object Label11: TLabel
    Left = 200
    Top = 64
    Width = 6
    Height = 13
    Caption = '7'
  end
  object Label12: TLabel
    Left = 200
    Top = 94
    Width = 6
    Height = 13
    Caption = '8'
  end
  object Label13: TLabel
    Left = 200
    Top = 121
    Width = 6
    Height = 13
    Caption = '9'
  end
  object Label14: TLabel
    Left = 200
    Top = 148
    Width = 12
    Height = 13
    Caption = '10'
  end
  object GcEdt1: TEdit
    Left = 33
    Top = 35
    Width = 65
    Height = 21
    TabOrder = 0
  end
  object GcEdt2: TEdit
    Left = 32
    Top = 64
    Width = 65
    Height = 21
    TabOrder = 2
  end
  object GcEdt3: TEdit
    Left = 32
    Top = 94
    Width = 65
    Height = 21
    TabOrder = 4
  end
  object GcEdt4: TEdit
    Left = 32
    Top = 121
    Width = 65
    Height = 21
    TabOrder = 6
  end
  object GcEdt5: TEdit
    Left = 32
    Top = 148
    Width = 65
    Height = 21
    TabOrder = 8
  end
  object GcColorCBB1: TOvcColorComboBox
    Left = 120
    Top = 35
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 1
    Text = 'Black'
  end
  object GcColorCBB2: TOvcColorComboBox
    Left = 120
    Top = 64
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 3
    Text = 'Black'
  end
  object GcColorCBB3: TOvcColorComboBox
    Left = 120
    Top = 94
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 5
    Text = 'Black'
  end
  object GcColorCBB4: TOvcColorComboBox
    Left = 120
    Top = 121
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 7
    Text = 'Black'
  end
  object GcColorCBB5: TOvcColorComboBox
    Left = 120
    Top = 148
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 9
    Text = 'Black'
  end
  object btnCancel: TButton
    Left = 294
    Top = 192
    Width = 75
    Height = 33
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 22
    OnClick = btnCancelClick
  end
  object btnApply: TButton
    Left = 176
    Top = 192
    Width = 75
    Height = 33
    Caption = 'Apply'
    ModalResult = 1
    TabOrder = 21
    OnClick = btnApplyClick
  end
  object GcEdt6: TEdit
    Left = 224
    Top = 35
    Width = 65
    Height = 21
    TabOrder = 10
  end
  object GcEdt7: TEdit
    Left = 224
    Top = 64
    Width = 65
    Height = 21
    TabOrder = 12
  end
  object GcEdt8: TEdit
    Left = 224
    Top = 94
    Width = 65
    Height = 21
    TabOrder = 14
  end
  object GcEdt9: TEdit
    Left = 224
    Top = 121
    Width = 65
    Height = 21
    TabOrder = 16
  end
  object GcEdt10: TEdit
    Left = 224
    Top = 148
    Width = 65
    Height = 21
    TabOrder = 18
  end
  object GcColorCBB6: TOvcColorComboBox
    Left = 312
    Top = 35
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 11
    Text = 'Black'
  end
  object GcColorCBB7: TOvcColorComboBox
    Left = 312
    Top = 64
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 13
    Text = 'Black'
  end
  object GcColorCBB8: TOvcColorComboBox
    Left = 312
    Top = 94
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 15
    Text = 'Black'
  end
  object GcColorCBB9: TOvcColorComboBox
    Left = 312
    Top = 121
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 17
    Text = 'Black'
  end
  object GcColorCBB10: TOvcColorComboBox
    Left = 312
    Top = 148
    Width = 57
    Height = 19
    ItemHeight = 13
    ShowColorNames = False
    TabOrder = 19
    Text = 'Black'
  end
  object GcHighlightCB: TCheckBox
    Left = 16
    Top = 208
    Width = 113
    Height = 17
    Caption = 'Enable Highlighting'
    TabOrder = 20
  end
end
