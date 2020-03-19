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

unit PortClsTime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmPortClsTm = class(TForm)
    Label1: TLabel;
    SecToClsLBL: TLabel;
    StopTimerBtn: TButton;
    procedure StopTimerBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPortClsTm: TFrmPortClsTm;

implementation

uses srcMain;

{$R *.dfm}

procedure TFrmPortClsTm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  srcMain.PortCloseTimeRemaining := 0;
end;

procedure TFrmPortClsTm.StopTimerBtnClick(Sender: TObject);
begin
  srcMain.PortCloseTimeRemaining := 0;
end;

end.
