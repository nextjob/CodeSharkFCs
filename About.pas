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
  Aboutlbl.caption := 'This is free and unencumbered software released into the public domain. ' + char(10) +
' Anyone is free to copy, modify, publish, use, compile, sell, or  '  + char(10) +
'distribute this software, either in source code form or as a compiled '   + char(10) +
'binary, for any purpose, commercial or non-commercial, and by any '   + char(10) +
'means. '   + char(10) +
'  '    + char(10) +
'In jurisdictions that recognize copyright laws, the author or authors '   + char(10) +
'of this software dedicate any and all copyright interest in the'     + char(10) +
'software to the public domain. We make this dedication for the benefit '  + char(10) +
'of the public at large and to the detriment of our heirs and '  + char(10) +
'successors. We intend this dedication to be an overt act of '   + char(10) +
'relinquishment in perpetuity of all present and future rights to this '  + char(10) +
'software under copyright law.'  + char(10) +
' '  + char(10) +
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,'   + char(10) +
'EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF'   + char(10) +
'MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.'  + char(10) +
'IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR'   + char(10) +
'OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,'  + char(10) +
'ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE '   + char(10) +
'OR OTHER DEALINGS IN THE SOFTWARE.'  + char(10) +
' '   + char(10) +
'For more information, please refer to <http://unlicense.org/> '
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
