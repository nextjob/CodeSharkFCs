// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_INSERTJDBG ON
// JCL_DEBUG_EXPERT_DELETEMAPFILE ON
program CodeSharkFCs;

uses
  Vcl.Forms,
  srcMain in 'srcMain.pas' {FrmMain},
  About in 'About.pas' {AboutBox},
  SetFCparms in 'SetFCparms.pas' {SetFCparmsFrm},
  SetTool in 'SetTool.pas' {SetToolFRM},
  FreeCad in 'FreeCad.pas' {FreeCadFrm},
  srcExceptionDialog in 'srcExceptionDialog.pas' {ExceptionDialog},
  cmset in 'cmset.pas' {ComPortOptions},
  ptops in 'ptops.pas' {ProtocolOptions},
  Settings in 'Settings.pas' {FrmSettings},
  SendRecvDlg in 'SendRecvDlg.pas' {FrmSendRecvDlg},
  AsciiStatusU in 'AsciiStatusU.pas' {AsciiStatusF},
  PortClsTime in 'PortClsTime.pas' {FrmPortClsTm},
  tsttrm in 'tsttrm.pas' {FrmTrm},
  dlgConfirmReplace in 'dlgConfirmReplace.pas' {ConfirmReplaceDialog},
  dlgReplaceText in 'dlgReplaceText.pas',
  dlgSearchText in 'dlgSearchText.pas' {TextSearchDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TSetFCparmsFrm, SetFCparmsFrm);
  Application.CreateForm(TSetToolFRM, SetToolFRM);
  Application.CreateForm(TComPortOptions, ComPortOptions);
  Application.CreateForm(TProtocolOptions, ProtocolOptions);
  Application.CreateForm(TFrmSettings, FrmSettings);
  Application.CreateForm(TFrmSendRecvDlg, FrmSendRecvDlg);
  Application.CreateForm(TAsciiStatusF, AsciiStatusF);
  Application.CreateForm(TFrmPortClsTm, FrmPortClsTm);
  Application.CreateForm(TFrmTrm, FrmTrm);
  Application.CreateForm(TConfirmReplaceDialog, ConfirmReplaceDialog);
  Application.Run;

end.
