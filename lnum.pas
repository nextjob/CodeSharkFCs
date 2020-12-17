unit lnum;
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
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin;

type
  TFrmLN = class(TForm)
    GroupBox1: TGroupBox;
    RBIns: TRadioButton;
    RBRmv: TRadioButton;
    GBoxOps: TGroupBox;
    SEditStart: TSpinEdit;
    SEditInc: TSpinEdit;
    CBoxLead: TCheckBox;
    CBoxAdd: TCheckBox;
    ButOk: TButton;
    ButCancl: TButton;
    lblstrt: TLabel;
    lblinc: TLabel;
    procedure RBRmvClick(Sender: TObject);
    procedure RBInsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButOkClick(Sender: TObject);
    procedure ButCanclClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLN: TFrmLN;

implementation

{$R *.DFM}


procedure TFrmLN.RBRmvClick(Sender: TObject);
begin
 if RBRmv.Checked =true then GBoxOps.Visible:=false;
end;

procedure TFrmLN.RBInsClick(Sender: TObject);
begin
  if RBIns.Checked =true then GBoxOps.Visible:=true;
end;

procedure TFrmLN.FormActivate(Sender: TObject);
begin
 if (RBIns.Checked=false) and (RBRmv.Checked=false) then RBIns.Checked:=true; 
end;

procedure TFrmLN.ButOkClick(Sender: TObject);
begin
 self.hide;
 
end;

procedure TFrmLN.ButCanclClick(Sender: TObject);
begin
 self.hide;
end;

end.
