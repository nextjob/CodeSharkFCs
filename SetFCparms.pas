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
unit SetFCparms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.IOUtils, System.IniFiles, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FileCtrl,
  PythonEngine,
  Vcl.ComCtrls;

type
  TSetFCparmsFrm = class(TForm)
    PythonHome: TLabeledEdit;
    FreeCadMod: TLabeledEdit;
    cbCustStart: TCheckBox;
    cbCustPanel: TCheckBox;
    cbCustSelectObs: TCheckBox;
    cbCustWindowAction: TCheckBox;
    cbOverWriteScript: TCheckBox;
    cbFreeCADWarnDisable: TCheckBox;
    Label1: TLabel;
    PyDllName: TLabeledEdit;
    cbPyVersions: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure PythonHomeClick(Sender: TObject);
    procedure FreeCadModClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbPyVersionsSelect(Sender: TObject);

  private
    { Private declarations }
  public
    procedure LoadIni;
    procedure SaveIni;
  end;

var
  SetFCparmsFrm: TSetFCparmsFrm;
  PyRegVersion: string;

implementation

{$R *.dfm}

uses srcMain, SetTool, Freecad;

Const
  // ini file section names
  PathSection = 'Paths';
  ScriptsSection = 'Scripts';
  WarningsSection = 'Warnings';

procedure TSetFCparmsFrm.cbPyVersionsSelect(Sender: TObject);
begin
  // cbPyVersions.ItemIndex index to selected python verstion
  PyDllName.Text := PYTHON_KNOWN_VERSIONS[cbPyVersions.ItemIndex + 1].DllName;
  PyRegVersion := PYTHON_KNOWN_VERSIONS[cbPyVersions.ItemIndex + 1].RegVersion;
end;

procedure TSetFCparmsFrm.FormClose(Sender: TObject; var Action: TCloseAction);
Begin
  SaveIni;
end;

procedure TSetFCparmsFrm.FormCreate(Sender: TObject);
var
  PyEngineVersion: TPythonVersionProp;
  // create a dropdown list of python versions currently defined in Pythom4delphi engine

begin
  for PyEngineVersion in PYTHON_KNOWN_VERSIONS do
    cbPyVersions.Items.Add(PyEngineVersion.DllName);
end;

procedure TSetFCparmsFrm.FormShow(Sender: TObject);

begin
  LoadIni;
end;

procedure TSetFCparmsFrm.LoadIni;

var
  Inif: TCustomIniFile;

begin

  // read in the ini file
  Try
    Inif := TMemIniFile.Create(FrmMain.AppDataPath + PathDelim + srcMain.IniFileName);
    PythonHome.Text := Inif.ReadString(PathSection, 'PythonHome', '');
    // PyDllPath.Text := Inif.ReadString(PathSection, 'PythonDllPath', '');
    PyDllName.Text := Inif.ReadString(PathSection, 'PythonDllName', '');
    PyRegVersion := Inif.ReadString(PathSection, 'RegVersion', '');
    //
    // FreeCadBin.Text := Inif.ReadString(PathSection, 'FreeCadBin', '');
    FreeCadMod.Text := Inif.ReadString(PathSection, 'FreeCadMod', '');

    cbCustStart.Checked := Inif.ReadBool(ScriptsSection, 'Custom_Start_Script',
      cbCustStart.Checked);
    cbCustPanel.Checked := Inif.ReadBool(ScriptsSection,
      'Custom_View_Panel_Script', cbCustPanel.Checked);
    cbCustSelectObs.Checked := Inif.ReadBool(ScriptsSection,
      'Custom_Selection_Observer_Script', cbCustSelectObs.Checked);
    cbCustWindowAction.Checked := Inif.ReadBool(ScriptsSection,
      'Custom_Window_Actions_Script', cbCustWindowAction.Checked);
    cbOverWriteScript.Checked := Inif.ReadBool(ScriptsSection,
      'Overwrite_Custom_Scripts', cbOverWriteScript.Checked);

    cbFreeCADWarnDisable.Checked := Inif.ReadBool(WarningsSection,
      'Disable_FreeCAD_Window_Warning', cbFreeCADWarnDisable.Checked);
    ExtraDebugging := Inif.ReadBool(WarningsSection, 'ExtraDebugging', False);
    FormatForPathDisplay := Inif.ReadBool(WarningsSection,
      'FormatForPathDisplay', False);

  Finally
    Inif.Free;
  End;

end;

procedure TSetFCparmsFrm.SaveIni;

var
  Inif: TCustomIniFile;

begin
  Try
    Inif := TMemIniFile.Create(FrmMain.AppDataPath + PathDelim + srcMain.IniFileName);

    if (Length(PythonHome.Text) > 0) and (TDirectory.Exists(PythonHome.Text))
    then
      Inif.WriteString(PathSection, 'PythonHome', PythonHome.Text)
    else
      showMessage('Python Home not set, ' + PythonHome.Text + ' not found');

    { if (Length(PyDllPath.Text) > 0) and (TDirectory.Exists(PyDllPath.Text)) then
      Inif.WriteString(PathSection, 'PythonDllPath', PyDllPath.Text)
      else
      showMessage('Python Dll Path not set, ' + PyDllPath.Text + ' not found');
    }
    if (Length(PyDllName.Text) > 0) and
      (FileExists(PythonHome.Text + PathDelim + PyDllName.Text)) then
      Inif.WriteString(PathSection, 'PythonDllName', PyDllName.Text)
    else
      showMessage('Python Dll Name not set, ' + PythonHome.Text + PathDelim +
        PyDllName.Text + ' not found');

    if (Length(PyRegVersion) > 0) then
      Inif.WriteString(PathSection, 'RegVersion', PyRegVersion)
    else
      showMessage('Python Registered Version not set');
    {
      if (Length(FreeCadBin.Text) > 0) and (TDirectory.Exists(FreeCadBin.Text))
      then
      Inif.WriteString(PathSection, 'FreeCadBin', FreeCadBin.Text)
      else
      showMessage('FreeCad Bin Directory Path not set, ' + FreeCadBin.Text +
      ' not found');

    }
    if (Length(FreeCadMod.Text) > 0) and (TDirectory.Exists(FreeCadMod.Text))
    then
      Inif.WriteString(PathSection, 'FreeCadMod', FreeCadMod.Text)
    else
      showMessage('FreeCad Mod Directory Path not set, ' + FreeCadMod.Text +
        ' not found');

    Inif.WriteBool(ScriptsSection, 'Custom_Start_Script', cbCustStart.Checked);
    Inif.WriteBool(ScriptsSection, 'Custom_View_Panel_Script',
      cbCustPanel.Checked);
    Inif.WriteBool(ScriptsSection, 'Custom_Selection_Observer_Script',
      cbCustSelectObs.Checked);
    Inif.WriteBool(ScriptsSection, 'Custom_Window_Actions_Script',
      cbCustWindowAction.Checked);
    Inif.WriteBool(ScriptsSection, 'Overwrite_Custom_Scripts',
      cbOverWriteScript.Checked);

    Inif.WriteBool(WarningsSection, 'Disable_FreeCAD_Window_Warning',
      cbFreeCADWarnDisable.Checked);
    Inif.WriteBool(WarningsSection, 'ExtraDebugging', ExtraDebugging);
    Inif.WriteBool(WarningsSection, 'FormatForPathDisplay',
      FormatForPathDisplay);

  Finally
    Inif.UpdateFile;
    Inif.Free;
  End;

end;

{ procedure TSetFCparmsFrm.FreeCadBinChange(Sender: TObject);
  var
  RDir: string;
  ADir: TArray<string>;
  begin
  if Length(FreeCadBin.Text) <> 0 then
  RDir := FreeCadBin.Text
  else
  RDir := 'C:\';

  if FileCtrl.SelectDirectory(RDir, ADir, [],
  'Select FreeCad Bin Directory', 'FreeCad Bin Directory (typically: ..\FreeCad\bin)')
  then
  FreeCadBin.Text := ADir[0];
  end;
}

procedure TSetFCparmsFrm.FreeCadModClick(Sender: TObject);
var
  RDir: string;
  ADir: TArray<string>;
begin
  if Length(FreeCadMod.Text) <> 0 then
    RDir := FreeCadMod.Text
  else
    RDir := 'C:\';

  if FileCtrl.SelectDirectory(RDir, ADir, [], 'Select FreeCad Mod Directory',
    'FreeCad Mod Directory (typically: ..\FreeCad\Mod)') then
    FreeCadMod.Text := ADir[0];
end;

{ procedure TSetFCparmsFrm.PyDllPathClick(Sender: TObject);
  var
  RDir: string;
  ADir: TArray<string>;
  begin
  if Length(PyDllPath.Text) <> 0 then
  RDir := PyDllPath.Text
  else
  RDir := 'C:\';

  if FileCtrl.SelectDirectory(RDir, ADir, [],
  'Select Python Dll Path ', 'Python Dll Path (typically: ..\FreeCad\bin)') then
  PyDllPath.Text := ADir[0];
  end; }

procedure TSetFCparmsFrm.PythonHomeClick(Sender: TObject);
var
  RDir: string;
  ADir: TArray<string>;
begin
  if Length(PythonHome.Text) <> 0 then
    RDir := PythonHome.Text
  else
    RDir := 'C:\';

  if FileCtrl.SelectDirectory(RDir, ADir, [], 'Select PythonHome Path ',
    'PythonHome Path (typically: ..\FreeCad\bin)') then
    PythonHome.Text := ADir[0];
end;

end.
