{ This file is part of CodeSharkFCs
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
}

unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmSettings = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    FileExtLBL: TLabel;
    GutterCB: TCheckBox;
    NbrsOnGutterCB: TCheckBox;
    FilterOnOpenCB: TCheckBox;
    RemoveSpacesCB: TCheckBox;
    AddPercentCB: TCheckBox;
    Clear1stBlockCB: TCheckBox;
    FileExtLBX: TListBox;
    FilterOnSendCB: TCheckBox;
    FilterOnReceiveCB: TCheckBox;
    FilterPanel: TPanel;
    TabSheet2: TTabSheet;
    TracingCB: TCheckBox;
    ViewTraceBtn: TButton;
    ViewHistBtn: TButton;
    TestTermBtn: TButton;
    ForceUpperCaseCB: TCheckBox;

    procedure FileExtLBXClick(Sender: TObject);
    procedure GutterCBClick(Sender: TObject);
    procedure NbrsOnGutterCBClick(Sender: TObject);
    procedure ViewHistBtnClick(Sender: TObject);
    procedure ViewTraceBtnClick(Sender: TObject);
    procedure TestTermBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSettings: TFrmSettings;

implementation

Uses
  srcMain, tsttrm;

{$R *.dfm}

procedure TFrmSettings.FileExtLBXClick(Sender: TObject);
begin
  case FileExtLBX.ItemIndex of
    0:
      FrmMain.DefaultFileExtension := 'G';
    1:
      FrmMain.DefaultFileExtension := 'T';
    2:
      FrmMain.DefaultFileExtension := 'TXT';
    3:
      FrmMain.DefaultFileExtension := 'NC';
    4:
      FrmMain.DefaultFileExtension := 'PRO';
    5:
      FrmMain.DefaultFileExtension := '';
  end;
end;

procedure TFrmSettings.GutterCBClick(Sender: TObject);
begin
  FrmMain.GutterExecute;
end;

procedure TFrmSettings.NbrsOnGutterCBClick(Sender: TObject);
begin
  FrmMain.GutterExecute;
end;

procedure TFrmSettings.TestTermBtnClick(Sender: TObject);
begin
  If FrmMain.ApdComPort1.ComNumber = 0 Then
  Begin
    FrmMain.ConfigurePortExecute(Sender)
  End;
  If FrmMain.ApdComPort1.ComNumber = 0 Then
  Begin
    ShowMessage('Comm Port Not Set')
  End
  Else
  Begin
    // MnuSend.Enabled := FALSE;
    // Configure1.Enabled := FALSE;
    // MnuReceive.Enabled := FALSE;
    // MnuTestTerminal.Enabled := FALSE;
    TestTermBtn.Enabled := false;
    FrmMain.DisableMenuItems;
    FrmTrm.show;
  End;
end;

procedure TFrmSettings.ViewHistBtnClick(Sender: TObject);
Var
  Cln: STRING;
  Pln: Array [0 .. 256] Of AnsiChar;
Begin
  // view log file in Notepad
  Cln := '';
  If FileExists(srcMain.AproHstFn) = TRUE Then
  Begin
    Cln := 'Notepad.exe ' + srcMain.AproHstFn;
    Try
      StrPCopy(Pln, Cln);
      WinExec(Pln, SW_SHOWNORMAL);
    Except
      exit;
    End;
  End;
end;

procedure TFrmSettings.ViewTraceBtnClick(Sender: TObject);
Var
  Cln: STRING;
  Pln: Array [0 .. 256] Of AnsiChar;
Begin
  // view log file in Notepad
  Cln := '';
  If FileExists(srcMain.AproTrcFn) = TRUE Then
  Begin
    Cln := 'Notepad.exe ' + srcMain.AproTrcFn;
    Try
      StrPCopy(Pln, Cln);
      WinExec(Pln, SW_SHOWNORMAL);
    Except
      exit;
    End;
  End;
end;

End.
