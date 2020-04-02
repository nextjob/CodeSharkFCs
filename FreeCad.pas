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

unit FreeCad;
{$IFDEF FPC} {$MODE Delphi} {$ENDIF}
// Getting Path from Shape from https://www.freecadweb.org/wiki/index.php?title=Path_scripting
// - use to replace PathKurveUtils?
// Assign the shape of wire Part to a normal Path object, using Path.fronShape() script function
// (or more powerful Path.fronShapes()). By giving as parameter a wire Part object,
// its path will be automatically calculated from the shape.
// Note that in this case the placement is automatically set to the first point of the wire,
// and the object is therefore not movable anymore by changing its placement.
// To move it, the underlying shape itself must be moved.
// path0 = Path.fromShapes(wire0, start=wire0.Vertexes[0].Point, preamble=False, verbose=False)
// will require creation of

// To Fix:
//
// The selection observer script is very simple.
// It assumes it is dealing with edges or points.
// At this time is does not work well with Faces.
// look at ..\FreeCadNotes\ListSelectedObjects.py on how to parse thru all components of an object
// (find the componentv via name? or label? then output its geometry?)
//
// Floating point division by zero when first run import (python 3.6)
// add MaskFPUExceptions(True);
// before loading the python library and before executing each script.
// see https://github.com/pyscripter/python4delphi/issues/69
//
// Py_Initialize raised exception class External: ?
// set PythonEngine1.SetPythonHome to PythonHome  in PythonEngine1BeforeLoad
//
// Error - could not load a Python engine
// FreeCAD does not ?always? load all the required Python files for python4delphi to interface properly.
// Installing python from python.org (currently version Python 3.6.6). Fixes this issue.
//
// Error - This application failed to start because it could not find or load the Qt platform plugin "windows"
// Problem with QT5 looking for ..\platforms\ in the directory of the executable (in this case CodeSharkFC.exe).
// You should be able to set environment variables to point to ..\FreeCAD19\bin\platforms but I have not had any luck with this.
// Work around is to copy contents of ..\FreeCAD19\bin\platforms to ..\CodeSharkFC\platforms

//
// Notes for developement:
//
// Selecting mulitple circles to return location to editor
// look at Shift+B creates selection box
// look up way to parse all selected elements
//
// for o in Gui.Selection.getSelectionEx():
// print o.ObjectName
// for s in o.SubElementNames:
// print "name: ",s
// for s in o.SubObjects:
// print "object: ",s
//
//
// the python wrappers into libarea are created via boost python.
// look in: \FreeCAD-0.xx\src\Mod\Path\libarea\PythonStuff
//
// we may need to clean up our selector script (way in which we determine if selection is point circle line etc...
// see use of geomType in  cleanedges()
// defined in \FreeCAD\Mod\Path\PathScripts\PathUtils
// This also shows how to convert  BSplines and Bezier to arcs add to pick geometry??
//
// procedure WrtArc(InData : TArray<String>);
// look at the our selector script and
// procedure WrtUser(Id : Integer; InData : TArray<String>);
// -- load and save params to ini file (SetFCparmsFrm.LoadIni  SetFCparmsFrm.SaveIni)
//
// FreeCAD interface via python4delphi
/// /  THIS IS IMPORTANT READ BELOW !!!!  //////
// P4D uses a define (DEFINE PYTHONxx) to build for a specific python version,
// we need to set and recompile based on what version of Python FreeCAD is bundled with
// current version is Python36 and PYTHON36 is defined in
// C:\...\python4delphi\PythonForDelphi\Components\Sources\Core\Definition.Inc
//
// If you are getting a message about not finding python36.dll  check the following:
//
// Did you set the default python version in:
// ..\python4delphi-master\PythonForDelphi\Components\Sources\Core\Definition.inc ?
//
// PythonEngine1 properties set correctly, especially:
// PyFlags -> pgIgnorEnvironmentFlag
// DLLName -> python36.dll
// UseLastKnownVersion -> False
//
// We also depend on the following values being defined in CodeSharkFC.ini
// [Paths]
// PythonHome=C:\FreeCad\bin
// FreeCadMod=C:\FreeCad\Mod
//
// Then set these values with
// PythonEngine1.SetPythonHome to PythonHome
// PythonEngine1.DllPath to PythonHome
//
// We want (need?) to have P4D use the python interpreter imbedded with FreeCad, to do this we need tell the pythonengine where to look.
// see PythonEngine1BeforeLoad
// PythonEngine1.DllPath := Trim(SetFCparmsFrm.PythonHome.Text);
// note: if we set at design time it does not seem to take.
//
// Steps taken to fire off FreeCAD
// Feed the python interpreter the following scripts
// LoadStartupScript
// LoadPanelViewScript
// LoadObserverScript
//
// on exit we close FreeCAD
// LoadStopScript  FreeCADGui.getMainWindow().close()

interface

uses
{$IFDEF FPC}
  Windows, JwaPsApi, Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
  ComCtrls, Process,
  Dialogs, ExtCtrls, StdCtrls, PythonEngine, PythonGUIInputOutput, JwaTlHelp32;
{$ELSE}
  Windows, PsAPI, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PythonEngine, Vcl.StdCtrls,
  PythonGUIInputOutput, Vcl.ComCtrls, Vcl.ExtCtrls, TLHelp32;
{$ENDIF}

type

  // { TFreeCadFrm }

  { TFreeCadFrm }

  TFreeCadFrm = class(TForm)
{$IFDEF FPC}
    Label5: TLabel;
    Label6: TLabel;
{$ENDIF}
    PythonEngine1: TPythonEngine;
    ExeMemo: TMemo;
    PyOutMemo: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    btnExeFC: TButton;
    Panel1: TPanel;
    cbRawOut: TCheckBox;
    pnlPickGeo: TPanel;
    cbIncludeZ: TCheckBox;
    Label3: TLabel;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    PythonModule1: TPythonModule;
    UpDown1: TUpDown;
    EdtUpDown: TEdit;
    pnlPath: TPanel;
    cbBypassSel: TCheckBox;
    btnSetTool: TButton;
    btnGenPath: TButton;
    Label4: TLabel;
    lblEdgeCnt: TLabel;
    PythonDelphiVar1: TPythonDelphiVar;

    procedure btnExeFCClick(Sender: TObject);
    procedure PythonModule1Initialization(Sender: TObject);
    procedure LoadStartupScript;
    procedure LoadWindowScript;
    procedure LoadPanelViewScript;
    procedure LoadObserverScript;
    procedure LoadWindowActionScript(Action : Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGenPathClick(Sender: TObject);
    procedure btnSetToolClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    function WrtArgsToEditor(pself, args: PPyObject): PPyObject; cdecl;
    function ParseFreeCADString(Indata: String): Boolean;
    procedure WrtDebugInfo(Indata: Array of String);
    procedure WrtPoint(Indata: Array of String);
    procedure WrtLine(Indata: Array of String);
    procedure WrtCircle(Indata: Array of String);
    procedure WrtArc(Indata: Array of String);
    procedure WrtArvMove(GCode, PosX, PosY, PosZ, CtrX, CtrY, CtrZ: String);
    procedure WrtUser(Id: Integer; Indata: Array of String);
    procedure OutPutPoint(PosX, PosY, PosZ: String);
    procedure SaveLastPoint(PosX, PosY, PosZ: String);

    function ExeScript(ScriptLns: TStringList): Boolean;
    function IsSamePoint(PosX, PosY, PosZ: String): Boolean;

  public
    { Public declarations }
  end;

var
  FreeCadFrm: TFreeCadFrm;

implementation

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

uses
  srcMain, SetFCparms, SetTool;

Const
  // Define data line sent back by FreeCAD  Note, Paramsz must = number of fields passed, it sizes array used to store
  // individual fields!

  CrLf = #13#10;
  // Array locations for individual passed fields
  Geo = 0;
  X1 = 1;
  Y1 = 2;
  Z1 = 3;
  X2 = 4;
  Y2 = 5;
  Z2 = 6;
  Rad = 7;
  CtrX = 8;
  CtrY = 9;
  CtrZ = 10;
  ParamSz = 10; // Constant to size array to hold fields

  // Define Geo values sent back by FreeCAD
  Path = 'path';
  Point = 'point';
  Circle = 'circle';
  Arc = 'arc';
  Line = 'line';
  User1 = 'user1';
  User2 = 'user2';
  User3 = 'user3';
  OtherData = 'otherdata';
  Unknown = 'unknown';
  // custom script files found in AppData (C:\Users\**username**\AppData\Local\CodeSharkFC)
  StartupScript = 'StartupScript.py';
  PanelViewScript = 'PanelViewScript.py';
  ObserverScript = 'ObserverScript.py';
  WindowCloseScript = 'WindowCloseScript.py';
  WindowHideScript = 'WindowHideScript.py';
  WindowShowScript = 'WindowShowScript.py';
  //
  cFreeCADScreenName = 'FreeCAD(CSFC'; //Name we will assign to FreeCAD window in LoadWindowScript
  // LoadWindowActionScript actions
  WindowShow = 0;
  WindowHide = 1;
  WindowClose = 2;

var
  StartupLoaded, PanelViewLoaded, ObserverLoaded: Boolean;
  ScriptLns: TStringList;
  LastX, LastY, LastZ: String; // last point processed
  FreeCADPid: Integer; // PID of FreeCAD process, returned by  startup script
  FreeCADScreenName : String;  //Name we will assign to FreeCAD window in LoadWindowScript
  FreeCADFound: Boolean;       // Our FreeCAD Screen Name Found with FindFreeCADWindow

 //
 // following is how we determine if the FreeCAD Window Name (we assigned in PanelViewScript.py) is still active
 // we need to have a linux and windows version of this code
 // so here it is
 // Note in both versions of FindFreeCADWindow we shamelessly use ths global variables:
 //   FreeCADScreenName  Name we will assign to FreeCAD window in LoadWindowScript
 //   FreeCADFound  Our FreeCAD Screen Name Found T/F
 //
{$IFDEF LINUX}
procedure FindFreeCADWindow;
 var
    AProcess: TProcess;
    List : TStringList = nil;
    Result : Boolean;
    i :integer
begin
    Result := False;
    FreeCADFound := False;
    // use wmctrl to get a list of all windows
    AProcess := TProcess.Create(nil);
    AProcess.Executable:= 'wmctrl';
    AProcess.Parameters.Add('-l');
    AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes];
    try
        AProcess.Execute;
        Result := (AProcess.ExitStatus = 0);        // says at least one packet got back
    except on
        E: EProcess do Showmessage('Process execution failed: ' + E.Message );
    end;
    if Result then
    Begin
      List := TStringList.Create;
      List.LoadFromStream(AProcess.Output);       // Get the output from wmcttl
      for i := 0 to List.Count-1 do               // look for the our FreeCAD window
        if Pos(FreeCADScreenName, List[i] then
        Begin
          FreeCADFound := True;
          Exit;
        End;
      List.Free;
      AProcess.Free;
    End
    Else
      Showmessage('wmctrl returned no windows');

end;
{$ELSE}
function EnumWinProc(wHandle: hWnd; lparam: Integer): Bool; stdcall;
Const
  MAX_TEXT = MAX_PATH;
var
  strText, strClass: array [0 .. MAX_TEXT] of char;
  IsAppMainWin: Boolean;
  ProcId: cardinal;
begin
  // Check if the window is a application main window.

  IsAppMainWin :=
    (GetWindow(wHandle, GW_OWNER) = 0) AND // Not owned by other windows
    (GetParent(wHandle) = 0) AND // Does not have any parent
    (GetWindowLong(wHandle, GWL_EXSTYLE) AND WS_EX_TOOLWINDOW = 0);  // Not a tool window



  if IsAppMainWin then
  begin
    GetWindowText(wHandle, strText, MAX_TEXT);
//    GetClassName(wHandle, strClass, MAX_TEXT);
//    GetWindowThreadProcessID(wHandle, ProcId);
    if strText = FreeCADScreenName then
      FreeCADFound := True;
  end;

  Result := True;
end;

procedure FindFreeCADWindow;
var
  FirstWnd: cardinal;
begin
  FreeCADFound := False;
  EnumWindows(@EnumWinProc, LPARAM(@FirstWnd));
end;
{$ENDIF}

function SetEnvVarValue(const VarName, VarValue: string): Integer;
begin
  // Simply call API function
  if Windows.SetEnvironmentVariable(PChar(VarName), PChar(VarValue)) then
    Result := 0
  else
    Result := GetLastError;
end;

function EnsurePathHasDoubleSlashes(Path: string): string;
begin
  Result := StringReplace(Path, '\', '\\', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '\\\', '\\', [rfReplaceAll, rfIgnoreCase]);
end;

function TFreeCadFrm.WrtArgsToEditor(pself, args: PPyObject): PPyObject; cdecl;
// define the function we will use in the python scripts to get the data into the codeshark programing window
// lots more work to do here, lets just get the basics to work for now
begin
  with GetPythonEngine do
  begin
    lblEdgeCnt.Caption := PythonDelphiVar1.ValueAsString;
    ParseFreeCADString(PyObjectAsString(args));
    Result := ReturnNone;
  end;
end;

function TFreeCadFrm.ParseFreeCADString(Indata: String): Boolean;
// Format of Indata:
//
// (Geometry,Point1_X,Point1_Y,Point1_Z,Point2_X,Point2_Y,Point2_Z,Radius,Center_X,Center_Y,Center_Z)
//
// Geometry - 'point', 'circle', 'line', 'User1', 'User2', 'User3', 'unknown (with type after unknown)
// 'User1', 'User2', 'User3', - not sure what the point of this is but add for flexiblity
// Point1_X,Point1_Y,Point1_Z,Point2_X,Point2_Y,Point2_Z,Radius,Center_X,Center_Y,Center_Z - 5 place decimal string value or empty string
// ie:  ('line', '0.0', '0.0', '0.0', '50.0', '0.0', '0.0', '', '', '', '')

Var
  Params: array [0 .. ParamSz] of string;
  TempStr, ParseParam, MyPid: String;
  i, x: Integer;
Begin
  Result := True;
  TempStr := StringReplace(Indata, '(', '', [rfReplaceAll, rfIgnoreCase]);
  TempStr := StringReplace(TempStr, ')', '', [rfReplaceAll, rfIgnoreCase]);
  TempStr := StringReplace(TempStr, '''', '', [rfReplaceAll, rfIgnoreCase]);
  TempStr := StringReplace(TempStr, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  x := 0;
  ParseParam := '';
  If length(TempStr) > 0 then
  begin
    For i := 1 to length(TempStr) do
    Begin
      If TempStr[i] = ',' then
      Begin
        Params[x] := ParseParam;
        inc(x);
        ParseParam := '';

        If x > ParamSz Then
        Begin
          // prevent array overflow condition, someone added fields to passed string but did not increase Paramsz constant to match
          ShowMessage
            ('More Fields passed than expected, Unable to complete parsing' +
            CrLf + '(' + TempStr + ')');
          if ExtraDebugging then
            FrmMain.SynEdit.Lines.Add('(' + TempStr + ')');
          Result := False;
          Exit;
        end;

      end
      else
        ParseParam := ParseParam + TempStr[i];
    end;
    Params[x] := ParseParam; // save last parameter
  end
  Else // somethng rotten here, exit with return code falses
  Begin
    Result := False;
    Exit;
  end;



  // FrmMain.SynEdit.Lines.Add(TempStr);
  // Params := TempStr.Split([',']);

  if cbRawOut.Checked then
    PyOutMemo.Lines.Add(Indata);

  if Params[Geo] = OtherData then
  //
  // look to see what data we send back from FreeCAD
  begin
    if Params[X1] = 'PID' then
    Begin
      // we have FreeCAD windows PID, save for shutdown testing
      MyPid := Params[Y1];
      PyOutMemo.Lines.Add('FreeCAD PID = :' + MyPid + ':');
      Try
        FreeCADPid := StrToInt(MyPid)
      Except
        FreeCADPid := 0
      End;

    End
    else
      PyOutMemo.Lines.Add('Unknow Other Data Passed: ' + Indata);
  end

  else if Params[Geo] = Path then
  // generate path

  begin
    // add the path statements to the memo
    // for now all code dumps out in X1 data position
    FrmMain.SynEdit.Lines.Add(Params[X1]);
  end

  else
  // write selections to the editor memo only if cbBypassSel not checked
  begin
    if ExtraDebugging then
      WrtDebugInfo(Params);

    if not(cbBypassSel.Checked) then

      if (Params[Geo] = Point) then
        // point type
        WrtPoint(Params)
      else if (Params[Geo] = Line) then
        // line type
        WrtLine(Params)
      else if (Params[Geo] = Circle) then
        // circle type
        WrtCircle(Params)
      else if (Params[Geo] = Arc) then
        // arc type
        WrtArc(Params)
      else if Params[Geo] = User1 then
        // User1
        WrtUser(1, Params)
      else if Params[Geo] = User2 then
        // User2
        WrtUser(2, Params)
      else if Params[Geo] = User3 then
        // User3
        WrtUser(3, Params)
      else
        PyOutMemo.Lines.Add('Unknow Data Passed: ' + Indata);
  end;

End;

function TFreeCadFrm.IsSamePoint(PosX, PosY, PosZ: String): Boolean;
Begin
  if (PosX = LastX) and (PosY = LastY) and (PosZ = LastZ) then
    Result := True
  else
    Result := False;
End;

procedure TFreeCadFrm.SaveLastPoint(PosX, PosY, PosZ: String);
begin
  LastX := PosX;
  LastY := PosY;
  LastZ := PosZ;
end;

procedure TFreeCadFrm.OutPutPoint(PosX, PosY, PosZ: String);
Var
  MemoLine: String;
begin
  if FormatForPathDisplay then
    MemoLine := 'G1 X' + PosX + ' Y' + PosY
  else
    MemoLine := 'X' + PosX + ' Y' + PosY;

  if cbIncludeZ.Checked then
    MemoLine := MemoLine + ' Z' + PosZ;
  FrmMain.SynEdit.Lines.Add(MemoLine);
  SaveLastPoint(PosX, PosY, PosZ);
end;

procedure TFreeCadFrm.WrtDebugInfo(Indata: Array of String);
Begin
  // some debugging stuff
  FrmMain.SynEdit.Lines.Add('(Last XYZ: ' + LastX + ' ' + LastY + ' ' +
    LastZ + ')');
  FrmMain.SynEdit.Lines.Add('(Geo: ' + Indata[Geo] + ')');
  FrmMain.SynEdit.Lines.Add('(XYZ1: ' + Indata[X1] + ' ' + Indata[Y1] + ' ' +
    Indata[Z1] + ')');
  FrmMain.SynEdit.Lines.Add('(XYZ2: ' + Indata[X2] + ' ' + Indata[Y2] + ' ' +
    Indata[Z2] + ')');
  FrmMain.SynEdit.Lines.Add('(Rad:  ' + Indata[Rad] + ' Cntr XYZ: ' +
    Indata[CtrX] + ' ' + Indata[CtrY] + ' ' + Indata[CtrZ] + ')');

end;

procedure TFreeCadFrm.WrtPoint(Indata: Array of String);
// Var
// MemoLine: String;
begin
  OutPutPoint(Indata[X1], Indata[Y1], Indata[Z1]);
end;

procedure TFreeCadFrm.WrtLine(Indata: Array of String);
// Var
// MemoLine: String;
begin
  if length(LastX) > 0 then // Have we output at least one point?
    // Yes, is it the same as the start of this line?
    // if so only output ending point
    if IsSamePoint(Indata[X1], Indata[Y1], Indata[Z1]) then
      OutPutPoint(Indata[X2], Indata[Y2], Indata[Z2])
      // if not is it the same as the end of this line?
      // if so output point at other end of line (flip direction)
    else if IsSamePoint(Indata[X2], Indata[Y2], Indata[Z2]) then
      OutPutPoint(Indata[X1], Indata[Y1], Indata[Z1])
    else
    begin // not contiguous with last point, output both points as received
      OutPutPoint(Indata[X1], Indata[Y1], Indata[Z1]);
      OutPutPoint(Indata[X2], Indata[Y2], Indata[Z2]);
    end
  else
  begin // no previous point, output as received
    OutPutPoint(Indata[X1], Indata[Y1], Indata[Z1]);
    OutPutPoint(Indata[X2], Indata[Y2], Indata[Z2]);
  end;

end;

procedure TFreeCadFrm.WrtCircle(Indata: Array of String);
Var
  SaveFormatForPathDisplay: Boolean;
  // for circles we write out center point
begin
  SaveFormatForPathDisplay := FormatForPathDisplay;
  // for circle center point never send g code regarless of flag
  FormatForPathDisplay := False;
  OutPutPoint(Indata[CtrX], Indata[CtrY], Indata[CtrZ]);
  FormatForPathDisplay := SaveFormatForPathDisplay;
end;

procedure TFreeCadFrm.WrtArc(Indata: Array of String);
//
// WrtArc - We need to determine if arc is G2 (cw) or G3 (ccw)
// The way we do this is assume all arcs are CCW in open cascade (OCC).
// So if the user's last point selected is the starting point of the arc, then the movement arc should be CCW (G3).
// If the user's last point selected is the ending point of the arc, then the the movement arc should be CW (G2)
// NOTE we are assuming XY Plane (G17) !!!!!

begin
  if length(LastX) > 0 then // Have we output at least one point?
  else
  begin
    // started on arc, can only assume CCW
    // output start point
    // assign to last point
    OutPutPoint(Indata[X1], Indata[Y1], Indata[Z1]);
  end;

  if IsSamePoint(Indata[X1], Indata[Y1], Indata[Z1]) then
    // Start point of arc is at last position, G3 move
    WrtArvMove('G3', Indata[X2], Indata[Y2], Indata[Z2], Indata[CtrX],
      Indata[CtrY], Indata[CtrZ])
  else if IsSamePoint(Indata[X2], Indata[Y2], Indata[Z2]) then
    // End point of arc is at last postions, G2 move
    WrtArvMove('G2', Indata[X1], Indata[Y1], Indata[Z1], Indata[CtrX],
      Indata[CtrY], Indata[CtrZ])
  else
    ShowMessage
      ('Unable to calculate Arc Move, Suggest Selection of End Point Elements vs Edges (Lines)');

end;

procedure TFreeCadFrm.WrtArvMove(GCode, PosX, PosY, PosZ, CtrX, CtrY,
  CtrZ: String);
Var
  Ipos: Double;
  // offset from starting x (LastX) coordinate to center x coordinate
  JPos: Double;
  // offset from starting y (LastY) coordinate to center y coordinate
  GCodeString: String;
Begin
  Try
    Ipos := (strTofloat(LastX) - strTofloat(CtrX)) * -1.0;
    // calculate offset from starting x (LastX) coordinate to center x coordinate
    JPos := (strTofloat(LastY) - strTofloat(CtrY)) * -1.0; // same for y
    GCodeString := GCode + 'X' + PosX + 'Y' + PosY + 'I' + floatToStr(Ipos) +
      'J' + floatToStr(JPos);
    FrmMain.SynEdit.Lines.Add(GCodeString);
    SaveLastPoint(PosX, PosY, PosZ); // save ending postion
  Except
    // catch conversion issues here
    on E: Exception do
      ShowMessage('Unable to calculate arc: ' + E.Message);

  End;

End;

procedure TFreeCadFrm.WrtUser(Id: Integer; Indata: Array of String);
// user defined, for now we just add second passed parameter
begin
  FrmMain.SynEdit.Lines.Add(Indata[X1]);
end;

{ procedure TFreeCadFrm.XScriptClick(Sender: TObject);
  begin
  if ExeMemo.Lines.Count > 0 then
  Begin
  ScriptLns.Clear;
  ScriptLns.AddStrings(ExeMemo.Lines);
  ExeScript(ScriptLns);
  End;
  end; }

procedure TFreeCadFrm.PythonModule1Initialization(Sender: TObject);
begin
  // Add the delphi defined fuction into the python interpreter
  //
  // to use in python:
  // import CaptureFC     <-- this is the name we gave the module (PythonModule1.ModuleName)
  // CaputureFC.WrtArgs('1 2 3', 1)   <- WrtArgs is the name of the method (assigned below)
  // this command with result in ('1 2 3', 1) being added to the editor window
  // CaputureFC.WrtArgs(x)  <- this will result in ('1 2 3') begin added to the editor window

  with Sender as TPythonModule do
  begin
    AddDelphiMethod('WrtArgs', WrtArgsToEditor,
      'Function writes args to CodeShark Editor');
  end;
end;

procedure TFreeCadFrm.btnGenPathClick(Sender: TObject);
Var
  PathKurveStr, MsgText: String;

begin
  //
  // create script to generate cnc path on selected edges
  // we break process down into steps to hopefully catch errors and stop the process
  // at the error
  // we shall see how well it works......
  //
  // Edges are saved in MyEdgeList as user clicks on object (line or arc for now)

  if StrToInt(PythonDelphiVar1.ValueAsString) <= 1 then
  Begin
    MsgText := 'Not Enough Edges Selected (>1), Path generation not possible';
    MessageDlg(MsgText, mtWarning, [mbOK], 0);
    Exit
  End;

  ScriptLns.Clear;
  ExeMemo.Lines.Clear;
  ScriptLns.Add('print(''Edges: '' + str(len(MyEdgeList)))');
  PyOutMemo.Lines.Add('Execute script to get the edge list');
  if not(ExeScript(ScriptLns)) then
    Exit;

  // create MyCurve
  ScriptLns.Clear;
  ExeMemo.Lines.Clear;
  ScriptLns.Add('if len(MyEdgeList) > 1:'); // need at least 2 edges

  PathKurveStr := '    MyCurve = PathKurveUtils.makeAreaCurve(MyEdgeList,';
  if SetToolFrm.rbCCW.Checked then
    PathKurveStr := PathKurveStr + '''CCW'')'
  else
    PathKurveStr := PathKurveStr + '''CW'')';
  ScriptLns.Add(PathKurveStr);
  PyOutMemo.Lines.Add('Execute script to create MyCurve');
  PyOutMemo.Lines.Add(PathKurveStr);
  if not(ExeScript(ScriptLns)) then
    Exit;

  // create the  PathKurveUtils.profile function  call
  //
  ScriptLns.Clear;
  ExeMemo.Lines.Clear;
  ScriptLns.Add('if len(MyEdgeList) > 1:'); // need at least 2 edges
  PathKurveStr := '    goutput = PathKurveUtils.profile(MyCurve, ';

  if SetToolFrm.rbOnLine.Checked then
    PathKurveStr := PathKurveStr + '''On'', '
  else if SetToolFrm.rbRightofLine.Checked then
    PathKurveStr := PathKurveStr + '''Right'', '
  else
    PathKurveStr := PathKurveStr + '''Left'', ';

  PathKurveStr := PathKurveStr + SetToolFrm.RadiusEdt.Text + ', ' +
    SetToolFrm.VertFeedEdt.Text + ', ' + SetToolFrm.HorzFeedEdt.Text + ', ' +
    SetToolFrm.OffsetExtraEdt.Text + ', ' + SetToolFrm.RapidSafeSpaceEdt.Text +
    ', ' + SetToolFrm.ClearanceEdt.Text + ', ' + SetToolFrm.StartDepthEdt.Text +
    ', ' + SetToolFrm.StepdownEdt.Text + ', ' +
    SetToolFrm.FinalDepthEdt.Text + ')';

  ScriptLns.Add(PathKurveStr);
  PyOutMemo.Lines.Add('Execute script PathKurveUtils.profile function  call');
  PyOutMemo.Lines.Add(PathKurveStr);
  if not(ExeScript(ScriptLns)) then
    Exit;

  // send the gcode to the editor
  //
  ScriptLns.Clear;
  ExeMemo.Lines.Clear;
  ScriptLns.Add('if len(goutput) != 0:'); // any output?
  ScriptLns.Add('    for gcodeln in goutput.splitlines():'); // any output?
  ScriptLns.Add('        CaptureFC.WrtArgs(''' + Path +
    ''',gcodeln,'''','''','''','''','''','''','''','''','''')');
  ScriptLns.Add('else:');
  ScriptLns.Add('    CaptureFC.WrtArgs(''' + Path +
    ''','' error generating G-Code'','''','''','''','''','''','''','''','''','''')');
  PyOutMemo.Lines.Add('Execute script Retrieve goutput ');
  if not(ExeScript(ScriptLns)) then
    Exit;

  // finally show the path
  //
  ScriptLns.Clear;
  // ExeMemo.Lines.Clear;
  ScriptLns.Add('if len(goutput) != 0:'); // any output?
  ScriptLns.Add('    p = Path.Path(goutput)');
  ScriptLns.Add
    ('    myPath = FreeCAD.ActiveDocument.addObject("Path::Feature","Import")');
  ScriptLns.Add('    myPath.Path = p');
  ScriptLns.Add('    FreeCAD.ActiveDocument.recompute()');
  ExeScript(ScriptLns);

  // clear the slected edge list
  PyOutMemo.Lines.Add('Execute script Clear Edge List');
  ScriptLns.Clear;
  ScriptLns.Add('goutput = ''''');
  ScriptLns.Add('MyEdgeList = []');
  lblEdgeCnt.Caption := '0';
  ExeScript(ScriptLns);

end;

function TFreeCadFrm.ExeScript(ScriptLns: TStringList): Boolean;
begin
  Result := True;
  ExeMemo.Lines.Assign(ScriptLns);
  // execute the script
  try
    MaskFPUExceptions(True);
    PythonEngine1.ExecStrings(ExeMemo.Lines);
  Except
    on E: Exception do
    begin
      ShowMessage('Exception On Generate Path Script, class name = ' +
        E.ClassName + CrLf + 'Exception message = ' + E.Message);
      Result := False;
    end;

  end;
end;

procedure TFreeCadFrm.btnSetToolClick(Sender: TObject);
begin
  SetToolFrm.ShowModal;
end;

procedure TFreeCadFrm.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  MsgText: String;
begin
  Action := caHide;
  if StartupLoaded then
    LoadWindowActionScript(WindowHide);
end;

procedure TFreeCadFrm.FormCreate(Sender: TObject);
Var
  MyPyDllPath: String;
begin
  ScriptLns := TStringList.Create;
  StartupLoaded := False;
  ObserverLoaded := False;
  FreeCADFound := False;
  FreeCADPid := -1;
  LastX := '';
  LastY := '';
  LastZ := ''; // init last point position

  ObserverLoaded := False; // observer not loaded at this point

  //
  // Set up PythonEngine to use python user selected (hopefully the FreeCAD Python Interperter

  PythonEngine1.DllPath := Trim(SetFCparmsFrm.PythonHome.Text);
  PythonEngine1.DllName := Trim(SetFCparmsFrm.PyDllName.Text);
  PythonEngine1.RegVersion := SetFCparms.PyRegVersion;
  // need to set PYTHONHOME before startup or we will fail
  // Note setting  env PYTHONHOME does not seem to work, use dll call
  PythonEngine1.SetPythonHome(SetFCparmsFrm.PythonHome.Text);

  MyPyDllPath := IncludeTrailingPathDelimiter(PythonEngine1.DllPath) +
    PythonEngine1.DllName;

  if not(FileExists(MyPyDllPath)) then
  Begin
    ShowMessage('Cannot Find Python dll: ' + MyPyDllPath +
      ' Python dll path and or name not set, or set incorrectly');
    ShowMessage('Cannot Start FreeCAD without Python!');
  End
  else
  Begin
    PythonEngine1.LoadDll;
    MaskFPUExceptions(True);
  End;

end;

procedure TFreeCadFrm.FormDestroy(Sender: TObject);
Var
  MsgText: String;
begin
  if StartupLoaded then
  begin
  // see if we still have a FreeCAD window (user did not close)
    FindFreeCADWindow;
    if FreeCADFound then
    Begin
      LoadWindowActionScript(WindowClose);
      PythonEngine1.Finalize;
    End

    else
  //
    Begin
      MsgText := 'The ' + FreeCADScreenName + ' Window Cannot Be Found.' + CrLf;
      MsgText := MsgText +
        'We Cannot Cleanly Unload The Interface To FreeCAD.' + CrLf;
      MsgText := MsgText +
      'THIS WILL MOST LIKELY RESULT IN AN APPLICATION ERROR WHEN THE PROGRAM IS CLOSED!'
        + CrLf;
      MsgText := MsgText + 'PLEASE SAVE YOUR WORK NOW!' + CrLf;
      MsgText := MsgText +
        'In The Future, Please Close FreeCAD  By Closing The CodeShark/FreeCAD Interface Dialog';
      MessageDlg(MsgText, mtWarning, [mbOK], 0);
    End
  End;
  ScriptLns.Free;
end;

procedure TFreeCadFrm.FormShow(Sender: TObject);
begin
  if StartupLoaded then
    LoadWindowActionScript(WindowShow)
end;

procedure TFreeCadFrm.LoadStartupScript;

var
  scriptFn: String;
  PyPath: String;

Begin
  ScriptLns.Clear;
  ExeMemo.Lines.Clear;
  scriptFn := FrmMain.AppDataPath + PathDelim + StartupScript;
  // if custom script file exists and load custom specified
  if SetFCparmsFrm.cbCustStart.Checked and FileExists(scriptFn) then
  begin
    // load ExeMemo.Lines from custom script file
    Label2.Caption := scriptFn;
    ExeMemo.Lines.LoadFromFile(scriptFn);
  end
  else
  begin
    // else load default
    Label2.Caption := 'Default Startup Script';
    ScriptLns.Add('import sys, os, fnmatch');

// paths needing to be set differ between Linux and Windows version
// setup here

{$IFDEF LINUX}
    ScriptLns.Add('sys.path.append(''' +SetFCparmsFrm.PythonHome.Text''')');
{$ELSE}
    PyPath := EnsurePathHasDoubleSlashes(SetFCparmsFrm.PythonHome.Text);
    ScriptLns.Add('sys.path.append(''' + PyPath + ''')');
    PyPath := EnsurePathHasDoubleSlashes(SetFCparmsFrm.PythonHome.Text);
    ScriptLns.Add('sys.path.append(''' + PyPath +
      '\\lib\\site-packages\\PySide2'')');
    PyPath := EnsurePathHasDoubleSlashes(SetFCparmsFrm.FreeCadMod.Text);
    ScriptLns.Add('sys.path.append(''' + PyPath + '\\Part'')');
    ScriptLns.Add('sys.path.append(''' + PyPath + '\\Drawing'')');
    PyPath := EnsurePathHasDoubleSlashes(ExtractFileDir(ParamStr(0)));
    ScriptLns.Add('sys.path.append(''' + PyPath + ''')');
{$ENDIF}

    // we expect to find  PathKurveUtils & PathSelection in CodeSharkFC exe
    // // directory, as of FC.17 it is no longer part of  Path (PathScripts)
    ScriptLns.Add('import FreeCADGui,FreeCAD');
    ScriptLns.Add('from PySide import QtCore, QtGui');
    ScriptLns.Add('import Path');
    ScriptLns.Add('import PathKurveUtils');
    // stop the start page from showing up
    ScriptLns.Add
      ('grp=FreeCAD.ParamGet("User parameter:BaseApp/Preferences/General")');
    ScriptLns.Add('grp.SetString("AutoloadModule","PartWorkbench")');
    //
    // turn of TUX
    ScriptLns.Add
      ('grp=FreeCAD.ParamGet("User parameter:Tux/NavigationIndicator")');
    ScriptLns.Add('grp.SetBool("Enabled",False)');

    // finally import our module (must match ModuleName of TPythonModule on form!
    ScriptLns.Add('import CaptureFC');

    // finally fire up FreeCAD
    ScriptLns.Add('FreeCADGui.showMainWindow()');
    // and save the process id of FreeCAD
    ScriptLns.Add('MyPid = os.getpid()');
    ScriptLns.Add('CaptureFC.WrtArgs(''otherdata'',''PID'',MyPid)');
    //
    ScriptLns.Add('EdgeCnt.Value = 0');

    ExeMemo.Lines.Assign(ScriptLns);
  end;

  // save copy of Script?
  if Not FileExists(scriptFn) then
    ExeMemo.Lines.SaveToFile(scriptFn)
  else if SetFCparmsFrm.cbOverWriteScript.Checked then
    ExeMemo.Lines.SaveToFile(scriptFn);

  // execute the script

  try
    MaskFPUExceptions(True);
    PythonEngine1.ExecStrings(ExeMemo.Lines);
    StartupLoaded := True;
    PyOutMemo.Lines.Add('Startup Script Executed');
  Except
    on E: Exception do
    begin
      ShowMessage('Exception On Startup Script, class name = ' + E.ClassName +
        CrLf + 'Exception message = ' + E.Message);
    end;

  end;

End;

procedure TFreeCadFrm.LoadWindowScript;
var
  scriptFn: String;

Begin
  //Include in  FreeCAD window name the PID we are running as
  FreeCADScreenName := cFreeCADScreenName + IntToStr(FreeCADPid) + ')';
  ScriptLns.Clear;
  ExeMemo.Lines.Clear;

  Label2.Caption := 'Window Setting Script Script';
  ScriptLns.Add('mainWindow = FreeCADGui.getMainWindow()');
  // now mod the window to include pid in window title
  ScriptLns.Add('mainWindow.setWindowTitle("' + FreeCADScreenName + '")');
  // change the window flags to not include the close X on the main window
  ScriptLns.Add
      ('flags = QtCore.Qt.WindowMinimizeButtonHint | QtCore.Qt.WindowMaximizeButtonHint | QtCore.Qt.CustomizeWindowHint');
  ScriptLns.Add('mainWindow.setWindowFlags(flags)');
  ScriptLns.Add('mainWindow.show()');

  ExeMemo.Lines.Assign(ScriptLns);
  // execute the script

  try
    MaskFPUExceptions(True);
    PythonEngine1.ExecStrings(ExeMemo.Lines);
    PanelViewLoaded := True;
    PyOutMemo.Lines.Add('Window Setting Script Executed');
  Except
    on E: Exception do
    begin
      ShowMessage('Exception On Window Setting Script, class name = ' + E.ClassName
        + CrLf + 'Exception message = ' + E.Message);
    end;

  end;
End;


procedure TFreeCadFrm.LoadPanelViewScript;
var
  scriptFn: String;

Begin
  ScriptLns.Clear;
  ExeMemo.Lines.Clear;
  scriptFn := FrmMain.AppDataPath + PathDelim + PanelViewScript;
  // if custom script file exists and load custom specified
  if SetFCparmsFrm.cbCustPanel.Checked and FileExists(scriptFn) then
  begin
    // load ExeMemo.Lines from custom script file
    Label2.Caption := scriptFn;
    ExeMemo.Lines.LoadFromFile(scriptFn);
  end
  else
  begin
    // else load default
    Label2.Caption := 'Default Panel View Script';
    ScriptLns.Add('mainWindow = FreeCADGui.getMainWindow()');
    // set the panels we want visible
    ScriptLns.Add('dockWidgets = mainWindow.findChildren(QtGui.QDockWidget)');
    ScriptLns.Add('for dw in dockWidgets:');
    ScriptLns.Add('  if dw.objectName() == "Tree view":');
    ScriptLns.Add('    dw.hide()');
    ScriptLns.Add('  if dw.objectName() == "Combo View":');
    ScriptLns.Add('    dw.hide()');
    ScriptLns.Add('  if dw.objectName() == "Property view":');
    ScriptLns.Add('    dw.hide()');
    ScriptLns.Add('  if dw.objectName() == "Report view":');
    ScriptLns.Add('    dw.showNormal()');
    ScriptLns.Add('  if dw.objectName() == "Python console":');
    ScriptLns.Add('    dw.showNormal()');
    ExeMemo.Lines.Assign(ScriptLns);
  end;

  // save copy of Script?
  if Not FileExists(scriptFn) then
    ExeMemo.Lines.SaveToFile(scriptFn)
  else if SetFCparmsFrm.cbOverWriteScript.Checked then
    ExeMemo.Lines.SaveToFile(scriptFn);

  // execute the script

  try
    MaskFPUExceptions(True);
    PythonEngine1.ExecStrings(ExeMemo.Lines);
    PanelViewLoaded := True;
    PyOutMemo.Lines.Add('Panel View Script Executed');
  Except
    on E: Exception do
    begin
      ShowMessage('Exception On Panel View Script, class name = ' + E.ClassName
        + CrLf + 'Exception message = ' + E.Message);
    end;

  end;

End;

procedure TFreeCadFrm.LoadObserverScript;
//
// note: other scripting ways to get arc / circle info:
// print Gui.Selection.getSelectionEx()[0].SubObjects[0].Curve.Center
// returns Vector (0.0, 0.0, 10.0)
//
// print Gui.Selection.getSelectionEx()[0].SubObjects[0].Curve.Center.x
// print Gui.Selection.getSelectionEx()[0].SubObjects[0].Curve.Center.y
// print Gui.Selection.getSelectionEx()[0].SubObjects[0].Curve.Center.z
//
var
  scriptFn: String;
  testprecision: Integer;
  DecPrecision: String;

Begin
  ScriptLns.Clear;
  ExeMemo.Lines.Clear;
  scriptFn := FrmMain.AppDataPath + PathDelim + ObserverScript;
  // if custom script file exists and load custom specified
  if SetFCparmsFrm.cbCustSelectObs.Checked and FileExists(scriptFn) then
  begin
    // load ExeMemo.Lines from custom script file
    Label2.Caption := scriptFn;
    ExeMemo.Lines.LoadFromFile(scriptFn);
  end
  else
  begin
    Try
      testprecision := StrToInt(EdtUpDown.Text);
      DecPrecision := EdtUpDown.Text;
    Except
      ShowMessage('Bad precision value: ' + EdtUpDown.Text + ' using 4');
      DecPrecision := '4';
    End;
    // else load default
    Label2.Caption := 'Default Observer Script';
    ScriptLns.Add('def MyStr(InData):');
    ScriptLns.Add('    result = ''{:.' + DecPrecision + 'f}''.format(InData)');
    ScriptLns.Add('    return result');
    //
    ScriptLns.Add('class SelObserver:');
    ScriptLns.Add('    def addSelection(self,doc,obj,sub,pnt):');
    ScriptLns.Add('        global MyEdgeList');
    ScriptLns.Add('        MyGeo = ''unknown''');
    ScriptLns.Add('        MyX1 = ''''');
    ScriptLns.Add('        MyY1 = ''''');
    ScriptLns.Add('        MyZ1 = ''''');
    ScriptLns.Add('        MyX2 = ''''');
    ScriptLns.Add('        MyY2 = ''''');
    ScriptLns.Add('        MyZ2 = ''''');
    ScriptLns.Add('        MyRad = ''''');
    ScriptLns.Add('        MyCtrX  = ''''');
    ScriptLns.Add('        MyCtrY  = ''''');
    ScriptLns.Add('        MyCtrZ  = ''''');
    ScriptLns.Add('        sel = FreeCADGui.Selection.getSelection()');
    ScriptLns.Add('        SubObject = str(sub)');
    ScriptLns.Add('        if fnmatch.fnmatch(SubObject, ''Vertex*''):');
    // sub object is a Vertex therefore we have a point
    ScriptLns.Add('            MyGeo = ''point''');
    ScriptLns.Add('            MyX1 = MyStr(pnt[0])');
    ScriptLns.Add('            MyY1 = MyStr(pnt[1])');
    ScriptLns.Add('            MyZ1 = MyStr(pnt[2])');
    ScriptLns.Add('        elif fnmatch.fnmatch(str(obj), ''Face*''): ');
    ScriptLns.Add
      ('            MyGeo = ''unknown-Object:'' + str(obj) + ''-subobject:'' + SubObject');
    ScriptLns.Add('        elif fnmatch.fnmatch(SubObject, ''Edge*''): ');
    // could be Line, Circle or Arc
    ScriptLns.Add('            try:');
    ScriptLns.Add
      ('                MyRad = str(sel[0].Shape.Edges[0].Curve.Radius)');
    ScriptLns.Add('                MyCtr = sel[0].Shape.Edges[0].Curve.Center');
    ScriptLns.Add('                MyCtrX  = MyStr(MyCtr.x)');
    ScriptLns.Add('                MyCtrY  = MyStr(MyCtr.y)');
    ScriptLns.Add('                MyCtrZ  = MyStr(MyCtr.z)');
    // if we made it here we could be a circle or and arc, lets test number of vertices
    ScriptLns.Add('                a = sel[0].Shape.Edges[0].Vertexes[0]');
    ScriptLns.Add('                MyX1 = MyStr(a.Point.x)');
    ScriptLns.Add('                MyY1 = MyStr(a.Point.y)');
    ScriptLns.Add('                MyZ1 = MyStr(a.Point.z)');
    ScriptLns.Add('                try:');
    ScriptLns.Add('                    a = sel[0].Shape.Edges[0].Vertexes[1]');
    ScriptLns.Add('                    MyGeo = ''arc''');
    ScriptLns.Add('                    MyX2 = MyStr(a.Point.x)');
    ScriptLns.Add('                    MyY2 = MyStr(a.Point.y)');
    ScriptLns.Add('                    MyZ2 = MyStr(a.Point.z)');
    ScriptLns.Add
      ('                    MyEdgeList.append(sel[0].Shape.Edges[0])');
    ScriptLns.Add('                except:');
    ScriptLns.Add('                    MyGeo = ''circle''');
    ScriptLns.Add('            except:');
    // we have a line
    ScriptLns.Add('                MyGeo = ''line''');
    ScriptLns.Add('                a = sel[0].Shape.Edges[0].Vertexes[0]');
    ScriptLns.Add('                MyX1 = MyStr(a.Point.x)');
    ScriptLns.Add('                MyY1 = MyStr(a.Point.y)');
    ScriptLns.Add('                MyZ1 = MyStr(a.Point.z)');
    ScriptLns.Add('                a = sel[0].Shape.Edges[0].Vertexes[1]');
    ScriptLns.Add('                MyX2 = MyStr(a.Point.x)');
    ScriptLns.Add('                MyY2 = MyStr(a.Point.y)');
    ScriptLns.Add('                MyZ2 = MyStr(a.Point.z)');
    ScriptLns.Add('                MyEdgeList.append(sel[0].Shape.Edges[0])');
    ScriptLns.Add('        else:');
    // unknown (or un handled) type
    ScriptLns.Add('            MyGeo = ''unknown: '' + SubObject');
    ScriptLns.Add
      ('        print( ''Object: '' + str(obj) + '' subobject: '' + SubObject)');
    ScriptLns.Add('        print( ''Geo:    '' + MyGeo)');
    ScriptLns.Add('        EdgeCnt.Value = len(MyEdgeList)');
    ScriptLns.Add
      ('        print( ''Point1: '' + MyX1 + '','' + MyY1 + '','' +MyZ1)');
    ScriptLns.Add
      ('        print( ''Point2: '' + MyX2 + '','' + MyY2 + '','' +MyZ2)');
    ScriptLns.Add('        print( ''Radius: '' + MyRad)');
    ScriptLns.Add
      ('        print( ''Center: '' + MyCtrX  + '','' + MyCtrY + '','' + MyCtrZ )');
    ScriptLns.Add
      ('        CaptureFC.WrtArgs(MyGeo,MyX1,MyY1,MyZ1,MyX2,MyY2,MyZ2,MyRad,MyCtrX,MyCtrY,MyCtrZ)');

    // init our edge list
    ScriptLns.Add('MyEdgeList = []');
    ScriptLns.Add('EdgeCnt.Value = len(MyEdgeList)');

    // create an instance of our observer
    ScriptLns.Add('s=SelObserver()');
    // and tell freecad to use it
    ScriptLns.Add('FreeCADGui.Selection.addObserver(s)');
    // Execute the script
    ExeMemo.Lines.Assign(ScriptLns);
  end;

  // save copy of Script?
  if Not FileExists(scriptFn) then
    ExeMemo.Lines.SaveToFile(scriptFn)
  else if SetFCparmsFrm.cbOverWriteScript.Checked then
    ExeMemo.Lines.SaveToFile(scriptFn);

  // execute the script

  try
    MaskFPUExceptions(True);
    PythonEngine1.ExecStrings(ExeMemo.Lines);
    ObserverLoaded := True;
    PyOutMemo.Lines.Add('Observer Script Executed');
  Except
    on E: Exception do
    begin
      ShowMessage('Exception On Observer Script, class name = ' + E.ClassName +
        CrLf + 'Exception message = ' + E.Message);
    end;

  end;

End;

procedure TFreeCadFrm.LoadWindowActionScript(Action : Integer);
// LoadWindowActionScript actions
//  WindowShow = 0;
//  WindowHide = 1;
//  WindowClose = 2;
var
  scriptFn, WindowActionFN, WindowAction: String;

Begin
  case Action of

   WindowShow:
   Begin
    WindowActionFN := WindowShowScript;
    WindowAction := 'FreeCADGui.getMainWindow().show()'
   End;

   WindowHide:
   Begin
    WindowActionFN := WindowHideScript;
    WindowAction := 'FreeCADGui.getMainWindow().hide()'
   End;

   WindowClose:
   Begin
    WindowActionFN := WindowCloseScript;
    WindowAction := 'FreeCADGui.getMainWindow().close()'
   End

  end;


  ScriptLns.Clear;
  ExeMemo.Lines.Clear;
  scriptFn := FrmMain.AppDataPath + PathDelim + WindowActionFN;
  // if custom script file exists and load custom specified
  if SetFCparmsFrm.cbCustWindowAction.Checked and FileExists(scriptFn) then
  begin
    // load ExeMemo.Lines from custom script file
    Label2.Caption := scriptFn;
    ExeMemo.Lines.LoadFromFile(scriptFn);
  end
  else
  begin
    // else load default
    Label2.Caption := 'Default Window Action Script';
    ScriptLns.Add(WindowAction);
    ExeMemo.Lines.Assign(ScriptLns);
  end;

  // save copy of Script?
  if Not FileExists(scriptFn) then
    ExeMemo.Lines.SaveToFile(scriptFn)
  else if SetFCparmsFrm.cbOverWriteScript.Checked then
    ExeMemo.Lines.SaveToFile(scriptFn);

  // execute the script

  try
    MaskFPUExceptions(True);
    // PythonEngine1.ExecStrings(ExeMemo.Lines);
    PythonEngine.GetPythonEngine.ExecStrings(ExeMemo.Lines);
    // ShowMessage('FreeCad sent Shutdown Message');
  Except
    on E: Exception do
    begin
      ShowMessage('Exception On ' + Label2.Caption + ' Script, class name = ' + E.ClassName +
        CrLf + 'Exception message = ' + E.Message);
    end;

  end;

End;

procedure TFreeCadFrm.btnExeFCClick(Sender: TObject);
var
  MsgText: string;

begin

  if not SetFCparmsFrm.cbFreeCADWarnDisable.Checked then
  Begin
    MsgText := 'Please Note:' + CrLf;
    MsgText := MsgText +
      'The Close "X" on the FreeCAD Application Window has been disabled. ' +
      CrLf;
    MsgText := MsgText +
      'Please Close FreeCAD  By Closing The CodeShark/FreeCAD Interface Dialog'
      + CrLf;
    MsgText := MsgText +
      'FAILURE TO FOLLOW THIS INSTRUCTION WILL MOST LIKELY RESULT IN AN APPLICATION ERROR WHEN THE PROGRAM IS CLOSED!'
      + CrLf;
    MsgText := MsgText +
      'To Disable This Warning Check "Disable FreeCAD Window Warning" in the CodeSharkFC - FreeCAD Setup Parameters Dialog'
      + CrLf;
    MessageDlg(MsgText, mtWarning, [mbOK], 0);
  End;

{$IFDEF MSWINDOWS}
  //    -- windows only problem ? --
  // Note (or warn) for QT bug, "/platforms" directory must be local to codeshark exe, look for it
  // 01/22/2020 this looks like it has been fixed, do not warn
  // 02/18/2020 when using  FreeCAD_0.19.19635_x64_Conda_Py3QT5-WinVS2015   it is back again!
  if not DirectoryExists(ExtractFilePath(ParamStr(0)) + PathDelim + 'platforms') then
    ShowMessage
      ('Warning ... Due to QT5 issue, "platforms" directory must be copied from FreeCad ../bin/platforms to directory containing CodeSharkFC exe file, it was not found.');
{$ENDIF}
  //
  FrmMain.Cursor := crHourGlass;
  FrmMain.StatusBar.Panels[0].Text := 'Script Statup';
  FrmMain.Refresh;
  Try
    LoadStartupScript;
    LoadWindowScript;
    LoadPanelViewScript;
    LoadObserverScript;
  Finally
    btnExeFC.Enabled := False; // do not let user select again

    FrmMain.Cursor := crDefault;
    if cbBypassSel.Checked then
      FrmMain.StatusBar.Panels[0].Text :=
        'Bypass Insertion of Clicked on Geometry '
    else
      FrmMain.StatusBar.Panels[0].Text := 'Insert Clicked on Geometry';
  End;

end;

end.
