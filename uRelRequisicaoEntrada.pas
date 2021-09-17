unit uRelRequisicaoEntrada;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  frxClass,
  Data.DB,
  Data.Win.ADODB,
  frxDBSet,
  udmComprasEstoque,
  Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, JvExExtCtrls, JvRadioGroup;

type
  TfrmRelRequisicaoEntrada = class(TForm)
    frxRelRequisicao: TfrxReport;
    qryRequisicao: TADOQuery;
    dsRequisicao: TDataSource;
    frxRequisicao: TfrxDBDataset;
    dblRequisicao: TDBLookupComboBox;
    Button1: TButton;
    qryIt: TADOQuery;
    dsIt: TDataSource;
    Label1: TLabel;
    grpTipoRequisicao: TJvRadioGroup;
    Label2: TLabel;
    frxReqSaida: TfrxReport;
    qryReqSaida: TADOQuery;
    dsReqSaida: TDataSource;
    frxDBReqSaida: TfrxDBDataset;
    qryItsaida: TADOQuery;
    dsItSaida: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grpTipoRequisicaoClick(Sender: TObject);
    procedure generateOutStockReport;
    procedure generateInStockReport;
    procedure dblRequisicaoCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRequisicaoEntrada: TfrmRelRequisicaoEntrada;
  actualIndex: Integer;

implementation

{$R *.dfm}

procedure TfrmRelRequisicaoEntrada.Button1Click(Sender: TObject);
begin
  if (grpTipoRequisicao.ItemIndex = 0) then
    generateInStockReport
  else
    generateOutStockReport;
end;

procedure TfrmRelRequisicaoEntrada.dblRequisicaoCloseUp(Sender: TObject);
begin
  //
  if dblRequisicao.KeyValue <> -1 then
    Button1.Enabled := True;
end;

procedure TfrmRelRequisicaoEntrada.FormShow(Sender: TObject);
begin
  qryIt.Open;
  actualIndex := grpTipoRequisicao.ItemIndex;
end;

procedure TfrmRelRequisicaoEntrada.generateInStockReport;
var
  script: String;
begin
  //

  with qryRequisicao do
  begin
    Close;
    Parameters.ParamByName('id').Value := dblRequisicao.KeyValue;
    Open;
    if qryRequisicao.RecordCount <> 0 then
    begin
      frxRelRequisicao.LoadFromFile
        ('Relatorios\RelatorioRequisicaoEntrada.fr3');
      if FileExists(qryRequisicao.FieldByName('logo').AsString) = True then
        TfrxPictureView(frxRelRequisicao.FindComponent('logo'))
          .Picture.LoadFromFile(qryRequisicao.FieldByName('logo').AsString);
      frxRelRequisicao.ShowReport();
    end
    else
      MessageBox(Application.Handle, 'Não há itens a serem listados.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK)
  end;
end;

procedure TfrmRelRequisicaoEntrada.generateOutStockReport;
var
  script: String;
begin
  //

  with qryReqSaida do
  begin
    Close;
    Parameters.ParamByName('id').Value := dblRequisicao.KeyValue;
    Open;
    if RecordCount <> 0 then
    begin
      frxReqSaida.LoadFromFile('Relatorios\RelatorioRequisicaoSaida.fr3');
      if FileExists(FieldByName('logo').AsString) = True then
        TfrxPictureView(frxReqSaida.FindComponent('logo'))
          .Picture.LoadFromFile(FieldByName('logo').AsString);
      frxReqSaida.ShowReport();
    end
    else
      MessageBox(Application.Handle, 'Não há itens a serem listados.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK)
  end;
end;

procedure TfrmRelRequisicaoEntrada.grpTipoRequisicaoClick(Sender: TObject);
begin
  Self.Refresh;

  if (actualIndex <> grpTipoRequisicao.ItemIndex) then
  begin
    actualIndex := grpTipoRequisicao.ItemIndex;
    dblRequisicao.KeyValue := -1;
    Button1.Enabled := False;
    if (grpTipoRequisicao.ItemIndex = 0) then
    begin
      qryIt.Close;
      dblRequisicao.ListSource := dsIt;
      dblRequisicao.ListField := 'requisicaocompraId';
      dblRequisicao.KeyField := 'requisicaocompraId';

      qryIt.Open;

    end
    else
    begin
      qryItsaida.Close;
      dblRequisicao.ListSource := dsItSaida;
      dblRequisicao.ListField := 'requisicaosaidaId';
      dblRequisicao.KeyField := 'requisicaosaidaId';
      qryItsaida.Open;
    end;
  end;

end;

end.
