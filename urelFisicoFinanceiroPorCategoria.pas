unit urelFisicoFinanceiroPorCategoria;

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
  Data.DB,
  Datasnap.DBClient,
  frxClass,
  frxDBSet,
  Data.Win.ADODB,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.ComCtrls;

type
  TfrmRelFisFinPorCategoria = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    chkProduto: TCheckBox;
    chkLocalArmazenamento: TCheckBox;
    dblArmazenamento: TDBLookupComboBox;
    dblProduto: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    chkTipoProduto: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    qryRelFisicoFinanceiro: TADOQuery;
    frxDBDataset1: TfrxDBDataset;
    frxRelFisicoFinanceiro: TfrxReport;
    ClientDataSet1: TClientDataSet;
    qryEntradaProduto: TADOQuery;
    frxDescontos: TfrxDBDataset;
    frxEntidade: TfrxDBDataset;
    qryEntidade: TADOQuery;
    ClientDataSet1CodigoLocalArmazen: TIntegerField;
    ClientDataSet1LocalArmazenamento: TStringField;
    ClientDataSet1ProdutoID: TIntegerField;
    ClientDataSet1NomeProduto: TStringField;
    ClientDataSet1PMedio: TFloatField;
    ClientDataSet1Entrada: TFloatField;
    ClientDataSet1EntradaFinanceiro: TFloatField;
    ClientDataSet1Saida: TFloatField;
    ClientDataSet1SaidaFinanceiro: TFloatField;
    ClientDataSet1Saldo: TFloatField;
    ClientDataSet1saldofinanceiro: TFloatField;
    ClientDataSet1saldoanterior: TFloatField;
    ClientDataSet1saldoanteriorfinanceiro: TFloatField;
    ClientDataSet1Logo: TStringField;
    ClientDataSet1Prefeitura: TStringField;
    ClientDataSet1Estado: TStringField;
    ClientDataSet1cnpj: TStringField;
    qryRelFisicoFinanceirologo: TStringField;
    qryRelFisicoFinanceiroprefeitura: TStringField;
    qryRelFisicoFinanceiroestado: TStringField;
    qryRelFisicoFinanceirocnpj: TStringField;
    qryRelFisicoFinanceiroprodutoID: TIntegerField;
    qryRelFisicoFinanceiroNomeProduto: TStringField;
    qryRelFisicoFinanceiroCodigoLocalArmazen: TIntegerField;
    qryRelFisicoFinanceiroLocalArmazenamento: TStringField;
    qryRelFisicoFinanceiroSALDOANTERIOR: TBCDField;
    qryRelFisicoFinanceiroENTRADA: TFMTBCDField;
    qryRelFisicoFinanceiroPMedio: TFMTBCDField;
    qryRelFisicoFinanceiroSAIDA: TFMTBCDField;
    qryRelFisicoFinanceiroSALDO: TFMTBCDField;
    procedure BitBtn1Click(Sender: TObject);
    function formatCNPJ(xcnpj: string): string;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFisFinPorCategoria: TfrmRelFisFinPorCategoria;

implementation

{$R *.dfm}

uses udmComprasEstoque;

procedure TfrmRelFisFinPorCategoria.BitBtn1Click(Sender: TObject);
var
  qry, qryEntrada, dataInicio, dataFinal, ano: String;
  xData: TDateTime;
  memo: TfrxMemoView;
begin

  { Descontos }
  dataInicio := DateToStr(dtpDe.Date);
  dataFinal := DateToStr(dtpAte.Date);
  qryEntrada := ' SELECT ''' + dataInicio + ''' as ''dataInicio'', ''' +
    dataFinal + ''' as ''dataFinal'', ep.valoracrescimodesconto ';
  qryEntrada := qryEntrada + ' from entradaproduto ep ';
  qryEntrada := qryEntrada + ' where ep.dataentrada between ''' +
    FormatDateTime('yyyy-mm-dd', dtpDe.Date) + ''' AND ''' +
    FormatDateTime('yyyy-mm-dd', dtpAte.Date) + '''';

  qryEntradaProduto.SQL.Clear;
  qryEntradaProduto.SQL.Add(qryEntrada);
  qryEntradaProduto.Open;

  xData := dtpDe.Date - 1;

  qry := 'SELECT  ent.logo, ent.nome as prefeitura, ent.nomeuf as estado, ent.cnpj, p.produtoID, p.descricao as NomeProduto, a.categoriaID as CodigoLocalArmazen, a.descricao as LocalArmazenamento, ';
  qry := qry + ' p.produtoID, p.descricao as NomeProduto, ';
  qry := qry +
    ' (SELECT coalesce(Saldo,0) FROM estoqueproduto where idproduto = ie.idproduto and MES = '''
    + FormatDateTime('mm', xData) + ''' and ANO = ''' + FormatDateTime('yyyy',
    xData) + ''' ) as SALDOANTERIOR ,  ';
  qry := qry +
    ' (SELECT SUM(Entrada) FROM ESTOQUEPRODUTO where idproduto = ie.idproduto and MES Between '''
    + inttoStr(StrToInt(FormatDateTime('mm', dtpDe.DateTime))) + ''' AND ''' +
    inttoStr(StrToInt(FormatDateTime('mm', dtpAte.DateTime))) +
    '''  ) as ENTRADA , ';
  qry := qry +
    ' (SELECT AVG(precomedio) FROM PRECOMEDIO where idproduto = ie.idproduto and MES Between '''
    + inttoStr(StrToInt(FormatDateTime('mm', dtpDe.DateTime))) + ''' AND ''' +
    inttoStr(StrToInt(FormatDateTime('mm', dtpAte.DateTime))) +
    '''   ) as PMedio  , ';
  qry := qry +
    ' (SELECT sum(saida) FROM ESTOQUEPRODUTO WHERE idproduto = ie.idproduto and MES Between '''
    + inttoStr(StrToInt(FormatDateTime('mm', dtpDe.DateTime))) + ''' AND ''' +
    inttoStr(StrToInt(FormatDateTime('mm', dtpAte.DateTime))) +
    '''   ) as SAIDA , ';
  qry := qry +
    ' (SELECT Sum(saldo) FROM ESTOQUEPRODUTO WHERE idproduto = ie.idproduto and MES Between '''
    + inttoStr(StrToInt(FormatDateTime('mm', dtpDe.DateTime))) + ''' AND ''' +
    inttoStr(StrToInt(FormatDateTime('mm', dtpAte.DateTime))) +
    '''  ) as SALDO ';
  qry := qry + ' FROM entradaproduto as E ';
  qry := qry +
    ' join itensentradaproduto as ie on ie.identradaproduto = e.entradaid ';
  qry := qry + ' join produto as p on p.produtoID = ie.idproduto ';
  qry := qry + ' join categoria as a on a.categoriaID = E.idCategoria ';
  qry := qry + ' join entidade as ent ';
  qry := qry + ' WHERE 1 ';
  qry := qry + '  AND E.DATAENTRADA BETWEEN ''' + FormatDateTime('yyyy-mm-dd',
    dtpDe.DateTime) + ''' AND ''' + FormatDateTime('yyyy-mm-dd',
    dtpAte.DateTime) + '''';
  if chkProduto.Checked then
    qry := qry + ' AND P.PRODUTOID = ''' + inttoStr(dblProduto.KeyValue) + '''';

  if chkLocalArmazenamento.Checked then
    qry := qry + ' AND a.almoxarifadoID = ''' +
      inttoStr(dblArmazenamento.KeyValue) + '''';

  if chkTipoProduto.Checked then
    qry := qry + ' AND p.idtipo = ''' +
      inttoStr(DBLookupComboBox1.KeyValue) + '''';

  { qry := qry +
    ' GROUP BY a.categoriaID, a.descricao, ie.idproduto, p.descricao ';
    qry := qry + ' ORDER BY ie.idproduto'; }
  qry := qry + ' GROUP BY a.categoriaID, p.descricao ';
  qry := qry +
    ' ORDER BY a.categoriaID, a.descricao, ie.idproduto, p.descricao ';
  with qryRelFisicoFinanceiro do
  Begin
    Close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
    qryRelFisicoFinanceiro.Last;
    { } ClientDataSet1.Open;
    while not qryRelFisicoFinanceiro.Bof do
    begin
      ClientDataSet1.Insert;
      ClientDataSet1CodigoLocalArmazen.Value :=
        qryRelFisicoFinanceiroCodigoLocalArmazen.Value;
      ClientDataSet1LocalArmazenamento.Value :=
        qryRelFisicoFinanceiroLocalArmazenamento.Value;
      ClientDataSet1ProdutoID.Value := qryRelFisicoFinanceiroprodutoID.Value;
      ClientDataSet1NomeProduto.Value :=
        qryRelFisicoFinanceiroNomeProduto.Value;
      ClientDataSet1PMedio.Value := qryRelFisicoFinanceiroPMedio.AsFloat;

      ClientDataSet1Entrada.Value := qryRelFisicoFinanceiroENTRADA.AsFloat;
      ClientDataSet1Saida.Value := qryRelFisicoFinanceiroSAIDA.AsFloat;
      ClientDataSet1Saldo.Value := qryRelFisicoFinanceiroSALDO.AsFloat;

      { ClientDataSet1EntradaFinanceiro.Value := ClientDataSet1Entrada.Value;
        ClientDataSet1SaidaFinanceiro.Value := ClientDataSet1Saida.Value;
        ClientDataSet1saldofinanceiro.Value := ClientDataSet1Saldo.Value; }

      ClientDataSet1EntradaFinanceiro.Value := ClientDataSet1Entrada.Value *
        ClientDataSet1PMedio.Value;
      ClientDataSet1SaidaFinanceiro.Value := ClientDataSet1Saida.Value *
        ClientDataSet1PMedio.Value;
      ClientDataSet1saldofinanceiro.Value := ClientDataSet1Saldo.Value *
        ClientDataSet1PMedio.Value;

      ClientDataSet1Logo.AsString := qryRelFisicoFinanceirologo.AsString;
      ClientDataSet1Prefeitura.AsString :=
        qryRelFisicoFinanceiroprefeitura.AsString;
      ClientDataSet1Estado.AsString := qryRelFisicoFinanceiroestado.AsString;

      ClientDataSet1cnpj.AsString :=
        formatCNPJ(qryRelFisicoFinanceirocnpj.AsString);

      ClientDataSet1saldoanterior.Value :=
        qryRelFisicoFinanceiroSALDOANTERIOR.AsInteger;
      ClientDataSet1saldoanteriorfinanceiro.Value :=
        qryRelFisicoFinanceiroSALDOANTERIOR.AsInteger;

      ClientDataSet1.Post;
      qryRelFisicoFinanceiro.Prior;
    end;
    frxRelFisicoFinanceiro.LoadFromFile
      ('Relatorios\relatorioFisicoFinanceiroPorCategoriadeEntrada.fr3');
    if FileExists(qryRelFisicoFinanceirologo.AsString) then
      TfrxPictureView(frxRelFisicoFinanceiro.FindComponent('Logomarca'))
        .Picture.LoadFromFile(qryRelFisicoFinanceirologo.AsString);
    // TfrxMemoView(frxRelFisicoFinanceiro.FindComponent('Memo19')).Text := 'Mês Ref.:'+FormatDateTime('mm/yyyy',dtpDe.DateTime);

    frxRelFisicoFinanceiro.ShowReport();
    ClientDataSet1.EmptyDataSet;
  End;
end;

function TfrmRelFisFinPorCategoria.formatCNPJ(xcnpj: string): string;
Var
  xTemp: String;
begin
  xTemp := xcnpj.Substring(0, 2) + '.' + xcnpj.Substring(2, 3) + '.' +
    xcnpj.Substring(5, 3) + '/' + xcnpj.Substring(8, 4) + '-' +
    xcnpj.Substring(12, 2);
  Result := xTemp;
end;

procedure TfrmRelFisFinPorCategoria.FormShow(Sender: TObject);
begin
  dmComprasEstoque.qryAlmoxarifado.Open;
  dmComprasEstoque.qryProdutosRequisicao.Open;
  dmComprasEstoque.qryTipoProduto.Open;
  dtpDe.DateTime := strToDateTime(FormatDateTime('01/mm/yyyy', Now));
  dtpAte.DateTime := strToDateTime(FormatDateTime('dd/mm/yyyy', Now));
end;

end.
