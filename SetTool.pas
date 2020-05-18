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
unit SetTool;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSetToolFRM = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    rbCW: TRadioButton;
    rbCCW: TRadioButton;
    Panel3: TPanel;
    StartZEdt: TLabeledEdit;
    StartYEdt: TLabeledEdit;
    StartXEdt: TLabeledEdit;
    Panel4: TPanel;
    RadiusEdt: TLabeledEdit;
    VertFeedEdt: TLabeledEdit;
    HorzFeedEdt: TLabeledEdit;
    OffsetExtraEdt: TLabeledEdit;
    RapidSafeSpaceEdt: TLabeledEdit;
    ClearanceEdt: TLabeledEdit;
    StartDepthEdt: TLabeledEdit;
    StepdownEdt: TLabeledEdit;
    FinalDepthEdt: TLabeledEdit;
    Panel2: TPanel;
    rbOnLine: TRadioButton;
    rbRightofLine: TRadioButton;
    rbLeftofLine: TRadioButton;
    procedure GenericEditExit(Sender: TObject);
    procedure GenericEditExitP(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetToolFRM: TSetToolFRM;

implementation

{$R *.dfm}

procedure TSetToolFRM.GenericEditExit(Sender: TObject);
Var
Value : Double;
begin
  with Sender as TLabeledEdit do
  begin
    if Not(TryStrToFloat(Text, Value)) then
    Begin
      ShowMessage('Value Entered for ' + EditLabel.Caption + ': ' + Text + ' Is Invalid, Retry');
      Setfocus;
    End;
  end;
end;

procedure TSetToolFRM.GenericEditExitP(Sender: TObject);
Var
Value : Double;
begin
  with Sender as TLabeledEdit do
  begin
    if Not(TryStrToFloat(Text, Value)) then
      Begin
        ShowMessage('Value Entered for ' + EditLabel.Caption + ': ' + Text + ' Is Invalid, Retry');
        Setfocus;
      End
    Else
      if Value < 0  then
      Begin
        ShowMessage('Value Entered for ' + EditLabel.Caption + ': ' + Text + ' Cannot Be Negative, Retry');
        Setfocus;
      End
  end;
end;


end.
