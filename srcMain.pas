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

unit srcMain;

//

// - - - - - - - - - - - - - - - ASYNCPRO MODS FOR USE WITH CodeSharkFC - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - -  - - -

// MODS made to AdProtcl - to allow display of seconds remaining before EOF on receive operation and display status
// add function GetEofTimerRemaining for property EofTimerRemaining
// add function GetProtocolState for property GetProtocolState

// around line 340
// function GetEofTimerRemaining : LongInt;
// function GetProtocolState : TAsciiState;


// around line 546
// property EofTimerRemaining : LongInt
// read GetEofTimerRemaining;

// property ProtocolState : TAsciiState
// read GetProtocolState;

// around line 1383
// function TApdCustomProtocol.GetEofTimerRemaining : LongInt;
// {  -Return the ticks remaining until EOF raised for recieve operation}
// begin
// PData^.aHc.ValidDispatcher.TimerTicksRemaining(PData^.aTimeoutTrigger, Result);
// end;


// function TApdCustomProtocol.GetProtocolState : TAsciiState;
// {-Return the protocol state}
// begin
// Result := PData^.sAsciiState;
// end;

{$I SynEdit.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, IOUtils, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.Menus, Vcl.StdActns,
  Vcl.ActnList, System.Actions, Vcl.ActnPopup, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls, SynEditPrint,
  System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, SynEditSearch, SynEditMiscClasses,
  SynEditRegexSearch, Vcl.ExtCtrls, AdPacket, AdProtcl, AdPStat, OoMisc, AdPort, AwtPcl;

type
  TFrmMain = class(TForm)
    ActionManager1: TActionManager;
    ActionMainMenuBar1: TActionMainMenuBar;
    PopupActionBar1: TPopupActionBar;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FilePrintSetup1: TFilePrintSetup;
    FilePageSetup1: TFilePageSetup;
    FileExit1: TFileExit;
    DialogPrintDlg1: TPrintDlg;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    DialogFontEdit1: TFontEdit;
    ActSave: TAction;
    SynEditPrint1: TSynEditPrint;
    actGutterLines: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    ToolBarMain: TToolBar;
    ToolButtonSearch: TToolButton;
    ToolButtonSeparator2: TToolButton;
    ToolButtonSearchReplace: TToolButton;
    ImageListMain: TImageList;
    ActionListMain: TActionList;
    ActionFileOpen: TAction;
    ActionSearch: TAction;
    ActionSearchNext: TAction;
    ActionSearchPrev: TAction;
    ActionSearchReplace: TAction;
    Statusbar: TStatusBar;
    SynEditSearch: TSynEditSearch;
    FindDialog1: TFindDialog;
    ReplaceDialog1: TReplaceDialog;
    ToolButtonSearchNext: TToolButton;
    ToolButtonSearchPrev: TToolButton;
    ToolButtonSep1: TToolButton;
    ToolButtonSep2: TToolButton;
    ToolButtonSep4: TToolButton;
    FreeCADSettings: TAction;
    FreeCADExecute: TAction;
    ApdComPort1: TApdComPort;
    ApdProtocol1: TApdProtocol;
    ApdProtocolLog1: TApdProtocolLog;
    ApdDPack: TApdDataPacket;
    PortCloseTimer: TTimer;
    OpenSendDialog: TOpenDialog;
    OpenRecvDialog: TOpenDialog;
    ConfigurePort: TAction;
    Action2: TAction;
    ProtocolOpts: TAction;
    SendFromFile: TAction;
    Action1: TAction;
    FilterOnOpen: TAction;
    FilterOnSend: TAction;
    FilterOnReceive: TAction;
    Clear1stBlock: TAction;
    AddPercent: TAction;
    RemoveSpaces: TAction;
    SendFromEditor: TAction;
    Receive: TAction;
    OpenOnReceive: TAction;
    New: TAction;
    SynEdit: TSynEdit;
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure DialogPrintDlg1Accept(Sender: TObject);
    procedure DialogFontEdit1FontDialogApply(Sender: TObject; Wnd: HWND);
    procedure actGutterLinesExecute(Sender: TObject);
    procedure DialogFontEdit1BeforeExecute(Sender: TObject);

    procedure ActionSearchExecute(Sender: TObject);
    procedure ActionSearchNextExecute(Sender: TObject);
    procedure ActionSearchPrevExecute(Sender: TObject);
    procedure ActionSearchReplaceExecute(Sender: TObject);

    procedure DoFindText(Sender: TObject);
    procedure DoReplaceText(Sender: TObject);
    procedure ShowStatus;
    procedure FreeCADSettings1Click(Sender: TObject);
    procedure FreeCADClick(Sender: TObject);
    procedure ConfigurePortExecute(Sender: TObject);
    procedure SetDefaultFileExtension;
    Procedure LoadIni(Inif: TCustomIniFile);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ProtocolOptsExecute(Sender: TObject);
    procedure SendFromFileExecute(Sender: TObject);
    Procedure CNCFileFilter(FileToFilter: STRING);
    Procedure SendFile(Sender: TObject; Const FileToSend: TFileName;Const FileToSendPrompt: String);
    Procedure ReceiveFile(Sender: TObject);
    Procedure DisableMenuItems;
    Procedure EnableMenuItems;
    procedure ReceiveExecute(Sender: TObject);
    procedure RemoveSpacesExecute(Sender: TObject);
    procedure AddPercentExecute(Sender: TObject);
    procedure Clear1stBlockExecute(Sender: TObject);
    procedure FilterOnReceiveExecute(Sender: TObject);
    procedure FilterOnSendExecute(Sender: TObject);
    procedure FilterOnOpenExecute(Sender: TObject);
    procedure SendFromEditorExecute(Sender: TObject);
    Procedure ApdProtocol1ProtocolFinish(CP: TObject; ErrorCode: Integer);
    procedure ApdProtocol1ProtocolStatus(CP: TObject; Options: Word);
    procedure ApdProtocol1ProtocolError(CP: TObject; ErrorCode: Integer);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure NewExecute(Sender: TObject);
    procedure SaveExistingEditSession;
    procedure PortCloseTimerTimer(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    EditFileNameWithPath: String;
    AppDataPath: string;
    ApdHistoryLogFileName: String;
    // holds history file name for serial communication
    DefaultFileExtension: String;
    // Default File Extension used on open / save dialogs
  end;

var
  FrmMain: TFrmMain;
  // flags set in SetFCparms, read from CodeSharkFC.ini
  LicenseRead: Boolean;      // if set do not show about screen on startup
  ExtraDebugging: Boolean;   // if set output extra debug info to editor window 
  FormatForPathDisplay: Boolean;      // add G1 to output (so we can send to path and evaluted with  p = Path.Path(editor lines) 
  
  ApdMode: Integer; // flags mode AdpProtocal is in (send, recv, free)
  NameOfTempSendFile: String;
  // Name of the temp file created to give to Aysnc Pro to Transfer
  // Fully qualified path and file name of temp file used for send operation need to know so we can delete it
  SendMode, RecMode: Boolean;
  // Sending a file (SendMode=True) or Receving a file (RecMode=true)

  FirstPassOnActive: Boolean;
  // First Pass Flag for On Active Event - for code we only want to execute once.

const
  MyAppName = 'CodeSharkFC';
  CurVersion = '0.0';
  // custom script files found in AppData (C:\Users\**username**\AppData\Local\CodeSharkFC)
  StartupScript = 'StartupScript.py';
  PanelViewScript = 'PanelViewScript.py';
  ObserverScript = 'ObserverScript.py';
  ShutdownScript = 'ShutdownScript.py';

  ApdModeFree = 0; // Not send or recieve in process
  ApdModeSend = 1; // send in process
  ApdModeRecv = 2; // receive in process

  DialogFileExtensionFilter =
    'G Code Files (*.G)|*.G|Tape Files (*.T)|*.T|Text Files (*.TXT)|*.TXT|NC Files (*.NC)|*.NC|Program Files (*.PRO)|*.PRO|All Files (*.*)|*.*';

  // ini file sections
  MainSection = 'Window';
  FontSection = 'Font';
  ColorsSection = 'Colors';
  EditionSection = 'Edition';
  SetupSection = 'Setup';
  SerialSection = 'SerialPort';
  ProtocolSection = 'Protocol';
  FilterSection = 'FileFilter';
  NOF = '--nof--';

implementation

{$R *.DFM}

uses
  ShellAPI, ShlObj, SetFCparms, FreeCad,  About,
  cmset, ptops, settings, AsciistatusU, SendRecvDlg,
  SynEditTextBuffer,
  SynEditTypes,
  SynEditKeyCmds,
  SynEditMiscProcs;

const

  AppDataName = '\' + MyAppName;
  IniFileName = '\CodeSharkFC.ini';

resourcestring
  STextNotFound = 'Text not found';

function ShGetFolderPath(hWndOwner: HWND; csidl: Integer; hToken: THandle;
  dwReserved: DWord; lpszPath: PChar): HResult; stdcall;
  external 'ShFolder.dll' name 'SHGetFolderPathW';

function GetAppDataPath: string;
var
  DataPath: array [0 .. MAX_PATH] of Char;
  success: Boolean;
begin
  success := ShGetFolderPath(0, CSIDL_LOCAL_APPDATA or
    $8000 { CSIDL_FLAG_CREATE } , 0, { SHGFP_TYPE_CURRENT } 0, DataPath) = S_OK;
  if success then
    Result := DataPath
  else
    Result := NOF;
end;

Function GetWindowsDir: TFileName;
Var
  WinDir: Array [0 .. MAX_PATH - 1] Of Char;
Begin
  SetString(Result, WinDir, GetWindowsDirectory(WinDir, MAX_PATH));
  If Result = '' Then
  Begin
    Raise Exception.Create(SysErrorMessage(GetLastError))
  End;
End;

Function GetTempDir: TFileName;
// The following function returns the location of the temporary directory and attempts to create it if it doesn't exist.
Var
  TmpDir: Array [0 .. MAX_PATH - 1] Of Char;
Begin
  Try
    SetString(Result, TmpDir, GetTempPath(MAX_PATH, TmpDir));
    If NOT DirectoryExists(Result) Then
    Begin
      If NOT CreateDirectory(PChar(Result), NIL) Then
      Begin
        Result := IncludeTrailingBackSlash(GetWindowsDir) + 'TEMP';
        If NOT DirectoryExists(Result) Then
        Begin
          If NOT CreateDirectory(pointer(Result), NIL) Then
          Begin
            Result := ExtractFileDrive(Result) + '\TEMP';
            If NOT DirectoryExists(Result) Then
            Begin
              If NOT CreateDirectory(pointer(Result), NIL) Then
              Begin
                Result := ExtractFileDrive(Result) + '\TMP';
                If NOT DirectoryExists(Result) Then
                Begin
                  If NOT CreateDirectory(pointer(Result), NIL) Then
                  Begin
                    Raise Exception.Create(SysErrorMessage(GetLastError));
                  End
                End;
              End
            End;
          End
        End;
      End
    End;
  Except
    Result := '';
    Raise;
  End;
End;



Function CreateTempFile: TFileName;
// Creates a temporal file and returns its path name
Var
  TempFileName: Array [0 .. MAX_PATH - 1] Of Char;
Begin
  If GetTempFileName(PChar(GetTempDir), '~', 0, TempFileName) = 0 Then
  Begin
    Raise Exception.Create(SysErrorMessage(GetLastError))
  End;
  Result := TempFileName;
End;


procedure TFrmMain.ShowStatus;
var
  s: string;
begin
  s := 'BlkBgn ch / ln: ' + inttoStr(SynEdit.BlockBegin.Char) + ' / ' +
    inttoStr(SynEdit.BlockBegin.Line);
  s := s + ' BlkEnd ch / ln: ' + inttoStr(SynEdit.BlockEnd.Char) + ' / ' +
    inttoStr(SynEdit.BlockEnd.Line);
  s := s + ' CaretXY  ch / ln: ' + inttoStr(SynEdit.CaretXY.Char) + ' / ' +
    inttoStr(SynEdit.CaretXY.Line);
  s := s + ' Text: ' + SynEdit.GetWordAtRowCol(SynEdit.BlockBegin);
  Statusbar.SimpleText := s;
end;


procedure TFrmMain.actGutterLinesExecute(Sender: TObject);
begin
  SynEdit.Gutter.ShowLineNumbers := actGutterLines.Checked;
end;

procedure TFrmMain.ActSaveExecute(Sender: TObject);
// save menu item clicked on
begin
  if EditFileNameWithPath = '' then
    FileSaveAs1.Execute
  else
    SynEdit.Lines.SaveToFile(EditFileNameWithPath);
end;

procedure TFrmMain.AddPercentExecute(Sender: TObject);
begin
  AddPercent.Checked := Not(AddPercent.Checked);
end;

procedure TFrmMain.DialogFontEdit1BeforeExecute(Sender: TObject);
begin
  DialogFontEdit1.Dialog.Font := SynEdit.Font;
end;

procedure TFrmMain.DialogFontEdit1FontDialogApply(Sender: TObject; Wnd: HWND);
begin
  SynEdit.Font.Assign(DialogFontEdit1.Dialog.Font);
end;

procedure TFrmMain.DialogPrintDlg1Accept(Sender: TObject);
begin
  SynEditPrint1.SynEdit := SynEdit;
  SynEditPrint1.Print;
end;

procedure TFrmMain.FileOpen1Accept(Sender: TObject);
begin
  EditFileNameWithPath := FileOpen1.Dialog.FileName;
  SynEdit.Lines.LoadFromFile(EditFileNameWithPath);
end;

procedure TFrmMain.FileOpen1BeforeExecute(Sender: TObject);
begin
//    is there data in the editor window and has it changed?
    SaveExistingEditSession;
end;



procedure TFrmMain.FileSaveAs1Accept(Sender: TObject);
begin
  EditFileNameWithPath := FileSaveAs1.Dialog.FileName;
  SynEdit.Lines.SaveToFile(EditFileNameWithPath);
end;


procedure TFrmMain.SaveExistingEditSession;
//
// do we have an existing edit session that should be saved?
Begin
  if SynEdit.Modified then
     if EditFileNameWithPath = '' then
       FileSaveAs1.Execute
     else
       case MessageDlg('Save changes to "' + ExtractFileName(EditFileNameWithPath) +
        '"?', mtConfirmation, mbYesNoCancel, 0) of
       mrYes:
        SynEdit.Lines.SaveToFile(EditFileNameWithPath);
       end

End;

procedure TFrmMain.FilterOnOpenExecute(Sender: TObject);
begin
  FilterOnOpen.Checked := Not(FilterOnOpen.Checked);
end;

procedure TFrmMain.FilterOnReceiveExecute(Sender: TObject);
begin
  FilterOnReceive.Checked := Not(FilterOnReceive.Checked);
end;

procedure TFrmMain.FilterOnSendExecute(Sender: TObject);
begin
  FilterOnSend.Checked := Not(FilterOnSend.Checked);
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Inif: TCustomIniFile;
  ParityStr: String; // string reprentaton of com values for com port
  Swflow, HwFlow: String;

begin

  SaveExistingEditSession;


  try
    Inif := TMemIniFile.Create(AppDataPath + IniFileName);
    // setup section
    Inif.WriteBool(SetupSection, 'LicenseRead', LicenseRead);

    // cnc & serial port options in this section
    Inif.WriteInteger(SerialSection, 'Port', ApdComPort1.ComNumber);
    Inif.WriteInteger(SerialSection, 'Baud', ApdComPort1.Baud);
    Inif.WriteInteger(SerialSection, 'DataBits', ApdComPort1.DataBits);
    Inif.WriteInteger(SerialSection, 'StopBits', ApdComPort1.StopBits);

    case ord(ApdComPort1.Parity) of
      0:
        ParityStr := 'NONE';
      1:
        ParityStr := 'ODD';
      2:
        ParityStr := 'EVEN';
      3:
        ParityStr := 'MARK';
      4:
        ParityStr := 'SPACE';
    end;
    Inif.WriteString(SerialSection, 'Parity', ParityStr);
    // software flow, we are either none or XON/XOFF
    if ApdComPort1.SWFlowOptions = swfNone then
      Swflow := 'NONE'
    else
      Swflow := 'XON/XOFF';
    Inif.WriteString(SerialSection, 'SWFlow', Swflow);
    // Hardware Flow
    HwFlow := '';
    if hwfUseDTR in ApdComPort1.HWFlowOptions then
      HwFlow := 'DTR';
    if hwfUseRTS in ApdComPort1.HWFlowOptions then
      HwFlow := HwFlow + 'RTS';
    Inif.WriteString(SerialSection, 'HWFlow', HwFlow);

    // ProtocolSection
    Inif.WriteInteger(ProtocolSection, 'AsciiCharDelay',
      ApdProtocol1.AsciiCharDelay);
    Inif.WriteInteger(ProtocolSection, 'AsciiLineDelay',
      ApdProtocol1.AsciiLineDelay);
    Inif.WriteInteger(ProtocolSection, 'AsciiEOFTimeout',
      ApdProtocol1.AsciiEOFTimeout);
    Inif.WriteInteger(ProtocolSection, 'PortCloseTimer',
      PortCloseTimer.Interval);

    // synedt settings
    Inif.WriteString(FontSection, 'Type', SynEdit.Font.name);
    Inif.WriteInteger(FontSection, 'Size', SynEdit.Font.Size);
    Inif.WriteInteger(FontSection, 'Color', SynEdit.Font.Color);
  Finally
    Inif.UpdateFile;
    Inif.Free;
    // Except
    // ShowMessage('error updating ' + AppDataPath + IniFileName);
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  Inif: TCustomIniFile;
  IniFound: Integer;
  MyAbout: TForm;

begin

  // get the location of the ini file
  AppDataPath := GetAppDataPath;

  if AppDataPath = NOF then
  Begin
    AppDataPath := ExtractFilePath(ParamStr(0));
    ShowMessage('Unable to Locate CSIDL_APPDATA , This is not Good! Using ' +
      AppDataPath);
  end;

  AppDataPath := AppDataPath + '\' + MyAppName;
  // does the application's data directory exist?
  if not TDirectory.Exists(AppDataPath) then
  Begin
    ShowMessage(AppDataPath + ' Does not exist, Creating');
    TDirectory.CreateDirectory(AppDataPath);
  End;

  LicenseRead := False; // license acceptance?

  try
    Inif := TMemIniFile.Create(AppDataPath + IniFileName);
    // note: a TMemIniFile is believed to be more efficient than TIniFile
    IniFound := Inif.ReadInteger(MainSection, 'Width', -1);
    // if ini not found we end up with -1,

    LicenseRead := Inif.ReadBool(SetupSection, 'LicenseRead', False);
    LicenseRead := False; // for now always force license acceptance

    if not(LicenseRead) then
    begin
      MyAbout := TAboutBox.Create(nil);
      Try
        MyAbout.ShowModal
      Finally
        MyAbout.Free;
      End;
    end;
    LoadIni(Inif);
    SetDefaultFileExtension;
  finally
    Inif.Free;
  end;
  if not(LicenseRead) then
    Application.Terminate;
  //
  EditFileNameWithPath := '';   // just started, set to empty

  end;


Procedure TFrmMain.LoadIni(Inif: TCustomIniFile);
var
  ParityStr: String; // string reprentaton of parity value for com port
  HWOptsStr: String; // and hardware flow control options
  SWOptsStr: String; // and software flow control
  HWOpts: THWFlowOptionSet; // and hardware flow control options
  SWOpts: TSWFlowOptions; // and software flow control
  MyFont : TFont;
  MyFontName : String;
  MyFontSize : Integer;
  MyFontColor : Integer;

Begin
  { cnc / serial port options in this section }
  ApdComPort1.ComNumber := Inif.ReadInteger(SerialSection, 'Port',
    ApdComPort1.ComNumber);
  ApdComPort1.Baud := Inif.ReadInteger(SerialSection, 'Baud', ApdComPort1.Baud);
  ApdComPort1.DataBits := Inif.ReadInteger(SerialSection, 'DataBits',
    ApdComPort1.DataBits);
  ParityStr := Inif.ReadString(SerialSection, 'Parity', 'None');
  // set parity  {Parity type}
  // TParity = (pNone, pOdd, pEven, pMark, pSpace);
  If ParityStr = 'NONE' Then
    ApdComPort1.Parity := TParity(0)
  Else If ParityStr = 'EVEN' Then
    ApdComPort1.Parity := TParity(2)
  Else If ParityStr = 'ODD' Then
    ApdComPort1.Parity := TParity(1)
  Else If ParityStr = 'MARK' Then
    ApdComPort1.Parity := TParity(3)
  Else If ParityStr = 'SPACE' Then
    ApdComPort1.Parity := TParity(4)
  Else
    ApdComPort1.Parity := TParity(0);
  // stop bits
  ApdComPort1.StopBits := Inif.ReadInteger(SerialSection, 'StopBits',
    ApdComPort1.StopBits);
  // Hardware Flow Control
  HWOptsStr := Inif.ReadString(SerialSection, 'HWFlow', '');
  HWOpts := [];
  If Pos('DTR', HWOptsStr) > 0 Then
  Begin
    HWOpts := [hwfUseDTR, hwfRequireDSR]
  End;
  If Pos('RTS', HWOptsStr) > 0 Then
  Begin
    Include(HWOpts, hwfUseRTS);
    Include(HWOpts, hwfRequireCTS);
  End;
  ApdComPort1.HWFlowOptions := HWOpts;
  // Software Flow Control
  // note - if nothing is set, default to ApdComPort1 design setting
  SWOptsStr := Inif.ReadString(SerialSection, 'SWFlow', '');
  if Length(SWOptsStr) > 0 then // only set if something entered
  Begin
    SWOpts := swfBoth; // default to xon/xoff
    If (Pos('NONE', SWOptsStr) > 0) then // unless we specifically said none
      SWOpts := swfNone;
    ApdComPort1.SWFlowOptions := SWOpts;
  End;

  // ProtocolSection
  ApdProtocol1.AsciiCharDelay := Inif.ReadInteger(ProtocolSection,
    'AsciiCharDelay', ApdProtocol1.AsciiCharDelay);
  ApdProtocol1.AsciiLineDelay := Inif.ReadInteger(ProtocolSection,
    'AsciiLineDelay', ApdProtocol1.AsciiLineDelay);
  ApdProtocol1.AsciiEOFTimeout := Inif.ReadInteger(ProtocolSection,
    'AsciiEOFTimeout', ApdProtocol1.AsciiEOFTimeout);
  PortCloseTimer.Interval := Inif.ReadInteger(ProtocolSection, 'PortCloseTimer',
    PortCloseTimer.Interval);
    // synedt settings
  MyFontName := Inif.ReadString(FontSection, 'Type', 'Courier');
  MyFontSize := Inif.ReadInteger(FontSection, 'Size', 12);
  MyFontColor := Inif.ReadInteger(FontSection, 'Color', clBlack);
  MyFont := Synedit.Font;
  MyFont.Size :=  MyFontSize;
  MyFont.Name :=  MyFontName;
  MyFont.Color := MyFontColor;
  SynEdit.Font.Assign(MyFont);

End;


procedure TFrmMain.NewExecute(Sender: TObject);
begin
//     is there data in the editor window and has it changed, if so save it
     SaveExistingEditSession;
     SynEdit.Clear;
     EditFileNameWithPath := ''
end;

// PortcloseTimer event
procedure TFrmMain.PortCloseTimerTimer(Sender: TObject);
begin
  PortCloseTimer.Enabled := False;
  If ApdComPort1.Open Then
  Begin
    ApdComPort1.Open := False;
    ApdMode := ApdModeFree;
  End
end;

procedure TFrmMain.ProtocolOptsExecute(Sender: TObject);
begin
  ProtocolOptions.Execute;
end;

procedure TFrmMain.SendFromEditorExecute(Sender: TObject);
Var
      TmpScrFl: STRING;

    Begin
      // send from screen
      If SynEdit.Lines.Text = '' Then
      Begin
        exit
      End;
      //
      // Create a temp file and write the current editor text to it
      TmpScrFl := CreateTempFile;
      SynEdit.Lines.SaveToFile(TmpScrFl);
      //
      // FileFilter on Receive File?
      If FilterOnReceive.Checked Then
      Begin
        CNCFileFilter(TmpScrFl)
      End; // Clean the file before sending
      FrmSendRecvDlg.Memo1.Lines.Clear;
      FrmSendRecvDlg.Memo1.Lines.Add('Sending CNC Program From Screen');
      FrmSendRecvDlg.Memo1.Lines.Add('Via Temp File: ' + TmpScrFl);
      SendFile(Sender, TmpScrFl, 'Send From Screen'); // Send file to cnc

    End;

    Procedure TFrmMain.SendFile(Sender: TObject; Const FileToSend: TFileName;
      Const FileToSendPrompt: String);
    //
    // Send FileToSend out to cnc
    //
    Var
      FtSend: STRING;
      MBPrmpt: PChar;
    Begin
      // send file exists?
      If Not FileExists(FileToSend) Then
      Begin
        exit
      End;

      // Configure1Click(Sender);
      // cnc setup
      ComPortOptions.Label1.Visible := True;
      ComPortOptions.Label2.Visible := True;
      ComPortOptions.Edit1.Visible := True;
      ComPortOptions.Edit2.Visible := True;
      ComPortOptions.DTRRTS.Visible := True;

      FrmSendRecvDlg.Memo1.Visible := True;
      FrmSendRecvDlg.btnSendRecv.Caption := 'Send File';
      If FrmSendRecvDlg.ShowModal = mrOk then
      Begin
        If ApdComPort1.ComNumber = 0 Then
        Begin
          ShowMessage('No Com Port Selected');
          DeleteFile(FileToSend);
          exit;
        End;
      End
      Else
      // user did not select ok to FrmSendRecvDlg Ok Button
      Begin
        ShowMessage('Send Cancelled');
        DeleteFile(FileToSend);
        exit
      End;

      // ApdComPort1.Open :=false;   apro 4.07 mods
      // ApdDPack.Disable;
      ApdDPack.Enabled := False;


      // ComStatus.PopPortState;

      // MnuSendfromScreen.Enabled := FALSE;
      // MnuReceive.Enabled := FALSE;
      // Configure1.Enabled := FALSE;
      // MnuTestTerminal.Enabled := FALSE;
      DisableMenuItems;

      SendMode := True;
      FtSend := FileToSend;
      NameOfTempSendFile := FileToSend;
      // save the tmp file name globally, we need to delete later

      Try

        ApdComPort1.Open := True; // apro 4.07 mod
        ApdProtocol1.ProtocolType := ptAscii;
        ApdProtocol1.FileMask := FtSend;
        ApdProtocolLog1.HistoryName := ApdHistoryLogFileName;
        ApdProtocol1.StartTransmit;
      Except
        on E: Exception do
          ShowMessage
            ('Communications Send Error, Exception Class / Message raised: ' +
            E.ClassName + ' ' + E.Message);
      End;
    End;


procedure TFrmMain.SendFromFileExecute(Sender: TObject);

    Var
      TmpSendFile, FileExt: STRING;
      MBPrmpt: PChar;
    Begin
      // send a selected file to a cnc

      OpenSendDialog.Title := 'Select a G-code file to Send';
      OpenSendDialog.FileName := '';
      If OpenSendDialog.Execute Then
      Begin
        // Save selected directory for next time we open a file
        OpenSendDialog.InitialDir := ExtractFilePath(OpenSendDialog.FileName);
        // check for invalid file types
        FileExt := AnsiUpperCase(ExtractFileExt(OpenSendDialog.FileName));
        If (FileExt = '.SYS') OR (FileExt = '.DLL') OR (FileExt = '.EXE') Then
        Begin
          MBPrmpt := PChar('Sending: ' + OpenSendDialog.FileName +
            ' With CodeShark is Not Allowed');
          Application.MessageBox(MBPrmpt, 'CodeShark', MB_OK + MB_ICONWARNING +
            MB_TASKMODAL);
          exit;
        End;
        // Create a temp file and write the current editor text to it
        TmpSendFile := CreateTempFile;
        //
        // Did we get a file?
        if Not FileExists(TmpSendFile) then
        Begin
          ShowMessage('Failed To Create Transfer file, send aborted');
          exit
        End;
        //
        // Copy user selected file to our temp file
        If NOT CopyFile(PChar(OpenSendDialog.FileName), PChar(TmpSendFile),
          False) Then
        Begin
          ShowMessage('Send from File: Failed To Create Transfer Copy ' +
            SysErrorMessage(GetLastError) + ' Operation Aborted');
          exit;
        End;
        // user selected send from file, see if we should filter first
        If FilterOnSend.Checked Then
        Begin
          MBPrmpt := PChar('Filter File: ' + OpenSendDialog.FileName +
            ' Before Sending?');
          If Application.MessageBox(MBPrmpt, 'CodeShark Send File',
            MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1 + MB_APPLMODAL)
            = ID_YES Then
          Begin
            CNCFileFilter(TmpSendFile)
          End;
        End;
        FrmSendRecvDlg.Memo1.Lines.Clear;
        FrmSendRecvDlg.Memo1.Lines.Add('Sending CNC Program: ' +
          OpenSendDialog.FileName);
        FrmSendRecvDlg.Memo1.Lines.Add('Via Temp File: ' + TmpSendFile);
        SendFile(Sender, TmpSendFile, OpenSendDialog.FileName);
        // Send file to cnc
      End;

    End;


Procedure TFrmMain.SetDefaultFileExtension;

Var
  FilterIndex: Integer;
Begin
  // Set the file dialogs to the predefined filter text and Default extension
  // G Code Files (*.G)|*.G|Tape Files (*.T)|*.T|Text Files (*.TXT)|*.TXT|NC Files (*.NC)|*.NC|Program Files (*.PRO)|*.PRO|All Files (*.*)|*.*
  If FrmMain.DefaultFileExtension = 'G' Then
    FilterIndex := 1
  Else If FrmMain.DefaultFileExtension = 'T' Then
    FilterIndex := 2
  Else If FrmMain.DefaultFileExtension = 'TXT' Then
    FilterIndex := 3
  Else If FrmMain.DefaultFileExtension = 'NC' Then
    FilterIndex := 4
  Else If FrmMain.DefaultFileExtension = 'PRO' Then
    FilterIndex := 5
  Else
    FilterIndex := 6;

  OpenSendDialog.Filter := DialogFileExtensionFilter;
  OpenSendDialog.FilterIndex := FilterIndex;
  OpenSendDialog.DefaultExt := DefaultFileExtension;

  OpenRecvDialog.Filter := DialogFileExtensionFilter;
  OpenRecvDialog.FilterIndex := FilterIndex;
  OpenRecvDialog.DefaultExt := DefaultFileExtension;

  FileOpen1.Dialog.Filter := DialogFileExtensionFilter;
  FileOpen1.Dialog.InitialDir := ExtractFilePath(Application.ExeName);
  FileSaveAs1.Dialog.Filter := FileOpen1.Dialog.Filter;
  FileSaveAs1.Dialog.FilterIndex := FilterIndex;

End;

{ event handler }

procedure TFrmMain.ConfigurePortExecute(Sender: TObject);
var
  Parity: Integer;
  ParityStr: String;
  Baud: string;
  data: string;
  flow: string;

Begin
  // cnc setup
  ComPortOptions.Label1.Visible := True;
  ComPortOptions.Label2.Visible := True;
  ComPortOptions.Edit1.Visible := True;
  ComPortOptions.Edit2.Visible := True;
  ComPortOptions.DTRRTS.Visible := True;

  Begin
    if ComPortOptions.ShowModal = mrOk then
    Begin

      Baud := inttoStr(ApdComPort1.Baud);
      data := inttoStr(ApdComPort1.DataBits);
      Parity := ord(FrmMain.ApdComPort1.Parity);
      if Parity = 0 then
        ParityStr := 'NONE';
      if Parity = 1 then
        ParityStr := 'ODD';
      if Parity = 2 then
        ParityStr := 'EVEN';
      if Parity = 3 then
        ParityStr := 'MARK';
      if Parity = 4 then
        ParityStr := 'SPACE';
      flow := '/';
      if ComPortOptions.RTSCTS.Checked = True then
        flow := flow + 'RTS/';
      if ComPortOptions.DTRRTS.Checked = True then
        flow := flow + 'DTR/';
      if ComPortOptions.SoftwareXmit.Checked or ComPortOptions.SoftwareRcv.Checked
      then
        flow := flow + 'XON/XOFF';

    End;
  End;
End;


procedure TFrmMain.ActionSearchExecute(Sender: TObject);
begin
  FindDialog1.Execute;
  ActionSearchNext.Enabled := True;
  ActionSearchPrev.Enabled := True;
end;

procedure TFrmMain.ActionSearchNextExecute(Sender: TObject);
begin
  FindDialog1.Options := FindDialog1.Options + [frDown];
  DoFindText(Sender);
  SynEdit.SetFocus;
end;

procedure TFrmMain.ActionSearchPrevExecute(Sender: TObject);
begin
  FindDialog1.Options := FindDialog1.Options - [frDown];
  DoFindText(Sender);
  SynEdit.SetFocus;
end;

procedure TFrmMain.DoFindText(Sender: TObject);
var
  rOptions: TSynSearchOptions;
  dlg: TFindDialog;
  SaveEnd: TBufferCoord;
  sSearch: string;
begin
  if Sender = ReplaceDialog1 then
    dlg := ReplaceDialog1
  else
    dlg := FindDialog1;
  sSearch := dlg.FindText;
  if Length(sSearch) = 0 then
  begin
    Beep;
    Statusbar.SimpleText := 'Can''t search for empty text!';
  end
  else
  begin
    rOptions := [ssoSelectedOnly];
    if not(frDown in dlg.Options) then
      Include(rOptions, ssoBackwards);
    if frMatchCase in dlg.Options then
      Include(rOptions, ssoMatchCase);
    if frWholeWord in dlg.Options then
      Include(rOptions, ssoWholeWord);
    if SynEdit.SearchReplace(sSearch, '', rOptions) = 0 then
    begin
      Beep;
      Statusbar.SimpleText := 'SearchText ''' + sSearch + ''' not found!';
    end
    else
      Statusbar.SimpleText := '';
    if Sender = ReplaceDialog1 then
    begin
      // if we are doing a find the searchrplace dialog, push cursor back to beginning of text found
      // SynEdit.BlockEnd := SynEdit.BlockBegin;
      // SynEdit.CaretXY := SynEdit.BlockBegin;
      with SynEdit do
      begin
        if Length(SynEdit.GetWordAtRowCol(SynEdit.BlockBegin)) > 0 then
        Begin

          BeginUpdate;
          SaveEnd := BlockEnd;
          CaretXY := BlockBegin;
          BlockEnd := SaveEnd;
          EndUpdate;
        End;
      end;

    end;
  end;
  ShowStatus;
end;

procedure TFrmMain.ActionSearchReplaceExecute(Sender: TObject);
begin
  ReplaceDialog1.Execute;
end;

procedure TFrmMain.DoReplaceText(Sender: TObject);
var
  rOptions: TSynSearchOptions;
  sSearch: string;
begin
  Statusbar.SimpleText := '';
  sSearch := ReplaceDialog1.FindText;
  if Length(sSearch) = 0 then
  begin
    Beep;
    Statusbar.SimpleText := 'Can''t replace an empty text!';
  end
  else
  begin
    rOptions := [ssoReplace];
    if frMatchCase in ReplaceDialog1.Options then
      Include(rOptions, ssoMatchCase);
    if frWholeWord in ReplaceDialog1.Options then
      Include(rOptions, ssoWholeWord);
    if frReplaceAll in ReplaceDialog1.Options then
      Include(rOptions, ssoReplaceAll);
    if SynEdit.SearchReplace(sSearch, ReplaceDialog1.ReplaceText, rOptions) = 0
    then
    begin
      Beep;
      Statusbar.SimpleText := 'SearchText ''' + sSearch +
        ''' could not be replaced!';
    end
    else
      Statusbar.SimpleText := '';
  end;
  ShowStatus;
end;

procedure TFrmMain.FreeCADClick(Sender: TObject);
begin
  SetFCparmsFrm.Loadini; // make sure we have the setup info loaded for python
  // Rem     Modeless forms. Use "Application" as the owner:
  // var
  // myForm : TMyForm;
  // ...       myForm := TMyForm.Create(Application) ;
  // Now, when you terminate (exit) the application, the "Application" object will free the "myForm" instance.
  //

  // For now do not let user resart FreeCAD we need to figure out how to reinitialize the python engine and python and freeCAD
  FrmMain.FreeCADExecute.Enabled := false;

  With TFreeCadFrm.Create(Application) Do
  Begin
    // Try
    show;
    // Finally
    // Free;
    // End
  End;
end;

procedure TFrmMain.FreeCADSettings1Click(Sender: TObject);
begin
  SetFCparmsFrm.ShowModal;
end;


Procedure TFrmMain.ReceiveFile(Sender: TObject);
    // receive a file
    Begin
      OpenRecvDialog.Title := 'Select a G-code file to Receive';
      OpenRecvDialog.FileName := '';
      If OpenRecvDialog.Execute Then
      Begin
        // If ApdComPort1.ComNumber = 0 Then
        // Begin
        // Configure1Click(Sender);
        // If ApdComPort1.ComNumber = 0 Then
        // Begin
        // ShowMessage('Comm Port Not Set');
        // Exit;
        // End;
        // End;

        // cnc setup
        // Note the software flow control characters maybe hiden from view by Csrvset
        //  the module that sets com parameters for machines and also the default com parameters
        ComPortOptions.Label1.Visible := True;
        ComPortOptions.Label2.Visible := True;
        ComPortOptions.Edit1.Visible := True;
        ComPortOptions.Edit2.Visible := True;
        ComPortOptions.DTRRTS.Visible := True;

        FrmSendRecvDlg.Memo1.Visible := False;
        FrmSendRecvDlg.btnSendRecv.Caption := 'Receive File';
        If FrmSendRecvDlg.ShowModal = mrOk then
        Begin
          If ApdComPort1.ComNumber = 0 Then
          Begin
            ShowMessage('No Com Port Selected');
            exit;
          End;
        End
        Else
        // user did not select ok to FrmSendRecvDlg Ok Button
        Begin
          exit
        End;


        // ComStatus.PopPortState;

        // ApdComPort1.Open :=false;     // apro 4.07 mods
        // ApdDPack.Disable;            //
        ApdDPack.Enabled := False; //
        // RDlg.Title := 'Select a G-code file to Receive';
        // RDlg.Filename := '';
        // If RDlg.execute Then
        // Begin

        // MnuSend.Enabled := FALSE;
        // MnuReceive.Enabled := FALSE;
        // Configure1.Enabled := FALSE;
        // MnuTestTerminal.Enabled := FALSE;
        DisableMenuItems;
        RecMode := True;
        Try
          ApdComPort1.Open := True; // apro 4.07 mod
          ApdProtocol1.ProtocolType := ptAscii;
          ApdProtocol1.FileName := OpenRecvDialog.FileName;
          ApdProtocolLog1.HistoryName := ApdHistoryLogFileName;
          ApdProtocol1.StartReceive;
        Except
          on E: Exception do
          Begin
            ShowMessage
              ('Communications Receive Error, Exception Class / Message raised: '
              + E.ClassName + ' ' + E.Message);
            RecMode := False;
          End;
        End;
        // End;
      End;
    End;

procedure TFrmMain.RemoveSpacesExecute(Sender: TObject);
begin
    RemoveSpaces.Checked := Not(RemoveSpaces.Checked)
end;

procedure TFrmMain.ReceiveExecute(Sender: TObject);
begin
  ReceiveFile(Sender);
end;

Procedure TFrmMain.DisableMenuItems;
    Begin
      Receive.Enabled := False;
      ConfigurePort.Enabled := False;
      SendFromEditor.Enabled := False;
      SendFromFile.Enabled := False;
    End;

    Procedure TFrmMain.EnableMenuItems;
    Begin
      Receive.Enabled := True;
      ConfigurePort.Enabled  := True;
      SendFromEditor.Enabled := True;
      SendFromFile.Enabled := True;
      // MnuPops.Enabled := TRUE;
    End;


    Procedure TFrmMain.ApdProtocol1ProtocolFinish(CP: TObject;
      ErrorCode: Integer);
    // this event is called by ApdProtocol1, when the protocal transfer ends
    // (successfully or NOT!)

    Begin
      // logging settings
      // ApdComPort1.Logging := tlAppend;

      // ShowMessage('ApdDPackProtocolFinish fired');
      EnableMenuItems;
      //
      If SendMode = True Then
      // send mode:
      // following is a apro 4.07 mod
      // we connot determine if all data has been sent out the port prior to closing it
      // ApdComPort1.OutBuffUsed = 0 does not mean all data sent out physical port,
      // if we close port prior to data being sent out port, receiver will not get
      // all of the data.
      // SO we set a timer to close port after ?? seconds
      Begin
        SendMode := False;
        if PortCloseTimer.Interval > 0 then
          PortCloseTimer.Enabled := True
        else
          ApdComPort1.Open := False;
        If FileExists(NameOfTempSendFile) Then
        Begin
          DeleteFile(NameOfTempSendFile);
          NameOfTempSendFile := '';
        End;

      End

      Else // this is Receive Mode

      Begin
        ApdComPort1.Open := False;
        // run the CNCFileFilter to clean up (remove spaces,control codes) from received cnc program

        If FilterOnReceive.Checked AND (ErrorCode = 0) Then
        Begin
          CNCFileFilter(ApdProtocol1.FileName)
        End; // Clean the file after receiving
        If OpenOnReceive.Checked = True Then
        // open file in editor after receive is checked, see if we need to save current file
        // then open received file
        Begin
          SaveExistingEditSession;
          if SynEdit.Modified then
            case MessageDlg('Save changes to "' + ExtractFileName(EditFileNameWithPath) +
              '"?', mtConfirmation, mbYesNoCancel, 0) of
              mrYes:
                SynEdit.Lines.SaveToFile(EditFileNameWithPath);
            end;
          EditFileNameWithPath := ApdProtocol1.FileName;
          SynEdit.Lines.LoadFromFile(EditFileNameWithPath);

        End;
        RecMode := False;
      End;

    End;

    procedure TFrmMain.ApdProtocol1ProtocolStatus(CP: TObject; Options: Word);
    Var
      StateTxt: String;

    begin
      case Options of
        apFirstCall:
          Begin
          AsciiStatusF.show;
          End;
        apLastCall:
          AsciiStatusF.hide;
      else
        { show status }
        case ApdProtocol1.ProtocolState of
          taInitial:
            StateTxt := 'Prepare to transmit file';
          taGetBlock:
            StateTxt := 'Get next block to transmit';
          taWaitFreeSpace:
            StateTxt := 'Wait for free space in output buffer';
          taSendBlock:
            StateTxt := 'Start transmitting current block';
          taSendDelay:
            StateTxt := 'Wait for delay for next outgoing char/line';
          taFinishDrain:
            StateTxt := 'Wait for last data to go out';
          taFinished:
            StateTxt := 'Normal or error completion, cleanup';
          taDone:
            StateTxt := 'Done with transmit';
          raInitial:
            StateTxt := 'Prepare to receive file';
          raCollectBlock:
            StateTxt := 'Collect block';
          raProcessBlock:
            StateTxt := 'Check for ^Z, write block to disk';
          raFinished:
            StateTxt := 'Normal or error completion, cleanup';
          raDone:
            StateTxt := 'Done with receive';
        else // must be receiving
          StateTxt := 'Unknown';
        end;

        if RecMode then
        begin
          AsciiStatusF.spTimeOutSeconds.Caption :=
            IntToStr(Ticks2Secs(ApdProtocol1.EofTimerRemaining));
          AsciiStatusF.spTimoutPanel.Visible := True;
        end
        else
          AsciiStatusF.spTimoutPanel.Visible := False;

        AsciiStatusF.psState.Caption := StateTxt;

        AsciiStatusF.psFileName.Text := ApdProtocol1.FileName;
        AsciiStatusF.psProtocol.Caption :=
          ProtocolName(ApdProtocol1.ProtocolType);
        AsciiStatusF.psFileSize.Caption := IntToStr(ApdProtocol1.FileLength);
        AsciiStatusF.psBytesTransferred.Caption :=
          IntToStr(ApdProtocol1.BytesTransferred);
        AsciiStatusF.psBytesRemaining.Caption :=
          IntToStr(ApdProtocol1.BytesRemaining);
        AsciiStatusF.psStatusMsg.Caption :=
          ApdProtocol1.StatusMsg(ApdProtocol1.ProtocolStatus);
      end;
    end;

    procedure TFrmMain.ApdProtocol1ProtocolError(CP: TObject; ErrorCode: Integer);
    begin
      ShowMessage('Error: ' + IntToStr(ErrorCode))
    end;


procedure TFrmMain.Clear1stBlockExecute(Sender: TObject);
begin
  Clear1stBlock.Checked := Not(Clear1stBlock.Checked);
end;

Procedure TFrmMain.CNCFileFilter(FileToFilter: STRING);
    Var
      TmpFl, TmpFl2: TFileName; // temp files used during parse
      F1, F2: textfile;
      ChF1: File Of AnsiChar;
      Attrs, CharCount, StrPtr, lncount, LineLength: Integer;
      TermChar: Integer;
      // terminator character for filtered file (if not crlf terminateed)
      Tmpln, NewLn, LastLn: ANSISTRING;
      comment, Firstln, BOFfound, CrLfFound: Boolean;
      ch: AnsiChar;
      MBPrmpt: PChar;

    Begin

      // test for valid file name
      If NOT FileExists(FileToFilter) Then
      Begin
        MBPrmpt := PChar('Filter File: ' + FileToFilter + ' Not Found');
        Application.MessageBox(MBPrmpt, 'CodeShark File Filter',
          MB_OK + MB_ICONWARNING + MB_TASKMODAL);
        exit;
      End
      Else
      Begin
        // if read only we cannot change !
        Attrs := FileGetAttr(FileToFilter);
        If Attrs AND faReadOnly <> 0 Then
        Begin
          MBPrmpt := PChar('FilterFile: ' + FileToFilter +
            ' Read Only, Filter Not Allowed');
          Application.MessageBox(MBPrmpt, 'CodeShark File Filter',
            MB_OK + MB_ICONWARNING + MB_TASKMODAL);
          exit;
        End;
      End;

      // create temp file names

      TmpFl := CreateTempFile;
      TmpFl2 := CreateTempFile;

      If NOT CopyFile(PChar(FileToFilter), PChar(TmpFl), False) Then
      Begin
        ShowMessage('FilterFile: Failed To Create Copy ' +
          SysErrorMessage(GetLastError) + ' Filter Not Allowed');
        exit;
      End;
      //
      // pasre the file a single character at a time (looking to see if it is a true text file)
      //
      CrLfFound := False;
      // ascii Cr &  line feed found (valid text file layout)
      System.AssignFile(ChF1, TmpFl); // fl is now file to parse
      Reset(ChF1);
      CharCount := 0; // character count
      TermChar := 0;
      While NOT Eof(ChF1) Do
      Begin
        Read(ChF1, ch);
        Inc(CharCount);
        // test for <cr>
        If ord(ch) = 13 Then
        Begin
          If NOT Eof(ChF1) Then
          Begin
            TermChar := 13;
            Read(ChF1, ch);
            Inc(CharCount);
            // now look for line feed
            If ord(ch) = 10 Then
            Begin
              CrLfFound := True
            End;
          End;
        End
        // it is possible that this is a line feed terminated file, is it?
        // because we have already check for the <cr><lf> pair in the above code, if we
        // hit a <lf> here we are pretty safe assuming a <lf> terminated file.
        Else If ord(ch) = 10 Then // line feed ??
        Begin
          TermChar := 10 // line feed terminated file
        End;

        If CrLfFound Then
        Begin
          Break
        End;
      End;
      //
      // Empty File ??
      If CharCount <= 0 Then
      Begin
        // ShowMessage('FileFilter: Empty File, No Action Taken');
        CloseFile(ChF1);
        DeleteFile(TmpFl);
        DeleteFile(TmpFl2);
        exit;
      End;
      //
      If (NOT CrLfFound) AND (TermChar = 0) AND (CharCount > 0) Then
      Begin
        ShowMessage
          ('FileFilter: Cannot Determine Termination Characer, no action taken');
        CloseFile(ChF1);
        DeleteFile(TmpFl);
        DeleteFile(TmpFl2);
        exit;
      End;
      //
      // if this file is not in standard text file format then ask if user want to convert to standard format (add cr lf)
      //
      If NOT CrLfFound Then
      //
      Begin
        If Application.MessageBox
          ('File is not in standard text file format (lines not CR & LF terminated). Would you like convert to standard text file format?',
          'File Filter Message', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1 +
          MB_APPLMODAL) = ID_YES Then
        //
        // user wants file converted, do it
        //
        Begin
          AssignFile(F2, TmpFl2); // fl2 will be converted version
          Rewrite(F2);
          Reset(ChF1);
          NewLn := '';
          While NOT Eof(ChF1) Do
          Begin
            Read(ChF1, ch);
            If ord(ch) = TermChar Then
            // when we hit the term character, write out to new file
            Begin
              Writeln(F2, NewLn);
              NewLn := '';
            End
            Else
            Begin
              NewLn := NewLn + ch
            End;
          End; // while not eof loop
          CloseFile(ChF1); // This is TmpFl
          CloseFile(F2); // This is TmpFL2
          If NOT CopyFile(PChar(TmpFl2), PChar(TmpFl), False) Then
          Begin
            ShowMessage('FileFilter Text File Conversion Failed - ' +
              SysErrorMessage(GetLastError));
            exit;
          End;
        End
        Else
        //
        // user does not want file converted, we cannot do a file filter, tell user this, clean up and exit
        //
        Begin
          ShowMessage
            ('Cannot Filter Files in none text file format, no action taken');
          CloseFile(ChF1);
          DeleteFile(TmpFl);
          DeleteFile(TmpFl2);
          exit;
        End
      End

      Else // crlf test

      Begin
        CloseFile(ChF1);
      End;
      //
      // now do the actual file filter procedure
      //
      AssignFile(F1, TmpFl); // fl is now file to parse
      Reset(F1);

      //
      AssignFile(F2, TmpFl2); // fl2 will be the cleaned version
      Rewrite(F2);
      Firstln := True; // First Line Flag
      BOFfound := False; // First % found flag
      LastLn := '';
      lncount := 0; // line count
      // remove nulls, control codes,  spaces and blank lines

      While NOT Eof(F1) Do
      Begin
        Readln(F1, Tmpln);
        Inc(lncount);
        LineLength := Length(Tmpln);
        NewLn := '';
        comment := False; // comment in block flag
        For StrPtr := 1 To LineLength Do // parse each character of the line
        Begin
          ch := Tmpln[StrPtr];
          // do we strip to first % ?

          If Clear1stBlock.Checked Then
          Begin
            If NOT BOFfound Then
            Begin
              If ch = '%' Then
              Begin
                BOFfound := True
              End
              Else If lncount <= 1 Then
              Begin
                continue
              End
            End
          End; // only stirp to % on first line
          Case ch Of
            #0 .. #12:
              Begin
                continue
              End; // strip all ascii control codes except cr (0d)
            // #11..#12: continue;   // strip all ascii control codes except cr (0d)
            #14 .. #31:
              Begin
                continue
              End; // strip all ascii control codes
            #$20:
              Begin
                If comment Then
                Begin
                  NewLn := NewLn + ch
                End // keep the spaces in comments
                Else If RemoveSpaces.Checked Then
                Begin
                  continue
                End // stip other spaces if option set
                Else
                Begin
                  NewLn := NewLn + ch
                End
              End;
            '(':
              Begin
                comment := True; // set flag to not strip comments
                NewLn := NewLn + ch;
              End;
            // good character, save it
          Else
            Begin
              NewLn := NewLn + ch
            End; // this character ok, keep it
          End;
        End;
        If Length(NewLn) <> 0 Then
        Begin
          If Firstln Then
          // are we missing the starting %
          Begin
            If AddPercent.Checked AND (NewLn[1] <> '%') Then
            Begin
              Writeln(F2, '%')
            End;
            Firstln := False;
          End;
          LastLn := NewLn;
          Writeln(F2, NewLn);
        End;
      End;
      // did we end with a % ?
      If Length(LastLn) <> 0 Then
      Begin
        If (LastLn[1] <> '%') AND AddPercent.Checked Then
        Begin
          LastLn := '%';
          Writeln(F2, LastLn);
        End
      End;
      // all done, close the file to allow access by dream memo
      CloseFile(F1);
      CloseFile(F2);
      // copy back to source file
      If NOT CopyFile(PChar(TmpFl2), PChar(FileToFilter), False) Then
      Begin
        ShowMessage('FilterFile: ReWrite of ' + FileToFilter + ' ' +
          SysErrorMessage(GetLastError) + ', Filter Not Allowed');
        exit;
      End;
      DeleteFile(TmpFl);
      DeleteFile(TmpFl2);
    End;



end.
