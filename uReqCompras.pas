unit uReqCompras;

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
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ToolWin,
  Vcl.ImgList,
  Data.DB,
  Datasnap.DBClient,
  Data.Win.ADODB,
  System.UITypes,
  Datasnap.Provider,
  ComObj,
  Vcl.Menus,
  UItemRequisicaoCompra,
  Funcoes,
  ProdutosDAO,
  UFrmSearchProdutos,
  System.ImageList, Vcl.Mask, JvExMask, JvToolEdit, JvDBLookup;

type
  TfrmRequisicaoCompra = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    chkLicitacao: TCheckBox;
    chkAlmoxarifado: TCheckBox;
    dblAlmoxarifado: TDBLookupComboBox;
    chkCentroConsumo: TCheckBox;
    dblCentroConsumo: TDBLookupComboBox;
    chkFornecedor: TCheckBox;
    dblFornecedor: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    De: TLabel;
    Até: TLabel;
    dtpAteRequisicao: TDateTimePicker;
    dtpDeRequisicao: TDateTimePicker;
    chkDataConclusao: TCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpAteConclusao: TDateTimePicker;
    dtpDeConclusao: TDateTimePicker;
    edtLicitacao: TEdit;
    btnConsultar: TBitBtn;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    btnNovo: TToolButton;
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
    Label2: TLabel;
    dtpRequisicao: TDateTimePicker;
    dtpConclusao: TDateTimePicker;
    rdgFormaRequisicao: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    dblFormaPagamentoLanc: TDBLookupComboBox;
    Label7: TLabel;
    dblAlmoxarifadoLanc: TDBLookupComboBox;
    Label8: TLabel;
    dblCentroConsumoLanc: TDBLookupComboBox;
    dblFornecedorLanc: TDBLookupComboBox;
    Label9: TLabel;
    dlbSituacaoRequisicao: TDBLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Panel2: TPanel;
    ClientDataSet1Label: TLabel;
    dsItensRequisicao: TDataSource;
    edtLicitacaoLanc: TEdit;
    edtDescricaoConclusao: TEdit;
    ToolButton2: TToolButton;
    DBGrid2: TDBGrid;
    Label12: TLabel;
    edtQuantidade: TEdit;
    Label13: TLabel;
    btnAdicionarItens: TSpeedButton;
    ImageListMainMenu: TImageList;
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    StatusBar1: TStatusBar;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1produtoid: TIntegerField;
    ClientDataSet1quantidade: TFloatField;
    ClientDataSet1valorunitario: TFloatField;
    ClientDataSet1descricao: TStringField;
    btnImport: TBitBtn;
    dlgImp: TOpenDialog;
    BitBtn1: TBitBtn;
    chkDataRequisicao: TCheckBox;
    lblDescricaoProduto: TLabel;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    ToolButton5: TToolButton;
    ToolButton11: TToolButton;
    edtProduto: TEdit;
    dblProdutosRequisicao: TJvDBLookupEdit;
    procedure ativarClientDataSet;
    procedure btnNovoClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure habilitaBotoes;
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarItensClick(Sender: TObject);
    procedure limpaCampos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure carregaDados;
    procedure btnExcluirClick(Sender: TObject);
    procedure edtLicitacaoLancKeyPress(Sender: TObject; var Key: Char);
    procedure dblFormaPagamentoLancKeyPress(Sender: TObject; var Key: Char);
    procedure dblAlmoxarifadoLancKeyPress(Sender: TObject; var Key: Char);
    procedure dblCentroConsumoLancKeyPress(Sender: TObject; var Key: Char);
    procedure dblFornecedorLancKeyPress(Sender: TObject; var Key: Char);
    procedure dlbSituacaoRequisicaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoConclusaoKeyPress(Sender: TObject; var Key: Char);
    procedure dblProdutosRequisicao1KeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dtpRequisicaoKeyPress(Sender: TObject; var Key: Char);
    procedure dtpConclusaoKeyPress(Sender: TObject; var Key: Char);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure ImportarExcel(arquivo: String);
    function verificarDados(): TList;
    procedure BitBtn1Click(Sender: TObject);
    procedure dtpDeRequisicaoChange(Sender: TObject);
    procedure dtpDeConclusaoChange(Sender: TObject);
    procedure dblAlmoxarifadoCloseUp(Sender: TObject);
    procedure dblCentroConsumoCloseUp(Sender: TObject);
    procedure dblFornecedorCloseUp(Sender: TObject);
    procedure edtLicitacaoChange(Sender: TObject);
    procedure chkAlmoxarifadoClick(Sender: TObject);
    procedure chkCentroConsumoClick(Sender: TObject);
    procedure chkLicitacaoClick(Sender: TObject);
    procedure chkFornecedorClick(Sender: TObject);
    procedure edtProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure atualizarProdutos();
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure dblProdutosRequisicaoKeyPress(Sender: TObject; var Key: Char);
    procedure dblProdutosRequisicaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRequisicaoCompra: TfrmRequisicaoCompra;
  tipooperacao: Char;
  arquivo: String;
  ultimoProduto: String;
  ultimoIdProduto: Integer;

implementation

{$R *.dfm}

uses
  udmComprasEstoque,
  ufuncao,
  uCadProdutos;

function TfrmRequisicaoCompra.verificarDados(): TList;
var
  items, itemsReserva, itensNaoCadastrados: TList;
  item: TItemRequisicaoCompra;
  x, i, vazio: Integer;
  nCadastrados, descArquivo, descBD: String;
  excel: Variant;
  Funcoes: TFuncoes;
  qryProdCadastrados: TADOQuery;
begin
  excel := CreateOleObject('Excel.Application');
  excel.DisplayAlerts := false;
  excel.Visible := false;
  excel.WorkBooks.Open(arquivo);
  x := 0; // Verificador de existência de Item já cadastrado no BD
  i := 2; // primeira linha do arquivo
  items := TList.Create;
  // Setando Dados no ClientDataSet
  ClientDataSet1.Close;
  ClientDataSet1.Open;
  ClientDataSet1.First;
  Funcoes := TFuncoes.Create;
  while (excel.WorkBooks[1].Sheets[1].Cells[i, 1].Value <> '') do
  begin
    item := TItemRequisicaoCompra.Create;
    item.descricao := excel.WorkBooks[1].Sheets[1].Cells[i, 1].Value;
    item.quantidade := excel.WorkBooks[1].Sheets[1].Cells[i, 2].Value;
    i := i + 1;

    qryProdCadastrados := dmComprasEstoque.qryProdutos;
    with (qryProdCadastrados) do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM produto where descricao like ''' +
        item.descricao + '''');
      Open;
      if (qryProdCadastrados.RecordCount = 0) then
      begin
        item := cadastrarProduto(item);
      end
      else
      begin
        item.idproduto := FieldByName('produtoID').AsString;
      end;
    end;
    items.Add(item);
  end;
  Result := items;
end;

procedure TfrmRequisicaoCompra.ImportarExcel(arquivo: String);
var
  i: Integer;
  listItens: TList;
  item: TItemRequisicaoCompra;
begin
  // verificando duplicidade de dadosd
  listItens := verificarDados();

  for i := 0 to listItens.Count - 1 do
  begin
    item := listItens[i];
    ClientDataSet1.Insert;
    ClientDataSet1.FieldByName('produtoID').AsString := item.idproduto;
    ClientDataSet1.FieldByName('quantidade').AsString := item.quantidade;
    ClientDataSet1.FieldByName('descricao').AsString := item.descricao;
    ClientDataSet1.Post;
  end;
  ClientDataSet1.Close;
  ClientDataSet1.Open;

end;

procedure TfrmRequisicaoCompra.btnCancelarClick(Sender: TObject);
begin
  Panel1.Enabled := false;
  habilitaBotoes;
  limpaCampos;
  tipooperacao := ' ';
  dmComprasEstoque.qryProdutos.Close;
end;

procedure TfrmRequisicaoCompra.btnConsultarClick(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT  rc.*, alm.descricao as almoxarifado, sr.descricao as SituacaoRequisicao, ';
  qry := qry + ' cc.descricao as CentroConsumo, f.razaosocial ';
  qry := qry + ' FROM requisicaocompra as rc';
  qry := qry +
    ' left join almoxarifado as alm on alm.almoxarifadoid = rc.idalmoxarifado ';
  qry := qry +
    ' left join situacaorequisicao as sr on sr.situacaorequisicaoid = rc.idsituacao ';
  qry := qry +
    ' left join centroconsumo as cc on cc.centroconsumoID = rc.idcentroconsumo ';
  qry := qry +
    ' left join fornecedor as f on f.cpfcnpj = rc.idfornecedor OR f.codigo = rc.idfornecedor ';
  qry := qry + ' WHERE 1 ';
  if chkDataRequisicao.Checked then
  begin
    qry := qry + ' AND rc.datarequisicao between ''' +
      FormatDateTime('yyyy-mm-dd', dtpDeRequisicao.DateTime) + ''' AND ''' +
      FormatDateTime('yyyy-mm-dd', dtpAteRequisicao.DateTime) + '''';
  end;
  if chkDataConclusao.Checked then
  begin
    qry := qry + ' AND rc.dataconclusao between ''' +
      FormatDateTime('yyyy-mm-dd', dtpDeConclusao.DateTime) + ''' AND ''' +
      FormatDateTime('yyyy-mm-dd', dtpAteConclusao.DateTime) + '''';
  end;
  if chkLicitacao.Checked then
    qry := qry + ' AND rc.licitacao = ''' + edtLicitacao.Text + '''';
  if chkAlmoxarifado.Checked then
    qry := qry + ' AND rc.idalmoxarifado = ''' +
      IntToStr(dblAlmoxarifado.KeyValue) + '''';

  if chkCentroConsumo.Checked then
    qry := qry + ' AND rc.idcentroconsumo = ''' +
      IntToStr(dblCentroConsumo.KeyValue) + '''';

  if chkFornecedor.Checked then
    qry := qry + ' AND rc.idfornecedor = ''' + IntToStr(dblFornecedor.KeyValue)
      + ''' OR rc.idfornecedor = ''' + dmComprasEstoque.qryFornecedor.
      FieldByName('codigo').AsString + '''';

  with dmComprasEstoque, qryRequisicaoCompras do
  begin
    Close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
  end;

end;

procedure TfrmRequisicaoCompra.btnEditarClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitaBotoes;
  tipooperacao := 'E';
  dtpRequisicao.SetFocus;
  dmComprasEstoque.qryProdutos.Open;

end;

procedure TfrmRequisicaoCompra.btnExcluirClick(Sender: TObject);
var
  qry: string;
  // comandos : TAdoCommand;
  qryTemporario: TADOQuery;
begin
  if MessageDlg('Deseja excluir esta requisição de compra?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    qryTemporario := TADOQuery.Create(self);
    qryTemporario.Connection := dmComprasEstoque.conexao;
    qryTemporario.Close;
    qryTemporario.SQL.Clear;
    qry := 'SELECT * FROM REQUISICAOCOMPRA WHERE requisicaocompraid = ''' +
      dmComprasEstoque.qryRequisicaoCompras.FieldByName('requisicaocompraid')
      .AsString + '''';
    qryTemporario.SQL.Add(qry);
    qryTemporario.Open;
    if qryTemporario.FieldByName('idsituacao').AsInteger = 2 then
    begin
      MessageBox(Application.Handle,
        'Não é possível exclusão, pois esta requisição possui uma Ordem de Compra associada.',
        'Compras & Estoque', MB_ICONERROR + MB_OK);
    end
    else
    begin
      try
        dmComprasEstoque.conexao.BeginTrans;
        qry := 'DELETE FROM ITENSREQUISICAOCOMPRA WHERE idrequisicaocompra = '''
          + dmComprasEstoque.qryRequisicaoCompras.FieldByName
          ('requisicaocompraid').AsString + '''';
        dmComprasEstoque.comandos.CommandText := qry;
        dmComprasEstoque.comandos.Execute;

        qry := 'DELETE FROM REQUISICAOCOMPRA WHERE requisicaocompraid = ''' +
          dmComprasEstoque.qryRequisicaoCompras.FieldByName
          ('requisicaocompraid').AsString + '''';
        dmComprasEstoque.comandos.CommandText := qry;
        dmComprasEstoque.comandos.Execute;
        dmComprasEstoque.conexao.CommitTrans;
        limpaCampos;
        MessageBox(Application.Handle, 'Requisição excluída com sucesso.',
          'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
      Except
        on e: Exception do
        begin
          dmComprasEstoque.conexao.RollbackTrans;
          MessageBox(Application.Handle, 'Erro ao excluir a requisição.',
            'Compras & Estoque', MB_ICONERROR + MB_OK);
        end;
      end;
    end;
  end;
end;

procedure TfrmRequisicaoCompra.btnImportClick(Sender: TObject);
var
  excel: Variant;
begin
  if (dlgImp.Execute) then
  begin
    arquivo := dlgImp.fileName;
    excel := CreateOleObject('Excel.Application');
    excel.DisplayAlerts := false;
    excel.Visible := false;
    excel.WorkBooks.Open(arquivo);
    if (excel.WorkBooks[1].Sheets[1].Cells[1, 3].Value = 'itemrequisicaocompra')
    then
      ImportarExcel(arquivo)
    else
      ShowMessage
        ('O Arquivo selecionado não é relacionado a Itens de Requisição de Compra. Por favor, selecione o arquivo correto e tente novamente.');
  end;
end;

procedure TfrmRequisicaoCompra.btnNovoClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitaBotoes;
  tipooperacao := 'N';
  limpaCampos;
  dtpRequisicao.SetFocus;
  rdgFormaRequisicao.ItemIndex := 0;
  dmComprasEstoque.qryProdutos.Open;
end;

procedure TfrmRequisicaoCompra.btnSalvarClick(Sender: TObject);
var
  qry: string;
  comandos: TAdoCommand;
  // query : TADOQuery;
  requisicao: Integer;
begin
  if ClientDataSet1.IsEmpty then
  begin
    MessageBox(Application.Handle,
      'Adicione itens para confirmação do lançamento.', 'Compras e Estoque',
      MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  // query := TADOQuery.Create(self);
  // query.Connection := dmComprasEstoque.conexao;
  // if verificaliberacao(query,strtoint(FormatDateTime('yyyy',dtpRequisicao.Date)),strtoint(FormatDateTime('mm',dtpRequisicao.Date))) then begin

  Panel1.Enabled := false;
  habilitaBotoes;
  case tipooperacao of
    'N':
      begin
        if (rdgFormaRequisicao.ItemIndex = -1) then
        begin
          ShowMessage('Informe a forma de requisição.');
          exit;
        end;
        qry := 'INSERT INTO REQUISICAOCOMPRA(idalmoxarifado, idcentroconsumo, idfornecedor, datarequisicao, ';
        qry := qry +
          ' idformapagamento, idsituacao, licitacao, observacaojustificativa, dataconclusao, ';
        qry := qry + ' descricaoconclusao, formarequisicao)';
        qry := qry +
          ' VALUES(:idalmoxarifado, :idcentroconsumo, :idfornecedor, :datarequisicao, ';
        qry := qry +
          ' :idformapagamento, :idsituacao, :licitacao, :observacaojustificativa, :dataconclusao, ';
        qry := qry + ' :descricaoconclusao, :formarequisicao)';
        comandos := TAdoCommand.Create(self);
        comandos.Connection := dmComprasEstoque.conexao;
        with comandos do
        begin
          CommandText := qry;
          Parameters.Clear;
          // Adicionando os parametros no command
          Parameters.AddParameter.Name := 'idalmoxarifado';
          Parameters.AddParameter.Name := 'idcentroconsumo';
          Parameters.AddParameter.Name := 'idfornecedor';
          Parameters.AddParameter.Name := 'datarequisicao';
          Parameters.AddParameter.Name := 'idformapagamento';
          Parameters.AddParameter.Name := 'idsituacao';
          Parameters.AddParameter.Name := 'licitacao';
          Parameters.AddParameter.Name := 'observacaojustificativa';
          Parameters.AddParameter.Name := 'dataconclusao';
          Parameters.AddParameter.Name := 'descricaoconclusao';
          Parameters.AddParameter.Name := 'formarequisicao';
          // Atribuindo valores aos parametros
          Parameters.ParamByName('idalmoxarifado').Value :=
            dblAlmoxarifadoLanc.KeyValue;
          Parameters.ParamByName('idcentroconsumo').Value :=
            dblCentroConsumoLanc.KeyValue;
          Parameters.ParamByName('idfornecedor').Value :=
            dblFornecedorLanc.KeyValue;
          Parameters.ParamByName('datarequisicao').Value :=
            FormatDateTime('yyyy-mm-dd', dtpRequisicao.Date);
          Parameters.ParamByName('idformapagamento').Value :=
            dblFormaPagamentoLanc.KeyValue;
          Parameters.ParamByName('idsituacao').Value :=
            dlbSituacaoRequisicao.KeyValue;
          Parameters.ParamByName('licitacao').Value :=
            UpperCase(edtLicitacaoLanc.Text);
          Parameters.ParamByName('observacaojustificativa').Value := '';
          Parameters.ParamByName('dataconclusao').Value :=
            FormatDateTime('yyyy-mm-dd', dtpConclusao.Date);
          Parameters.ParamByName('descricaoconclusao').Value :=
            UpperCase(edtDescricaoConclusao.Text);
          Parameters.ParamByName('formarequisicao').Value :=
            rdgFormaRequisicao.ItemIndex + 1;
          try
            dmComprasEstoque.conexao.BeginTrans;
            Execute;
            qry := 'select requisicaocompraid from requisicaocompra order by requisicaocompraid desc limit 1';
            dmComprasEstoque.qryAux.Close;
            dmComprasEstoque.qryAux.SQL.Clear;
            dmComprasEstoque.qryAux.SQL.Add(qry);
            dmComprasEstoque.qryAux.Open;
            requisicao := dmComprasEstoque.qryAux.FieldByName
              ('requisicaocompraid').AsInteger;
            qry := 'INSERT INTO ITENSREQUISICAOCOMPRA(idrequisicaocompra, idproduto, quantidade) ';
            qry := qry +
              ' VALUES(:idrequisicaocompra, :idproduto, :quantidade) ';
            CommandText := qry;
            Parameters.Clear;
            Parameters.AddParameter.Name := 'idrequisicaocompra';
            Parameters.AddParameter.Name := 'idproduto';
            Parameters.AddParameter.Name := 'quantidade';

            ClientDataSet1.First;

            while not ClientDataSet1.Eof do
            begin
              Parameters.ParamByName('idrequisicaocompra').Value := requisicao;
              Parameters.ParamByName('idproduto').Value :=
                ClientDataSet1produtoid.AsInteger;
              Parameters.ParamByName('quantidade').Value :=
                ClientDataSet1quantidade.AsFloat;
              Execute;
              ClientDataSet1.Next
            end;
            dmComprasEstoque.conexao.CommitTrans;
            ShowMessage('Requisição No ' + formatfloat('000000', requisicao) +
              ' gerada com sucesso.');
            // MessageBox(Application.Handle,'Requisição gerada com sucesso.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
            limpaCampos;
          except
            on e: Exception do
            Begin
              ShowMessage(e.Message);
              dmComprasEstoque.conexao.RollbackTrans;
            End;
          end;
        end;
      end; // Fim caso N
    'E':
      begin
        if dmComprasEstoque.qryRequisicaoCompras.FieldByName('ordemcompraid')
          .AsString <> '' then
        begin
          MessageBox(Application.Handle,
            'Requisição já possui pedido. Edição não permitida.',
            'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
          limpaCampos;
        end
        else
        begin
          qry := 'UPDATE REQUISICAOCOMPRA SET idalmoxarifado = :idalmoxarifado, idcentroconsumo = :idcentroconsumo, idfornecedor = :idfornecedor, datarequisicao = :datarequisicao, ';
          qry := qry +
            ' idformapagamento = :idformapagamento , idsituacao = :idsituacao , licitacao = :licitacao, observacaojustificativa = :observacaojustificativa, dataconclusao = :dataconclusao, ';
          qry := qry +
            ' descricaoconclusao = :descricaoconclusao, formarequisicao = :formarequisicao';
          qry := qry + ' WHERE requisicaocompraid = :requisicao';
          comandos := TAdoCommand.Create(self);
          comandos.Connection := dmComprasEstoque.conexao;
          with comandos do
          begin
            CommandText := qry;
            Parameters.Clear;
            // Adicionando os parametros no command
            Parameters.AddParameter.Name := 'idalmoxarifado';
            Parameters.AddParameter.Name := 'idcentroconsumo';
            Parameters.AddParameter.Name := 'idfornecedor';
            Parameters.AddParameter.Name := 'datarequisicao';
            Parameters.AddParameter.Name := 'idformapagamento';
            Parameters.AddParameter.Name := 'idsituacao';
            Parameters.AddParameter.Name := 'licitacao';
            Parameters.AddParameter.Name := 'observacaojustificativa';
            Parameters.AddParameter.Name := 'dataconclusao';
            Parameters.AddParameter.Name := 'descricaoconclusao';
            Parameters.AddParameter.Name := 'formarequisicao';
            Parameters.AddParameter.Name := 'requisicao';
            // Atribuindo valores aos parametros
            Parameters.ParamByName('idalmoxarifado').Value :=
              dblAlmoxarifadoLanc.KeyValue;
            Parameters.ParamByName('idcentroconsumo').Value :=
              dblCentroConsumoLanc.KeyValue;
            Parameters.ParamByName('idfornecedor').Value :=
              dblFornecedorLanc.KeyValue;
            Parameters.ParamByName('datarequisicao').Value :=
              FormatDateTime('yyyy-mm-dd', dtpRequisicao.Date);
            Parameters.ParamByName('idformapagamento').Value :=
              dblFormaPagamentoLanc.KeyValue;
            Parameters.ParamByName('idsituacao').Value :=
              dlbSituacaoRequisicao.KeyValue;
            Parameters.ParamByName('licitacao').Value :=
              UpperCase(edtLicitacaoLanc.Text);
            Parameters.ParamByName('observacaojustificativa').Value := '';
            Parameters.ParamByName('dataconclusao').Value :=
              FormatDateTime('yyyy-mm-dd', dtpConclusao.Date);
            Parameters.ParamByName('descricaoconclusao').Value :=
              UpperCase(edtDescricaoConclusao.Text);
            Parameters.ParamByName('formarequisicao').Value :=
              rdgFormaRequisicao.ItemIndex + 1;
            Parameters.ParamByName('requisicao').Value :=
              dmComprasEstoque.qryRequisicaoCompras.FieldByName
              ('requisicaocompraid').AsInteger;
            try
              dmComprasEstoque.conexao.BeginTrans;
              Execute;
              qry := 'DELETE FROM ITENSREQUISICAOCOMPRA WHERE idrequisicaocompra = '''
                + dmComprasEstoque.qryRequisicaoCompras.FieldByName
                ('requisicaocompraid').AsString + '''';
              dmComprasEstoque.comandos.CommandText := qry;
              dmComprasEstoque.comandos.Execute;

              requisicao := dmComprasEstoque.qryRequisicaoCompras.FieldByName
                ('requisicaocompraid').AsInteger;
              qry := 'INSERT INTO ITENSREQUISICAOCOMPRA(idrequisicaocompra, idproduto, quantidade) ';
              qry := qry +
                ' VALUES(:idrequisicaocompra, :idproduto, :quantidade) ';
              CommandText := qry;
              Parameters.Clear;
              Parameters.AddParameter.Name := 'idrequisicaocompra';
              Parameters.AddParameter.Name := 'idproduto';
              Parameters.AddParameter.Name := 'quantidade';

              ClientDataSet1.First;

              while not ClientDataSet1.Eof do
              begin
                Parameters.ParamByName('idrequisicaocompra').Value :=
                  requisicao;
                Parameters.ParamByName('idproduto').Value :=
                  ClientDataSet1produtoid.AsInteger;
                Parameters.ParamByName('quantidade').Value :=
                  ClientDataSet1quantidade.AsFloat;
                Execute;
                ClientDataSet1.Next
              end;
              dmComprasEstoque.conexao.CommitTrans;
              MessageBox(Application.Handle, 'Registro atualizado com sucesso.',
                'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
              limpaCampos;
            Except
              on e: Exception do
              begin
                dmComprasEstoque.conexao.RollbackTrans;
              end;
            end;
          end;
        end;
      end; // Fim do caso E
  end;
  dmComprasEstoque.qryProdutos.Close;
  tipooperacao := ' ';
  // end
  // else begin
  // Messagebox(Application.Handle,'O mês para realização do lançamento não está ativado.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
  // btnCancelarClick(self);
  // end;

end;

procedure TfrmRequisicaoCompra.carregaDados;
var
  qry: string;
begin
  limpaCampos;
  with dmComprasEstoque do
  begin

    try
      dtpRequisicao.DateTime :=
        StrToDateTime(FormatDateTime('dd/mm/yyyy',
        qryRequisicaoCompras.FieldByName('datarequisicao').AsDateTime));
    Except
      dtpRequisicao.DateTime := dtpRequisicao.MaxDate;
    end;
    dtpConclusao.DateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy',
      qryRequisicaoCompras.FieldByName('dataconclusao').AsDateTime));
    rdgFormaRequisicao.ItemIndex := qryRequisicaoCompras.FieldByName
      ('formarequisicao').AsInteger - 1;
    edtLicitacaoLanc.Text := qryRequisicaoCompras.FieldByName
      ('licitacao').AsString;
    dblFormaPagamentoLanc.KeyValue := qryRequisicaoCompras.FieldByName
      ('idformapagamento').AsInteger;
    dblAlmoxarifadoLanc.KeyValue := qryRequisicaoCompras.FieldByName
      ('idalmoxarifado').AsInteger;
    dblCentroConsumoLanc.KeyValue := qryRequisicaoCompras.FieldByName
      ('idcentroconsumo').AsInteger;
    dblFornecedorLanc.KeyValue := qryRequisicaoCompras.FieldByName
      ('idfornecedor').AsString;
    dlbSituacaoRequisicao.KeyValue := qryRequisicaoCompras.FieldByName
      ('idsituacao').AsInteger;
    edtDescricaoConclusao.Text := qryRequisicaoCompras.FieldByName
      ('descricaoconclusao').AsString;
    ClientDataSet1.Open;
    while not qryItensRequisicaoCompra.Eof do
    begin
      qry := 'select * from produto where produtoid = ''' +
        qryItensRequisicaoCompra.FieldByName('idproduto').AsString + '''';
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(qry);
      qryAux.Open;
      ClientDataSet1.Insert;
      ClientDataSet1produtoid.Value := qryItensRequisicaoCompra.FieldByName
        ('idproduto').AsInteger;
      ClientDataSet1descricao.AsString :=
        qryAux.FieldByName('descricao').AsString;
      ClientDataSet1quantidade.Value := qryItensRequisicaoCompra.FieldByName
        ('quantidade').AsFloat;
      ClientDataSet1.Post;
      qryItensRequisicaoCompra.Next;
    end;

  end;
end;

procedure TfrmRequisicaoCompra.chkAlmoxarifadoClick(Sender: TObject);
begin
  if (dblAlmoxarifado.Text = '') then
    chkAlmoxarifado.Checked := false;
end;

procedure TfrmRequisicaoCompra.chkCentroConsumoClick(Sender: TObject);
begin
  if (dblCentroConsumo.Text = '') then
    chkCentroConsumo.Checked := false;
end;

procedure TfrmRequisicaoCompra.chkFornecedorClick(Sender: TObject);
begin
  if (dblFornecedor.Text = '') then
    chkFornecedor.Checked := false;

end;

procedure TfrmRequisicaoCompra.chkLicitacaoClick(Sender: TObject);
begin
  if (edtLicitacao.Text = '') then
    chkLicitacao.Checked := false
end;

procedure TfrmRequisicaoCompra.DBGrid1DblClick(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT * FROM itensrequisicaocompra as rc WHERE idrequisicaocompra =  '''
    + dmComprasEstoque.qryRequisicaoCompras.FieldByName('requisicaocompraId')
    .AsString + '''';
  with dmComprasEstoque, qryItensRequisicaoCompra do
  begin
    Close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
    PageControl1.ActivePageIndex := 1;

    carregaDados;
  end;

end;

procedure TfrmRequisicaoCompra.dblAlmoxarifadoCloseUp(Sender: TObject);
begin
  if (dblAlmoxarifado.Text <> '') then
    chkAlmoxarifado.Checked := true
  else
    chkAlmoxarifado.Checked := false;
end;

procedure TfrmRequisicaoCompra.dblAlmoxarifadoLancKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.dblCentroConsumoCloseUp(Sender: TObject);
begin
  if (dblCentroConsumo.Text <> '') then
    chkCentroConsumo.Checked := true
  else
    chkCentroConsumo.Checked := false;
end;

procedure TfrmRequisicaoCompra.dblCentroConsumoLancKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.dblFormaPagamentoLancKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.dblFornecedorCloseUp(Sender: TObject);
begin
  if (dblFornecedor.Text <> '') then
    chkFornecedor.Checked := true
  else
    chkFornecedor.Checked := false;
end;

procedure TfrmRequisicaoCompra.dblFornecedorLancKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.dblProdutosRequisicao1KeyPress(Sender: TObject;
  var Key: Char);
var
  carac, prodAtual: String;

begin

  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.dblProdutosRequisicaoClick(Sender: TObject);
begin
  //
  keybd_event(VK_DOWN, 1, 0, 0);
end;

procedure TfrmRequisicaoCompra.dblProdutosRequisicaoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.dlbSituacaoRequisicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.dtpConclusaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.dtpDeConclusaoChange(Sender: TObject);
begin
  chkDataConclusao.Checked := true;
end;

procedure TfrmRequisicaoCompra.dtpDeRequisicaoChange(Sender: TObject);
begin
  chkDataRequisicao.Checked := true;
end;

procedure TfrmRequisicaoCompra.dtpRequisicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  //

end;

procedure TfrmRequisicaoCompra.edtDescricaoConclusaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.edtLicitacaoChange(Sender: TObject);
begin
  if (edtLicitacao.Text <> '') then
    chkLicitacao.Checked := true
  else
    chkLicitacao.Checked := false;
end;

procedure TfrmRequisicaoCompra.edtLicitacaoLancKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.edtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoCompra.edtProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  produto, prodQry: String;
begin
  {
    with (dmComprasEstoque.qryProdutos) do
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

procedure TfrmRequisicaoCompra.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin
    if edtQuantidade.Text <> '' then
    begin
      btnAdicionarItensClick(self);
      dblProdutosRequisicao.SetFocus;
    end
    else
      MessageBox(Application.Handle, 'Informe a quantidade do produto.',
        'Compras & Estoque', MB_ICONEXCLAMATION);
  end;
end;

procedure TfrmRequisicaoCompra.ExcluirItem1Click(Sender: TObject);
begin
  ClientDataSet1.Delete;
end;

procedure TfrmRequisicaoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmComprasEstoque do
  begin
    qryProdutosRequisicao.Close;
    qryFormaPagamento.Close;
    qryFornecedor.Close;
    qrySituacaoRequisicao.Close;
    qryAlmoxarifado.Close;
    qryCentroConsumo.Close;
    qryRequisicaoCompras.Close;
  end;
end;

procedure TfrmRequisicaoCompra.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  dtpDeRequisicao.DateTime := now;
  dtpAteRequisicao.DateTime := now;
  dtpDeConclusao.DateTime := now;
  dtpAteConclusao.DateTime := now;
  dtpRequisicao.DateTime := dtpRequisicao.MaxDate;
  dtpConclusao.DateTime := now;
  with dmComprasEstoque do
  begin
    qryProdutosRequisicao.Open;
    qryFormaPagamento.Open;
    qryFornecedor.Open;
    qrySituacaoRequisicao.Open;
    qryAlmoxarifado.Open;
    qryCentroConsumo.Open;
  end;
  atualizarProdutos;

  btnConsultarClick(self);
end;

procedure TfrmRequisicaoCompra.habilitaBotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmRequisicaoCompra.limpaCampos;
begin
  dtpRequisicao.DateTime := dtpRequisicao.MaxDate;
  dtpConclusao.DateTime := now;
  rdgFormaRequisicao.ItemIndex := -1;
  edtLicitacaoLanc.Clear;
  dblFormaPagamentoLanc.KeyValue := 0;
  dblAlmoxarifadoLanc.KeyValue := 0;
  dblCentroConsumoLanc.KeyValue := 0;
  dblFornecedorLanc.KeyValue := 0;
  dlbSituacaoRequisicao.KeyValue := 0;
  edtDescricaoConclusao.Clear;
  dblProdutosRequisicao.LookupValue := '';
  edtQuantidade.Clear;

  ativarClientDataSet;

end;

procedure TfrmRequisicaoCompra.ativarClientDataSet;
begin
  if (ClientDataSet1.Active = true) then
  begin
    ClientDataSet1.EmptyDataSet;
    ClientDataSet1.Close;
  end;
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.Open;
end;

procedure TfrmRequisicaoCompra.BitBtn1Click(Sender: TObject);
var
  frmSearch: TFrmSearchProdutos;
begin
  frmSearch := TFrmSearchProdutos.Create(self);
  try
    if (frmSearch.ShowModal = mrOk) then
    begin
      dmComprasEstoque.atualizarProdutos;
      dblProdutosRequisicao.LookupValue :=
        IntToStr(frmSearch.idProdutoSelecionado);
    end;
  finally

  end;
end;

procedure TfrmRequisicaoCompra.btnAdicionarItensClick(Sender: TObject);
begin

  if ((dblProdutosRequisicao.Text <> '') and (edtQuantidade.Text <> '')) then
  begin
    try
      ClientDataSet1.Open;
      ClientDataSet1.Insert;
      ClientDataSet1produtoid.Value := dmComprasEstoque.qryProdutos.FieldByName
        ('produtoid').AsInteger;
      ClientDataSet1quantidade.Value := StrTofloat(edtQuantidade.Text);
      ClientDataSet1descricao.AsString :=
        dmComprasEstoque.qryProdutos.FieldByName('descricao').AsString;
      ClientDataSet1.Post;

      dblProdutosRequisicao.LookupValue := '';
      edtQuantidade.Text := '1';
    Except
      ShowMessage('Valor Inválido');

    end;
  end;
end;

procedure TfrmRequisicaoCompra.btnAnteriorClick(Sender: TObject);
begin
  if (dmComprasEstoque.qryRequisicaoCompras.FindPrior) then
  begin
    DBGrid1DblClick(self);
    btnProximo.Enabled := true;
  end
  else
    btnAnterior.Enabled := false;
end;

procedure TfrmRequisicaoCompra.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRequisicaoCompra.btnProximoClick(Sender: TObject);
begin
  if (dmComprasEstoque.qryRequisicaoCompras.FindNext) then
  begin
    DBGrid1DblClick(self);
    btnAnterior.Enabled := true;
  end
  else
    btnProximo.Enabled := false;

end;

procedure TfrmRequisicaoCompra.atualizarProdutos;
var
  qry: String;
begin
  //
  qry := 'Select p.*, c.descricao as categoria, u.descricao as unidade, tp.descricao as tipo, concat(produtoID, concat( '' '', p.descricao)) as ''cod_descricao'' ';
  qry := qry +
    ' from Produto p , categoria c , unidademedida u, tipoproduto tp ';
  qry := qry + ' where p.idcategoria = c.categoriaid ';
  qry := qry + ' and p.idunidade = u.unidadeid ';
  qry := qry + ' and p.idtipo = tp.tipoid ORDER BY p.descricao';
  with dmComprasEstoque.qryProdutos do
  begin
    Close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
  end;
end;

end.
