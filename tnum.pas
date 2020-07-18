unit tnum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ExtCtrls;

type
  TFrmTR = class(TForm)
    RGrpFunc: TRadioGroup;
    GBvl: TGroupBox;
    SEditVlu: TSpinEdit;
    RGrpMd: TRadioGroup;
    Butok: TButton;
    Butcncl: TButton;
    procedure ButokClick(Sender: TObject);
    procedure ButcnclClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTR: TFrmTR;

implementation

{$R *.DFM}


procedure TFrmTR.ButokClick(Sender: TObject);
begin
 self.hide;
end;

procedure TFrmTR.ButcnclClick(Sender: TObject);
begin
 self.hide;
end;

procedure TFrmTR.FormActivate(Sender: TObject);
begin
 if RGrpFunc.ItemIndex=-1 then RGrpFunc.ItemIndex:=0;
 if RGrpMd.ItemIndex =-1 then RGrpMd.ItemIndex:=0; 
end;

end.
