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
  
   This module is based on  ADXPROT.PAS part of TurboPower Async Professional
   The Initial Developer of the Original Code is TurboPower Software 
   Async Professional is subject to the Mozilla Public License Version 1.1  http://www.mozilla.org/MPL/
   Async Professional source can be found at https://github.com/TurboPack/AsyncPro
  
}
{ Global defines potentially affecting this unit }
{$I AWDEFINE.INC}
{ Options required for this unit }
{$G+,X+,F+}
unit ptops;

interface

uses
  SysUtils,
  WinTypes,
  WinProcs,
  Messages,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Oomisc,
  AdProtcl;

type
  TProtocolOptions = class(TForm)
    GeneralOptions: TGroupBox;
    gWriteFail: TComboBox;
    Label1: TLabel;
    gHonorDirectory: TCheckBox;
    gIncludeDirectory: TCheckBox;
    gRTSLowForWrite: TCheckBox;
    gAbortNoCarrier: TCheckBox;
    ZmodemOptions: TGroupBox;
    zOptionOverride: TCheckBox;
    zSkipNoFile: TCheckBox;
    zRecover: TCheckBox;
    z8K: TCheckBox;
    zFileManagment: TComboBox;
    Label2: TLabel;
    OK: TButton;
    Cancel: TButton;
    KermitOptions: TGroupBox;
    AsciiOptions: TGroupBox;
    Label3: TLabel;
    kBlockLen: TEdit;
    Label5: TLabel;
    kWindows: TEdit;
    Label6: TLabel;
    kTimeout: TEdit;
    Label7: TLabel;
    sInterCharDelay: TEdit;
    Label8: TLabel;
    sInterLineDelay: TEdit;
    sCRTrans: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    sLFTrans: TComboBox;
    Label11: TLabel;
    sEOFTimeout: TEdit;
    Label4: TLabel;
    sPortclosetimeout: TEdit;
    procedure CancelClick(Sender: TObject);
    procedure OKClick(Sender: TObject);

  private
    FProtocol: TApdProtocol;
    Executed: Boolean;

  protected
    function GetProtocol: TApdProtocol;
    procedure SetProtocol(NewProtocol: TApdProtocol);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;

    property Protocol: TApdProtocol read GetProtocol write SetProtocol;
  end;

var
  ProtocolOptions: TProtocolOptions;

implementation

uses srcMain;

{$R *.DFM}

function Str2Int(const S: String): Integer;
var
  Code: Integer;
begin
  Val(S, Result, Code);
  if Code <> 0 then
    Result := 0;
end;

constructor TProtocolOptions.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProtocol := TApdProtocol.Create(Self);
  Executed := False;
end;

destructor TProtocolOptions.Destroy;
begin
  FProtocol.Free;
  inherited Destroy;
end;

function TProtocolOptions.Execute: Boolean;
begin
  { Update dialog controls, general... }
  { gHonorDirectory.Checked := FProtocol.HonorDirectory;
    gIncludeDirectory.Checked := FProtocol.IncludeDirectory;
    gRTSLowForWrite.Checked := FProtocol.RTSLowForWrite;
    gAbortNoCarrier.Checked := FProtocol.AbortNoCarrier;
    gWriteFail.ItemIndex := Ord(FProtocol.WriteFailAction); }

  { Zmodem... }
  { zOptionOverride.Checked := FProtocol.ZmodemOptionOverride;
    zSkipNoFile.Checked := FProtocol.ZmodemSkipNoFile;
    zRecover.Checked := FProtocol.ZmodemRecover;
    z8K.Checked := FProtocol.Zmodem8K;
    zFileManagment.ItemIndex := Ord(FProtocol.ZmodemFileOption); }

  { Kermit... }
  { kBlockLen.Text := IntToStr(FProtocol.KermitMaxLen);
    kWindows.Text := IntToStr(FProtocol.KermitMaxWindows);
    kTimeout.Text := IntToStr(FProtocol.KermitTimeoutSecs); }

  { ASCII... }
  // sInterCharDelay.Text := IntToStr(FProtocol.AsciiCharDelay);
  // sInterLineDelay.Text := IntToStr(FProtocol.AsciiLineDelay);
  // sCRTrans.ItemIndex := Ord(FProtocol.AsciiCRTranslation);
  // sLFTrans.ItemIndex := Ord(FProtocol.AsciiLFTranslation);
  // sEOFTimeout.Text := IntToStr(FProtocol.AsciiEOFTimeout);
  // mab
  // sInterCharDelay.Text := IntToStr(FrmMain.ApdProtocol1.AsciiCharDelay);
  sInterCharDelay.Text :=
    IntToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiCharDelay));
  // sInterLineDelay.Text := IntToStr(FrmMain.ApdProtocol1.AsciiLineDelay);
  sInterLineDelay.Text :=
    IntToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiLineDelay));
  sCRTrans.ItemIndex := Ord(FrmMain.ApdProtocol1.AsciiCRTranslation);
  sLFTrans.ItemIndex := Ord(FrmMain.ApdProtocol1.AsciiLFTranslation);

  // sEOFTimeout.Text :=IntToStr(FrmMain.ApdProtocol1.AsciiEOFTimeout);
  sEOFTimeout.Text :=
    IntToStr(Ticks2Secs(FrmMain.ApdProtocol1.AsciiEOFTimeout));

  // sPortclosetimeout.Text :=IntToStr(FrmMain.PortCloseTimer.Interval);

  sPortclosetimeout.Text := Floattostr(FrmMain.PortCloseTimer.Interval / 1000);
  { Execute }
  ShowModal;
  Result := ModalResult = mrOK;
  Executed := Result;
end;

function TProtocolOptions.GetProtocol: TApdProtocol;
begin
  if Executed then
  begin
    { Get values from dialog controls, general... }
    { FProtocol.HonorDirectory := gHonorDirectory.Checked;
      FProtocol.IncludeDirectory := gIncludeDirectory.Checked;
      FProtocol.RTSLowForWrite := gRTSLowForWrite.Checked;
      FProtocol.AbortNoCarrier := gAbortNoCarrier.Checked;
      FProtocol.WriteFailAction := TWriteFailAction(gWriteFail.ItemIndex); }

    { Zmodem... }
    { FProtocol.ZmodemOptionOverride := zOptionOverride.Checked;
      FProtocol.ZmodemSkipNoFile := zSkipNoFile.Checked;
      FProtocol.ZmodemRecover := zRecover.Checked;
      FProtocol.Zmodem8K := z8K.Checked;
      FProtocol.ZmodemFileOption := TZmodemFileOptions(zFileManagment.ItemIndex); }

    { Kermit... }
    { FProtocol.KermitMaxLen := Str2Int(kBlockLen.Text);
      FProtocol.KermitMaxWindows := Str2Int(kWindows.Text);
      FProtocol.KermitTimeoutSecs := Str2Int(kTimeout.Text); }

    { ASCII... }
    FProtocol.AsciiCharDelay := Secs2Ticks(Str2Int(sInterCharDelay.Text));
    FProtocol.AsciiLineDelay := Secs2Ticks(Str2Int(sInterLineDelay.Text));
    FProtocol.AsciiCRTranslation := TAsciiEOLTranslation(sCRTrans.ItemIndex);
    FProtocol.AsciiLFTranslation := TAsciiEOLTranslation(sLFTrans.ItemIndex);
    FProtocol.AsciiEOFTimeout := Str2Int(sEOFTimeout.Text) * 1000;
  end;
  Result := FProtocol;
end;

procedure TProtocolOptions.SetProtocol(NewProtocol: TApdProtocol);
begin
  if NewProtocol <> FProtocol then
    FProtocol.Assign(NewProtocol);
end;

procedure TProtocolOptions.CancelClick(Sender: TObject);
begin
  ModalResult := idCancel;
end;

procedure TProtocolOptions.OKClick(Sender: TObject);
begin
  FrmMain.ApdProtocol1.AsciiCharDelay :=
    Secs2Ticks(Str2Int(sInterCharDelay.Text));
  FrmMain.ApdProtocol1.AsciiLineDelay :=
    Secs2Ticks(Str2Int(sInterLineDelay.Text));
  FrmMain.ApdProtocol1.AsciiCRTranslation :=
    TAsciiEOLTranslation(sCRTrans.ItemIndex);
  FrmMain.ApdProtocol1.AsciiLFTranslation :=
    TAsciiEOLTranslation(sLFTrans.ItemIndex);
  FrmMain.ApdProtocol1.AsciiEOFTimeout := Secs2Ticks(Str2Int(sEOFTimeout.Text));
  FrmMain.PortCloseTimer.Interval := Str2Int(sPortclosetimeout.Text) * 1000;
  ModalResult := idOK;
end;

end.
