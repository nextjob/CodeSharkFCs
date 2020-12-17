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

  This module is based on  ADXPORT.PAS part of TurboPower Async Professional
  The Initial Developer of the Original Code is TurboPower Software
  Async Professional is subject to the Mozilla Public License Version 1.1  http://www.mozilla.org/MPL/
  Async Professional source can be found at https://github.com/TurboPack/AsyncPro

}
unit cmset;

//
// based on  ADXPORT.PAS  TurboPower Software
interface

uses
  WinTypes,
  WinProcs,
  SysUtils,
  Messages,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  AdPort,
  AdTapi,
  AdTSel;

type
  TComPortOptions = class(TForm)
    FlowControlBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DTRRTS: TCheckBox;
    RTSCTS: TCheckBox;
    SoftwareXmit: TCheckBox;
    SoftwareRcv: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Bauds: TRadioGroup;
    Paritys: TRadioGroup;
    Databits: TRadioGroup;
    Stopbits: TRadioGroup;
    Comports: TGroupBox;
    OK: TButton;
    Cancel: TButton;
    PortComboBox: TComboBox;
    procedure OKClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ComPortOptions: TComPortOptions;

implementation

{$R *.DFM}

uses srcMain;

const
  BaudValues: array [0 .. 9] of Word = (30, 60, 120, 240, 480, 960, 1920, 3840,
    5760, 11520);

procedure TComPortOptions.OKClick(Sender: TObject);
var
  HWOpts: THWFlowOptionSet;
  SWOpts: TSWFlowOptions;
  Temp: Integer;
  Code: Integer;
  DeviceName: string;
  DeviceNumber: Integer;

begin
  // from manual page 55 create configures and opens com port
  // ApdComPort := TApdComPort.Create(Self);
  // ApdComPort.ComNumber := 1; {use Com1}
  // ApdComPort.Baud := 9600;
  // ApdComPort.Parity := pNone;
  // ApdComPort.DataBits := 8;
  // ApdComPort.StopBits := 1;
  // ApdComPort.Open := True;

  { Update ComPort from dialog controls }
  DeviceName := PortComboBox.Items[PortComboBox.ItemIndex];
  if length(DeviceName) = 0 then
    ShowMessage('No Com Port Selected!')

  else
  begin
    DeviceNumber := StrToInt(Copy(DeviceName, length(DirectTo) + 1,
      length(DeviceName)));

    if Pos(DirectTo, DeviceName) > 0 then
    begin
      If FrmMain.ApdComPort1.Open then
        FrmMain.ApdComPort1.Open := FALSE;
      FrmMain.ApdComPort1.TapiMode := tmOff;
      FrmMain.ApdComPort1.ComNumber := DeviceNumber;
    end;

    FrmMain.ApdComPort1.Baud := LongInt(BaudValues[Bauds.ItemIndex]) * 10;
    FrmMain.ApdComPort1.Parity := TParity(Paritys.ItemIndex);
    FrmMain.ApdComPort1.Databits := 8 - Databits.ItemIndex;
    FrmMain.ApdComPort1.Stopbits := Succ(Stopbits.ItemIndex);
    { Update HW flow }
    HWOpts := [];
    if DTRRTS.Checked then
      HWOpts := [hwfUseDTR, hwfRequireDSR];
    if RTSCTS.Checked then
    begin
      Include(HWOpts, hwfUseRTS);
      Include(HWOpts, hwfRequireCTS);
    end;
    FrmMain.ApdComPort1.HWFlowOptions := HWOpts;

    { Update SW flow }
    if SoftwareXmit.Checked then
      if SoftwareRcv.Checked then
        SWOpts := swfBoth
      else
        SWOpts := swfTransmit
    else if SoftwareRcv.Checked then
      SWOpts := swfReceive
    else
      SWOpts := swfNone;
    FrmMain.ApdComPort1.SWFlowOptions := SWOpts;

    Val(Edit1.Text, Temp, Code);
    if Code = 0 then
      FrmMain.ApdComPort1.XOnChar := AnsiChar(Temp);
    Val(Edit2.Text, Temp, Code);
    if Code = 0 then
      FrmMain.ApdComPort1.XOffChar := AnsiChar(Temp);

    ModalResult := mrOK;
  end;
end;

procedure TComPortOptions.CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TComPortOptions.FormShow(Sender: TObject);
Var
  I: Word;
  CheckBaud: Word;
  E: TDeviceSelectionForm;
begin
  { Gather all  ports }
  E := TDeviceSelectionForm.Create(Self);
  try
    E.ShowTapiDevices := FALSE;
    E.ShowPorts := True; { !!.50 }
    E.EnumAllPorts; { !!.50 }
    PortComboBox.Items := E.PortItemList;
  finally;
    E.Free;
  end;
  // Highlite the active com port
  with PortComboBox do
    if FrmMain.ApdComPort1 <> Nil then
    begin
      ItemIndex := Items.IndexOf
        (DirectTo + IntToStr(FrmMain.ApdComPort1.ComNumber));
    end;
  // Set Baud
  Bauds.ItemIndex := 6;
  CheckBaud := FrmMain.ApdComPort1.Baud div 10;
  for I := 0 to 9 do
    if CheckBaud = BaudValues[I] then
    begin
      Bauds.ItemIndex := I;
      break;
    end;
  Paritys.ItemIndex := Ord(FrmMain.ApdComPort1.Parity);
  Databits.ItemIndex := 8 - FrmMain.ApdComPort1.Databits;
  Stopbits.ItemIndex := Pred(FrmMain.ApdComPort1.Stopbits);

  { Hardware flow }
  DTRRTS.Checked := hwfUseDTR in FrmMain.ApdComPort1.HWFlowOptions;
  RTSCTS.Checked := hwfUseRTS in FrmMain.ApdComPort1.HWFlowOptions;

  { Software flow }
  SoftwareXmit.Checked := (FrmMain.ApdComPort1.SWFlowOptions = swfBoth) or
    (FrmMain.ApdComPort1.SWFlowOptions = swfTransmit);
  SoftwareRcv.Checked := (FrmMain.ApdComPort1.SWFlowOptions = swfBoth) or
    (FrmMain.ApdComPort1.SWFlowOptions = swfReceive);
  Edit1.Text := IntToStr(Ord(FrmMain.ApdComPort1.XOnChar));
  Edit2.Text := IntToStr(Ord(FrmMain.ApdComPort1.XOffChar));

end;

end.
