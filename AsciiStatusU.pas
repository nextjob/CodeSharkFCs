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
unit AsciiStatusU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TAsciiStatusF = class(TForm)
    psPanel1: TPanel;
    psLabel1: TLabel;
    psLabel4: TLabel;
    psProtocol: TLabel;
    psFileSize: TLabel;
    psLabel13: TLabel;
    psBytesTransferred: TLabel;
    psLabel14: TLabel;
    psBytesRemaining: TLabel;
    psCancel: TButton;
    psPanel5: TPanel;
    psLabel22: TLabel;
    psStatusMsg: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    psState: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    spTimoutPanel: TPanel;
    Label4: TLabel;
    spTimeOutSeconds: TLabel;
    Label1: TLabel;
    psFileName: TEdit;
    procedure psCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AsciiStatusF: TAsciiStatusF;

implementation

uses
  srcMain;

{$R *.dfm}

procedure TAsciiStatusF.psCancelClick(Sender: TObject);
begin
  FrmMain.ApdProtocol1.CancelProtocol;
end;

end.
