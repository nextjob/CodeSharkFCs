object FrmSettings: TFrmSettings
  Left = 0
  Top = 0
  Caption = 'CodeShark FC Misc Settings'
  ClientHeight = 294
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 104
    Height = 13
    Caption = 'Default File Extension'
  end
  object FileExtLBX: TListBox
    Left = 8
    Top = 43
    Width = 89
    Height = 30
    ItemHeight = 13
    Items.Strings = (
      '.G'
      '.T'
      '.TXT'
      '.NC'
      '.PRO'
      '*.*')
    TabOrder = 0
    OnClick = FileExtLBXClick
  end
end
