unit uRelSaidaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Mask,
  Datasnap.DBClient;

type
  TfrmRelSaidaProdutos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    chkPedido: TCheckBox;
    chkCategoria: TCheckBox;
    chkCentroConsumo: TCheckBox;
    chkProduto: TCheckBox;
    chkLocalArmazenamento: TCheckBox;
    edtPedido: TEdit;
    dblCategoria: TDBLookupComboBox;
    dblArmazenamento: TDBLookupComboBox;
    dblCentroConsumo: TDBLookupComboBox;
    dblProduto: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    qryRelSaidaProduto: TADOQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    DBEdit1: TDBEdit;
    qryRelSaidaProdutoData: TDateField;
    qryRelSaidaProdutocentroconsumo: TStringField;
    qryRelSaidaProdutoprodutoID: TIntegerField;
    qryRelSaidaProdutodescricao: TStringField;
    qryRelSaidaProdutovalortotal: TFMTBCDField;
    qryRelSaidaProdutoAlmoxarifado: TStringField;
    qryRelSaidaProdutologo: TStringField;
    qryRelSaidaProdutoprefeitura: TStringField;
    qryRelSaidaProdutoestado: TStringField;
    qryRelSaidaProdutocnpj: TStringField;
    chkNFEntrada: TCheckBox;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Data: TDateField;
    ClientDataSet1produtoID: TIntegerField;
    ClientDataSet1descricao: TStringField;
    ClientDataSet1centroConsumo: TStringField;
    ClientDataSet1quantidade: TFloatField;
    ClientDataSet1Valortotal: TFloatField;
    ClientDataSet1Almoxarifado: TStringField;
    ClientDataSet1totalprecomedio: TFloatField;
    ClientDataSet1cnpj: TStringField;
    ClientDataSet1logo: TStringField;
    ClientDataSet1nomeestado: TStringField;
    ClientDataSet1nomeentidade: TStringField;
    qryRelSaidaProdutoquantidade: TBCDField;
    edtNFEntrada: TMaskEdit;
    DataSource1: TDataSource;
    qryEntidade: TADOQuery;
    frxEntidade: TfrxDBDataset;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelSaidaProdutos: TfrmRelSaidaProdutos;

implementation

{$R *.dfm}

uses udmComprasEstoque, frmPrincipal, ufuncao;

procedure TfrmRelSaidaProdutos.BitBtn1Click(Sender: TObject);
var qry : String;
begin
  frmRelSaidaProdutos.Cursor := crSQLWait;
  qry := 'Select ent.logo, ent.nome as prefeitura, ent.nomeuf as estado, ent.cnpj, ';
  qry := qry + ' ordemsaidaid, EP.datasaida as Data, FORN.descricao as centroconsumo, ';
  qry := qry + ' PROD.produtoID, PROD.descricao, IEP.quantidade , ( ';

  qry := qry + ' (SELECT AVG(precomedio) FROM PRECOMEDIO ';
  qry := qry + ' WHERE mes Between ''' + FormatDateTime('mm',dtpDe.DateTime) + ''' AND ''' + FormatDateTime('mm',dtpAte.DateTime) + '''';
  qry := qry + '   AND idproduto = PROD.produtoid';
//  qry := qry + '   AND idalmox = ALM.almoxarifadoid  AND idproduto = PROD.produtoid';

  qry := qry + ' )) AS valortotal, ';
  qry := qry + ' ALM.DESCRICAO as Almoxarifado ';
  qry := qry + ' from ordemsaidaestoque as EP ';
  qry := qry + ' join itensordemsaida as IEP on IEP.idordemsaida = EP.ordemsaidaId ';
  qry := qry + ' join almoxarifado as ALM on ALM.almoxarifadoID = EP.idalmoxarifado ';
  qry := qry + ' join centroconsumo as FORN on FORN.centroconsumoID = EP.idCentroConsumo ';
  qry := qry + ' join produto as PROD on PROD.produtoID = IEP.idproduto ';
  qry := qry + ' join categoria as CAT on cat.categoriaid = prod.idcategoria ';
  qry := qry + ' join entidade as ent ';
  qry := qry + ' WHERE  EP.DATASAIDA BETWEEN ''' + FormatDateTime('yyyy-mm-dd',dtpDe.DateTime) + ''' AND ''' + FormatDateTime('yyyy-mm-dd',dtpAte.DateTime)  + '''';

  if chkNFEntrada.Checked then
      qry := qry + ' AND EP.notafiscal = ''' + edtNFEntrada.Text + '''';

  if chkPedido.Checked then
      qry := qry + ' AND EP.ordemsaidaId = ''' + edtPedido.Text + '''';

   if chkLocalArmazenamento.Checked then
      qry := qry + ' AND EP.idalmoxarifado = ''' + intToStr(dblArmazenamento.KeyValue) + '''';

  if chkCentroConsumo.Checked then
      qry := qry + ' AND  EP.idCentroConsumo =  ''' + intTostr(dblCentroConsumo.KeyValue) + '''';

  if chkProduto.Checked then
      qry := qry + ' AND prod.produtoID = ''' + intToStr(dblProduto.KeyValue) + '''';


  if chkCategoria.Checked then
      qry := qry + ' AND CAT.categoriaID = ''' + intToStr(dblCategoria.KeyValue) + '''';

  qry := qry + ' GROUP BY ordemsaidaid, ALM.almoxarifadoID, EP.datasaida, PROD.produtoID';
  qry := qry + ' ORDER BY ALM.almoxarifadoID, EP.datasaida, ordemsaidaid, PROD.produtoID';




  with dmComprasEstoque, qryRelSaidaProduto do begin
    Close;
    SQL.Clear;
    SQL.Add(qry);

    try
        Open;
        ClientDataSet1.Open;

        while NOT qryRelSaidaProduto.Eof do begin
          ClientDataSet1.Insert;
          ClientDataSet1Data.Value := qryRelSaidaProdutoData.Value;
          ClientDataSet1produtoID.Value := qryRelSaidaProdutoprodutoID.Value;
          ClientDataSet1descricao.Value := qryRelSaidaProdutodescricao.Value;
          ClientDataSet1centroconsumo.Value := qryRelSaidaProdutocentroconsumo.Value;
          ClientDataSet1quantidade.Value := qryRelSaidaProdutoquantidade.Value;
          ClientDataSet1valortotal.Value := qryRelSaidaProdutovalortotal.AsFloat;
          ClientDataSet1Almoxarifado.Value := qryRelSaidaProdutoAlmoxarifado.Value;
          ClientDataSet1totalprecomedio.Value := ClientDataSet1quantidade.Value * ClientDataSet1valortotal.Value;
          ClientDataSet1cnpj.AsString :=  formatCNPJ(qryRelSaidaProdutocnpj.AsString);
(*          ClientDataSet1cnpj.AsString := qryRelSaidaProdutocnpj.AsString.Substring(0,2) + '.' +
                                                qryRelSaidaProdutocnpj.AsString.Substring(2,3)+ '.' +
                                                qryRelSaidaProdutocnpj.AsString.Substring(5,3)+ '/' +
                                                qryRelSaidaProdutocnpj.AsString.Substring(8,4)+ '-' +
                                                qryRelSaidaProdutocnpj.AsString.Substring(12,2);*)


          ClientDataSet1Logo.AsString := qryRelSaidaProdutologo.AsString;
          ClientDataSet1NomeEstado.AsString := qryRelSaidaProdutoestado.AsString;
          ClientDataSet1NomeEntidade.AsString := qryRelSaidaProdutoprefeitura.AsString;

          ClientDataSet1.Post;
          qryRelSaidaProduto.Next;
        end;
        frxReport1.LoadFromFile('Relatorios\relatorioSaidaProdutosV2.fr3');
        if FileExists(qryRelSaidaProdutologo.AsString) then
            TfrxPictureView(frxReport1.FindComponent('Logomarca')).Picture.LoadFromFile(qryRelSaidaProdutologo.AsString);
        TfrxMemoView(frxReport1.FindComponent('Memo8')).Text := 'Mês Ref.:' + FormatDateTime('mm/yyyy',dtpDe.DateTime);
        frxReport1.ShowReport();
        frmRelSaidaProdutos.Cursor := crDefault;
        ClientDataSet1.EmptyDataSet;
    except on E: Exception do
        ShowMessage(e.Message);

    end;

  end;



end;

procedure TfrmRelSaidaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    with dmComprasEstoque do begin
      qryAlmoxarifado.close;
      qryProdutosRequisicao.close;
      qryCentroConsumo.close;
      qryCategorias.close;
    end;
end;

procedure TfrmRelSaidaProdutos.FormShow(Sender: TObject);
begin
    dtpDe.DateTime := StrToDatetime(FormatDateTime('01/mm/yyyy',now));
    dtpAte.DateTime := StrToDatetime(FormatDateTime('dd/mm/yyyy',now));

    with dmComprasEstoque do begin
      qryAlmoxarifado.Open;
      qryProdutosRequisicao.Open;
      qryCentroConsumo.Open;
      qryCategorias.Open
    end;

end;

end.

