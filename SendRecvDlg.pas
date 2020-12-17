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
  parity, Translate: string;

implementation

uses
  srcMain, cmset, ptops;

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
    ModalResult := mrOk
  else
  Begin
    MBPrmpt := PCHAR('Com Port Number: ' +
      intToStr(FrmMain.ApdComPort1.ComNumber) + ' Unavailable!' + chr(13) +
      'Please select a valid com port');
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
  lblPortVal.Caption := intToStr(FrmMain.ApdComPort1.ComNumber);
  lblBaudVal.Caption := intToStr(FrmMain.ApdComPort1.Baud);
  lblStopVal.Caption := intToStr(FrmMain.ApdComPort1.StopBits);
  // {Parity type}
  // TParity = (pNone, pOdd, pEven, pMark, pSpace);

  case ord(FrmMain.ApdComPort1.parity) of
    0:
      parity := 'None';
    1:
      parity := 'Odd';
    2:
      parity := 'Even';
    3:
      parity := 'Mark';
    4:
      parity := 'Space';
  end;
  lblParityVal.Caption := parity;
  lblDataVal.Caption := intToStr(FrmMain.ApdComPort1.DataBits);
  if FrmMain.ApdComPort1.Open then
    lblStateVal.Caption := 'Open'
  else
    lblStateVal.Caption := 'Close';
end;

procedure TFrmSendRecvDlg.PopProtState;
begin
  // do not delete this!
  lblCharVal.Caption :=
    intToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiCharDelay));
  lblLnVal.Caption := intToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiLineDelay));

  case ord(FrmMain.ApdProtocol1.AsciiCRTranslation) of
    0:
      Translate := 'none';
    1:
      Translate := 'strip';
    2:
      Translate := 'add CR';
    3:
      Translate := 'add LF';
  end;
  lblCrTranVal.Caption := Translate;

  case ord(FrmMain.ApdProtocol1.AsciiLFTranslation) of
    0:
      Translate := 'none';
    1:
      Translate := 'strip';
    2:
      Translate := 'add CR';
    3:
      Translate := 'add LF';
  end;
  lblLnTranVal.Caption := Translate;

  lblEOFVal.Caption :=
    intToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiEOFTimeout));
  lblPortCloseVal.Caption := intToStr(srcMain.PortCloseTime);

end;

end.
