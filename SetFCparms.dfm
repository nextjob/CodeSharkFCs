object SetFCparmsFrm: TSetFCparmsFrm
  Left = 0
  Top = 0
  Caption = 'Setup Parameters'
  ClientHeight = 302
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 256
    Width = 217
    Height = 13
    Caption = '*Overwrites Script with Last Executed Copy*'
  end
  object PythonHome: TLabeledEdit
    Left = 8
    Top = 24
    Width = 225
    Height = 21
    EditLabel.Width = 111
    EditLabel.Height = 13
    EditLabel.Caption = 'PythonHome Env Value'
    TabOrder = 0
    OnClick = PythonHomeClick
  end
  object FreeCadMod: TLabeledEdit
    Left = 8
    Top = 66
    Width = 225
    Height = 21
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'FreeCad Mod Path'
    TabOrder = 1
    OnClick = FreeCadModClick
  end
  object cbCustStart: TCheckBox
    Left = 8
    Top = 141
    Width = 129
    Height = 17
    Caption = 'Custom Start Script'
    TabOrder = 2
  end
  object cbCustPanel: TCheckBox
    Left = 8
    Top = 164
    Width = 153
    Height = 17
    Caption = 'Custom View Panel Script'
    TabOrder = 3
  end
  object cbCustSelectObs: TCheckBox
    Left = 8
    Top = 187
    Width = 185
    Height = 17
    Caption = 'Custom Selection Observer Script'
    TabOrder = 4
  end
  object cbCustShutdown: TCheckBox
    Left = 8
    Top = 210
    Width = 185
    Height = 17
    Caption = 'Custom Shutdown Script'
    TabOrder = 5
  end
  object cbOverWriteScript: TCheckBox
    Left = 8
    Top = 233
    Width = 169
    Height = 17
    Caption = 'Overwrite Scripts *Caution*'
    TabOrder = 6
  end
  object cbFreeCADWarnDisable: TCheckBox
    Left = 8
    Top = 275
    Width = 185
    Height = 17
    Caption = 'Disable FreeCAD Window Warning'
    TabOrder = 7
  end
  object PyDllName: TLabeledEdit
    Left = 8
    Top = 114
    Width = 121
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'dll Name'
    EditLabel.Color = clBtnFace
    EditLabel.ParentColor = False
    ReadOnly = True
    TabOrder = 8
  end
  object cbPyVersions: TComboBox
    Left = 135
    Top = 114
    Width = 98
    Height = 21
    Style = csDropDownList
    TabOrder = 9
    OnSelect = cbPyVersionsSelect
  end
end
