{ This file is part of CodeSharkFCs

  Copyright (C) 2020 Nextjob Solutions, LLC.

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
unit SendRecvDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Oomisc, AdSelCom, AdPort;

type
  TFrmSendRecvDlg = class(TForm)
    GBComport: TGroupBox;
    BtnChangePort: TButton;
    lblBaud: TLabel;
    lblBaudVal: TLabel;
    lblDataBits: TLabel;
    lblDataVal: TLabel;
    lblParity: TLabel;
    lblParityVal: TLabel;
    lblPortNbr: TLabel;
    lblPortVal: TLabel;
    lblState: TLabel;
    lblStateVal: TLabel;
    lblStopBits: TLabel;
    lblStopVal: TLabel;
    GBprotocol: TGroupBox;
    lblCharDelay: TLabel;
    lblLnDelay: TLabel;
    lblEOFDelay: TLabel;
    lblPortClose: TLabel;
    lblCRTrn: TLabel;
    lblLNTran: TLabel;
    btnChangeProto: TButton;
    Memo1: TMemo;
    btnSendRecv: TButton;
    lblCharVal: TLabel;
    lblLnVal: TLabel;
    lblEOFVal: TLabel;
    lblPortCloseVal: TLabel;
    lblCrTranVal: TLabel;
    lblLnTranVal: TLabel;
    btnProtocolHelp: TButton;
    procedure FromShow(Sender: TObject);
    procedure PopPortState;
    procedure PopProtState;
    procedure btnSendRecvClick(Sender: TObject);
    procedure BtnChangePortClick(Sender: TObject);
    procedure btnChangeProtoClick(Sender: TObject);
    procedure btnProtocolHelpClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSendRecvDlg: TFrmSendRecvDlg;
  parity, Translate : string;
implementation

uses
    srcMain, cmset, ptops ;

{$R *.dfm}
procedure TFrmSendRecvDlg.BtnChangePortClick(Sender: TObject);
begin
  If (FrmMain.ApdComPort1 = NIL) Then
     ShowMessage('Unable to Assign Com Port Options, ApdComport1 Nil??!')
  else
  Begin
     if ComPortOptions.showmodal = mrOk then
      PopPortState();
  end;
End;
procedure TFrmSendRecvDlg.btnChangeProtoClick(Sender: TObject);
begin
 ProtocolOptions.execute;
 PopProtState();
end;

procedure TFrmSendRecvDlg.btnProtocolHelpClick(Sender: TObject);
begin
  If FileExists(Application.HelpFile) = TRUE Then
    Application.HelpContext(830)
  Else
   ShowMessage(Application.HelpFile + ' Not Available');
end;

procedure TFrmSendRecvDlg.btnSendRecvClick(Sender: TObject);
var
   MBPrmpt: PCHAR;
begin
   if IsPortAvailable(FrmMain.ApdComPort1.ComNumber) then
      ModalResult := mrOK
   else
   Begin
     MBPrmpt :=  PCHAR('Com Port Number: ' + intToStr(FrmMain.ApdComPort1.ComNumber) + ' Unavailable!'+chr(13)+'Please select a valid com port');
     Application.MessageBox(MBPrmpt, 'CodeShark', MB_OK + MB_ICONWARNING +
          MB_TASKMODAL);
   end;
end;


procedure TFrmSendRecvDlg.FromShow(Sender: TObject);
 begin
     PopPortState();
     PopProtState();
 end;

procedure TFrmSendRecvDlg.PopPortState;
 begin
 lblPortVal.Caption := intTostr(FrmMain.ApdComPort1.ComNumber);
 lblBaudVal.Caption := intTostr(FrmMain.ApdComPort1.Baud);
 lblStopVal.Caption := intTostr(FrmMain.ApdComPort1.StopBits);
// {Parity type}
//  TParity = (pNone, pOdd, pEven, pMark, pSpace);

 case ord(FrmMain.ApdComPort1.Parity) of
   0 : parity := 'None';
   1 : parity := 'Odd' ;
   2 : parity := 'Even' ;
   3 : parity := 'Mark' ;
   4 : parity := 'Space' ;
 end;
 lblParityVal.Caption :=  parity;
 lblDataVal.Caption := intTostr(FrmMain.ApdComPort1.DataBits);
 if FrmMain.ApdComPort1.Open then
    lblStateVal.Caption :=  'Open'
 else
    lblStateVal.Caption :=  'Close';
 end;

 procedure TFrmSendRecvDlg.PopProtState;
 begin
  // do not delete this!
  lblCharVal.Caption := IntToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiCharDelay));
  lblLnVal.Caption := IntToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiLineDelay));

  case Ord(FrmMain.ApdProtocol1.AsciiCRTranslation) of
   0 : Translate := 'none';
   1 : Translate := 'strip' ;
   2 : Translate := 'add CR' ;
   3 : Translate := 'add LF' ;
  end;
  lblCrTranVal.Caption :=  Translate;

  case Ord(FrmMain.ApdProtocol1.AsciiLFTranslation) of
   0 : Translate := 'none';
   1 : Translate := 'strip' ;
   2 : Translate := 'add CR' ;
   3 : Translate := 'add LF' ;
  end;
  lblLnTranVal.Caption :=  Translate;

  lblEOFVal.Caption :=IntToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiEOFTimeout));
  lblPortCloseVal.Caption :=Floattostr(FrmMain.PortCloseTimer.Interval / 1000);

 end;

 end.
