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

unit tsttrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AdStatLt, OoMisc, StdCtrls, ExtCtrls, ADTrmEmu, AdSelCom;

type
  TFrmTrm = class(TForm)
    // ApdTerminal1: TAdTerminal;       // apro 4.07 mod
    Panel1: TPanel;
    ApdStatusLight1: TApdStatusLight;
    ApdStatusLight2: TApdStatusLight;
    ApdStatusLight3: TApdStatusLight;
    ApdStatusLight4: TApdStatusLight;
    ApdStatusLight5: TApdStatusLight;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    // ApdKeyboardEmulator1: TAdTTYEmulator;    // apro 4.07 mod
    ApdSLCtrl: TApdSLController;
    PanComStat: TPanel;
    AdTTYEmulator1: TAdTTYEmulator;
    AdTerminal1: TAdTerminal;
    Edit1: TEdit;

    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrm: TFrmTrm;

implementation

uses srcMain, Settings;

{$R *.DFM}

procedure TFrmTrm.FormActivate(Sender: TObject);
begin
//  If FrmMain.ApdComPort1.ComNumber = 0 Then
  if not(IsPortAvailable(FrmMain.ApdComPort1.ComNumber)) then
  Begin
    ShowMessage('Invalid Com Port Selected, use CNC -> Configure Port');
    exit;
  End;
  try
    FrmMain.ApdComPort1.Open := true;
    AdTerminal1.ComPort := FrmMain.ApdComPort1;
    ApdSLCtrl.ComPort := FrmMain.ApdComPort1;
    ApdSLCtrl.monitoring := true;
  // ApdKeyboardEmulator1.Enabled:=true;   // apro 4.07 mod
    AdTerminal1.Active := true;
  Except
    on E: Exception do
    Begin
      showMessage('Communications Error, Exception Class / Message raised: ' +
          E.ClassName + ' ' + E.Message);
      exit
    End;
  End;


  PanComStat.Caption := 'Port: ' + IntToStr(FrmMain.ApdComPort1.ComNumber);
  PanComStat.Caption := PanComStat.Caption + '  Baud: ' +
    IntToStr(FrmMain.ApdComPort1.Baud);
  PanComStat.Caption := PanComStat.Caption + '  Parity: ' + FrmMain.ParityChar;
  PanComStat.Caption := PanComStat.Caption + '  Data: ' +
    IntToStr(FrmMain.ApdComPort1.DataBits);
  PanComStat.Caption := PanComStat.Caption + '  Stop: ' +
    IntToStr(FrmMain.ApdComPort1.StopBits);
  PanComStat.Caption := PanComStat.Caption + '  Flow: ' + FrmMain.FlowChar;
end;

procedure TFrmTrm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ApdSLCtrl.monitoring := false;
  // ApdKeyboardEmulator1.Enabled:=false;   // apro 4.07 mod
  AdTerminal1.Active := false;
  FrmMain.ApdComPort1.Open := false;
  FrmMain.EnableMenuItems;
  FrmSettings.TestTermBtn.Enabled := true;
end;

end.
