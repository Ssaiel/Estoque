unit uRelEntradaProduto;

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
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.DBCtrls,
  Vcl.Buttons,
  Data.DB,
  Data.Win.ADODB,
  frxClass,
  frxDBSet,
  Vcl.Mask, JvExMask, JvToolEdit, JvDBLookup;

type
  TfrmRelEntradaProduto = class(TForm)
    GroupBox1: TGroupBox;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    chkPedido: TCheckBox;
    chkNotaFiscal: TCheckBox;
    chkEmpenho: TCheckBox;
    chkCategoria: TCheckBox;
    chkFornecedor: TCheckBox;
    chkProduto: TCheckBox;
    chkLocalArmazenamento: TCheckBox;
    edtPedido: TEdit;
    edtEmpenho: TEdit;
    dblCategoria: TDBLookupComboBox;
    dblArmazenamento: TDBLookupComboBox;
    dblFornecedor: TDBLookupComboBox;
    dblProduto1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    frxReport1: TfrxReport;
    qryRelEntradaProduto: TADOQuery;
    DataSource1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    qryRelEntradaProdutologo: TStringField;
    qryRelEntradaProdutoprefeitura: TStringField;
    qryRelEntradaProdutoestado: TStringField;
    qryRelEntradaProdutocnpj: TStringField;
    qryRelEntradaProdutoEntrada: TIntegerField;
    qryRelEntradaProdutoPedido: TIntegerField;
    qryRelEntradaProdutoData: TDateField;
    qryRelEntradaProdutoEmpenho: TStringField;
    qryRelEntradaProdutonotafiscal: TStringField;
    qryRelEntradaProdutoFornecedor: TStringField;
    qryRelEntradaProdutoprodutoID: TIntegerField;
    qryRelEntradaProdutodescricao: TStringField;
    qryRelEntradaProdutovalorunitario: TBCDField;
    qryRelEntradaProdutovalortotal: TBCDField;
    qryRelEntradaProdutoAlmoxarifado: TStringField;
    qryRelEntradaProdutoquantidade: TBCDField;
    edtNotaFiscal: TMaskEdit;
    qryRelEntradaProdutodesconto: TFMTBCDField;
    qryEntidade: TADOQuery;
    frxEntidade: TfrxDBDataset;
    edtProduto: TEdit;
    dblProduto: TJvDBLookupEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNotaFiscalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEntradaProduto: TfrmRelEntradaProduto;

implementation

{$R *.dfm}

uses
  udmComprasEstoque,
  frmPrincipal;

procedure TfrmRelEntradaProduto.BitBtn1Click(Sender: TObject);
var
  qry, dataInicio, dataFinal: String;
begin

  dataInicio := FormatDateTime('dd/mm/yyyy', dtpDe.Date);
  dataFinal := FormatDateTime('dd/mm/yyyy', dtpAte.Date);

  qry := 'Select ent.logo, ent.nome as prefeitura, ent.nomeuf as estado, ent.cnpj,  entradaID as Entrada, idOrdemCompra as Pedido, EP.dataentrada as Data, empenhoprocesso as Empenho, ';
  qry := qry +
    ' notafiscal, CAT.descricao as Descricao_Categoria , FORN.RazaoSocial as Fornecedor, PROD.produtoID, PROD.descricao, IEP.quantidade , IEP.valorunitario, (IEP.quantidade * IEP.valorunitario) as valortotal, ALM.DESCRICAO as Almoxarifado, ';
  qry := qry +
    ' (ep.valoracrescimodesconto / (select count(*) from entradaproduto join itensentradaproduto on itensentradaproduto.identradaproduto = entradaproduto.entradaID where entradaID = ep.entradaID)) as ''desconto'' ';
  qry := qry + ' from entradaproduto as EP ';
  qry := qry +
    ' join itensentradaproduto as IEP on IEP.identradaproduto = EP.entradaID ';
  qry := qry +
    ' join almoxarifado as ALM on ALM.almoxarifadoID = EP.CodAlmoxarifado ';
  qry := qry +
    ' join fornecedor as FORN on FORN.cpfcnpj = EP.codFornecedor OR FORN.codigo = EP.codFornecedor ';
  qry := qry + ' join produto as PROD on PROD.produtoID = IEP.idproduto ';
  qry := qry + ' join categoria as CAT on CAT.categoriaID = PROD.idcategoria ';
  qry := qry + ' join entidade as ent ';
  qry := qry + ' WHERE  EP.DATAENTRADA BETWEEN ''' +
    FormatDateTime('yyyy-mm-dd', dtpDe.DateTime) + ''' AND ''' +
    FormatDateTime('yyyy-mm-dd', dtpAte.DateTime) + '''';
  if chkPedido.Checked then
    qry := qry + ' AND idOrdemCompra = ''' + edtPedido.Text + '''';
  if chkNotaFiscal.Checked then
    qry := qry + ' AND notafiscal = ''' + edtNotaFiscal.Text + '''';

  if chkEmpenho.Checked then
    qry := qry + ' AND empenhoprocesso = ''' + edtEmpenho.Text + '''';

  if chkLocalArmazenamento.Checked then
    qry := qry + ' AND CodAlmoxarifado = ''' +
      intToStr(dblArmazenamento.KeyValue) + '''';

  if chkFornecedor.Checked then
    qry := qry + ' AND  codFornecedor =  ''' +
      intToStr(dblArmazenamento.KeyValue) + ''' OR codFornecedor = ''' +
      intToStr(dblArmazenamento.KeyValue) + '''';

  if chkProduto.Checked then
    qry := qry + ' AND prod.produtoID = ''' +
      dmComprasEstoque.qryProdutosRequisicao.FieldByName('produtoID')
      .asString + '''';

  if chkCategoria.Checked then
    qry := qry + ' AND CAT.categoriaID = ''' +
      intToStr(dblCategoria.KeyValue) + '''';

  qry := qry +
    ' ORDER BY ALM.almoxarifadoID, entradaID, Pedido, EP.dataentrada, PROD.produtoID ';

  with dmComprasEstoque, qryRelEntradaProduto do
  begin
    Close;
    SQL.Clear();
    SQL.Add(qry);
    { if chkPedido.Checked then
      Parameters.AddParameter.Name :=  'numeropedido';
      if chkNotaFiscal.Checked then
      Parameters.AddParameter.Name :=  'notafiscal';
      if chkEmpenho.Checked then
      Parameters.AddParameter.Name :=  'empenho';
      if chkLocalArmazenamento.Checked then
      Parameters.AddParameter.Name :=  'Almox';
      if chkFornecedor.Checked then
      Parameters.AddParameter.Name :=  'codigoFor';
      if chkFornecedor.Checked then
      Parameters.AddParameter.Name :=  'CNPJ';
      if chkProduto.Checked then
      Parameters.AddParameter.Name :=  'codigoproduto';
      if chkCategoria.Checked then
      Parameters.AddParameter.Name :=  'codigoCategoria';

      if chkPedido.Checked then
      Parameters.ParamByName('numeropedido').Value := edtPedido.Text;
      if chkNotaFiscal.Checked then
      Parameters.ParamByName('notafiscal').Value := edtNotaFiscal.Text;
      if chkEmpenho.Checked then
      Parameters.ParamByName('empenho').Value := edtEmpenho.Text;
      if chkLocalArmazenamento.Checked then
      Parameters.ParamByName('Almox').Value := dblArmazenamento.KeyValue;
      if chkFornecedor.Checked then
      Parameters.ParamByName('codigoFor').Value := qryFornecedor.FieldByName('codigo').Value;
      if chkFornecedor.Checked then
      Parameters.ParamByName('CNPJ').Value := dblFornecedor.KeyValue;
      if chkProduto.Checked then
      Parameters.ParamByName('codigoproduto').Value := dblProduto.KeyValue;
      if chkCategoria.Checked then
      Parameters.ParamByName('codigoCategoria').Value := dblCategoria.KeyValue; }
    try
      Open;
      frxReport1.LoadFromFile('Relatorios\relatorioEntradaProdutos.fr3');
      if FileExists(qryRelEntradaProduto.FieldByName('logo').asString) then
        TfrxPictureView(frxReport1.FindComponent('Logomarca'))
          .Picture.LoadFromFile(qryRelEntradaProduto.FieldByName('logo')
          .asString);

      TfrxMemoView(frxReport1.FindComponent('periodo')).Text := dataInicio +
        ' à ' + dataFinal;

      frxReport1.ShowReport();

    except
      on E: Exception do
        ShowMessage(E.Message);

    end;

  end;

end;

procedure TfrmRelEntradaProduto.edtNotaFiscalChange(Sender: TObject);
begin
  { if(edtNotaFiscal.Text <> '')then chkNotaFiscal.Checked := True
    else chkNotaFiscal.Checked := False; }
end;

procedure TfrmRelEntradaProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmComprasEstoque do
  begin
    qryFornecedor.Close;
    qryProdutosRequisicao.Close;
    qryAlmoxarifado.Close;
    qryCategorias.Close;
  end;
end;

procedure TfrmRelEntradaProduto.FormShow(Sender: TObject);
begin
  with dmComprasEstoque do
  begin
    qryFornecedor.Open;
    qryProdutosRequisicao.Open;
    qryAlmoxarifado.Open;
    qryCategorias.Open;
  end;
  dtpDe.DateTime := StrToDateTime(FormatDateTime('01/mm/yyyy', now));
  dtpAte.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy', now));

end;

end.
