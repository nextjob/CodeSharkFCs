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
