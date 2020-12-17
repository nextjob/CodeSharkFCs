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
