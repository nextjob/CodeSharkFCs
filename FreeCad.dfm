object FreeCadFrm: TFreeCadFrm
  Left = 0
  Top = 0
  Caption = 'CodeShark/FreeCAD Interface Dialog'
  ClientHeight = 494
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 301
    Width = 74
    Height = 13
    Caption = 'Python Output '
  end
  object Label2: TLabel
    Left = 8
    Top = 179
    Width = 100
    Height = 13
    Caption = 'Python Script Strings'
  end
  object PyOutMemo: TMemo
    Left = 8
    Top = 320
    Width = 377
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 377
    Height = 165
    Alignment = taLeftJustify
    TabOrder = 1
    VerticalAlignment = taAlignTop
    object btnExeFC: TButton
      Left = 8
      Top = 15
      Width = 161
      Height = 42
      Caption = 'Run FreeCad'
      TabOrder = 0
      OnClick = btnExeFCClick
    end
    object pnlPickGeo: TPanel
      Left = 8
      Top = 63
      Width = 161
      Height = 96
      Caption = 'Picked Geometry Settings'
      TabOrder = 1
      VerticalAlignment = taAlignTop
      object Label3: TLabel
        Left = 62
        Top = 46
        Width = 81
        Height = 13
        Caption = 'Decimal Precision'
      end
      object cbIncludeZ: TCheckBox
        Left = 16
        Top = 23
        Width = 145
        Height = 17
        Caption = 'Include Z Axis Address'
        TabOrder = 0
      end
      object UpDown1: TUpDown
        Left = 40
        Top = 47
        Width = 16
        Height = 21
        Min = 2
        Max = 7
        Position = 4
        TabOrder = 1
      end
      object EdtUpDown: TEdit
        Left = 8
        Top = 46
        Width = 26
        Height = 21
        TabOrder = 2
        Text = '4'
      end
    end
    object pnlPath: TPanel
      Left = 175
      Top = 15
      Width = 177
      Height = 144
      Alignment = taLeftJustify
      Caption = '  Path'
      TabOrder = 2
      VerticalAlignment = taAlignTop
      object Label4: TLabel
        Left = 16
        Top = 75
        Width = 100
        Height = 13
        Caption = 'Selected Edge Count'
      end
      object lblEdgeCnt: TLabel
        Left = 122
        Top = 75
        Width = 6
        Height = 13
        Caption = '0'
        Transparent = False
      end
      object cbBypassSel: TCheckBox
        Left = 13
        Top = 18
        Width = 140
        Height = 17
        Caption = 'Bypass Selection Import'
        TabOrder = 0
      end
      object btnSetTool: TButton
        Left = 13
        Top = 41
        Width = 145
        Height = 25
        Caption = 'Set Tool'
        TabOrder = 1
        OnClick = btnSetToolClick
      end
      object btnGenPath: TButton
        Left = 13
        Top = 99
        Width = 145
        Height = 25
        Caption = 'Generate Selected Path'
        TabOrder = 2
        OnClick = btnGenPathClick
      end
    end
  end
  object ExeMemo: TMemo
    Left = 8
    Top = 206
    Width = 377
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object cbRawOut: TCheckBox
    Left = 8
    Top = 415
    Width = 113
    Height = 17
    Caption = 'Output Raw Data'
    TabOrder = 3
  end
  object PythonEngine1: TPythonEngine
    DllName = 'python36.dll'
    APIVersion = 1013
    RegVersion = '3.6'
    FatalAbort = False
    FatalMsgDlg = False
    UseLastKnownVersion = False
    OnBeforeLoad = PythonEngine1BeforeLoad
    AutoFinalize = False
    IO = PythonGUIInputOutput1
    PyFlags = [pfIgnoreEnvironmentFlag]
    Left = 40
    Top = 448
  end
  object PythonModule1: TPythonModule
    Engine = PythonEngine1
    OnInitialization = PythonModule1Initialization
    ModuleName = 'CaptureFC'
    Errors = <>
    Left = 256
    Top = 448
  end
  object PythonGUIInputOutput1: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = PyOutMemo
    Left = 152
    Top = 448
  end
  object PythonDelphiVar1: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'EdgeCnt'
    Left = 344
    Top = 448
  end
end
