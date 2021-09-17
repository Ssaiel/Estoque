unit uTipoOrdemCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmTipoOrdemCompra = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoOrdemCompra: TfrmTipoOrdemCompra;

implementation

{$R *.dfm}

uses uOrdemCompra;

procedure TfrmTipoOrdemCompra.BitBtn1Click(Sender: TObject);
begin
  frmOrdemCompra.resp := RadioGroup1.ItemIndex+1;
  Close;
end;

procedure TfrmTipoOrdemCompra.BitBtn2Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := -1;
  frmOrdemCompra.resp := -1;
  Close;
end;

end.

