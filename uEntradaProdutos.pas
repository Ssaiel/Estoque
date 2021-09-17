unit uEntradaProdutos;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ImgList,
  Data.DB,
  System.UITypes,
  Datasnap.DBClient,
  Data.Win.ADODB,
  Vcl.Menus,
  Vcl.JumpList, System.ImageList, Vcl.Mask, JvExMask, JvToolEdit, JvDBLookup,
  TOrdemCompraDAO, TRequisicaoCompraDAO;

type
  TfrmEntradaProdutos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    chkAlmoxarifado: TCheckBox;
    dblAlmoxarifado: TDBLookupComboBox;
    chkFornecedor: TCheckBox;
    dblFornecedor: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    De: TLabel;
    Até: TLabel;
    dtpAteRequisicao: TDateTimePicker;
    dtpDeRequisicao: TDateTimePicker;
    btnConsultar: TBitBtn;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    btnNovo: TToolButton;
    ToolButton2: TToolButton;
    btnEditar: TToolButton;
    ToolButton7: TToolButton;
    btnSalvar: TToolButton;
    ToolButton9: TToolButton;
    btnCancelar: TToolButton;
    ToolButton10: TToolButton;
    btnExcluir: TToolButton;
    ToolButton8: TToolButton;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dtpRequisicao: TDateTimePicker;
    edtPedidoCompra: TEdit;
    dblAlmoxarifadoLanc: TDBLookupComboBox;
    dblFornecedorLanc: TDBLookupComboBox;
    Panel2: TPanel;
    edtPrecoUnitario: TEdit;
    DBGrid2: TDBGrid;
    chkNF: TCheckBox;
    edtNF: TEdit;
    Label2: TLabel;
    edtNotaFiscal: TEdit;
    Label3: TLabel;
    edtQuantidade: TEdit;
    edtValorTotal: TEdit;
    Label4: TLabel;
    StatusBar1: TStatusBar;
    DataSource1: TDataSource;
    edtEmpenho: TEdit;
    Label6: TLabel;
    Label10: TLabel;
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    SpeedButton1: TSpeedButton;
    edtValorDesconto: TEdit;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2codigo: TIntegerField;
    ClientDataSet2descricao: TStringField;
    ClientDataSet2quantidade: TFloatField;
    ClientDataSet2precounitario: TFloatField;
    ClientDataSet2total: TFloatField;
    chkEntrada: TCheckBox;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    ToolButton5: TToolButton;
    ToolButton11: TToolButton;
    ImageListMainMenu: TImageList;
    edtCEmpenho: TEdit;
    chkEmpenho: TCheckBox;
    dblCategoria: TDBLookupComboBox;
    Label8: TLabel;
    edtProduto: TEdit;
    BitBtn1: TBitBtn;
    procedure ativarClientDataSet;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPrecoUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure habilitaBotoes;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtPedidoCompraKeyPress(Sender: TObject; var Key: Char);
    procedure limparcampos;
    procedure carregaDados;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure atualizaSaldoNF(codigoProduto: integer; codigoFornecedor: string;
      notaFiscal: string; Quantidade: real; valorUnitario: real);
    procedure dtpRequisicaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNotaFiscalKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmpenhoKeyPress(Sender: TObject; var Key: Char);
    procedure dblCentroConsumoLancKeyPress(Sender: TObject; var Key: Char);
    procedure dblAlmoxarifadoLancKeyPress(Sender: TObject; var Key: Char);
    procedure dblFornecedorLancKeyPress(Sender: TObject; var Key: Char);
    procedure dblProdutosRequisicao1KeyPress(Sender: TObject; var Key: Char);
    procedure dtpValidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure atualizaGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtValorDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDeRequisicaoClick(Sender: TObject);
    procedure dblAlmoxarifadoClick(Sender: TObject);
    procedure dblFornecedorClick(Sender: TObject);
    procedure chkAlmoxarifadoClick(Sender: TObject);
    procedure chkFornecedorClick(Sender: TObject);
    procedure chkNFClick(Sender: TObject);
    procedure edtNFChange(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure edtProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblProdutosRequisicaoEnter(Sender: TObject);
    //
    function deleteOrdemCompra(idOrdemCompra: String): boolean;
    function deleteRequisicaoCompra(idRequisicaoCompra: String): boolean;
    function getIdRCPorIdOC(idOrdemCompra: String): String;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaProdutos: TfrmEntradaProdutos;
  tipooperacao: Char;
  ultimoIdProduto: integer;

implementation

{$R *.dfm}

uses
  udmComprasEstoque,
  uRelItensNFSaida,
  ufuncao,
  uCadProdutos;

procedure TfrmEntradaProdutos.atualizaGrid;
var
  total: real;
  desconto: real;
begin
  total := 0;
  ClientDataSet2.First;
  while not ClientDataSet2.Eof do
  begin
    ClientDataSet2.Edit;
    ClientDataSet2total.Value := ClientDataSet2quantidade.Value *
      ClientDataSet2precounitario.Value;
    ClientDataSet2.Post;
    total := total + ClientDataSet2total.AsFloat;
    ClientDataSet2.Next;
  end;
  desconto := StrToFloat(edtValorDesconto.Text);
  edtValorTotal.Text := FormatFloat('0.00', total - desconto);
end;

procedure TfrmEntradaProdutos.atualizaSaldoNF(codigoProduto: integer;
  codigoFornecedor: string; notaFiscal: string; Quantidade: real;
  valorUnitario: real);
var
  qry: string;
  comandos: TADOCommand;
  qryTemp: TADOQuery;
begin
  qryTemp := TADOQuery.Create(self);
  qryTemp.Connection := dmComprasEstoque.conexao;
  comandos := TADOCommand.Create(self);
  comandos.Connection := dmComprasEstoque.conexao;
  qry := 'SELECT * FROM ESTOQUEPRODUTO WHERE IDPRODUTO = ''' +
    IntToStr(codigoProduto) + ''' AND MES = ''' + FormatDateTime('mm',
    dtpRequisicao.Date) + ''' AND ANO = ''' + FormatDateTime('yyyy',
    dtpRequisicao.Date) + '''';
  qryTemp.Close;
  qryTemp.SQL.Clear;
  qryTemp.SQL.Add(qry);
  qryTemp.Open;
  if qryTemp.RecordCount = 0 then
  begin
    qry := 'INSERT  INTO ESTOQUEPRODUTO(idproduto, mes, ano , entrada, saldo) ';
    qry := qry + ' VALUES (:produtoid, :mes, :ano , :entrada, :saldo) ';

    // with dmComprasEstoque do begin
    comandos.CommandText := qry;
    comandos.Parameters.Clear;
    // comandos.Parameters.AddParameter.Name := 'nf';
    comandos.Parameters.AddParameter.Name := 'produtoid';
    comandos.Parameters.AddParameter.Name := 'mes';
    comandos.Parameters.AddParameter.Name := 'ano';
    comandos.Parameters.AddParameter.Name := 'entrada';
    comandos.Parameters.AddParameter.Name := 'saldo';

    // comandos.Parameters.ParamByName('nf').Value := notaFiscal;
    comandos.Parameters.ParamByName('produtoid').Value := codigoProduto;
    comandos.Parameters.ParamByName('mes').Value :=
      FormatDateTime('mm', dtpRequisicao.Date);
    comandos.Parameters.ParamByName('ano').Value :=
      FormatDateTime('yyyy', dtpRequisicao.Date);
    comandos.Parameters.ParamByName('entrada').Value := Quantidade;
    comandos.Parameters.ParamByName('saldo').Value := Quantidade;

    comandos.Execute;

    qry := 'SELECT sum(saldo) as saldo FROM ESTOQUEPRODUTO WHERE IDPRODUTO = '''
      + IntToStr(codigoProduto) + '''';
    // qry := qry + ' AND MES = ''' + FormatDateTime('mm',dtpRequisicao.Date) + '''';
    // qry := qry + ' AND ANO = ''' + FormatDateTime('yyyy',dtpRequisicao.Date) + '''';

    qryTemp.Close;
    qryTemp.SQL.Clear;
    qryTemp.SQL.Add(qry);
    qryTemp.Open;

    qry := 'UPDATE PRODUTO SET ESTOQUE = ' +
      StringReplace(qryTemp.FieldByName('SALDO').AsString, ',', '.',
      [rfReplaceAll]);
    qry := qry + ' WHERE produtoID = ''' + IntToStr(codigoProduto) + '''';
    dmComprasEstoque.comandos.CommandText := qry;
    dmComprasEstoque.comandos.Execute;

  end
  else
  Begin
    qry := 'UPDATE ESTOQUEPRODUTO SET ENTRADA = ENTRADA + ';
    qry := qry + StringReplace(floatToStr(Quantidade), ',', '.', [rfReplaceAll])
      + ' WHERE IDPRODUTO = ''' + IntToStr(codigoProduto) + '''';
    qry := qry + ' AND MES = ''' + FormatDateTime('mm',
      dtpRequisicao.Date) + '''';
    qry := qry + ' AND ANO = ''' + FormatDateTime('yyyy',
      dtpRequisicao.Date) + '''';
    dmComprasEstoque.comandos.CommandText := qry;
    dmComprasEstoque.comandos.Execute;
    qry := 'UPDATE ESTOQUEPRODUTO SET SALDO = ENTRADA - SAIDA ';
    qry := qry + ' WHERE IDPRODUTO = ''' + IntToStr(codigoProduto) + '''';
    qry := qry + ' AND MES = ''' + FormatDateTime('mm',
      dtpRequisicao.Date) + '''';
    qry := qry + ' AND ANO = ''' + FormatDateTime('yyyy',
      dtpRequisicao.Date) + '''';
    dmComprasEstoque.comandos.CommandText := qry;
    dmComprasEstoque.comandos.Execute;

    qry := 'SELECT sum(saldo) as saldo FROM ESTOQUEPRODUTO WHERE IDPRODUTO = '''
      + IntToStr(codigoProduto) + '''';
    // qry := qry + ' AND MES = ''' + FormatDateTime('mm',dtpRequisicao.Date) + '''';
    // qry := qry + ' AND ANO = ''' + FormatDateTime('yyyy',dtpRequisicao.Date) + '''';

    qryTemp.Close;
    qryTemp.SQL.Clear;
    qryTemp.SQL.Add(qry);
    qryTemp.Open;

    qry := 'UPDATE PRODUTO SET ESTOQUE = ' +
      StringReplace(qryTemp.FieldByName('SALDO').AsString, ',', '.',
      [rfReplaceAll]);
    qry := qry + ' WHERE produtoID = ''' + IntToStr(codigoProduto) + '''';
    dmComprasEstoque.comandos.CommandText := qry;
    dmComprasEstoque.comandos.Execute;

  End;








  // end;

end;

procedure TfrmEntradaProdutos.BitBtn1Click(Sender: TObject);
begin
  try
    frmCadProdutos := TfrmCadProdutos.Create(self);
    frmCadProdutos.showModal;
  finally
    frmCadProdutos.Free;
    dmComprasEstoque.qryProdutosRequisicao.Close;
    dmComprasEstoque.qryProdutosRequisicao.Open;

    dmComprasEstoque.qryCategorias.Close;
    dmComprasEstoque.qryCategorias.Open;

  end;
end;

procedure TfrmEntradaProdutos.btnCancelarClick(Sender: TObject);
begin
  Panel1.Enabled := false;
  habilitaBotoes;
  limparcampos;
end;

procedure TfrmEntradaProdutos.btnConsultarClick(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT e.entradaid, e.dataentrada, f.razaosocial as Fornecedor, e.empenhoprocesso, e.notafiscal, alm.descricao as LocalArmazenamento, e.valoracrescimodesconto , e.idordemcompra';
  qry := qry + ' FROM entradaproduto as e ';
  qry := qry +
    ' join almoxarifado as alm on alm.almoxarifadoID = e.CodAlmoxarifado ';
  qry := qry +
    ' join fornecedor as f on f.cpfcnpj = e.codFornecedor or f.codigo = e.codFornecedor ';
  qry := qry + ' WHERE 1 ';
  if chkEntrada.Checked then
    qry := qry + ' AND e.dataentrada between ''' + FormatDateTime('yyyy-mm-dd',
      dtpDeRequisicao.DateTime) + ''' and ''' + FormatDateTime('yyyy-mm-dd',
      dtpAteRequisicao.DateTime) + '''';
  if chkAlmoxarifado.Checked then
    qry := qry + '   AND alm.Almoxarifadoid = :almox ';
  if chkFornecedor.Checked then
    qry := qry + '   AND (f.cpfcnpj = :fornec or f.codigo = :fornec1)';
  if chkEmpenho.Checked then
    qry := qry + '   AND e.empenhoprocesso = :empenhoprocesso ';
  if chkNF.Checked then
    qry := qry + '   AND e.notafiscal = :nf ';

  qry := qry + ' ORDER By e.dataentrada ';
  with dmComprasEstoque do
  begin
    qryEntradaProduto.Close;
    qryEntradaProduto.SQL.Clear;
    qryEntradaProduto.SQL.Add(qry);

    if chkAlmoxarifado.Checked then
      qryEntradaProduto.Parameters.ParamByName('almox').Value :=
        dblAlmoxarifado.KeyValue;
    if chkFornecedor.Checked then
    begin
      qryEntradaProduto.Parameters.ParamByName('fornec').Value :=
        dblFornecedor.KeyValue;
      qryEntradaProduto.Parameters.ParamByName('fornec1').Value :=
        dmComprasEstoque.qryFornecedor.FieldByName('Codigo').AsInteger;
    end;
    if chkEmpenho.Checked then
    begin
      qryEntradaProduto.Parameters.ParamByName('empenhoprocesso').Value :=
        edtCEmpenho.Text;
    end;
    if chkNF.Checked then
    begin
      qryEntradaProduto.Parameters.ParamByName('nf').Value := edtNF.Text;
    end;

    qryEntradaProduto.Close;
    qryEntradaProduto.Open;
  end;
end;

procedure TfrmEntradaProdutos.btnEditarClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitaBotoes;
  tipooperacao := 'E'; // Edição de Registro
  dtpRequisicao.SetFocus;
end;

procedure TfrmEntradaProdutos.btnExcluirClick(Sender: TObject);
Var
  qry: String;
  qtdEstoque: String;
var
  idEntrada, idOrdemCompra, idRequisicaoCompra: String;
begin
  // if ClientDataSet2.IsEmpty then begin
  // MessageBox(Application.Handle, 'Não há itens a serem excluídos.','Compras & Estoque',MB_ICONEXCLAMATION + MB_OK);
  // end
  // else begin
  if MessageDlg
    ('Deseja excluir está entrada de produto? Este processo excluirá a Ordem de Compra e Requisição de Compra correspondentes a esta Entrada',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      dmComprasEstoque.conexao.BeginTrans;
      ClientDataSet2.First;

      //
      idOrdemCompra := dmComprasEstoque.qryEntradaProduto.FieldByName
        ('idOrdemCompra').AsString;

      idRequisicaoCompra := getIdRCPorIdOC(idOrdemCompra);
      //

      while not ClientDataSet2.Eof do
      begin
        qtdEstoque := StringReplace(ClientDataSet2quantidade.AsString, ',', '.',
          [rfReplaceAll, rfIgnoreCase]);
        qry := 'UPDATE ESTOQUEPRODUTO SET ENTRADA = ENTRADA - ' + qtdEstoque;
        qry := qry + ' WHERE IDPRODUTO = ''' + ClientDataSet2codigo.AsString +
          ''' AND MES = ''' + FormatDateTime('mm', dtpRequisicao.Date) +
          ''' AND ANO = ''' + FormatDateTime('yyyy', dtpRequisicao.Date) + '''';
        dmComprasEstoque.comandos.CommandText := qry;

        dmComprasEstoque.comandos.Execute;

        qry := 'UPDATE ESTOQUEPRODUTO SET SALDO = ENTRADA - SAIDA ';
        qry := qry + ' WHERE IDPRODUTO = ''' + ClientDataSet2codigo.AsString +
          ''' AND MES = ''' + FormatDateTime('mm', dtpRequisicao.Date) +
          ''' AND ANO = ''' + FormatDateTime('yyyy', dtpRequisicao.Date) + '''';

        dmComprasEstoque.comandos.CommandText := qry;

        dmComprasEstoque.comandos.Execute;

        qry := 'UPDATE PRODUTO SET ESTOQUE = ESTOQUE - ' + qtdEstoque;
        qry := qry + ' WHERE PRODUTOID = ''' +
          ClientDataSet2codigo.AsString + ''' ';

        dmComprasEstoque.comandos.CommandText := qry;

        dmComprasEstoque.comandos.Execute;

        ClientDataSet2.Next;
      end;

      qry := 'DELETE FROM ITENSENTRADAPRODUTO WHERE identradaproduto = ''' +
        dmComprasEstoque.qryEntradaProduto.FieldByName('entradaid')
        .AsString + '''';
      dmComprasEstoque.comandos.CommandText := qry;
      dmComprasEstoque.comandos.Execute;

      qry := 'DELETE FROM ENTRADAPRODUTO WHERE entradaID = ''' +
        dmComprasEstoque.qryEntradaProduto.FieldByName('entradaid')
        .AsString + '''';
      dmComprasEstoque.comandos.CommandText := qry;
      dmComprasEstoque.comandos.Execute;
      dmComprasEstoque.conexao.CommitTrans;

      //
      deleteOrdemCompra(idOrdemCompra);
      deleteRequisicaoCompra(idRequisicaoCompra);
      //

      MessageBox(Application.Handle, 'Registro excluído com sucesso.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK);

      limparcampos;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
        dmComprasEstoque.conexao.RollbackTrans;
      end;
    end;
  end;
  // end;
end;

procedure TfrmEntradaProdutos.btnNovoClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitaBotoes;
  tipooperacao := 'N'; // Nova Entrada
  limparcampos;
  dtpRequisicao.SetFocus;
end;

procedure TfrmEntradaProdutos.btnProximoClick(Sender: TObject);
begin
  if (dmComprasEstoque.qryEntradaProduto.FindNext) then
  begin
    DBGrid1DblClick(self);
    btnAnterior.Enabled := true;
  end
  else
    btnProximo.Enabled := false;
end;

procedure TfrmEntradaProdutos.btnSalvarClick(Sender: TObject);
var
  qry: String;
  comandos: TADOCommand;
  codigoentrada: integer;

begin

  if ClientDataSet2.IsEmpty then
  begin
    MessageBox(Application.Handle,
      'Adicione itens para confirmação do lançamento.', 'Compras e Estoque',
      MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  // query := TADOQuery.Create(self);
  // query.Connection := dmComprasEstoque.conexao;
  // if verificaliberacao(query,strToint(FormatDateTime('yyyy',dtpRequisicao.DateTime)), strToint(FormatDateTime('mm',dtpRequisicao.DateTime)) ) then begin

  Panel1.Enabled := false;
  habilitaBotoes;
  case tipooperacao of
    'N':
      begin
        qry := 'INSERT INTO entradaproduto (idOrdemCompra,dataentrada, codalmoxarifado,codFornecedor,notafiscal,empenhoprocesso,valoracrescimodesconto,valorliquido, idCategoria) ';
        qry := qry +
          ' VALUES (:idOrdemCompra, :dataentrada, :codalmoxarifado, :codFornecedor, :notafiscal, :empenhoprocesso, :valoracrescimodesconto, :valorliquido, :idCategoria)';
        comandos := TADOCommand.Create(self);
        comandos.Connection := dmComprasEstoque.conexao;
        comandos.CommandText := qry;
        comandos.Parameters.Clear;
        // Adicionando os parametros no command
        comandos.Parameters.AddParameter.Name := 'idOrdemCompra';
        comandos.Parameters.AddParameter.Name := 'dataentrada';
        comandos.Parameters.AddParameter.Name := 'codalmoxarifado';
        comandos.Parameters.AddParameter.Name := 'codFornecedor';
        comandos.Parameters.AddParameter.Name := 'notafiscal';
        comandos.Parameters.AddParameter.Name := 'empenhoprocesso';
        comandos.Parameters.AddParameter.Name := 'valoracrescimodesconto';
        comandos.Parameters.AddParameter.Name := 'valorliquido';
        comandos.Parameters.AddParameter.Name := 'idCategoria';
        comandos.Parameters.ParamByName('idOrdemCompra').Value :=
          edtPedidoCompra.Text;
        comandos.Parameters.ParamByName('dataentrada').Value :=
          FormatDateTime('yyyy-mm-dd', dtpRequisicao.DateTime);
        comandos.Parameters.ParamByName('codalmoxarifado').Value :=
          dblAlmoxarifadoLanc.KeyValue;
        comandos.Parameters.ParamByName('codFornecedor').Value :=
          dblFornecedorLanc.KeyValue;
        comandos.Parameters.ParamByName('notafiscal').Value :=
          edtNotaFiscal.Text;
        comandos.Parameters.ParamByName('empenhoprocesso').Value :=
          edtEmpenho.Text;
        comandos.Parameters.ParamByName('valoracrescimodesconto').Value :=
          DoubleToDB(edtValorDesconto.Text);
        comandos.Parameters.ParamByName('valorliquido').Value :=
          DoubleToDB(edtValorTotal.Text);
        comandos.Parameters.ParamByName('idCategoria').Value :=
          dblCategoria.KeyValue;
        try
          dmComprasEstoque.conexao.BeginTrans;
          comandos.Execute;
          dmComprasEstoque.qryAux.Close;
          dmComprasEstoque.qryAux.SQL.Clear;
          dmComprasEstoque.qryAux.SQL.Add
            ('select * from entradaproduto order by entradaid desc limit 1 ');
          dmComprasEstoque.qryAux.Open;
          codigoentrada := dmComprasEstoque.qryAux.FieldByName('entradaid')
            .AsInteger;
          ClientDataSet2.First;
          while not ClientDataSet2.Eof do
          begin
            qry := 'INSERT INTO itensentradaproduto (idproduto, quantidade, valorunitario, valortotal, acrescimodesconto, identradaproduto) ';
            qry := qry +
              ' VALUES (:idproduto, :quantidade, :valorunitario, :valortotal, :acrescimodesconto,  :identradaproduto)';
            comandos.CommandText := qry;
            comandos.Parameters.Clear;
            // Adicionando os parametros no command
            comandos.Parameters.AddParameter.Name := 'idproduto';
            comandos.Parameters.AddParameter.Name := 'quantidade';
            comandos.Parameters.AddParameter.Name := 'valorunitario';
            comandos.Parameters.AddParameter.Name := 'valortotal';
            comandos.Parameters.AddParameter.Name := 'acrescimodesconto';
            comandos.Parameters.AddParameter.Name := 'identradaproduto';
            comandos.Parameters.ParamByName('idproduto').Value :=
              ClientDataSet2codigo.Value;
            comandos.Parameters.ParamByName('quantidade').Value :=
              ClientDataSet2quantidade.Value;
            comandos.Parameters.ParamByName('valorunitario').Value :=
              ClientDataSet2precounitario.Value;
            comandos.Parameters.ParamByName('valortotal').Value :=
              ClientDataSet2total.Value;
            comandos.Parameters.ParamByName('acrescimodesconto').Value :=
              edtValorDesconto.Text;
            comandos.Parameters.ParamByName('identradaproduto').Value :=
              codigoentrada;
            comandos.Execute;
            // Atualiza saldo do produto
            atualizaSaldoNF(ClientDataSet2codigo.AsInteger,
              dblFornecedorLanc.KeyValue, edtNotaFiscal.Text,
              ClientDataSet2quantidade.AsFloat,
              ClientDataSet2precounitario.AsFloat);
            ClientDataSet2.Next;
          end;
          if (edtPedidoCompra.Text <> '') AND (edtPedidoCompra.Text <> '0') then
          begin
            qry := 'UPDATE REQUISICAOCOMPRA SET idsituacao = 2 WHERE OrdemCompraID = '''
              + edtPedidoCompra.Text + '''';
            comandos.CommandText := qry;
            comandos.Execute;
          end;
          dmComprasEstoque.conexao.CommitTrans;
          MessageBox(Application.Handle, 'Registro salvo com sucesso.',
            'Compras e Estoque', MB_ICONINFORMATION + MB_OK);
          limparcampos;
          btnConsultarClick(self);
        except
          on E: Exception do
          begin
            dmComprasEstoque.conexao.RollbackTrans;
            ShowMessage(E.Message);
            MessageBox(Application.Handle, 'Erro ao gravar os dados.',
              'Compras e Estoque', MB_ICONERROR + MB_OK);
          end;
        end;
      end;
    'E':
      begin
        try
          dmComprasEstoque.conexao.BeginTrans;
          // ESTORNA OS ITENS ENTRADOS
          dmComprasEstoque.qryAux.First;
          while not dmComprasEstoque.qryAux.Eof do
          begin

            qry := 'UPDATE ESTOQUEPRODUTO SET ENTRADA = ENTRADA - ' +
              StringReplace
              (floatToStr(dmComprasEstoque.qryAux.FieldByName('quantidade')
              .AsFloat), ',', '.', [rfReplaceAll]) + ' , SALDO = SALDO - ' +
              StringReplace
              (floatToStr(dmComprasEstoque.qryAux.FieldByName('quantidade')
              .AsFloat), ',', '.', [rfReplaceAll]);
            qry := qry + ' WHERE IDPRODUTO = ''' +
              IntToStr(dmComprasEstoque.qryAux.FieldByName('idproduto')
              .AsInteger) + ''' AND MES = ''' + FormatDateTime('mm',
              dtpRequisicao.Date) + ''' AND ANO = ''' + FormatDateTime('yyyy',
              dtpRequisicao.Date) + '''';
            dmComprasEstoque.comandos.CommandText := qry;
            { dmComprasEstoque.comandos.Parameters.Clear;
              dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'QTDE';
              dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'QTDE1';
              dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'MES';
              dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'ANO';
              dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'IDPRODUTO';

              dmComprasEstoque.comandos.Parameters.ParamByName('QTDE').Value := dmComprasEstoque.qryAux.FieldByName('quantidade').AsInteger;
              dmComprasEstoque.comandos.Parameters.ParamByName('QTDE1').Value := dmComprasEstoque.qryAux.FieldByName('quantidade').AsInteger;
              dmComprasEstoque.comandos.Parameters.ParamByName('MES').Value := ;
              dmComprasEstoque.comandos.Parameters.ParamByName('ANO').Value := FormatDateTime('yyyy',dtpRequisicao.Date);
              dmComprasEstoque.comandos.Parameters.ParamByName('IDPRODUTO').Value := dmComprasEstoque.qryAux.FieldByName('idproduto').AsInteger;
            }
            dmComprasEstoque.comandos.Execute;
            dmComprasEstoque.comandos.Parameters.Clear;
            qry := 'UPDATE PRODUTO SET ESTOQUE  = ESTOQUE - ' +
              StringReplace
              (floatToStr(dmComprasEstoque.qryAux.FieldByName('quantidade')
              .AsFloat), ',', '.', [rfReplaceAll]);
            qry := qry + ' WHERE PRODUTOID = ''' +
              IntToStr(dmComprasEstoque.qryAux.FieldByName('idproduto')
              .AsInteger) + '''';

            dmComprasEstoque.comandos.CommandText := qry;
            {
              dmComprasEstoque.comandos.Parameters.Clear;
              dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'QTDE';
              //              dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'ALMOX';
              dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'IDPRODUTO';

              dmComprasEstoque.comandos.Parameters.ParamByName('QTDE').Value := dmComprasEstoque.qryAux.FieldByName('quantidade').AsInteger;
              //              dmComprasEstoque.comandos.Parameters.ParamByName('ALMOX').Value := dblAlmoxarifadoLanc.KeyValue;
              dmComprasEstoque.comandos.Parameters.ParamByName('IDPRODUTO').Value := dmComprasEstoque.qryAux.FieldByName('idproduto').AsInteger;
            }
            dmComprasEstoque.comandos.Execute;

            dmComprasEstoque.qryAux.Next;
          end;

          qry := 'DELETE FROM ITENSENTRADAPRODUTO WHERE identradaproduto = ''' +
            dmComprasEstoque.qryEntradaProduto.FieldByName('entradaid')
            .AsString + '''';
          dmComprasEstoque.comandos.CommandText := qry;
          dmComprasEstoque.comandos.Execute;

          qry := 'DELETE FROM ENTRADAPRODUTO WHERE entradaID = ''' +
            dmComprasEstoque.qryEntradaProduto.FieldByName('entradaid')
            .AsString + '''';
          dmComprasEstoque.comandos.CommandText := qry;
          dmComprasEstoque.comandos.Execute;

          // INSERINDO NOVAMENTE OS DADOS
          qry := 'INSERT INTO entradaproduto (idOrdemCompra,dataentrada, codalmoxarifado,codFornecedor,notafiscal,empenhoprocesso,valoracrescimodesconto,valorliquido, idCategoria) ';
          qry := qry +
            ' VALUES (:idOrdemCompra, :dataentrada, :codalmoxarifado, :codFornecedor, :notafiscal, :empenhoprocesso, :valoracrescimodesconto, :valorliquido, :idCategoria)';
          comandos := TADOCommand.Create(self);
          comandos.Connection := dmComprasEstoque.conexao;
          comandos.CommandText := qry;
          comandos.Parameters.Clear;
          // Adicionando os parametros no command
          comandos.Parameters.AddParameter.Name := 'idOrdemCompra';
          comandos.Parameters.AddParameter.Name := 'dataentrada';
          comandos.Parameters.AddParameter.Name := 'codalmoxarifado';
          comandos.Parameters.AddParameter.Name := 'codFornecedor';
          comandos.Parameters.AddParameter.Name := 'notafiscal';
          comandos.Parameters.AddParameter.Name := 'empenhoprocesso';
          comandos.Parameters.AddParameter.Name := 'valoracrescimodesconto';
          comandos.Parameters.AddParameter.Name := 'valorliquido';
          comandos.Parameters.AddParameter.Name := 'idCategoria';
          comandos.Parameters.ParamByName('idOrdemCompra').Value :=
            edtPedidoCompra.Text;
          comandos.Parameters.ParamByName('dataentrada').Value :=
            FormatDateTime('yyyy-mm-dd', dtpRequisicao.DateTime);
          comandos.Parameters.ParamByName('codalmoxarifado').Value :=
            dblAlmoxarifadoLanc.KeyValue;
          comandos.Parameters.ParamByName('codFornecedor').Value :=
            dblFornecedorLanc.KeyValue;
          comandos.Parameters.ParamByName('notafiscal').Value :=
            edtNotaFiscal.Text;
          comandos.Parameters.ParamByName('empenhoprocesso').Value :=
            edtEmpenho.Text;
          comandos.Parameters.ParamByName('valoracrescimodesconto').Value :=
            DoubleToDB(edtValorDesconto.Text);
          comandos.Parameters.ParamByName('valorliquido').Value :=
            DoubleToDB(edtValorTotal.Text);
          comandos.Parameters.ParamByName('idCategoria').Value :=
            dblCategoria.KeyValue;

          { qry := 'UPDATE entradaproduto SET idOrdemCompra = :idOrdemCompra, dataentrada = :dataentrada, codalmoxarifado = :codalmoxarifado, ';
            qry := qry + ' codFornecedor = :codFornecedor, notafiscal = :notafiscal, empenhoprocesso = :empenhoprocesso, valoracrescimodesconto = :valoracrescimodesconto, valorliquido = :valorliquido ';
            qry := qry + ' WHERE entradaid = ''' + dmComprasEstoque.qryEntradaProduto.FieldByName('entradaid').AsString + '''';
            comandos := TADOCommand.Create(self);
            comandos.Connection := dmComprasEstoque.conexao;
            comandos.CommandText := qry;
            comandos.Parameters.Clear;

            //Adicionando os parametros no command
            comandos.Parameters.AddParameter.Name := 'idOrdemCompra';
            comandos.Parameters.AddParameter.Name := 'dataentrada';
            comandos.Parameters.AddParameter.Name := 'codalmoxarifado';
            comandos.Parameters.AddParameter.Name := 'codFornecedor';
            comandos.Parameters.AddParameter.Name := 'notafiscal';
            comandos.Parameters.AddParameter.Name := 'empenhoprocesso';
            comandos.Parameters.AddParameter.Name := 'valoracrescimodesconto';
            comandos.Parameters.AddParameter.Name := 'valorliquido';
            comandos.Parameters.ParamByName('idOrdemCompra').Value := edtPedidoCompra.Text;
            comandos.Parameters.ParamByName('dataentrada').Value := FormatDateTime('yyyy-mm-dd',dtpRequisicao.DateTime);
            comandos.Parameters.ParamByName('codalmoxarifado').Value := dblAlmoxarifadoLanc.KeyValue;
            comandos.Parameters.ParamByName('codFornecedor').Value := dblFornecedorLanc.KeyValue;
            comandos.Parameters.ParamByName('notafiscal').Value := edtNotaFiscal.Text;
            comandos.Parameters.ParamByName('empenhoprocesso').Value := edtEmpenho.Text;
            comandos.Parameters.ParamByName('valoracrescimodesconto').Value := edtValorTotal.Text;
            comandos.Parameters.ParamByName('valorliquido').Value := edtValorTotal.Text;
          }

          comandos.Execute;
          dmComprasEstoque.qryAux.Close;
          dmComprasEstoque.qryAux.SQL.Clear;
          dmComprasEstoque.qryAux.SQL.Add
            ('select * from entradaproduto order by entradaid desc limit 1 ');
          dmComprasEstoque.qryAux.Open;
          codigoentrada := dmComprasEstoque.qryAux.FieldByName('entradaid')
            .AsInteger;

          // dmComprasEstoque.comandos.CommandText := 'DELETE FROM itensentradaproduto WHERE identradaproduto = ''' + dmComprasEstoque.qryEntradaProduto.FieldByName('entradaid').AsString + '''' ;
          // dmComprasEstoque.comandos.Execute;
          ClientDataSet2.First;
          // FormatoBR.DecimalSeparator := '.';
          // System.SysUtils.FormatSettings := FormatoBR;
          while not ClientDataSet2.Eof do
          begin
            qry := 'INSERT INTO itensentradaproduto (idproduto, quantidade, valorunitario, valortotal, identradaproduto) ';
            qry := qry +
              ' VALUES (:idproduto, :quantidade, :valorunitario, :valortotal, :identradaproduto)';
            comandos.CommandText := qry;
            comandos.Parameters.Clear;
            // Adicionando os parametros no command
            comandos.Parameters.AddParameter.Name := 'idproduto';
            comandos.Parameters.AddParameter.Name := 'quantidade';
            comandos.Parameters.AddParameter.Name := 'valorunitario';
            comandos.Parameters.AddParameter.Name := 'valortotal';
            // comandos.Parameters.AddParameter.Name := 'validade';
            comandos.Parameters.AddParameter.Name := 'identradaproduto';
            comandos.Parameters.ParamByName('idproduto').Value :=
              ClientDataSet2codigo.Value;
            comandos.Parameters.ParamByName('quantidade').Value :=
              ClientDataSet2quantidade.Value;
            comandos.Parameters.ParamByName('valorunitario').Value :=
              ClientDataSet2precounitario.Value;
            comandos.Parameters.ParamByName('valortotal').Value :=
              ClientDataSet2total.Value;
            // comandos.Parameters.ParamByName('validade').Value := FormatDateTime('yyyy-mm-dd',ClientDataSet2validade.Value);
            comandos.Parameters.ParamByName('identradaproduto').Value :=
              codigoentrada;
            // dmComprasEstoque.qryEntradaProduto.FieldByName('entradaid').AsString;
            comandos.Execute;
            ClientDataSet2.Next;
          end;
          // FormatoBR.DecimalSeparator := ',';
          // System.SysUtils.FormatSettings := FormatoBR;
          dmComprasEstoque.conexao.CommitTrans;
          ClientDataSet2.First;
          while not ClientDataSet2.Eof do
          begin
            atualizaSaldoNF(ClientDataSet2codigo.AsInteger,
              dblFornecedorLanc.KeyValue, edtNotaFiscal.Text,
              ClientDataSet2quantidade.AsFloat,
              ClientDataSet2precounitario.AsFloat);
            ClientDataSet2.Next;
          end;

          MessageBox(Application.Handle, 'Registro salvo com sucesso.',
            'Compras e Estoque', MB_ICONINFORMATION + MB_OK);
          limparcampos;
          btnConsultarClick(self);
        except
          on E: Exception do
          begin
            dmComprasEstoque.conexao.RollbackTrans;
            ShowMessage(E.Message);
            MessageBox(Application.Handle, 'Erro ao gravar os dados.',
              'Compras e Estoque', MB_ICONERROR + MB_OK);
          end;
        end;
      end;
  end;
  // end
  // else begin
  // Messagebox(Application.Handle,'O mês para realização do lançamento não está ativado.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
  // btnCancelarClick(self);
  // end;
end;

procedure TfrmEntradaProdutos.carregaDados;
var
  qry: string;
  // comandos : TADOCommand;
begin
  limparcampos;
  if btnNovo.Enabled = false then
    habilitaBotoes;
  qry := 'select * from entradaproduto as ep ';
  // qry := qry + ' join ordemcompra as oc on oc.ordemcompraid = ep.idordemcompra ';
  // qry := qry + ' join requisicaocompra as rc on rc.requisicaocompraid = oc.idreqcompra ';
  // qry := qry + ' join centroconsumo as cc on cc.centroconsumoID = rc.idcentroconsumo ';
  qry := qry +
    ' join fornecedor as f on f.cpfcnpj = ep.codfornecedor or f.codigo = ep.codfornecedor ';
  qry := qry +
    ' join almoxarifado as alm on alm.almoxarifadoID = ep.codalmoxarifado ';
  qry := qry + ' where ep.entradaID = ''' + dmComprasEstoque.qryEntradaProduto.
    FieldByName('entradaID').AsString + '''';
  with dmComprasEstoque do
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(qry);
    qryAux.Open;
    if qryAux.RecordCount <> 0 then
    begin

      // Carregando cabeçalho
      dtpRequisicao.DateTime :=
        StrToDateTime(FormatDateTime('dd/mm/yyyy',
        qryAux.FieldByName('dataentrada').Value));
      edtPedidoCompra.Text := qryAux.FieldByName('idordemcompra').AsString;
      edtNotaFiscal.Text := qryAux.FieldByName('notafiscal').AsString;

      edtValorDesconto.Text := qryAux.FieldByName
        ('valoracrescimodesconto').AsString;
      if (StrToFloat(edtValorDesconto.Text)
        = StrToFloat(qryAux.FieldByName('valorliquido').AsString)) then
      begin
        edtValorDesconto.Text := '0';
      end;
      edtEmpenho.Text := qryAux.FieldByName('empenhoprocesso').AsString;
      // dblCentroConsumoLanc.KeyValue := qryAux.FieldByName('idcentroconsumo').AsInteger;
      dblAlmoxarifadoLanc.KeyValue := qryAux.FieldByName('CodAlmoxarifado')
        .AsInteger;
      dblFornecedorLanc.KeyValue := qryAux.FieldByName('CODfornecedor')
        .AsString;
      dblCategoria.KeyValue := qryAux.FieldByName('idCategoria').Value;

      // carregando os produtos da nota fiscal
      qry := 'select * from itensentradaproduto as i';
      qry := qry + ' join produto as p on p.produtoid = i.idproduto ';
      qry := qry + ' where i.identradaproduto = ''' +
        qryAux.FieldByName('entradaid').AsString + '''';
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(qry);
      qryAux.Open;
      ClientDataSet2.Open;
      while not qryAux.Eof do
      begin
        ClientDataSet2.Insert;
        ClientDataSet2codigo.Value := qryAux.FieldByName('idproduto').AsInteger;
        ClientDataSet2descricao.AsString :=
          qryAux.FieldByName('descricao').AsString;
        ClientDataSet2quantidade.Value :=
          qryAux.FieldByName('quantidade').AsFloat;
        ClientDataSet2precounitario.Value :=
          qryAux.FieldByName('valorunitario').AsFloat;
        ClientDataSet2total.Value := qryAux.FieldByName('valortotal').AsFloat;
        // ClientDataSet2validade.Value := StrToDateTime(FormatDateTime('dd/mm/yyyy',qryAux.FieldByName('validade').AsDateTime));
        ClientDataSet2.Post;
        qryAux.Next;
      end;
    end;
  end;
  atualizaGrid;
end;

procedure TfrmEntradaProdutos.chkAlmoxarifadoClick(Sender: TObject);
begin
  if (dblAlmoxarifado.Text = '') then
    chkAlmoxarifado.Checked := false;
end;

procedure TfrmEntradaProdutos.chkFornecedorClick(Sender: TObject);
begin
  if (dblFornecedor.Text = '') then
    chkFornecedor.Checked := false;
end;

procedure TfrmEntradaProdutos.chkNFClick(Sender: TObject);
begin
  if (edtNF.Text = '') then
    chkNF.Checked := false;
end;

procedure TfrmEntradaProdutos.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  carregaDados;
end;

procedure TfrmEntradaProdutos.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    atualizaGrid;
  end;
end;

procedure TfrmEntradaProdutos.dblAlmoxarifadoClick(Sender: TObject);
begin
  if (dblAlmoxarifado.Text <> '') then
    chkAlmoxarifado.Checked := true
  else
    chkAlmoxarifado.Checked := false;
end;

procedure TfrmEntradaProdutos.dblAlmoxarifadoLancKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  BEGIN
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  END;
end;

procedure TfrmEntradaProdutos.dblCentroConsumoLancKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  BEGIN
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  END;

end;

procedure TfrmEntradaProdutos.dblFornecedorClick(Sender: TObject);
begin
  if (dblFornecedor.Text <> '') then
    chkFornecedor.Checked := true
  else
    chkFornecedor.Checked := false;

end;

procedure TfrmEntradaProdutos.dblFornecedorLancKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  BEGIN
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  END;
end;

procedure TfrmEntradaProdutos.dblProdutosRequisicao1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  BEGIN
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  END;
end;

procedure TfrmEntradaProdutos.dblProdutosRequisicaoEnter(Sender: TObject);
begin
  keybd_event(VK_DOWN, 1, 0, 0);
end;

procedure TfrmEntradaProdutos.dtpDeRequisicaoClick(Sender: TObject);
begin
  chkEntrada.Checked := true;
end;

procedure TfrmEntradaProdutos.dtpRequisicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmEntradaProdutos.dtpValidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  BEGIN
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  END;
end;

procedure TfrmEntradaProdutos.edtEmpenhoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmEntradaProdutos.edtNFChange(Sender: TObject);
begin
  if edtNF.Text <> '' then
    chkNF.Checked := true
  else
    chkNF.Checked := false;
end;

procedure TfrmEntradaProdutos.edtNotaFiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmEntradaProdutos.edtPedidoCompraKeyPress(Sender: TObject;
  var Key: Char);
var
  qry: string;
begin
  if Key = #13 then
  begin
    if edtPedidoCompra.Text <> '' then
    Begin

      // edtNotaFiscal.SetFocus;
      qry := 'SELECT * FROM ordemcompra as oc  ';
      qry := qry +
        ' join requisicaocompra as rc on rc.ordemcompraId = oc.ordemcompraID ';
      qry := qry + ' where oc.ordemcompraid = :pedido ';
      with dmComprasEstoque do
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(qry);
        qryAux.Parameters.ParamByName('pedido').Value := edtPedidoCompra.Text;
        qryAux.Open;
        if qryAux.RecordCount > 0 then
        begin
          // dblCentroConsumoLanc.KeyValue := qryAux.FieldByName('idcentroconsumo').AsInteger;
          dblAlmoxarifadoLanc.KeyValue := qryAux.FieldByName('idalmoxarifado')
            .AsInteger;
          dblFornecedorLanc.KeyValue :=
            qryAux.FieldByName('idfornecedor').AsString;
        end;
      end;
    End;
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmEntradaProdutos.edtPrecoUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if (edtQuantidade.Text <> '') then
    begin
      ClientDataSet2.Open;
      ClientDataSet2.Insert;
      ClientDataSet2codigo.Value := dmComprasEstoque.qryProdutosRequisicao.
        FieldByName('produtoID').AsInteger;
      ClientDataSet2descricao.AsString :=
        dmComprasEstoque.qryProdutosRequisicao.FieldByName('descricao')
        .AsString;
      ClientDataSet2quantidade.Value := StrToFloat(edtQuantidade.Text);
      ClientDataSet2precounitario.Value := StrToFloat(edtPrecoUnitario.Text);
      ClientDataSet2total.Value := ClientDataSet2quantidade.Value *
        ClientDataSet2precounitario.Value;
      // ClientDataSet2Validade.Value := StrToDateTime(FormatDateTime('dd/mm/yyyy',dtpValidade.DateTime));
      edtValorTotal.Text := floatToStr(StrToFloat(edtValorTotal.Text) +
        ClientDataSet2total.Value);
      ClientDataSet2.Post;
      dblProdutosRequisicao.LookupValue := '';
      edtQuantidade.Clear;
      edtPrecoUnitario.Text := '0,0';
      atualizaGrid;
      dblProdutosRequisicao.SetFocus;

    end
    else
    begin
      ShowMessage('Informe a quantidade do produto.');
      edtQuantidade.SetFocus;
    end;

  end;
end;

procedure TfrmEntradaProdutos.edtProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  produto, prodQry: String;
begin
  { with (dmComprasEstoque.qryProdutosRequisicao) do
    begin
    First;
    produto := UpperCase(edtProduto.Text);
    while (not Eof) do
    begin
    prodQry := Copy(FieldByName('descricao').AsString, 1, length(produto));
    if (prodQry = produto) then
    begin
    ultimoIdProduto := FieldByName('produtoID').AsInteger;
    dblProdutosRequisicao.KeyValue := FieldByName('produtoID').AsInteger;
    lblNomeProdutoBusca.Caption := FieldByName('descricao').AsString;
    // dblProdutosRequisicaoCloseUp(Sender);
    break;
    end;
    Next;
    end;
    if (dblProdutosRequisicao.Text = '') then
    dblProdutosRequisicao.KeyValue := ultimoIdProduto;
    end; }
  try
    if (edtProduto.Text <> '') then
      dblProdutosRequisicao.LookupValue := edtProduto.Text;
  finally

  end;
end;

procedure TfrmEntradaProdutos.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  BEGIN
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  END;
end;

procedure TfrmEntradaProdutos.edtValorDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if edtValorDesconto.Text <> '' then
      atualizaGrid;
  end;

end;

procedure TfrmEntradaProdutos.ExcluirItem1Click(Sender: TObject);
begin
  ClientDataSet2.Delete;
  { if tipooperacao = 'E'
    then
    begin
    dmComprasEstoque.comandos.CommandText :=
    'UPDATE PRODUTO SET ESTOQUE = ESTOQUE - ' +
    ClientDataSet2quantidade.AsString + ' WHERE PRODUTOID = ''' +
    ClientDataSet2codigo.AsString + '''';
    dmComprasEstoque.comandos.Execute;

    end; }
end;

procedure TfrmEntradaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmComprasEstoque.qryAlmoxarifado.Close;
  dmComprasEstoque.qryFornecedor.Close;
  dmComprasEstoque.qryProdutosRequisicao.Close;
  dmComprasEstoque.qryCentroConsumo.Close
end;

procedure TfrmEntradaProdutos.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  dtpDeRequisicao.DateTime := dtpDeRequisicao.MaxDate;
  with (dmComprasEstoque) do
  begin
    qryAlmoxarifado.Open;
    qryFornecedor.Open;
    qryProdutosRequisicao.Open;
    qryCentroConsumo.Open;
    qryCategorias.Open;
    qryEntradaProduto.Open;
  end;

end;

procedure TfrmEntradaProdutos.habilitaBotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmEntradaProdutos.limparcampos;
begin
  edtValorDesconto.Text := '0,0';
  edtPedidoCompra.Clear;
  edtNotaFiscal.Clear;
  // dblCentroConsumoLanc.KeyValue := 0;
  dblAlmoxarifadoLanc.KeyValue := 0;
  dblFornecedorLanc.KeyValue := 0;
  dblProdutosRequisicao.LookupValue := '';
  edtQuantidade.Clear;
  edtPrecoUnitario.Text := '0,0';
  edtValorTotal.Text := '0,0';
  // dtpValidade.DateTime := now;
  dtpRequisicao.DateTime := dtpRequisicao.MaxDate;

  ativarClientDataSet;

end;

procedure TfrmEntradaProdutos.ativarClientDataSet;
begin
  if (ClientDataSet2.Active = true) then
  begin
    ClientDataSet2.EmptyDataSet;
    ClientDataSet2.Close;
  end;
  ClientDataSet2.CreateDataSet;
  ClientDataSet2.Open;
end;

procedure TfrmEntradaProdutos.SpeedButton1Click(Sender: TObject);
begin
  try
    frmRelItensNFSaida := TfrmRelItensNFSaida.Create(self);
    frmRelItensNFSaida.showModal();
  finally
    frmRelItensNFSaida.Free;
  end;
end;

procedure TfrmEntradaProdutos.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEntradaProdutos.btnAnteriorClick(Sender: TObject);
begin
  if (dmComprasEstoque.qryEntradaProduto.FindPrior) then
  begin
    DBGrid1DblClick(self);
    btnProximo.Enabled := true;
  end
  else
    btnAnterior.Enabled := false;
end;

function TfrmEntradaProdutos.deleteOrdemCompra(idOrdemCompra: String): boolean;
var
  ordCompraDao: UOrdemCompraDAO;

begin
  //
  ordCompraDao := UOrdemCompraDAO.Create;
  if (ordCompraDao.Delete(idOrdemCompra)) then
  begin
    Result := true;
  end
  else
  begin
    ShowMessage('Não foi possível excluir a Ordem de Compra com ID ' +
      idOrdemCompra);
    Result := false;
  end;

end;

function TfrmEntradaProdutos.deleteRequisicaoCompra(idRequisicaoCompra
  : String): boolean;
var
  reqCompra: URequisicaoCompraDAO;
begin
  //
  reqCompra := URequisicaoCompraDAO.Create;
  if (reqCompra.Delete(idRequisicaoCompra)) then
  begin
    Result := true;
  end
  else
  begin
    ShowMessage('Não foi possível excluir a Requisição de Compra com ID ' +
      idRequisicaoCompra);
    Result := false;
  end;

end;

function TfrmEntradaProdutos.getIdRCPorIdOC(idOrdemCompra: String): String;
var
  reqCompra: URequisicaoCompraDAO;
  idRC: String;
begin
  //
  reqCompra := URequisicaoCompraDAO.Create;
  idRC := IntToStr(reqCompra.getIdRequisicaoCompraPorOrdemCompra
    (idOrdemCompra));
  reqCompra.Free;
  Result := idRC;

end;

end.
