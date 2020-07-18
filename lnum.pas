unit lnum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin;

type
  TFrmLN = class(TForm)
    GroupBox1: TGroupBox;
    RBIns: TRadioButton;
    RBRmv: TRadioButton;
    GBoxOps: TGroupBox;
    SEditStart: TSpinEdit;
    SEditInc: TSpinEdit;
    CBoxLead: TCheckBox;
    CBoxAdd: TCheckBox;
    ButOk: TButton;
    ButCancl: TButton;
    lblstrt: TLabel;
    lblinc: TLabel;
    procedure RBRmvClick(Sender: TObject);
    procedure RBInsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButOkClick(Sender: TObject);
    procedure ButCanclClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLN: TFrmLN;

implementation

{$R *.DFM}


procedure TFrmLN.RBRmvClick(Sender: TObject);
begin
 if RBRmv.Checked =true then GBoxOps.Visible:=false;
end;

procedure TFrmLN.RBInsClick(Sender: TObject);
begin
  if RBIns.Checked =true then GBoxOps.Visible:=true;
end;

procedure TFrmLN.FormActivate(Sender: TObject);
begin
 if (RBIns.Checked=false) and (RBRmv.Checked=false) then RBIns.Checked:=true; 
end;

procedure TFrmLN.ButOkClick(Sender: TObject);
begin
 self.hide;
 
end;

procedure TFrmLN.ButCanclClick(Sender: TObject);
begin
 self.hide;
end;

end.
