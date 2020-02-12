object FrmSendRecvDlg: TFrmSendRecvDlg
  Left = 187
  Top = 292
  Caption = 'Communications State'
  ClientHeight = 298
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FromShow
  PixelsPerInch = 96
  TextHeight = 13
  object GBComport: TGroupBox
    Left = 8
    Top = 8
    Width = 161
    Height = 193
    Caption = 'Com Port Setings'
    TabOrder = 0
    object lblBaud: TLabel
      Left = 16
      Top = 50
      Width = 51
      Height = 13
      Caption = 'Baud Rate'
    end
    object lblBaudVal: TLabel
      Left = 88
      Top = 50
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object lblDataBits: TLabel
      Left = 16
      Top = 70
      Width = 43
      Height = 13
      Caption = 'Data Bits'
    end
    object lblDataVal: TLabel
      Left = 88
      Top = 70
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object lblParity: TLabel
      Left = 16
      Top = 110
      Width = 26
      Height = 13
      Caption = 'Parity'
    end
    object lblParityVal: TLabel
      Left = 88
      Top = 110
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object lblPortNbr: TLabel
      Left = 16
      Top = 30
      Width = 59
      Height = 13
      Caption = 'Port Number'
    end
    object lblPortVal: TLabel
      Left = 88
      Top = 30
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object lblState: TLabel
      Left = 16
      Top = 130
      Width = 47
      Height = 13
      Caption = 'Port State'
    end
    object lblStateVal: TLabel
      Left = 88
      Top = 130
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object lblStopBits: TLabel
      Left = 16
      Top = 90
      Width = 42
      Height = 13
      Caption = 'Stop Bits'
    end
    object lblStopVal: TLabel
      Left = 88
      Top = 90
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object BtnChangePort: TButton
      Left = 32
      Top = 150
      Width = 97
      Height = 25
      Caption = 'Port Settings'
      TabOrder = 0
      OnClick = BtnChangePortClick
    end
  end
  object GBprotocol: TGroupBox
    Left = 194
    Top = 9
    Width = 193
    Height = 193
    Caption = 'Protocol'
    TabOrder = 1
    object lblCharDelay: TLabel
      Left = 10
      Top = 30
      Width = 124
      Height = 13
      Caption = 'Inter-char delay (Seconds)'
    end
    object lblLnDelay: TLabel
      Left = 10
      Top = 50
      Width = 71
      Height = 13
      Caption = 'Inter-line delay '
    end
    object lblEOFDelay: TLabel
      Left = 11
      Top = 71
      Width = 58
      Height = 13
      Caption = 'EOF timeout'
    end
    object lblPortClose: TLabel
      Left = 10
      Top = 90
      Width = 89
      Height = 26
      Caption = 'Close Port Timeout'#13#10
    end
    object lblCRTrn: TLabel
      Left = 10
      Top = 110
      Width = 66
      Height = 13
      Caption = 'CR translation'
    end
    object lblLNTran: TLabel
      Left = 10
      Top = 130
      Width = 66
      Height = 13
      Caption = 'LF translation:'
    end
    object lblCharVal: TLabel
      Left = 144
      Top = 30
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblLnVal: TLabel
      Left = 144
      Top = 50
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblEOFVal: TLabel
      Left = 144
      Top = 71
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblPortCloseVal: TLabel
      Left = 144
      Top = 90
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblCrTranVal: TLabel
      Left = 128
      Top = 112
      Width = 26
      Height = 13
      Caption = 'None'
    end
    object lblLnTranVal: TLabel
      Left = 128
      Top = 131
      Width = 26
      Height = 13
      Caption = 'None'
    end
    object btnChangeProto: TButton
      Left = 32
      Top = 150
      Width = 105
      Height = 25
      Caption = 'Protocol Settings'
      TabOrder = 0
      OnClick = btnChangeProtoClick
    end
    object btnProtocolHelp: TButton
      Left = 162
      Top = 10
      Width = 27
      Height = 25
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnProtocolHelpClick
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 208
    Width = 377
    Height = 51
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Line 1'
      'Line 2'
      'Line 3')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btnSendRecv: TButton
    Left = 87
    Top = 265
    Width = 209
    Height = 25
    Caption = 'Transmit Type'
    TabOrder = 3
    OnClick = btnSendRecvClick
  end
end
