unit uRelSolicitacaoOrdemCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, Vcl.DBCtrls, Vcl.StdCtrls,
  Data.DB, Data.Win.ADODB, udmComprasEstoque, frxDBSet;

type
  TFrmRelOrdemCompra = class(TForm)
    rptSolOrdemCompra: TfrxReport;
    dblOrdemCompra: TDBLookupComboBox;
    Label1: TLabel;
    qrySolOrdemCompra: TADOQuery;
    frxSolOrdemCompra: TfrxDBDataset;
    Button1: TButton;
    qryOrdemCompra: TADOQuery;
    dsOrdemCompra: TDataSource;
    Label2: TLabel;
    frxReport1: TfrxReport;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelOrdemCompra: TFrmRelOrdemCompra;

implementation

{$R *.dfm}

procedure TFrmRelOrdemCompra.Button1Click(Sender: TObject);
begin
  with (qrySolOrdemCompra) do
  begin
    Close;
    Parameters.ParamByName('id').Value := dblOrdemCompra.KeyValue;
    Open;
    if RecordCount <> 0 then
    begin
      rptSolOrdemCompra.LoadFromFile
        ('Relatorios\RelatorioSolicitacaoOrdemCompra.fr3');
      if FileExists(FieldByName('logo').AsString) = True then
        TfrxPictureView(rptSolOrdemCompra.FindComponent('logo'))
          .Picture.LoadFromFile(FieldByName('logo').AsString);
      rptSolOrdemCompra.ShowReport();
    end
    else
      MessageBox(Application.Handle, 'N?o h? itens a serem listados.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK)
  end;

end;

end.
