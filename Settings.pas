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
unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmSettings = class(TForm)
    FileExtLBX: TListBox;
    Label1: TLabel;
    procedure FileExtLBXClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSettings: TFrmSettings;

implementation

Uses
  srcMain;

{$R *.dfm}

procedure TFrmSettings.FileExtLBXClick(Sender: TObject);
begin
  case FileExtLBX.ItemIndex of
    0:
      FrmMain.DefaultFileExtension := 'G';
    1:
      FrmMain.DefaultFileExtension := 'T';
    2:
      FrmMain.DefaultFileExtension := 'TXT';
    3:
      FrmMain.DefaultFileExtension := 'NC';
    4:
      FrmMain.DefaultFileExtension := 'PRO';
    5:
      FrmMain.DefaultFileExtension := '';
  end;
  FrmMain.SetDefaultFileExtension;
end;

procedure TFrmSettings.FormActivate(Sender: TObject);
begin
  // set the file extension index based on default file extension

  If FrmMain.DefaultFileExtension = 'G' Then
    FrmSettings.FileExtLBX.ItemIndex := 0
  Else If FrmMain.DefaultFileExtension = 'T' Then
    FrmSettings.FileExtLBX.ItemIndex := 1
  Else If FrmMain.DefaultFileExtension = 'TXT' Then
    FrmSettings.FileExtLBX.ItemIndex := 2
  Else If FrmMain.DefaultFileExtension = 'NC' Then
    FrmSettings.FileExtLBX.ItemIndex := 3
  Else If FrmMain.DefaultFileExtension = 'PRO' Then
    FrmSettings.FileExtLBX.ItemIndex := 4
  Else
    FrmSettings.FileExtLBX.ItemIndex := 5;
end;

End.
