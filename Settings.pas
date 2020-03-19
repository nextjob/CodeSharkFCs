{ This file is part of CodeSharkFCs

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,Boston, MA 02110 USA
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
