unit uRelFisicoFinanceiro;

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
  frxDBSet,
  Data.DB,
  Data.Win.ADODB,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.ComCtrls,
  Datasnap.DBClient, Vcl.ExtCtrls;

type
  TfrmRelFisicoFinanceiro = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    chkProduto: TCheckBox;
    chkAgrupamento: TCheckBox;
    dblAgrupamento: TDBLookupComboBox;
    dblProduto: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    qryRelFisicoFinanceiro: TADOQuery;
    frxDBDataset1: TfrxDBDataset;
    frxRelFisicoFinanceiro: TfrxReport;
    qryRelFisicoFinanceiroCodigoLocalArmazen: TIntegerField;
    qryRelFisicoFinanceiroLocalArmazenamento: TStringField;
    qryRelFisicoFinanceiroprodutoID: TIntegerField;
    qryRelFisicoFinanceiroNomeProduto: TStringField;
    qryRelFisicoFinanceiroPMedio: TFMTBCDField;
    qryRelFisicoFinanceirologo: TStringField;
    qryRelFisicoFinanceiroprefeitura: TStringField;
    qryRelFisicoFinanceiroestado: TStringField;
    qryRelFisicoFinanceirocnpj: TStringField;
    chkTipoProduto: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    qryRelFisicoFinanceiroSALDOANTERIOR: TBCDField;
    qryRelFisicoFinanceiroENTRADA: TFMTBCDField;
    qryRelFisicoFinanceiroSAIDA: TFMTBCDField;
    qryRelFisicoFinanceiroSALDO: TFMTBCDField;
    ClientDataSet1: TClientDataSet;
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
    qryEntradaProduto: TADOQuery;
    frxDescontos: TfrxDBDataset;
    frxResponsaveis: TfrxDBDataset;
    qryResponsaveis: TADOQuery;
    ClientDataSet1resp1_nome: TStringField;
    ClientDataSet1resp1_cic: TStringField;
    ClientDataSet1resp1_cargo: TStringField;
    ClientDataSet1resp2_nome: TStringField;
    ClientDataSet1resp2_cic: TStringField;
    ClientDataSet1resp2_cargo: TStringField;
    ClientDataSet1resp3_nome: TStringField;
    ClientDataSet1resp3_cic: TStringField;
    ClientDataSet1resp3_cargo: TStringField;
    qryEntidade: TADOQuery;
    frxEntidade: TfrxDBDataset;
    rdAgrupamento: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure printRelPorCatProduto();
    procedure printRelPorCatEntrada();
    procedure printRelPorArmazenamento();
    procedure rdAgrupamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFisicoFinanceiro: TfrmRelFisicoFinanceiro;

implementation

{$R *.dfm}

uses
  udmComprasEstoque,
  ufuncao;

procedure TfrmRelFisicoFinanceiro.BitBtn1Click(Sender: TObject);
begin
  case rdAgrupamento.ItemIndex of
    0:
      begin
        printRelPorArmazenamento;
      end;
    1:
      begin
        printRelPorCatEntrada;
      end;
    2:
      begin
        printRelPorCatProduto;
      end;
  end;
end;

procedure TfrmRelFisicoFinanceiro.printRelPorArmazenamento();
Var
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
  if (chkAgrupamento.Checked) then
    qryEntrada := qryEntrada + ' and ep.CodAlmoxarifado = ' +
      dblAgrupamento.KeyValue;

  qryEntradaProduto.SQL.Clear;
  qryEntradaProduto.SQL.Add(qryEntrada);
  qryEntradaProduto.Open;

  xData := dtpDe.Date - 1;

  qry := 'SELECT  ent.logo, ent.nome as prefeitura, ent.nomeuf as estado, ent.cnpj, a.almoxarifadoid as CodigoLocalArmazen, a.descricao as LocalArmazenamento, ';
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
  qry := qry +
    ' join almoxarifado as a on a.almoxarifadoID = E.CodAlmoxarifado ';
  qry := qry + ' join entidade as ent ';
  qry := qry + ' WHERE 1 ';
  qry := qry + '  AND E.DATAENTRADA BETWEEN ''' + FormatDateTime('yyyy-mm-dd',
    dtpDe.DateTime) + ''' AND ''' + FormatDateTime('yyyy-mm-dd',
    dtpAte.DateTime) + '''';
  if chkProduto.Checked then
    qry := qry + ' AND P.PRODUTOID = ''' + inttoStr(dblProduto.KeyValue) + '''';

  if chkAgrupamento.Checked then
    qry := qry + ' AND a.almoxarifadoID = ''' +
      inttoStr(dblAgrupamento.KeyValue) + '''';

  if chkTipoProduto.Checked then
    qry := qry + ' AND p.idtipo = ''' +
      inttoStr(DBLookupComboBox1.KeyValue) + '''';

  qry := qry +
    ' GROUP BY a.almoxarifadoid, a.descricao, ie.idproduto, p.descricao ';
  qry := qry + ' ORDER BY ie.idproduto';
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
      ('Relatorios\relatorioFisicoFinanceiro.fr3');
    if FileExists(qryRelFisicoFinanceirologo.AsString) then
      TfrxPictureView(frxRelFisicoFinanceiro.FindComponent('Logomarca'))
        .Picture.LoadFromFile(qryRelFisicoFinanceirologo.AsString);
    // TfrxMemoView(frxRelFisicoFinanceiro.FindComponent('Memo19')).Text := 'Mês Ref.:'+FormatDateTime('mm/yyyy',dtpDe.DateTime);

    frxRelFisicoFinanceiro.ShowReport();
    ClientDataSet1.EmptyDataSet;
  End;
end;

procedure TfrmRelFisicoFinanceiro.printRelPorCatEntrada();
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
  if (chkAgrupamento.Checked) then
    qryEntrada := qryEntrada + ' and ep.idCategoria = ' +
      dblAgrupamento.KeyValue;

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

  if chkAgrupamento.Checked then
    qry := qry + ' AND a.categoriaID = ''' +
      inttoStr(dblAgrupamento.KeyValue) + '''';

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

procedure TfrmRelFisicoFinanceiro.printRelPorCatProduto();
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
  if (chkAgrupamento.Checked) then
    qryEntrada := qryEntrada + ' and ep.idCategoria = ' +
      dblAgrupamento.KeyValue;
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
  qry := qry + ' join categoria as a on a.categoriaID = p.idcategoria ';
  qry := qry + ' join entidade as ent ';
  qry := qry + ' WHERE 1 ';
  qry := qry + '  AND E.DATAENTRADA BETWEEN ''' + FormatDateTime('yyyy-mm-dd',
    dtpDe.DateTime) + ''' AND ''' + FormatDateTime('yyyy-mm-dd',
    dtpAte.DateTime) + '''';
  if chkProduto.Checked then
    qry := qry + ' AND P.PRODUTOID = ''' + inttoStr(dblProduto.KeyValue) + '''';

  if chkAgrupamento.Checked then
    qry := qry + ' AND a.categoriaID = ''' +
      inttoStr(dblAgrupamento.KeyValue) + '''';

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
      ('Relatorios\relatorioFisicoFinanceiroPorCategoriadeProduto.fr3');
    if FileExists(qryRelFisicoFinanceirologo.AsString) then
      TfrxPictureView(frxRelFisicoFinanceiro.FindComponent('Logomarca'))
        .Picture.LoadFromFile(qryRelFisicoFinanceirologo.AsString);
    // TfrxMemoView(frxRelFisicoFinanceiro.FindComponent('Memo19')).Text := 'Mês Ref.:'+FormatDateTime('mm/yyyy',dtpDe.DateTime);

    frxRelFisicoFinanceiro.ShowReport();
    ClientDataSet1.EmptyDataSet;
  End;
end;

procedure TfrmRelFisicoFinanceiro.rdAgrupamentoClick(Sender: TObject);
begin
  //
  dblAgrupamento.ListSource := nil;
  dblAgrupamento.KeyField := '';
  case rdAgrupamento.ItemIndex of
    0:
      begin
        dblAgrupamento.KeyField := 'almoxarifadoID';
        dblAgrupamento.ListField := 'descricao';
        dblAgrupamento.ListSource := dmComprasEstoque.dsQryAlmoxarifado;
        dmComprasEstoque.qryAlmoxarifado.Open;

        chkAgrupamento.Caption := 'Local de Armazenamento';
      end;
    1:
      begin
        dblAgrupamento.KeyField := 'categoriaID';
        dblAgrupamento.ListField := 'descricao';
        dblAgrupamento.ListSource := dmComprasEstoque.dsQryCategorias;
        dmComprasEstoque.qryCategorias.Open;
        chkAgrupamento.Caption := 'Categoria';
      end;
    2:
      begin
        dblAgrupamento.KeyField := 'categoriaID';
        dblAgrupamento.ListField := 'descricao';
        dblAgrupamento.ListSource := dmComprasEstoque.dsQryCategorias;
        dmComprasEstoque.qryCategorias.Open;
        chkAgrupamento.Caption := 'Categoria';
      end;
  end;
end;

procedure TfrmRelFisicoFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmComprasEstoque.qryAlmoxarifado.Close;
  dmComprasEstoque.qryTipoProduto.Close;
  dmComprasEstoque.qryProdutosRequisicao.Close;
end;

procedure TfrmRelFisicoFinanceiro.FormShow(Sender: TObject);
begin
  dmComprasEstoque.qryAlmoxarifado.Open;
  dmComprasEstoque.qryProdutosRequisicao.Open;
  dmComprasEstoque.qryTipoProduto.Open;
  dtpDe.DateTime := strToDateTime(FormatDateTime('01/mm/yyyy', Now));
  dtpAte.DateTime := strToDateTime(FormatDateTime('dd/mm/yyyy', Now));
end;

end.
