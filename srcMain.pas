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

unit srcMain;

{$I SynEdit.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.IOUtils, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.Menus, Vcl.StdActns,
  Vcl.ActnList, System.Actions, Vcl.ActnPopup, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls, SynEditPrint,
  System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, SynEditSearch, SynEditMiscClasses,
  SynEditRegexSearch, Vcl.ExtCtrls, AdPacket, AdProtcl, AdPStat, OoMisc, AdPort,
  AwtPcl, AdSelCom, FreeCAD, ovcbase, o32lkout, ovcsplit, XMLDoc, XMLIntf;

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
    About: TAction;
    ProtocolOpts: TAction;
    SendFromFile: TAction;
    SendFromEditor: TAction;
    Receive: TAction;
    OpenOnReceive: TAction;
    New: TAction;
    ProgramSettings: TAction;
    ToolButtonFileOpen: TToolButton;
    SynEditRegexSearch: TSynEditRegexSearch;
    MiniEdit: TAction;
    RemoveSpaces: TAction;
    SeqNumbers: TAction;
    ToolRenumber: TAction;
    OvcSplitter1: TOvcSplitter;
    O32LookoutBar1: TO32LookoutBar;
    SynEdit: TSynEdit;
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure DialogPrintDlg1Accept(Sender: TObject);
    procedure DialogFontEdit1FontDialogApply(Sender: TObject; Wnd: HWND);
    procedure GutterExecute;
    procedure DialogFontEdit1BeforeExecute(Sender: TObject);

    procedure ActionSearchExecute(Sender: TObject);
    procedure ActionSearchNextExecute(Sender: TObject);
    procedure ActionSearchPrevExecute(Sender: TObject);
    procedure ActionSearchReplaceExecute(Sender: TObject);
    procedure actSearchUpdate(Sender: TObject);
    procedure ActionSearchReplaceUpdate(Sender: TObject);
    procedure SynEditorReplaceText(Sender: TObject;
      const ASearch, AReplace: UnicodeString; Line, Column: Integer;
      var Action: TSynReplaceAction);
    procedure ShowFileName;
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
    Procedure SendFile(Sender: TObject; Const FileToSend: TFileName;
      Const FileToSendPrompt: String);
    Procedure ReceiveFile(Sender: TObject);
    Procedure DisableMenuItems;
    Procedure EnableMenuItems;
    procedure ReceiveExecute(Sender: TObject);
    procedure SendFromEditorExecute(Sender: TObject);
    Procedure ApdProtocol1ProtocolFinish(CP: TObject; ErrorCode: Integer);
    procedure ApdProtocol1ProtocolStatus(CP: TObject; Options: Word);
    procedure ApdProtocol1ProtocolError(CP: TObject; ErrorCode: Integer);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure NewExecute(Sender: TObject);
    procedure SaveExistingEditSession;
    procedure PortCloseTimerTimer(Sender: TObject);
    procedure AboutExecute(Sender: TObject);
    procedure ProgramSettingsExecute(Sender: TObject);
    procedure OpenOnReceiveExecute(Sender: TObject);
    Function ParityChar: CHAR;
    Function FlowChar: STRING;
    procedure FormShow(Sender: TObject);
    procedure MiniEditExecute(Sender: TObject);
    procedure EnableOptions;
    procedure SynEditKeyPress(Sender: TObject; var Key: Char);
    procedure RemoveSpacesExecute(Sender: TObject);
    procedure ToolRenumberExecute(Sender: TObject);
    procedure SeqNumbersExecute(Sender: TObject);
    Procedure AddLN;
    Procedure RmvLn;
    Function FindNumEnd(SearchSt: STRING; Strt: INTEGER): INTEGER;
    procedure O32LookoutBar1ItemClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; Index: Integer);
    procedure LoadLookoutBar(Sender: TObject);
    Function ExeScript(ScriptLine : String): Boolean;
  private
    { Private declarations }
    FSearchFromCaret: Boolean;
    procedure DoSearchReplaceText(AReplace: Boolean; ABackwards: Boolean);
    procedure ShowSearchReplaceDialog(AReplace: Boolean);
  public

    { Public declarations }
    EditFileNameWithPath: String;
    AppDataPath: string;

    DefaultFileExtension: String;
    // Default File Extension used on open / save dialogs
  end;

const
  MyAppName = 'CodeSharkFCs';
  AppDataName = PathDelim + MyAppName;
  IniFileName = PathDelim + 'CodeSharkFCs.ini';
  GTemplates =  PathDelim + 'CSFCgTemplates.xml';  //   -G Code template xml file
  CurVersion = '0.11';

  ApdModeFree = 0; // Not send or recieve in process
  ApdModeSend = 1; // send in process
  ApdModeRecv = 2; // receive in process

  DialogFileExtensionFilter =
    'G Code Files (*.G)|*.G|Tape Files (*.T)|*.T|Text Files (*.TXT)|*.TXT|NC Files (*.NC)|*.NC|Program Files (*.PRO)|*.PRO|All Files (*.*)|*.*';
  // ini file sections
  MainSection = 'Window';
  FontSection = 'Font';
  ColorsSection = 'Colors';
  DefaultsSection = 'Defaults';
  SetupSection = 'Setup';
  SerialSection = 'SerialPort';
  ProtocolSection = 'Protocol';
  FilterSection = 'FileFilter';
  NOF = '--nof--';

  STextNotFound = 'Text not found';

  O32LookoutBarGCodeMaxFolders = 20;
  O32LookoutBarGCodeMaxItems = 20;

var
  FrmMain: TFrmMain;
  MyFreeCADFrm : TFreeCadFrm;
  // flags set in SetFCparms, read from CodeSharkFC.ini
  LicenseRead: Boolean; // if set do not show about screen on startup
  ApdMode: Integer; // flags mode AdpProtocal is in (send, recv, free)
  NameOfTempSendFile: String;
  // Name of the temp file created to give to Aysnc Pro to Transfer
  // Fully qualified path and file name of temp file used for send operation need to know so we can delete it
  SendMode, RecMode: Boolean;
  // Sending a file (SendMode=True) or Receving a file (RecMode=true)

  FirstPassOnActive: Boolean;
  // First Pass Flag for On Active Event - for code we only want to execute once.
  AproHstFn: TFileName; // holds history file name for serial communication
  AproTrcFn: TFileName; // holds Trace file name for serial communication

  PortCloseTime, PortCloseTimeRemaining: Integer;
  // Counters used for close port timer

  // Search / Replace Flags
  // options - to be saved to the registry
  gbSearchBackwards: Boolean;
  gbSearchCaseSensitive: Boolean;
  gbSearchFromCaret: Boolean;
  gbSearchSelectionOnly: Boolean;
  gbSearchTextAtCaret: Boolean;
  gbSearchWholeWords: Boolean;
  gbSearchRegex: Boolean;

  gsSearchText: string;
  gsSearchTextHistory: string;
  gsReplaceText: string;
  gsReplaceTextHistory: string;

  // array to hold g code strings loaded into o32Lookoutbar (as read from CSFCgTemplates.xml -G Code template xml file)
  O32LookoutBarGCodeText : array[0..O32LookoutBarGCodeMaxFolders-1, 0..O32LookoutBarGCodeMaxItems-1] of string;
  O32LookoutBarGCodeType : array[0..O32LookoutBarGCodeMaxFolders-1, 0..O32LookoutBarGCodeMaxItems-1] of string;


implementation

{$R *.DFM}

uses
  ShellAPI, ShlObj, SetFCparms,  About, PortClsTime,
  cmset, ptops, Settings, AsciistatusU, SendRecvDlg, lnum, tnum,
  dlgSearchText, dlgReplaceText, dlgConfirmReplace, plgSearchHighlighter,
  SynEditTypes, SynEditMiscProcs;

Function FindScriptFileName(indata : String) : string;
Var
i, j  : integer;
scriptName : String;

begin
  Result := '';
  ScriptName := '';
  i := Pos('import',indata);
  if i > 0 then
  // we found import, now pull off file name
  begin
    // from the character after 'import' to the end of the string, look for script file name (termimated by ';')
    for j := i+6 to length(indata) do
      if indata[j] = ' ' then
      // space
        continue
      else if indata[j] = ';' then
        break
      else
        scriptName := scriptName +  indata[j];
     Result := scriptName;
  end;
end;

Function TFrmMain.ParityChar: CHAR;
Begin
  Case FrmMain.ApdComPort1.Parity Of
    pNone:
      Begin
        Result := 'N'
      End;
    pOdd:
      Begin
        Result := 'O'
      End;
    pEven:
      Begin
        Result := 'E'
      End;
    pMark:
      Begin
        Result := 'M'
      End;
    pSpace:
      Begin
        Result := 'S'
      End;
  Else
    Begin
      Result := 'N'
    End;
  End;
End;

Function TFrmMain.FlowChar: STRING;
Begin
  Case FrmMain.ApdComPort1.SWFlowOptions Of
    swfBoth:
      Begin
        Result := 'Xon/Xoff'
      End;
    swfNone:
      Begin
        Result := 'None'
      End;
    swfReceive:
      Begin
        Result := 'Receive Only Xon/Xoff'
      End;
    swfTransmit:
      Begin
        Result := 'Send Only Xon/Xoff'
      End;
  Else
    Begin
      Result := 'Hardware'
    End;
  End;
End;

procedure TFrmMain.ShowFileName;
begin
  FrmMain.Caption := EditFileNameWithPath + ' - ' + MyAppName;
end;

procedure TFrmMain.GutterExecute;
begin
  SynEdit.Gutter.Visible := FrmSettings.GutterCB.Checked;
  SynEdit.Gutter.ShowLineNumbers := FrmSettings.NbrsOnGutterCB.Checked;
end;

procedure TFrmMain.ActSaveExecute(Sender: TObject);
// save menu item clicked on
begin
  if EditFileNameWithPath = '' then
    FileSaveAs1.Execute
  else
    SynEdit.Lines.SaveToFile(EditFileNameWithPath);
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
Var
  TmpFl: TFileName;

begin
  EditFileNameWithPath := FileOpen1.Dialog.FileName;

  If FrmSettings.FilterOnOpenCB.Checked Then
  Begin
    TmpFl := TPath.GetTempFileName;
    If NOT CopyFile(PChar(EditFileNameWithPath), PChar(TmpFl), FALSE) Then
    Begin
      ShowMessage('File Open - Copy Read only Failed - ' +
        SysErrorMessage(GetLastError));
      exit;
    End;
    //
    // now perform the filefilter
    //
    CNCFileFilter(TmpFl);
    SynEdit.Lines.LoadFromFile(TmpFl);
    DeleteFile(TmpFl)

  End
  Else
    SynEdit.Lines.LoadFromFile(EditFileNameWithPath);
  ShowFileName;
end;

procedure TFrmMain.FileOpen1BeforeExecute(Sender: TObject);
begin
  // is there data in the editor window and has it changed?
  SaveExistingEditSession;
  FileOpen1.Dialog.FileName := '';
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
      case MessageDlg('Do You Wish to Save This File Before Closing? ', mtConfirmation, mbYesNo, 0) of
        mrYes:
          FileSaveAs1.Execute
      end
    else
      case MessageDlg('Save changes to "' +
        ExtractFileName(EditFileNameWithPath) + '"?', mtConfirmation,
        mbYesNoCancel, 0) of
        mrYes:
          SynEdit.Lines.SaveToFile(EditFileNameWithPath);
      end

End;

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
    Inif.WriteInteger(ProtocolSection, 'PortCloseTimer', PortCloseTime);

    // synedt settings
    Inif.WriteString(FontSection, 'Type', SynEdit.Font.name);
    Inif.WriteInteger(FontSection, 'Size', SynEdit.Font.Size);
    Inif.WriteInteger(FontSection, 'Color', SynEdit.Font.Color);

    // FileFiler
    Inif.WriteBool(FilterSection, 'FilterOnOpen',
      FrmSettings.FilterOnOpenCB.Checked);
    Inif.WriteBool(FilterSection, 'FilterOnReceive',
      FrmSettings.FilterOnReceiveCB.Checked);
    Inif.WriteBool(FilterSection, 'FilterOnSend',
      FrmSettings.FilterOnSendCB.Checked);
    Inif.WriteBool(FilterSection, 'AddPercent',
      FrmSettings.AddPercentCB.Checked);
    Inif.WriteBool(FilterSection, 'Clear1stBlock',
      FrmSettings.Clear1stBlockCB.Checked);
    Inif.WriteBool(FilterSection, 'RemoveSpaces',
      FrmSettings.RemoveSpacesCB.Checked);

    // defaults
    Inif.WriteString(DefaultsSection, 'DfltFileExt', DefaultFileExtension);
    Inif.WriteBool(DefaultsSection, 'OpenOnReceive', OpenOnReceive.Checked);
    Inif.WriteBool(DefaultsSection, 'GutterVisible', FrmSettings.GutterCB.Checked);
    Inif.WriteBool(DefaultsSection, 'NbrsOnGutter',  FrmSettings.NbrsOnGutterCB.Checked);
    Inif.WriteBool(DefaultsSection, 'ForceUpperCase',FrmSettings.ForceUpperCaseCB.Checked);

  Finally
    Inif.UpdateFile;
    Inif.Free;
    // Except
    // ShowMessage('error updating ' + AppDataPath + IniFileName);
  end;

end;

procedure TFrmMain.FormCreate(Sender: TObject);

begin
  // get the location of the ini file
  AppDataPath := TPath.GetCachePath;

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

  AproHstFn := AppDataPath + '\APRO.HIS';
  ApdProtocolLog1.HistoryName := AproHstFn;
  AproTrcFn := AppDataPath + '\APRO.LOG';
  //
  EditFileNameWithPath := ''; // just started, set to empty

  // setup the highlighter
  with TSearchTextHightlighterSynEditPlugin.Create(SynEdit) do
  begin
    Attribute.Background := $0078AAFF;
  end;

  MyFreeCADFrm := nil;

end;

Procedure TFrmMain.FormShow(Sender: TObject);
var
  Inif: TCustomIniFile;
  MyAbout: TForm;

begin
  LicenseRead := FALSE; // license acceptance?

  try
    Inif := TMemIniFile.Create(AppDataPath + IniFileName);
    // note: a TMemIniFile is believed to be more efficient than TIniFile

    LicenseRead := Inif.ReadBool(SetupSection, 'LicenseRead', FALSE);

    if not(LicenseRead) then
      AboutBox.ShowModal;
    LoadIni(Inif);
  finally
    Inif.Free;
  end;
  //
  if not(LicenseRead) then
  begin
    ShowMessage('License Not Accepted, Terminating Appliation');
    Application.Terminate;
  end;

  EnableOptions;
  //
  SetDefaultFileExtension;
  GutterExecute;
  LoadLookoutBar(sender);
end;

Procedure TFrmMain.LoadIni(Inif: TCustomIniFile);
var
  ParityStr: String; // string reprentaton of parity value for com port
  HWOptsStr: String; // and hardware flow control options
  SWOptsStr: String; // and software flow control
  HWOpts: THWFlowOptionSet; // and hardware flow control options
  SWOpts: TSWFlowOptions; // and software flow control
  MyFont: TFont;
  MyFontName: String;
  MyFontSize: Integer;
  MyFontColor: Integer;

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
  PortCloseTime := Inif.ReadInteger(ProtocolSection, 'PortCloseTimer', 5);
  // default it 5 seconds
  // synedt settings
  MyFontName := Inif.ReadString(FontSection, 'Type', 'Courier');
  MyFontSize := Inif.ReadInteger(FontSection, 'Size', 12);
  MyFontColor := Inif.ReadInteger(FontSection, 'Color', clBlack);
  MyFont := SynEdit.Font;
  MyFont.Size := MyFontSize;
  MyFont.name := MyFontName;
  MyFont.Color := MyFontColor;
  SynEdit.Font.Assign(MyFont);
  // FileFiler
  FrmSettings.FilterOnOpenCB.Checked := Inif.ReadBool(FilterSection,
    'FilterOnOpen', FrmSettings.FilterOnOpenCB.Checked);
  FrmSettings.FilterOnReceiveCB.Checked := Inif.ReadBool(FilterSection,
    'FilterOnReceive', FrmSettings.FilterOnReceiveCB.Checked);
  FrmSettings.FilterOnSendCB.Checked := Inif.ReadBool(FilterSection,
    'FilterOnSend', FrmSettings.FilterOnSendCB.Checked);
  FrmSettings.AddPercentCB.Checked := Inif.ReadBool(FilterSection, 'AddPercent',
    FrmSettings.AddPercentCB.Checked);
  FrmSettings.Clear1stBlockCB.Checked := Inif.ReadBool(FilterSection,
    'Clear1stBlock', FrmSettings.Clear1stBlockCB.Checked);
  FrmSettings.RemoveSpacesCB.Checked := Inif.ReadBool(FilterSection,
    'RemoveSpaces', FrmSettings.RemoveSpacesCB.Checked);

  // defaults
  DefaultFileExtension := Inif.ReadString(DefaultsSection, 'DfltFileExt', 'T');
  OpenOnReceive.Checked := Inif.ReadBool(DefaultsSection,
    'OpenOnReceive', FALSE);
  FrmSettings.GutterCB.Checked := Inif.ReadBool(DefaultsSection,
    'GutterVisible', FrmSettings.GutterCB.Checked);
  FrmSettings.NbrsOnGutterCB.Checked := Inif.ReadBool(DefaultsSection,
    'NbrsOnGutter', FrmSettings.NbrsOnGutterCB.Checked);
  FrmSettings.ForceUpperCaseCB.Checked := Inif.ReadBool(DefaultsSection,
    'ForceUpperCase', FrmSettings.ForceUpperCaseCB.Checked);

  If DefaultFileExtension = 'G' Then
    FrmSettings.FileExtLBX.ItemIndex := 0
  Else If DefaultFileExtension = 'T' Then
    FrmSettings.FileExtLBX.ItemIndex := 1
  Else If DefaultFileExtension = 'TXT' Then
    FrmSettings.FileExtLBX.ItemIndex := 2
  Else If DefaultFileExtension = 'NC' Then
    FrmSettings.FileExtLBX.ItemIndex := 3
  Else If DefaultFileExtension = 'PRO' Then
    FrmSettings.FileExtLBX.ItemIndex := 4
  Else
    FrmSettings.FileExtLBX.ItemIndex := 5;

End;

 procedure TFrmMain.LoadLookoutBar(Sender: TObject);
 //
 // Procedure loads information from codeshark g code template file into the lookout bar
 // allowing user defined canned g-code text to be entered into editor window
 //
var
  XmlFile: TXMLDocument;
  MainNode, FolderNode, ItemNode: IXMLNode;
  folders, folder, items, item, imageIdx : Integer;
  XMLPath: string;
  FolderName, ItemName, ItemText, imageTxt, ItemType : String;
begin
  XMLPath := ExtractFileDir(Application.ExeName) + GTemplates;
  UseLatestCommonDialogs:= false;
  if Not fileexists(XMLPath) then
    Showmessage(' G Code Templates File not found: ' + XMLPath)
  Else
  Begin
    XmlFile := TXMLDocument.Create(Application);
    try
    try
      XmlFile.LoadFromFile(XMLPath);
      XmlFile.Active := True;


      MainNode := XmlFile.DocumentElement;


      folders := MainNode.ChildNodes['Folders'].ChildNodes.Count;
      // dont overflow O32LookoutBarGCodeText array
      if folders > O32LookoutBarGCodeMaxFolders  then
        folders := O32LookoutBarGCodeMaxFolders;

      for folder := 0 to folders - 1 do
      begin
        // new folder
        FolderNode := MainNode.ChildNodes['Folders'].ChildNodes[folder];
        // get name
        FolderName :=   FolderNode.ChildNodes['folder_name'].Text ;
        // add to lookout bar
        O32LookoutBar1.InsertFolder(FolderName,folder);
        // now add the item for this folde
        Items     := FolderNode.ChildNodes['Items'].ChildNodes.Count;
        // dont overflow O32LookoutBarGCodeText array
        if Items > O32LookoutBarGCodeMaxItems then
          Items :=  O32LookoutBarGCodeMaxItems;


        for item:= 0 to ItemS - 1 do
        begin
          ItemNode := FolderNode.ChildNodes['Items'].ChildNodes[item];
          ItemName := ItemNode.ChildNodes['item_name'].Text;
          ItemType := ItemNode.ChildNodes['item_type'].Text;
          ItemText := ItemNode.ChildNodes['item_text'].Text;
          ImageTxt := ItemNode.ChildNodes['item_imageidx'].Text;
          if TryStrToInt(ImageTxt, ImageIdx) then
            O32LookoutBar1.InsertItem(ItemName,folder,item,ImageIdx)
          else
            O32LookoutBar1.InsertItem(ItemName,folder,item,-1);

          O32LookoutBarGCodeText[folder,item] := ItemText;
          O32LookoutBarGCodeType[folder,item] := ItemType;
        end;
      end;
    except
      on E: Exception do ShowMessage('Problems Parsing ' + XMLPath + #13#10 +  E.Message);
    end;


    finally
      FreeAndNil(XmlFile);
    end;
  End;
end;

procedure TFrmMain.EnableOptions;
Begin
  MiniEdit.Enabled := FileExists(IncludeTrailingBackSlash(ExtractFilePath(Application.exename)) +
    'MINIEDIT.EXE');
End;


procedure TFrmMain.MiniEditExecute(Sender: TObject);
Var
  ShCmdLn, ShCmdpm: STRING;
  formWidth: INTEGER;
  sformTop, sformLeft, sformWidth, sformHeight: STRING;
Begin
  // mini edit plugin
  // shrink current form width for mini edit window
  formWidth := (FrmMain.Width) DIV 2;
  If formWidth < 300 Then
  Begin
    formWidth := 300
  End;
  FrmMain.Width :=  formWidth;
  sformWidth := IntToStr(formWidth);
  sformHeight := IntToStr(FrmMain.Height);
  sformLeft := IntToStr(FrmMain.Left + FrmMain.Width);
  sformTop := IntToStr(FrmMain.Top);

  ShCmdLn := IncludeTrailingBackSlash(ExtractFilePath(Application.exename)) +
    'MINIEDIT.EXE';
  ShCmdpm := 'TOP ' + sformTop + ' LEFT ' + sformLeft + ' HEIGHT ' + sformHeight
    + ' WIDTH ' + sformWidth;
  ShellExecute(GetDesktopWindow(), NIL, PCHAR(ShCmdLn), PCHAR(ShCmdpm), NIL,
    SW_SHOWNORMAL);
End;

procedure TFrmMain.NewExecute(Sender: TObject);
begin
  // is there data in the editor window and has it changed, if so save it
  SaveExistingEditSession;
  SynEdit.Clear;
  EditFileNameWithPath := '';
  ShowFileName;
end;

procedure TFrmMain.O32LookoutBar1ItemClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; Index: Integer);
Var
 InsertString : String;
 SplittedString : TArray<String>;
 i : integer;

begin
   // Is this a static or dynamic (python script) action?
   if O32LookoutBarGCodeType[O32LookoutBar1.ActiveFolder,Index] = 'static' then
   begin
     InsertString :=  O32LookoutBarGCodeText[O32LookoutBar1.ActiveFolder,Index];
     SplittedString := InsertString.Split(['\n']);
     SynEdit.CaretX := 0;
     for i := 0 to Length(SplittedString)-1 do
     Begin
       If SynEdit.Lines.Text = '' Then
         SynEdit.Lines.Insert(0,SplittedString[i])
       else
         SynEdit.Lines.Insert(SynEdit.CaretY,SplittedString[i]);
       SynEdit.CaretY := SynEdit.CaretY + 1;
     End;
   end
   else if O32LookoutBarGCodeType[O32LookoutBar1.ActiveFolder,Index] = 'pyscript' then
   // assume dynamic - python script
   begin
     ExeScript(O32LookoutBarGCodeText[O32LookoutBar1.ActiveFolder,Index]);
   end
   else
    showmessage('Unknown User Def Type, ' + O32LookoutBarGCodeType[O32LookoutBar1.ActiveFolder,Index] + ' Folder: ' + IntTOStr(O32LookoutBar1.ActiveFolder) + ' Item: ' + IntToStr(Index));

end;

function TFrmMain.ExeScript(ScriptLine : String): Boolean;
Var
  ScriptFileName : String;
begin
  ScriptFileName := ExtractFilePath(Application.ExeName)+ FindScriptFileName(ScriptLine) + '.py';
  if FileExists(ScriptFileName) then
  Begin

    if MyFreeCADFrm <> nil then
    Begin

      if FreeCad.FreeCADPid  > 0 then
      Begin
       // execute the script
        try
          //MaskFPUExceptions(True);
          MyFreeCADFrm.PythonEngine1.ExecString(ScriptLine);
        Except
          on E: Exception do
          begin
            ShowMessage('Exception On Generate Path Script, class name = ' +
              E.ClassName + #13#10 + 'Exception message = ' + E.Message);
            Result := False;
          end;

        end;
      End
      else
        ShowMessage('It does not appear that FreeCAD has been started, Cannot Execute Python Script');
    End
    else
      ShowMessage('It does not appear that FreeCAD Interface has been created, Cannot Execute Python Script');
    End
    else
      ShowMessage('Cannot Find Script File: ' + ScriptFileName + ', No Action Taken');
end;



procedure TFrmMain.OpenOnReceiveExecute(Sender: TObject);
begin
  OpenOnReceive.Checked := Not(OpenOnReceive.Checked);
end;

// PortcloseTimer event
procedure TFrmMain.PortCloseTimerTimer(Sender: TObject);
begin
  dec(PortCloseTimeRemaining);
  FrmPortClsTm.SecToClsLBL.Caption := inttoStr(PortCloseTimeRemaining);
  if PortCloseTimeRemaining <= 0 then
  begin
    FrmPortClsTm.Hide;
    PortCloseTimer.Enabled := FALSE;
    if FrmSettings.TracingCB.Checked then
      ApdComPort1.AddStringToLog('Close Port Time Expired');
    If ApdComPort1.Open Then
    Begin
      ApdComPort1.Open := FALSE;
      if FrmSettings.TracingCB.Checked then
        ApdComPort1.Logging := tldump;
      ApdMode := ApdModeFree;
    End
  end;
end;

procedure TFrmMain.ProgramSettingsExecute(Sender: TObject);
begin
  FrmSettings.ShowModal;
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
  TmpScrFl := TPath.GetTempFileName;
  SynEdit.Lines.SaveToFile(TmpScrFl);
  //

  // FileFilter on Receive File?
  If FrmSettings.FilterOnReceiveCB.Checked Then
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
    If Not(IsPortAvailable(FrmMain.ApdComPort1.ComNumber)) then
    Begin
      ShowMessage('Set Com Port: ' + IntToStr(ApdComPort1.ComNumber) + ' Not Valid');
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
  ApdDPack.Enabled := FALSE;


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

    if FrmSettings.TracingCB.Checked then
    begin
      ApdComPort1.Logging := tlon;
      ApdComPort1.LogName := AproTrcFn;
    end;

    ApdComPort1.Open := True; // apro 4.07 mod
    ApdProtocol1.ProtocolType := ptAscii;
    ApdProtocol1.FileMask := FtSend;
    ApdProtocolLog1.HistoryName := AproHstFn;
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
    TmpSendFile := TPath.GetTempFileName;
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
      FALSE) Then
    Begin
      ShowMessage('Send from File: Failed To Create Transfer Copy ' +
        SysErrorMessage(GetLastError) + ' Operation Aborted');
      exit;
    End;
    // user selected send from file, see if we should filter first
    If FrmSettings.FilterOnSendCB.Checked Then
    Begin
      MBPrmpt := PChar('Filter File: ' + OpenSendDialog.FileName +
        ' Before Sending?');
      If Application.MessageBox(MBPrmpt, 'CodeShark Send File',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1 + MB_APPLMODAL) = ID_YES Then
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

procedure TFrmMain.SeqNumbersExecute(Sender: TObject);
Begin
  // line numbers
  FrmLN.showmodal;
  If FrmLN.modalresult = mrCancel Then
  Begin
    exit
  End;
  If FrmLN.RBRmv.Checked = TRUE Then
  Begin
    RmvLN
  End;
  If FrmLN.RBIns.Checked = TRUE Then
  Begin
    AddLN
  End;
  SynEdit.SetFocus;
  SynEdit.Refresh;
End;

 Procedure TFrmMain.RmvLN;
Var
  Vptr, NumEnd, TsPtr, CmtPtr: INTEGER;
  I: LONGINT;
  Nstr: STRING;
Begin
  // remove line numbers
  Vptr := 0;
  I := 0;
  NumEnd := 0;
  CmtPtr := 0;
  TsPtr := 0;

  For I := 0 To SynEdit.lines.count - 1 Do
  Begin
    TsPtr := Pos('[', SynEdit.lines[I]);
    CmtPtr := Pos('(', SynEdit.lines[I]);
    If (TsPtr = 0) AND (CmtPtr = 0) Then
    Begin
      Vptr := Pos('N', SynEdit.lines[I]);
      If Vptr = 1 Then // N must be first char in line to remove
      Begin
        NumEnd := FindNumEnd(SynEdit.lines[I], Vptr + 1);
        Nstr := Copy(SynEdit.lines[I], Vptr + NumEnd, Length(SynEdit.lines[I]));
        SynEdit.lines[I] := Trim(Nstr);
      End;
    End; // toolsheet check
  End; // loop
End;

Procedure TFrmMain.AddLN;
Var
  SeqSt, SeqInc, SeqNum, TsPtr, PrcPtr, OnmPtr, CmtPtr: INTEGER;
  Vptr, NumEnd, M30Ptr, M99Ptr: INTEGER;
  I: LONGINT;
  Nstr: STRING;

Begin
  // add line numbers
  Vptr := 0;
  SeqSt := 0;
  SeqInc := 0;
  SeqNum := 0;
  I := 0;
  NumEnd := 0;
  TsPtr := 0;
  PrcPtr := 0;
  OnmPtr := 0;
  CmtPtr := 0;
  M30Ptr := 0;
  M99Ptr := 0;

  SeqSt := FrmLN.SEditStart.Value;
  SeqInc := FrmLN.SEditInc.Value;
  SeqNum := SeqSt - SeqInc;

  For I := 0 To SynEdit.lines.count - 1 Do
  Begin
    TsPtr := Pos('[', SynEdit.lines[I]);
    PrcPtr := Pos('%', SynEdit.lines[I]);
    OnmPtr := Pos('O', SynEdit.lines[I]);
    CmtPtr := Pos('(', SynEdit.lines[I]);
    M30Ptr := Pos('M30', SynEdit.lines[I]);
    M99Ptr := Pos('M99', SynEdit.lines[I]);

    If (TsPtr = 0) AND (PrcPtr = 0) AND (CmtPtr = 0) AND (OnmPtr = 0) AND
      (M30Ptr = 0) AND (M99Ptr = 0) AND (SynEdit.lines[I] <> '') Then
    Begin
      Vptr := Pos('N', SynEdit.lines[I]);
      If Vptr = 1 Then
      Begin
        NumEnd := FindNumEnd(SynEdit.lines[I], Vptr + 1);
        Nstr := Copy(SynEdit.lines[I], Vptr + NumEnd, Length(SynEdit.lines[I]));
        SynEdit.lines[I] := Trim(Nstr);
      End
      Else
      Begin
        If FrmLN.CBoxLead.Checked = TRUE Then
        Begin
          Nstr := 'N0' + IntToStr(SeqNum + SeqInc)
        End
        Else
        Begin
          Nstr := 'N' + IntToStr(SeqNum + SeqInc)
        End;
        If FrmLN.CBoxAdd.Checked = TRUE Then
        Begin
          Nstr := Nstr + ' '
        End;
        Nstr := Nstr + SynEdit.lines[I];
        SynEdit.lines[I] := Trim(Nstr);
      End;
      // increment Seq#
      SeqNum := SeqNum + SeqInc;
    End; // ToolSheet
  End; // loop
End;

Function TFrmMain.FindNumEnd(SearchSt: STRING; Strt: INTEGER): INTEGER;
Var
  N: INTEGER;
  S, Code: INTEGER;
  CV: STRING;
Begin
  result := 0;
  For N := Strt To Length(SearchSt) Do
  Begin
    CV := Copy(SearchSt, N, 1);
    If CV = ' ' Then
    Begin
      continue
    End; // allow for spaces inbetween letter and value
    val(CV, S, Code);
    If Code <> 0 Then
    Begin
      result := N - 1;
      If (CV <> '.') AND (CV <> '-') Then
      Begin
        Break
      End;
    End
    Else
    Begin
      result := N
    End;
    If result = (Strt - 1) Then
    Begin
      result := result + 1
    End;
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
  FileOpen1.Dialog.FilterIndex := FilterIndex;
  // FileOpen1.Dialog.InitialDir := ExtractFilePath(Application.ExeName);
  FileSaveAs1.Dialog.Filter := FileOpen1.Dialog.Filter;
  FileSaveAs1.Dialog.FilterIndex := FilterIndex;
  FileSaveAs1.Dialog.DefaultExt := DefaultFileExtension;

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

Procedure TFrmMain.ReceiveFile(Sender: TObject);
// receive a file , if open on receive checked then handle existing editor file
Begin

  if OpenOnReceive.Checked then
    if SynEdit.Lines.Count > 0 then
      NewExecute(self);

  OpenRecvDialog.Title := 'Select a G-code file to Receive';
  OpenRecvDialog.FileName := '';
  If OpenRecvDialog.Execute Then
  Begin
    if FileExists(OpenRecvDialog.FileName) then
    begin
      If MessageDlg('OverWrite File: ' + OpenRecvDialog.FileName,
        mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrNo then
        exit;
    end;

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
    // the module that sets com parameters for machines and also the default com parameters
    ComPortOptions.Label1.Visible := True;
    ComPortOptions.Label2.Visible := True;
    ComPortOptions.Edit1.Visible := True;
    ComPortOptions.Edit2.Visible := True;
    ComPortOptions.DTRRTS.Visible := True;

    FrmSendRecvDlg.Memo1.Visible := FALSE;
    FrmSendRecvDlg.btnSendRecv.Caption := 'Receive File';
    If FrmSendRecvDlg.ShowModal = mrOk then
    Begin
      If Not(IsPortAvailable(FrmMain.ApdComPort1.ComNumber)) then
      Begin
        ShowMessage('Set Com Port: ' + IntToStr(ApdComPort1.ComNumber) + ' Not Valid');
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
    ApdDPack.Enabled := FALSE; //
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
      ApdProtocolLog1.HistoryName := AproHstFn;
      // dispatch tracing?
      if FrmSettings.TracingCB.Checked then
      begin
        ApdComPort1.Logging := tldump;
        ApdComPort1.LogName := AproTrcFn;
      end;
      ApdProtocol1.StartReceive;
    Except
      on E: Exception do
      Begin
        ShowMessage
          ('Communications Receive Error, Exception Class / Message raised: ' +
          E.ClassName + ' ' + E.Message);
        RecMode := FALSE;
      End;
    End;
    // End;
  End;
End;

procedure TFrmMain.RemoveSpacesExecute(Sender: TObject);
Var
  S: LONGINT;
  RmvStr: STRING;

Begin
  // remove spaces from program (char #32)
  // and blank lines
  For S := 0 To SynEdit.lines.count - 1 Do
  Begin
    // remove spaces from lines
    RmvStr := SynEdit.lines[S];
  	SynEdit.lines[S] := StringReplace(RmvStr, ' ', '', [rfReplaceAll]); //Remove spaces
  End;
End;

procedure TFrmMain.ReceiveExecute(Sender: TObject);
begin
  ReceiveFile(Sender);
end;

Procedure TFrmMain.DisableMenuItems;
Begin
  Receive.Enabled := FALSE;
  ConfigurePort.Enabled := FALSE;
  SendFromEditor.Enabled := FALSE;
  SendFromFile.Enabled := FALSE;
End;

Procedure TFrmMain.EnableMenuItems;
Begin
  Receive.Enabled := True;
  ConfigurePort.Enabled := True;
  SendFromEditor.Enabled := True;
  SendFromFile.Enabled := True;
  // MnuPops.Enabled := TRUE;
End;

Procedure TFrmMain.ApdProtocol1ProtocolFinish(CP: TObject; ErrorCode: Integer);
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
    SendMode := FALSE;
    if PortCloseTime > 0 then
    Begin
      if FrmSettings.TracingCB.Checked then
        ApdComPort1.AddStringToLog('Close Port Time Enabled )' +
          inttoStr(PortCloseTime) + ' Sec.');
      PortCloseTimeRemaining := PortCloseTime;
      FrmPortClsTm.SecToClsLBL.Caption := inttoStr(PortCloseTime);
      PortCloseTimer.Enabled := True;
      FrmPortClsTm.Show;
    End
    else
    begin
      ApdComPort1.Open := FALSE;
      if FrmSettings.TracingCB.Checked then
        ApdComPort1.Logging := tldump;
    end;
    If FileExists(NameOfTempSendFile) Then
    Begin
      DeleteFile(NameOfTempSendFile);
      NameOfTempSendFile := '';
    End;

  End

  Else // this is Receive Mode

  Begin
    ApdComPort1.Open := FALSE;
    // run the CNCFileFilter to clean up (remove spaces,control codes) from received cnc program

    If FrmSettings.FilterOnReceiveCB.Checked AND (ErrorCode = 0) Then
    Begin
      CNCFileFilter(ApdProtocol1.FileName)
    End; // Clean the file after receiving
    If OpenOnReceive.Checked = True Then
    Begin
      EditFileNameWithPath := ApdProtocol1.FileName;
      SynEdit.Lines.LoadFromFile(EditFileNameWithPath);
      ShowFileName;
    End;
    RecMode := FALSE;
  End;

End;

procedure TFrmMain.ApdProtocol1ProtocolStatus(CP: TObject; Options: Word);
Var
  StateTxt: String;

begin
  case Options of
    apFirstCall:
      Begin
        AsciiStatusF.Show;
      End;
    apLastCall:
      AsciiStatusF.Hide;
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
        inttoStr(Ticks2Secs(ApdProtocol1.EofTimerRemaining));
      AsciiStatusF.spTimoutPanel.Visible := True;
    end
    else
      AsciiStatusF.spTimoutPanel.Visible := FALSE;

    AsciiStatusF.psState.Caption := StateTxt;

    AsciiStatusF.psFileName.Text := ApdProtocol1.FileName;
    AsciiStatusF.psProtocol.Caption := ProtocolName(ApdProtocol1.ProtocolType);
    AsciiStatusF.psFileSize.Caption := inttoStr(ApdProtocol1.FileLength);
    AsciiStatusF.psBytesTransferred.Caption :=
      inttoStr(ApdProtocol1.BytesTransferred);
    AsciiStatusF.psBytesRemaining.Caption :=
      inttoStr(ApdProtocol1.BytesRemaining);
    AsciiStatusF.psStatusMsg.Caption :=
      ApdProtocol1.StatusMsg(ApdProtocol1.ProtocolStatus);
  end;
end;

procedure TFrmMain.ApdProtocol1ProtocolError(CP: TObject; ErrorCode: Integer);
begin
  ShowMessage('Error: ' + inttoStr(ErrorCode))
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

  TmpFl := TPath.GetTempFileName;
  TmpFl2 := TPath.GetTempFileName;

  If NOT CopyFile(PChar(FileToFilter), PChar(TmpFl), FALSE) Then
  Begin
    ShowMessage('FilterFile: Failed To Create Copy ' +
      SysErrorMessage(GetLastError) + ' Filter Not Allowed');
    exit;
  End;
  //
  // pasre the file a single character at a time (looking to see if it is a true text file)
  //
  CrLfFound := FALSE;
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
      If NOT CopyFile(PChar(TmpFl2), PChar(TmpFl), FALSE) Then
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
  BOFfound := FALSE; // First % found flag
  LastLn := '';
  lncount := 0; // line count
  // remove nulls, control codes,  spaces and blank lines

  While NOT Eof(F1) Do
  Begin
    Readln(F1, Tmpln);
    Inc(lncount);
    LineLength := Length(Tmpln);
    NewLn := '';
    comment := FALSE; // comment in block flag
    For StrPtr := 1 To LineLength Do // parse each character of the line
    Begin
      ch := Tmpln[StrPtr];
      // do we strip to first % ?

      If FrmSettings.Clear1stBlockCB.Checked Then
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
            Else If FrmSettings.RemoveSpacesCB.Checked Then
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
        If FrmSettings.AddPercentCB.Checked AND (NewLn[1] <> '%') Then
        Begin
          Writeln(F2, '%')
        End;
        Firstln := FALSE;
      End;
      LastLn := NewLn;
      Writeln(F2, NewLn);
    End;
  End;
  // did we end with a % ?
  If Length(LastLn) <> 0 Then
  Begin
    If (LastLn[1] <> '%') AND FrmSettings.AddPercentCB.Checked Then
    Begin
      LastLn := '%';
      Writeln(F2, LastLn);
    End
  End;
  // all done, close the file to allow access by dream memo
  CloseFile(F1);
  CloseFile(F2);
  // copy back to source file
  If NOT CopyFile(PChar(TmpFl2), PChar(FileToFilter), FALSE) Then
  Begin
    ShowMessage('FilterFile: ReWrite of ' + FileToFilter + ' ' +
      SysErrorMessage(GetLastError) + ', Filter Not Allowed');
    exit;
  End;
  DeleteFile(TmpFl);
  DeleteFile(TmpFl2);
End;

procedure TFrmMain.FreeCADClick(Sender: TObject);
begin
{
    From  https://www.thoughtco.com/tform-createaowner-aowner-1057563
    When you create Delphi objects dynamically that inherit from TControl, such as a TForm (representing
     a form/window in Delphi applications), the constructor "Create" expects an "Owner" parameter:
    Modeless forms. Use "Application" as the owner:
    var
    myForm : TMyForm;
    ...
    myForm := TMyForm.Create(Application) ;

    Now, when you terminate (exit) the application,
    the "Application" object will free the "myForm" instance.

}
  if MyFreeCADFrm = nil then
  Begin
    SetFCparmsFrm.LoadIni; // make sure we have the setup info loaded for python
    MyFreeCADFrm :=TFreeCadFrm.Create(Application);
    try
     MyFreeCADFrm.Show;
    Except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised on MyFreeCAD form creation, with message : '+E.Message);
    end;
  End
  else
    MyFreeCADFrm.Show;
end;

procedure TFrmMain.FreeCADSettings1Click(Sender: TObject);
begin
  SetFCparmsFrm.ShowModal;
end;

Procedure TFrmMain.AboutExecute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TFrmMain.ActionSearchExecute(Sender: TObject);
begin
  ShowSearchReplaceDialog(FALSE);
end;

procedure TFrmMain.ActionSearchNextExecute(Sender: TObject);
begin
  DoSearchReplaceText(FALSE, FALSE);
end;

procedure TFrmMain.ActionSearchPrevExecute(Sender: TObject);
begin
  DoSearchReplaceText(FALSE, True);
end;

procedure TFrmMain.ActionSearchReplaceExecute(Sender: TObject);
begin
  ShowSearchReplaceDialog(True);
end;

procedure TFrmMain.actSearchUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := gsSearchText <> '';
end;

procedure TFrmMain.ActionSearchReplaceUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (gsSearchText <> '') and not SynEdit.ReadOnly;
end;

procedure TFrmMain.DoSearchReplaceText(AReplace: Boolean; ABackwards: Boolean);
var
  Options: TSynSearchOptions;
begin
  Statusbar.SimpleText := '';
  if AReplace then
    Options := [ssoPrompt, ssoReplace, ssoReplaceAll]
  else
    Options := [];
  if ABackwards then
    Include(Options, ssoBackwards);
  if gbSearchCaseSensitive then
    Include(Options, ssoMatchCase);
  if not FSearchFromCaret then
    Include(Options, ssoEntireScope);
  if gbSearchSelectionOnly then
    Include(Options, ssoSelectedOnly);
  if gbSearchWholeWords then
    Include(Options, ssoWholeWord);
  if gbSearchRegex then
    SynEdit.SearchEngine := SynEditRegexSearch
  else
    SynEdit.SearchEngine := SynEditSearch;
  if SynEdit.SearchReplace(gsSearchText, gsReplaceText, Options) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    Statusbar.SimpleText := STextNotFound;
    if ssoBackwards in Options then
      SynEdit.BlockEnd := SynEdit.BlockBegin
    else
      SynEdit.BlockBegin := SynEdit.BlockEnd;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;

  if ConfirmReplaceDialog <> nil then
    ConfirmReplaceDialog.Free;
end;

procedure TFrmMain.ShowSearchReplaceDialog(AReplace: Boolean);
var
  dlg: TTextSearchDialog;
begin
  Statusbar.SimpleText := '';
  if AReplace then
    dlg := TTextReplaceDialog.Create(self)
  else
    dlg := TTextSearchDialog.Create(self);
  with dlg do
    try
      // assign search options
      SearchBackwards := gbSearchBackwards;
      SearchCaseSensitive := gbSearchCaseSensitive;
      SearchFromCursor := gbSearchFromCaret;
      SearchInSelectionOnly := gbSearchSelectionOnly;
      // start with last search text
      SearchText := gsSearchText;
      if gbSearchTextAtCaret then
      begin
        // if something is selected search for that text
        if SynEdit.SelAvail and (SynEdit.BlockBegin.Line = SynEdit.BlockEnd.Line)
        then
          SearchText := SynEdit.SelText
        else
          SearchText := SynEdit.GetWordAtRowCol(SynEdit.CaretXY);
      end;
      SearchTextHistory := gsSearchTextHistory;
      if AReplace then
        with dlg as TTextReplaceDialog do
        begin
          ReplaceText := gsReplaceText;
          ReplaceTextHistory := gsReplaceTextHistory;
        end;
      SearchWholeWords := gbSearchWholeWords;
      if ShowModal = mrOk then
      begin
        gbSearchBackwards := SearchBackwards;
        gbSearchCaseSensitive := SearchCaseSensitive;
        gbSearchFromCaret := SearchFromCursor;
        gbSearchSelectionOnly := SearchInSelectionOnly;
        gbSearchWholeWords := SearchWholeWords;
        gbSearchRegex := SearchRegularExpression;
        gsSearchText := SearchText;
        gsSearchTextHistory := SearchTextHistory;
        if AReplace then
          with dlg as TTextReplaceDialog do
          begin
            gsReplaceText := ReplaceText;
            gsReplaceTextHistory := ReplaceTextHistory;
          end;
        FSearchFromCaret := gbSearchFromCaret;
        if gsSearchText <> '' then
        begin
          DoSearchReplaceText(AReplace, gbSearchBackwards);
          FSearchFromCaret := True;
        end;
      end;
    finally
      dlg.Free;
    end;
end;

procedure TFrmMain.SynEditKeyPress(Sender: TObject; var Key: Char);
begin
if FrmSettings.ForceUpperCaseCB.Checked then
Begin
  if Key IN ['a' .. 'z'] then
    Key := upcase(Key);
End;

end;

procedure TFrmMain.SynEditorReplaceText(Sender: TObject;
  const ASearch, AReplace: UnicodeString; Line, Column: Integer;
  var Action: TSynReplaceAction);
var
  APos: TPoint;
  EditRect: TRect;
begin
  if ASearch = AReplace then
    Action := raSkip
  else
  begin
    APos := SynEdit.ClientToScreen
      (SynEdit.RowColumnToPixels(SynEdit.BufferToDisplayPos(BufferCoord(Column,
      Line))));
    EditRect := ClientRect;
    EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
    EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);

    if ConfirmReplaceDialog = nil then
      ConfirmReplaceDialog := TConfirmReplaceDialog.Create(Application);
    ConfirmReplaceDialog.PrepareShow(EditRect, APos.X, APos.Y,
      APos.Y + SynEdit.LineHeight, ASearch);
    case ConfirmReplaceDialog.ShowModal of
      mrYes:
        Action := raReplace;
      mrYesToAll:
        Action := raReplaceAll;
      mrNo:
        Action := raSkip;
    else
      Action := raCancel;
    end;
  end;
end;

procedure TFrmMain.ToolRenumberExecute(Sender: TObject);
Var
  Vptr, NumEnd, TsPtr, CmtPtr, CVal: INTEGER;
  I: LONGINT;
  Nstr, LCpy: STRING;
  Nvl: DOUBLE;

Begin
  // tool renumbering
  frmTR.showmodal;
  If frmTR.modalresult = mrCancel Then
  Begin
    exit
  End;
  Vptr := 0;
  I := 0;
  NumEnd := 0;
  CmtPtr := 0;
  TsPtr := 0;
  CVal := frmTR.SEditVlu.Value;
  Nvl := 0;

  For I := 0 To SynEdit.lines.count - 1 Do
  Begin
    TsPtr := Pos('[', SynEdit.lines[I]);
    CmtPtr := Pos('(', SynEdit.lines[I]);
    If (TsPtr = 0) AND (CmtPtr = 0) Then
    Begin
      // T Check
      Vptr := Pos('T', SynEdit.lines[I]);
      If Vptr <> 0 Then
      Begin
        NumEnd := FindNumEnd(SynEdit.lines[I], Vptr + 1);
        Nstr := Copy(SynEdit.lines[I], Vptr + 1, NumEnd - Vptr);
        If Nstr = '' Then
        Begin
          exit
        End;
        Nvl := StrToFloat(Nstr);
        Case frmTR.RGrpFunc.ItemIndex Of
          0:
            Begin
              Nvl := Nvl + CVal
            End; // add
          1:
            Begin
              Nvl := Nvl - CVal
            End; // subtract
          2:
            Begin
              Nvl := Nvl * CVal
            End; // multiply
        End;
        Nstr := FloatToStrF(Nvl, ffGeneral, 4, 0);
        LCpy := SynEdit.lines[I];
        Delete(LCpy, Vptr + 1, NumEnd - Vptr);
        Vptr := Pos('T', LCpy);
        Insert(Nstr, LCpy, Vptr + 1);
        SynEdit.lines[I] := LCpy;
      End; // end T check
      If frmTR.RGrpMD.ItemIndex > 0 Then
      Begin
        // H check
        Vptr := Pos('H', SynEdit.lines[I]);
        If Vptr <> 0 Then
        Begin
          NumEnd := FindNumEnd(SynEdit.lines[I], Vptr + 1);
          Nstr := Copy(SynEdit.lines[I], Vptr + 1, NumEnd - Vptr);
          If Nstr = '' Then
          Begin
            exit
          End;
          Nvl := StrToFloat(Nstr);
          Case frmTR.RGrpFunc.ItemIndex Of
            0:
              Begin
                Nvl := Nvl + CVal
              End; // add
            1:
              Begin
                Nvl := Nvl - CVal
              End; // subtract
            2:
              Begin
                Nvl := Nvl * CVal
              End; // multiply
          End;
          Nstr := FloatToStrF(Nvl, ffGeneral, 4, 0);
          LCpy := SynEdit.lines[I];
          Delete(LCpy, Vptr + 1, NumEnd - Vptr);
          Vptr := Pos('H', LCpy);
          Insert(Nstr, LCpy, Vptr + 1);
          SynEdit.lines[I] := LCpy;
        End; // end H check
        // D Check
        Vptr := Pos('D', SynEdit.lines[I]);
        If Vptr <> 0 Then
        Begin
          NumEnd := FindNumEnd(SynEdit.lines[I], Vptr + 1);
          Nstr := Copy(SynEdit.lines[I], Vptr + 1, NumEnd - Vptr);
          If Nstr = '' Then
          Begin
            exit
          End;
          Nvl := StrToFloat(Nstr);
          Case frmTR.RGrpFunc.ItemIndex Of
            0:
              Begin
                Nvl := Nvl + CVal
              End; // add
            1:
              Begin
                Nvl := Nvl - CVal
              End; // subtract
            2:
              Begin
                Nvl := Nvl * CVal
              End; // multiply
          End;
          Nstr := FloatToStrF(Nvl, ffGeneral, 4, 0);
          LCpy := SynEdit.lines[I];
          Delete(LCpy, Vptr + 1, NumEnd - Vptr);
          Vptr := Pos('D', LCpy);
          Insert(Nstr, LCpy, Vptr + 1);
          SynEdit.lines[I] := LCpy;
        End; // end D check
      End; // H and D option check
    End; // toolsheet check
  End; // loop
End;

end.
