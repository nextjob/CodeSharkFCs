object AsciiStatusF: TAsciiStatusF
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Ascii Protocol Status'
  ClientHeight = 253
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object psPanel1: TPanel
    Left = 8
    Top = 47
    Width = 425
    Height = 91
    TabOrder = 0
    object psLabel1: TLabel
      Left = 8
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Protocol:'
    end
    object psLabel4: TLabel
      Left = 8
      Top = 27
      Width = 41
      Height = 13
      Caption = 'File size:'
    end
    object psProtocol: TLabel
      Left = 157
      Top = 8
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'NoProtocol'
      ShowAccelChar = False
    end
    object psFileSize: TLabel
      Left = 125
      Top = 27
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = '999,999,999,999'
      ShowAccelChar = False
    end
    object psLabel13: TLabel
      Left = 8
      Top = 46
      Width = 89
      Height = 13
      Caption = 'Bytes transferred:'
    end
    object psBytesTransferred: TLabel
      Left = 125
      Top = 46
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = '999,999,999,999'
      ShowAccelChar = False
      Transparent = True
    end
    object psLabel14: TLabel
      Left = 8
      Top = 65
      Width = 80
      Height = 13
      Caption = 'Bytes remaining:'
    end
    object psBytesRemaining: TLabel
      Left = 125
      Top = 65
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = '999,999,999,999'
      ShowAccelChar = False
      Transparent = True
    end
    object spTimoutPanel: TPanel
      Left = 294
      Top = 8
      Width = 113
      Height = 65
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label4: TLabel
        Left = 3
        Top = 5
        Width = 105
        Height = 16
        Caption = 'Receiving Timeout'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object spTimeOutSeconds: TLabel
        Left = 72
        Top = 27
        Width = 30
        Height = 19
        Alignment = taCenter
        Caption = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 27
        Width = 48
        Height = 16
        Caption = 'Seconds'
      end
    end
  end
  object psCancel: TButton
    Left = 165
    Top = 222
    Width = 89
    Height = 27
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = psCancelClick
  end
  object psPanel5: TPanel
    Left = 8
    Top = 144
    Width = 425
    Height = 33
    TabOrder = 2
    object psLabel22: TLabel
      Left = 8
      Top = 9
      Width = 35
      Height = 13
      Caption = 'Status:'
    end
    object psStatusMsg: TLabel
      Left = 56
      Top = 9
      Width = 14
      Height = 13
      Caption = 'OK'
      ShowAccelChar = False
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 183
    Width = 425
    Height = 33
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 9
      Width = 30
      Height = 13
      Caption = 'State:'
    end
    object psState: TLabel
      Left = 56
      Top = 9
      Width = 22
      Height = 13
      Caption = 'Wait'
      ShowAccelChar = False
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 8
    Width = 425
    Height = 33
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 9
      Width = 50
      Height = 13
      Caption = 'File Name:'
    end
    object psFileName: TEdit
      Left = 64
      Top = 6
      Width = 353
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
end
