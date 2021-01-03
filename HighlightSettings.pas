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

unit HighlightSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ovccmbx, ovcclrcb;

type
  TFrmHighlighter = class(TForm)
    GcEdt1: TEdit;
    GcEdt2: TEdit;
    GcEdt3: TEdit;
    GcEdt4: TEdit;
    GcEdt5: TEdit;
    GcColorCBB1: TOvcColorComboBox;
    GcColorCBB2: TOvcColorComboBox;
    GcColorCBB3: TOvcColorComboBox;
    GcColorCBB4: TOvcColorComboBox;
    GcColorCBB5: TOvcColorComboBox;
    btnCancel: TButton;
    btnApply: TButton;
    GcEdt6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GcEdt7: TEdit;
    GcEdt8: TEdit;
    GcEdt9: TEdit;
    GcEdt10: TEdit;
    GcColorCBB6: TOvcColorComboBox;
    GcColorCBB7: TOvcColorComboBox;
    GcColorCBB8: TOvcColorComboBox;
    GcColorCBB9: TOvcColorComboBox;
    GcColorCBB10: TOvcColorComboBox;
    Label3: TLabel;
    Label4: TLabel;
    GcHighlightCB: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHighlighter: TFrmHighlighter;

implementation

{$R *.dfm}

Uses srcMain;

procedure TFrmHighlighter.btnApplyClick(Sender: TObject);
begin
 // save highlighter settings and refresh?
 srcMain.GcHLColors[1] := GcColorCBB1.SelectedColor;
 srcMain.GcHLColors[2] := GcColorCBB2.SelectedColor;
 srcMain.GcHLColors[3] := GcColorCBB3.SelectedColor;
 srcMain.GcHLColors[4] := GcColorCBB4.SelectedColor;
 srcMain.GcHLColors[5] := GcColorCBB5.SelectedColor;
 srcMain.GcHLColors[6] := GcColorCBB6.SelectedColor;
 srcMain.GcHLColors[7] := GcColorCBB7.SelectedColor;
 srcMain.GcHLColors[8] := GcColorCBB8.SelectedColor;
 srcMain.GcHLColors[9] := GcColorCBB9.SelectedColor;
 srcMain.GcHLColors[10] := GcColorCBB10.SelectedColor;
 //
 srcMain.GcHLStrings[1] := Trim(GcEdt1.Text);
 srcMain.GcHLStrings[2] := Trim(GcEdt2.Text);
 srcMain.GcHLStrings[3] := Trim(GcEdt3.Text);
 srcMain.GcHLStrings[4] := Trim(GcEdt4.Text);
 srcMain.GcHLStrings[5] := Trim(GcEdt5.Text);
 srcMain.GcHLStrings[6] := Trim(GcEdt6.Text);
 srcMain.GcHLStrings[7] := Trim(GcEdt7.Text);
 srcMain.GcHLStrings[8] := Trim(GcEdt8.Text);
 srcMain.GcHLStrings[9] := Trim(GcEdt9.Text);
 srcMain.GcHLStrings[10] := Trim(GcEdt10.Text);
 FrmMain.SynEdit.Refresh;
// btnCancelClick(self);
end;

procedure TFrmHighlighter.btnCancelClick(Sender: TObject);
begin
  self.hide;
end;

procedure TFrmHighlighter.FormActivate(Sender: TObject);
begin
 GcColorCBB1.SelectedColor:=  srcMain.GcHLColors[1];
 GcColorCBB2.SelectedColor:=  srcMain.GcHLColors[2];
 GcColorCBB3.SelectedColor:=  srcMain.GcHLColors[3];
 GcColorCBB4.SelectedColor:=  srcMain.GcHLColors[4];
 GcColorCBB5.SelectedColor:=  srcMain.GcHLColors[5];
 GcColorCBB6.SelectedColor:=  srcMain.GcHLColors[6];
 GcColorCBB7.SelectedColor:=  srcMain.GcHLColors[7];
 GcColorCBB8.SelectedColor:=  srcMain.GcHLColors[8];
 GcColorCBB9.SelectedColor:=  srcMain.GcHLColors[9];
 GcColorCBB10.SelectedColor:=  srcMain.GcHLColors[10];
 //
 GcEdt1.Text := srcMain.GcHLStrings[1];
 GcEdt2.Text := srcMain.GcHLStrings[2];
 GcEdt3.Text := srcMain.GcHLStrings[3];
 GcEdt4.Text := srcMain.GcHLStrings[4];
 GcEdt5.Text := srcMain.GcHLStrings[5];
 GcEdt6.Text := srcMain.GcHLStrings[6];
 GcEdt7.Text := srcMain.GcHLStrings[7];
 GcEdt8.Text := srcMain.GcHLStrings[8];
 GcEdt9.Text := srcMain.GcHLStrings[9];
 GcEdt10.Text := srcMain.GcHLStrings[10];
end;

end.
