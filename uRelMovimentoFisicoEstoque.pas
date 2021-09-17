unit uRelMovimentoFisicoEstoque;

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
  Vcl.Buttons,
  Vcl.DBCtrls,
  Data.DB,
  Data.Win.ADODB,
  frxExportRTF,
  frxClass,
  frxExportPDF,
  frxDBSet,
  Vcl.ExtCtrls,
  DateUtils, JvExControls, JvDBLookup, Vcl.Mask, JvExMask, JvToolEdit;

type
  TfrmRelatorioMovimentoFisicoEstoque = class(TForm)
    cmbMesInicio: TComboBox;
    cmbMesFinal: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    chkProduto: TCheckBox;
    btnVisualizar: TBitBtn;
    qryRelMovFisEstoque: TADOQuery;
    frxDBRelatorioMovFisEstoque: TfrxDBDataset;
    frxRelatorioMovFisEstoque: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    RadioGroup1: TRadioGroup;
    qryRelMovFinanEstoque: TADOQuery;
    frxDBRelatorioFinanceiroEstoque: TfrxDBDataset;
    frxRelatorioFinanceiroEstoque: TfrxReport;
    Label3: TLabel;
    cmbAno: TComboBox;
    qryEntradaProduto: TADOQuery;
    frxDescontos: TfrxDBDataset;
    qryResponsaveis: TADOQuery;
    frxResponsaveis: TfrxDBDataset;
    frxEntidade: TfrxDBDataset;
    qryEntidade: TADOQuery;
    btnChgOrder1: TBitBtn;
    DBLookupComboBox2: TJvDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnChgOrder1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioMovimentoFisicoEstoque: TfrmRelatorioMovimentoFisicoEstoque;

implementation

{$R *.dfm}

uses
  udmComprasEstoque;

procedure TfrmRelatorioMovimentoFisicoEstoque.btnChgOrder1Click
  (Sender: TObject);
var
  lst: TStringList;
begin

  lst := TStringList.Create;
  lst.Delimiter := ';';
  lst.DelimitedText := DBLookupComboBox2.LookupDisplay;
  DBLookupComboBox2.LookupDisplay := lst[1] + ';' + lst[0];
end;

procedure TfrmRelatorioMovimentoFisicoEstoque.btnVisualizarClick
  (Sender: TObject);
var
  qry, qryEntrada, ultimoDiaDoMes: String;
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    qry := ' SELECT  ''' + cmbMesInicio.Text + ''' as ''dataInicio'', ''' +
      cmbMesFinal.Text + ''' as ''dataFinal'', ''' + cmbAno.Text +
      ''' as ''ano'', e.nome as Prefeitura, e.nomeuf as Estado, e.cnpj, e.logo , ';
    qry := qry + ' p.produtoID, p.descricao as nomeproduto, ';
    qry := qry +
      ' Coalesce(sum(ep.entrada),0) as ENTRADA, Coalesce(Sum(ep.saida),0) as SAIDA, ';
    qry := qry + ' Coalesce(Sum(ep.saldo),0) as SALDO ';
    qry := qry + ' FROM estoqueproduto as ep ';
    qry := qry + ' join produto as p on p.produtoID =  ep.idproduto ';
    qry := qry + ' join entidade as e ';
    qry := qry + ' WHERE ep.Mes BETWEEN ''' +
      inttostr(cmbMesInicio.ItemIndex + 1) + ''' AND ''' +
      inttostr(cmbMesFinal.ItemIndex + 1) + '''';
    qry := qry + '  AND ep.ANO = ''' + cmbAno.Text + '''';
    if chkProduto.Checked then
      qry := qry + ' AND p.produtoID = ''' +
        inttostr(DBLookupComboBox2.KeyValue) + '''';

    qry := qry + ' group by p.produtoID, p.descricao ';
    qry := qry + ' ORDER BY p.produtoID ';
    with qryRelMovFisEstoque do
    begin
      Close;
      SQL.Clear;
      SQL.Add(qry);
      Open;
      frxRelatorioMovFisEstoque.LoadFromFile
        ('Relatorios\RelatorioFisicoMovimentoEstoque.fr3');
      if FileExists(qryRelMovFisEstoque.FieldByName('logo').AsString) then
        TfrxPictureView(frxRelatorioMovFisEstoque.FindComponent('Logomarca'))
          .Picture.LoadFromFile(qryRelMovFisEstoque.FieldByName('logo')
          .AsString);
      frxRelatorioMovFisEstoque.ShowReport();
    end;
  end
  else
  begin
    { qry := 'SELECT e.nome as Prefeitura, e.nomeuf as Estado, e.cnpj, e.logo , ';
      qry := qry + ' p.produtoID, p.descricao as nomeproduto, ';
      qry := qry + ' (Coalesce(sum(ep.entrada),0) * ';
      qry := qry + ' (SELECT avg(precomedio) FROM precomedio ';
      qry := qry + '   WHERE idproduto = p.produtoid AND MES BETWEEN ''' + inttostr(cmbMesInicio.ItemIndex+1) + ''' AND ''' + inttostr(cmbMesFinal.ItemIndex+1) + ''' )) ';
      qry := qry + '  as ENTRADA, ';
      qry := qry + ' (Coalesce(Sum(ep.saida),0) * (SELECT avg(precomedio) FROM precomedio ';
      qry := qry + '   WHERE idproduto = p.produtoid AND MES BETWEEN  ''' + inttostr(cmbMesInicio.ItemIndex+1) + ''' AND ''' + inttostr(cmbMesFinal.ItemIndex+1)  + ''')  ) as SAIDA, ';
      qry := qry + ' (Coalesce(Sum(ep.saldo),0) * (SELECT avg(precomedio) FROM precomedio ';
      qry := qry + '   WHERE idproduto = p.produtoid AND MES BETWEEN ''' + inttostr(cmbMesInicio.ItemIndex+1) + ''' AND ''' + inttostr(cmbMesFinal.ItemIndex+1)  + '''))  as SALDO ';
      qry := qry + ' FROM estoqueproduto as ep ';
      qry := qry + ' join produto as p on p.produtoID =  ep.idproduto ';
      qry := qry + ' join entidade as e ';
      qry := qry + ' WHERE ep.mes BETWEEN ''' + inttostr(cmbMesInicio.ItemIndex+1) + ''' AND ''' + inttostr(cmbMesFinal.ItemIndex+1) + '''';
      qry := qry + '  AND ep.ANO = ''' + cmbAno.Text + '''';
      if chkProduto.Checked then
      qry := qry + ' AND p.produtoID = ''' + inttoStr(DBLookupComboBox2.KeyValue) + '''';
      qry := qry + ' group by p.produtoID, p.descricao'; }
    // refeito
    qry := 'SELECT ''' + cmbMesInicio.Text + ''' as ''dataInicio'', ''' +
      cmbMesFinal.Text + ''' as ''dataFinal'', ''' + cmbAno.Text +
      ''' as ''ano'',  e.nome as Prefeitura, e.nomeuf as Estado, e.cnpj, e.logo , ';
    qry := qry + ' p.produtoID, p.descricao as nomeproduto, ';
    qry := qry + ' (Coalesce(sum(ep.entrada),0) *  ';
    qry := qry + ' (SELECT avg(precomedio) FROM precomedio ';
    qry := qry + '   WHERE idproduto = p.produtoid AND MES BETWEEN ''' +
      inttostr(cmbMesInicio.ItemIndex + 1) + ''' AND ''' +
      inttostr(cmbMesFinal.ItemIndex + 1) + ''' )) ';
    qry := qry + ' as ENTRADA, ';
    qry := qry +
      ' (Coalesce(Sum(ep.saida),0) * (SELECT avg(precomedio) FROM precomedio ';
    qry := qry + '   WHERE idproduto = p.produtoid AND MES BETWEEN  ''' +
      inttostr(cmbMesInicio.ItemIndex + 1) + ''' AND ''' +
      inttostr(cmbMesFinal.ItemIndex + 1) + ''')  ) as SAIDA, ';
    qry := qry +
      ' (Coalesce(Sum(ep.saldo),0) * (SELECT avg(precomedio) FROM precomedio ';
    qry := qry + '   WHERE idproduto = p.produtoid AND MES BETWEEN ''' +
      inttostr(cmbMesInicio.ItemIndex + 1) + ''' AND ''' +
      inttostr(cmbMesFinal.ItemIndex + 1) + '''))  as SALDO ';
    qry := qry + ' FROM estoqueproduto as ep ';
    qry := qry + ' join produto as p on p.produtoID =  ep.idproduto ';

    qry := qry + ' join entidade as e ';
    qry := qry + ' WHERE ep.mes BETWEEN ''' +
      inttostr(cmbMesInicio.ItemIndex + 1) + ''' AND ''' +
      inttostr(cmbMesFinal.ItemIndex + 1) + '''';
    qry := qry + '  AND ep.ANO = ''' + cmbAno.Text + '''';
    if chkProduto.Checked then
      qry := qry + ' AND p.produtoID = ''' +
        inttostr(DBLookupComboBox2.KeyValue) + '''';

    qry := qry + ' group by p.produtoID, p.descricao';

    ultimoDiaDoMes := FormatDateTime('dd', EndOfAMonth(StrToInt(cmbAno.Text),
      cmbMesFinal.ItemIndex + 1));

    // EntradaProdutoQry
    qryEntrada := ' select eep.valoracrescimodesconto  ';
    qryEntrada := qryEntrada + ' from entradaproduto eep ';
    qryEntrada := qryEntrada +
      ' join itensentradaproduto ie on ie.identradaproduto = eep.entradaID ';
    qryEntrada := qryEntrada + ' WHERE eep.dataentrada between ''';
    qryEntrada := qryEntrada + cmbAno.Text + '/' +
      inttostr(cmbMesInicio.ItemIndex + 1) + '/01'' and ''';
    qryEntrada := qryEntrada + cmbAno.Text + '/' +
      inttostr(cmbMesFinal.ItemIndex + 1) + '/' + ultimoDiaDoMes + '''';
    if chkProduto.Checked then
    begin
      qryEntrada := qryEntrada + ' and ie.idproduto = ' +
        inttostr(DBLookupComboBox2.KeyValue);
    end;
    qryEntrada := qryEntrada + ' GROUP BY ie.identradaproduto ';
    // --fim_qryEntrada
    qryEntradaProduto.SQL.Clear;
    qryEntradaProduto.SQL.Add(qryEntrada);
    qryEntradaProduto.Open;
    with qryRelMovFinanEstoque do
    begin
      Close;
      SQL.Clear;
      SQL.Add(qry);
      Open;

      { TfrxMemoView( frxRelatorioFinanceiroEstoque.FindComponent( 'dataRel' ) )
        .Text := 'Período de Listagem ' + #13 + 'De ' + cmbMesInicio.Text +
        ' à ' + cmbMesFinal.Text + ' / ' + cmbAno.Text; }

      frxRelatorioFinanceiroEstoque.LoadFromFile
        ('Relatorios\RelatorioFinanceiroMovimentoEstoque.fr3');
      if FileExists(qryRelMovFinanEstoque.FieldByName('logo').AsString) then
        TfrxPictureView(frxRelatorioFinanceiroEstoque.FindComponent('Logomarca')
          ).Picture.LoadFromFile(qryRelMovFinanEstoque.FieldByName('logo')
          .AsString);
      frxRelatorioFinanceiroEstoque.ShowReport();
    end;
  end;

end;

procedure TfrmRelatorioMovimentoFisicoEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmComprasEstoque do
  begin
    qryAlmoxarifado.Close;
    qryProdutosRequisicao.Close;
  end;
end;

procedure TfrmRelatorioMovimentoFisicoEstoque.FormShow(Sender: TObject);
var
  qry: TADOQuery;
begin
  qry := TADOQuery.Create(Self);
  qry.Connection := dmComprasEstoque.conexao;
  with dmComprasEstoque do
  begin
    qryAlmoxarifado.Open;
    qryProdutosRequisicao.Open;
  end;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT distinct year(dataentrada) as Ano FROM entradaproduto');
  qry.Open;
  if qry.RecordCount = 0 then
    cmbAno.Items.Add(FormatDateTime('yyyy', now))
  else
  begin
    while not qry.Eof do
    begin
      cmbAno.Items.Add(qry.FieldByName('ano').AsString);
      qry.Next;
    end;
    cmbAno.ItemIndex := cmbAno.Items.Count - 1;
  end;
end;

end.
