// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_INSERTJDBG ON
// JCL_DEBUG_EXPERT_DELETEMAPFILE ON
program CodeSharkFCs;

uses
  Vcl.Forms,
  srcMain in 'srcMain.pas' {FrmMain},
  Vcl.Themes,
  uHighlighterProcs in 'uHighlighterProcs.pas',
  About in 'About.pas' {AboutBox},
  SetFCparms in 'SetFCparms.pas' {SetFCparmsFrm},
  SetTool in 'SetTool.pas' {SetToolFRM},
  FreeCad in 'FreeCad.pas' {FreeCadFrm},
  srcExceptionDialog in 'srcExceptionDialog.pas' {ExceptionDialog},
  cmset in 'cmset.pas' {ComPortOptions},
  ptops in 'ptops.pas' {ProtocolOptions},
  Settings in 'Settings.pas' {FrmSettings},
  SendRecvDlg in 'SendRecvDlg.pas' {FrmSendRecvDlg},
  AsciiStatusU in 'AsciiStatusU.pas' {AsciiStatusF};

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
  Application.Run;

end.
