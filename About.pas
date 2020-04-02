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
unit about;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Dialogs,
  Buttons, ExtCtrls, shellapi;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    OKButton: TButton;
    ScrollBox1: TScrollBox;
    Aboutlbl: TLabel;
    Labelurl: TLabel;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
//    procedure LabelurlClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure LabelurlClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;
  AppDir : String;

implementation

{$R *.DFM}

uses srcMain;

procedure TAboutBox.FormActivate(Sender: TObject);
begin
  Aboutlbl.caption := 'This source is free software; ' + char(10) +
    'you can redistribute it and /or modify it under' + char(10) +
    'the terms of the GNU General Public License as published by the Free' +
    char(10) +
    'Software Foundation; either version 2 of the License, or (at your option) '
    + char(10) + 'any later version. ' + char(10) + char(10) +
    'This code is distributed in the hope that it will be useful, but WITHOUT ANY'
    + char(10) +
    'WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS'
    + char(10) +
    'FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more ' +
    char(10) + 'details. ' + char(10) + char(10) +
    'A copy of the GNU General Public License is available on the World Wide Web'
    + char(10) +
    'at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing'
    + char(10) +
    'to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,Boston, MA 02110 USA'
    + char(10) + char(10) +
    'This Program Is Built With and or utilizes the following modules / code' +
    char(10) + char(10) +
    ' SynEdit, Source Code Can Be Found At:   https://github.com/pyscripter/SynEdit-2'
    + char(10) +
    ' SynEdit SearchReplaceDemo project, written by  Michael Hieke for the SynEdit '
    + char(10) +
    '   component suite. Source Code Can Be Found At: http://SynEdit.SourceForge.net'
    + char(10) + char(10) +
    ' TurboPower Async Professional, Source Code Can Be Found At: ' + char(10) +
    '   https://github.com/TurboPack/AsyncPro' + char(10) + char(10) +
    ' Python4delphi, Source Code Can Be Found At: ' + char(10) +
    '   https://github.com/pyscripter/python4delphi' + char(10) + char(10) +
    ' PathKurveUtils.py, Copyright (c) 2015 Dan Falck <ddfalck@gmail.com> ' +
    char(10) + '   https://github.com/FreeCAD/FreeCAD';

end;

{procedure TAboutBox.LabelurlClick(Sender: TObject);
begin
  ShellExecute(Self.Handle, nil, PChar(Labelurl.caption), nil, nil, SW_SHOW);
end; }

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  if Not(LicenseRead) then
    // if we have no record of the license being agreed to, ask
    iF MessageDlg('Do You Agree With The Terms Of The License?', mtConfirmation,
      [mbYes, mbNo], 0, mbYes) = mrYes then
      LicenseRead := True;
end;

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not(LicenseRead) then
    // if we have no record of the license being agreed to, ask
    iF MessageDlg('Do You Agree With The Terms Of The License?', mtConfirmation,
      [mbYes, mbNo], 0, mbYes) = mrYes then
      LicenseRead := True;
end;

procedure TAboutBox.FormShow(Sender: TObject);
begin
  Self.caption := 'About';
  ProductName.caption := 'Product Name : CodeSharkFCs';
  Version.caption := 'Version: ' + CurVersion;
  AppDir := ExtractFilePath(Application.ExeName);
  Labelurl.caption := AppDir + 'Doc\CodeSharkFC.html';
 end;

procedure TAboutBox.LabelurlClick(Sender: TObject);
begin
  if FileExists(Labelurl.caption) then
    ShellExecute(Self.Handle, nil, PChar(Labelurl.caption), nil, nil, SW_SHOW)
  else
    ShowMessage('Doc Directory not found, download from https://github.com/nextjob/CodeSharkFCs');
end;

end.
