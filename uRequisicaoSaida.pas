unit uRequisicaoSaida;

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
  Data.Win.ADODB,
  Data.DB,
  Datasnap.DBClient,
  System.UITypes,
  Vcl.Menus,
  ComObj,
  UItemRequisicaoCompra,   UFrmSearchProdutos,
  Funcoes, System.ImageList, Vcl.Mask, JvExMask, JvToolEdit, JvDBLookup;

type
  TfrmRequisicaoSaida = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    chkNF: TCheckBox;
    chkAlmoxarifado: TCheckBox;
    dblAlmoxarifado: TDBLookupComboBox;
    chkCentroConsumo: TCheckBox;
    dblCentroConsumo: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    De: TLabel;
    Até: TLabel;
    dtpAteRequisicao: TDateTimePicker;
    dtpDeRequisicao: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtpAteBaixa: TDateTimePicker;
    dtpDeBaixa: TDateTimePicker;
    chkDataBaixa: TCheckBox;
    edtNf: TEdit;
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
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dtpRequisicao: TDateTimePicker;
    dtpEntrega: TDateTimePicker;
    edtNotaFiscal: TEdit;
    dblAlmoxarifadoLanc: TDBLookupComboBox;
    dblCentroConsumoLanc: TDBLookupComboBox;
    dlbSituacaoRequisicao: TDBLookupComboBox;
    Panel2: TPanel;
    edtDescricaoBaixa: TEdit;
    DBGrid2: TDBGrid;
    chkSituacao: TCheckBox;
    dblSituacaoRequisicao: TDBLookupComboBox;
    dtpBaixa: TDateTimePicker;
    Label14: TLabel;
    Label6: TLabel;
    edtObservacao: TEdit;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Label9: TLabel;
    Label12: TLabel;
    edtQuantidade: TEdit;
    btnAdicionarItens: TBitBtn;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1CODIGO: TIntegerField;
    ClientDataSet1DESCRICAO: TStringField;
    ClientDataSet1QUANTIDADE: TFloatField;
    ClientDataSet1VALORUNITARIO: TFloatField;
    btnImport: TBitBtn;
    dlgImp: TOpenDialog;
    chkRequisicao: TCheckBox;
    ImageListMainMenu: TImageList;
    edtProduto: TEdit;
    BitBtn1: TBitBtn;
    dblProdutosRequisicao: TJvDBLookupEdit;
    procedure ativarClientDataSet;
    procedure habilitaBotoes;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAdicionarItensClick(Sender: TObject);
    procedure limpaCampos;
    // procedure esvaziaMemoryTable;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtNotaFiscalKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dtpRequisicaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnImportClick(Sender: TObject);
    function verificarDados(): TList;
    procedure ImportarExcel(arquivo: String);
    procedure dtpDeRequisicaoChange(Sender: TObject);
    procedure dtpDeBaixaChange(Sender: TObject);
    procedure dblAlmoxarifadoCloseUp(Sender: TObject);
    procedure dblCentroConsumoCloseUp(Sender: TObject);
    procedure edtNfChange(Sender: TObject);
    procedure dblSituacaoRequisicaoCloseUp(Sender: TObject);
    procedure chkAlmoxarifadoClick(Sender: TObject);
    procedure chkCentroConsumoClick(Sender: TObject);
    procedure chkNFClick(Sender: TObject);
    procedure chkSituacaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblProdutosRequisicaoKeyPress(Sender: TObject; var Key: Char);
    procedure dblProdutosRequisicaoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRequisicaoSaida: TfrmRequisicaoSaida;
  tipooperacao: Char;
  ultimoIdProduto: Integer;
  arquivo: String;

implementation

{$R *.dfm}

uses
  udmComprasEstoque,
  uRelItensNFSaida,
  ufuncao, uCadProdutos;

{ TfrmRequisicaoSaida }

procedure TfrmRequisicaoSaida.BitBtn1Click(Sender: TObject);

  var
  frmSearch: TFrmSearchProdutos;
begin
  frmSearch := TFrmSearchProdutos.Create(self);
  try
    if (frmSearch.ShowModal = mrOk) then
    begin
      dblProdutosRequisicao.LookupValue :=
        IntToStr(frmSearch.idProdutoSelecionado);
    end;
  finally

  end;
end;

procedure TfrmRequisicaoSaida.btnAdicionarItensClick(Sender: TObject);
begin
  ClientDataSet1.Open;
  ClientDataSet1.Insert;
  ClientDataSet1CODIGO.Value := dmCOmprasEstoque.qryProdutosRequisicao.
    FieldByName('produtoID').AsInteger;
  ClientDataSet1DESCRICAO.AsString := dmCOmprasEstoque.qryProdutosRequisicao.
    FieldByName('descricao').AsString;
  ClientDataSet1QUANTIDADE.Value := StrToFloat(edtQuantidade.Text);
  ClientDataSet1.Post;
  edtQuantidade.Clear;
  dblProdutosRequisicao.SetFocus;
end;

procedure TfrmRequisicaoSaida.btnCancelarClick(Sender: TObject);
begin
  Panel1.Enabled := false;
  habilitaBotoes;
  tipooperacao := ' ';
  limpaCampos;

end;

procedure TfrmRequisicaoSaida.btnConsultarClick(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT rs.*, alm.descricao as LocalArmazenamento, cc.descricao as CentroConsumo, sr.descricao as Situacao ';
  qry := qry + ' FROM requisicaosaida as rs ';
  qry := qry +
    ' join almoxarifado as alm on alm.almoxarifadoID = rs.idalmoxarifado ';
  qry := qry +
    ' join centroconsumo as cc on cc.centroconsumoID = rs.idcentroconsumo ';
  qry := qry +
    ' join situacaorequisicao as sr on sr.situacaorequisicaoId = rs.idsituacao ';
  if chkRequisicao.Checked then

    qry := qry + ' where datarequisicao between ''' +
      FormatDateTime('yyyy-mm-dd', dtpDeRequisicao.DateTime) + ''' AND ''' +
      FormatDateTime('yyyy-mm-dd', dtpAteRequisicao.DateTime) + '''';
  qry := qry + '   AND idOrdemSaida IS NULL ';

  if chkDataBaixa.Checked then
    qry := qry + ' AND rs.databaixa between ''' + FormatDateTime('yyyy-mm-dd',
      dtpDeBaixa.DateTime) + ''' AND ''' + FormatDateTime('yyyy-mm-dd',
      dtpAteBaixa.DateTime) + '''';
  if chkAlmoxarifado.Checked then
    qry := qry + ' AND rs.idAlmoxarifado = ''' +
      IntToStr(dblAlmoxarifado.KeyValue) + '''';
  if chkCentroConsumo.Checked then
    qry := qry + ' AND rs.idcentroConsumo = ''' +
      IntToStr(dblCentroConsumo.KeyValue) + '''';
  if chkSituacao.Checked then
    qry := qry + ' AND rs.idsituacao = ''' +
      IntToStr(dblSituacaoRequisicao.KeyValue) + '''';
  if chkNF.Checked then
    qry := qry + ' AND rs.notafiscal = ''' + edtNf.Text + '''';
  with dmCOmprasEstoque do
  begin
    qryRequisicaoSaida.Close;
    qryRequisicaoSaida.SQL.Clear;
    qryRequisicaoSaida.SQL.Add(qry);
    qryRequisicaoSaida.Open;
  end;

end;

procedure TfrmRequisicaoSaida.btnEditarClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitaBotoes;
  tipooperacao := 'E';
  dtpRequisicao.SetFocus;
end;

procedure TfrmRequisicaoSaida.btnExcluirClick(Sender: TObject);
var
  qry: string;
  // comandos : TAdoCommand;
  qryConsultaTEmp: TADOQuery;
begin
  if MessageDlg('Deseja excluir esta requisição de saída?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    qryConsultaTEmp := TADOQuery.Create(self);
    qryConsultaTEmp.Connection := dmCOmprasEstoque.conexao;
    qryConsultaTEmp.Close;
    qryConsultaTEmp.SQL.Clear;
    qry := 'SELECT * FROM REQUISICAOSAIDA WHERE requisicaoSAIDAid = ''' +
      dmCOmprasEstoque.qryRequisicaoSaida.FieldByName('requisicaosaidaid')
      .AsString + '''';
    qryConsultaTEmp.SQL.Add(qry);
    qryConsultaTEmp.Open;
    if qryConsultaTEmp.FieldByName('idOrdemSaida').AsString <> '' then
    begin
      MessageBox(Application.Handle,
        'Não é possível exclusão, pois esta requisição possui uma Ordem de Saída associada.',
        'Compras & Estoque', MB_ICONERROR + MB_OK);
    end
    else
    Begin
      try
        dmCOmprasEstoque.conexao.BeginTrans;
        qry := 'DELETE FROM ITENSREQUISICAOSAIDA WHERE idreqsaida = ''' +
          dmCOmprasEstoque.qryRequisicaoSaida.FieldByName('requisicaosaidaid')
          .AsString + '''';
        dmCOmprasEstoque.comandos.CommandText := qry;
        dmCOmprasEstoque.comandos.Execute;

        qry := 'DELETE FROM REQUISICAOSAIDA WHERE requisicaoSAIDAid = ''' +
          dmCOmprasEstoque.qryRequisicaoSaida.FieldByName('requisicaosaidaid')
          .AsString + '''';
        dmCOmprasEstoque.comandos.CommandText := qry;
        dmCOmprasEstoque.comandos.Execute;
        dmCOmprasEstoque.conexao.CommitTrans;
        limpaCampos;
        MessageBox(Application.Handle, 'Requisição excluída com sucesso.',
          'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
      Except
        on e: Exception do
        begin
          dmCOmprasEstoque.conexao.RollbackTrans;
          MessageBox(Application.Handle, 'Erro ao excluir a requisição.',
            'Compras & Estoque', MB_ICONERROR + MB_OK);
        end;
      end;
    End;
  end;
end;

procedure TfrmRequisicaoSaida.btnImportClick(Sender: TObject);
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

function TfrmRequisicaoSaida.verificarDados(): TList;
var
  items, itemsReserva: TList;
  item: TItemRequisicaoCompra;
  x, i, vazio: Integer;
  nCadastrados, descArquivo, descBD: String;
  excel: Variant;
  Funcoes: TFuncoes;
begin
  excel := CreateOleObject('Excel.Application');
  excel.DisplayAlerts := false;
  excel.Visible := false;
  excel.WorkBooks.Open(arquivo);
  x := 0; // Verificador de existência de Item já cadastrado no BD
  i := 2; // primeira linha do arquivo
  vazio := 1;
  Funcoes := TFuncoes.Create;
  itemsReserva := TList.Create;
  items := TList.Create;
  // Setando Dados no ClientDataSet
  nCadastrados := '';
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
    itemsReserva.Add(item);

    dmCOmprasEstoque.qryProdutos.Close;
    dmCOmprasEstoque.qryProdutos.Open;
    dmCOmprasEstoque.qryProdutos.First;
    while (not dmCOmprasEstoque.qryProdutos.Eof) do
    begin
      vazio := 0;
      descArquivo := item.descricao;
      descBD := dmCOmprasEstoque.qryProdutos.FieldByName('descricao').AsString;
      if (Funcoes.comparaValores(descArquivo, descBD)) then
      begin
        x := 1;
        item.idproduto := dmCOmprasEstoque.qryProdutos.FieldByName
          ('produtoID').AsString;
        break;
      end
      else
        x := 0;
      dmCOmprasEstoque.qryProdutos.Next;
    end;
    if (x = 1) then
      items.Add(item)
    else
      nCadastrados := nCadastrados + ' - ' + item.descricao + #13;
  end;
  if (nCadastrados <> '') then
    ShowMessage
      ('Não foram encontradas associações de Produtos com os seguintes Itens: '
      + #13 + nCadastrados);
  if (vazio = 1) then
    Result := itemsReserva
  else
    Result := items;
end;

procedure TfrmRequisicaoSaida.ImportarExcel(arquivo: String);
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
    ClientDataSet1.FieldByName('quantidade').AsString := item.quantidade;
    ClientDataSet1.FieldByName('descricao').AsString := item.descricao;
    ClientDataSet1.Post;
  end;
  ClientDataSet1.Close;
  ClientDataSet1.Open;

end;

procedure TfrmRequisicaoSaida.btnNovoClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitaBotoes;
  tipooperacao := 'N';
  limpaCampos;
  dtpRequisicao.SetFocus;
end;

procedure TfrmRequisicaoSaida.btnSalvarClick(Sender: TObject);
var
  qry: string;
  comandos: TAdoCommand;
  // query : TADOQuery;
  requisicao: Integer;
begin
  if ClientDataSet1.IsEmpty then
  begin
    MessageBox(Application.Handle, 'Adicione itens para confirmar o lançamento',
      'Compras & Estoque', MB_ICONERROR + MB_OK);
    exit;
  end;

  // query := TADOQuery.Create(self);
  // query.Connection := dmComprasEstoque.conexao;
  // if verificaliberacao(query, strToint(FormatDateTime('yyyy',dtpRequisicao.Date)),strToint(FormatDateTime('mm',dtpRequisicao.Date)) ) then begin

  Panel1.Enabled := false;
  habilitaBotoes;
  case tipooperacao of
    'N':
      begin
        { if edtNotaFiscal.Text = ''  then begin
          MessageBox(Application.Handle,'Informe a Nota Fiscal.','Compras & Estoque',MB_ICONERROR + MB_OK);
          exit;
          end; }
        qry := 'INSERT INTO REQUISICAOSAIDA(idalmoxarifado, idcentroconsumo, datarequisicao, dataentrega, descricao, ';
        qry := qry + ' idsituacao, databaixa, descricaobaixa, notafiscal)';
        qry := qry +
          ' VALUES(:idalmoxarifado, :idcentroconsumo, :datarequisicao, :dataentrega, :descricao, ';
        qry := qry + ' :idsituacao, :databaixa, :descricaobaixa, :notafiscal)';
        comandos := TAdoCommand.Create(self);
        comandos.Connection := dmCOmprasEstoque.conexao;
        with comandos do
        begin
          CommandText := qry;
          Parameters.Clear;
          // Adicionando os parametros no command
          Parameters.AddParameter.Name := 'idalmoxarifado';
          Parameters.AddParameter.Name := 'idcentroconsumo';
          Parameters.AddParameter.Name := 'datarequisicao';
          Parameters.AddParameter.Name := 'dataentrega';
          Parameters.AddParameter.Name := 'descricao';
          Parameters.AddParameter.Name := 'idsituacao';
          Parameters.AddParameter.Name := 'databaixa';
          Parameters.AddParameter.Name := 'descricaobaixa';
          Parameters.AddParameter.Name := 'notafiscal';
          // Atribuindo valores aos parametros
          Parameters.ParamByName('idalmoxarifado').Value :=
            dblAlmoxarifadoLanc.KeyValue;
          Parameters.ParamByName('idcentroconsumo').Value :=
            dblCentroConsumoLanc.KeyValue;
          Parameters.ParamByName('datarequisicao').Value :=
            FormatDateTime('yyyy-mm-dd', dtpRequisicao.Date);
          Parameters.ParamByName('dataentrega').Value :=
            FormatDateTime('yyyy-mm-dd', dtpEntrega.Date);
          Parameters.ParamByName('descricao').Value :=
            UpperCase(edtObservacao.Text);
          Parameters.ParamByName('idsituacao').Value :=
            dlbSituacaoRequisicao.KeyValue;
          Parameters.ParamByName('databaixa').Value :=
            FormatDateTime('yyyy-mm-dd', dtpBaixa.Date);
          Parameters.ParamByName('descricaobaixa').Value :=
            UpperCase(edtDescricaoBaixa.Text);
          Parameters.ParamByName('notafiscal').Value := edtNotaFiscal.Text;
          try
            dmCOmprasEstoque.conexao.BeginTrans;
            Execute;
            qry := 'select requisicaosaidaid from requisicaosaida order by requisicaosaidaid desc limit 1';
            dmCOmprasEstoque.qryAux.Close;
            dmCOmprasEstoque.qryAux.SQL.Clear;
            dmCOmprasEstoque.qryAux.SQL.Add(qry);
            dmCOmprasEstoque.qryAux.Open;
            requisicao := dmCOmprasEstoque.qryAux.FieldByName
              ('requisicaosaidaid').AsInteger;
            ClientDataSet1.First;
            while not ClientDataSet1.Eof do
            begin
              qry := 'INSERT INTO itensrequisicaosaida(idreqSAIDA, idproduto, quantidade, valorunitario, valortotal) ';
              qry := qry +
                ' VALUES(:idreqSAIDA, :idproduto, :quantidade, :valorunitario, :valortotal) ';
              CommandText := qry;
              Parameters.Clear;
              Parameters.AddParameter.Name := 'idreqSAIDA';
              Parameters.AddParameter.Name := 'idproduto';
              Parameters.AddParameter.Name := 'quantidade';
              Parameters.AddParameter.Name := 'valorunitario';
              Parameters.AddParameter.Name := 'valortotal';

              Parameters.ParamByName('idreqSAIDA').Value := requisicao;
              Parameters.ParamByName('idproduto').Value :=
                ClientDataSet1CODIGO.AsInteger;
              Parameters.ParamByName('quantidade').Value :=
                ClientDataSet1QUANTIDADE.AsFloat;
              Parameters.ParamByName('valorunitario').Value :=
                ClientDataSet1VALORUNITARIO.AsFloat;
              Parameters.ParamByName('valortotal').Value :=
                ClientDataSet1QUANTIDADE.AsFloat *
                ClientDataSet1VALORUNITARIO.AsFloat;

              Execute;
              ClientDataSet1.Next
            end;
            dmCOmprasEstoque.conexao.CommitTrans;
            ShowMessage('Requisição de saída No ' + FormatFloat('000000',
              requisicao) + ' gerada com sucesso.');
            // MessageBox(Application.Handle,'Requisição gerada com sucesso.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
            limpaCampos;
          except
            on e: Exception do
            Begin
              ShowMessage(e.Message);
              dmCOmprasEstoque.conexao.RollbackTrans;
            End;
          end;
        end;
      end; // Fim caso N
    'E':
      begin
        qry := 'UPDATE REQUISICAOSAIDA SET idalmoxarifado = :idalmoxarifado, idcentroconsumo = :idcentroconsumo, datarequisicao = :datarequisicao, dataentrega = :dataentrega, descricao = :descricao, ';
        qry := qry +
          ' idsituacao = :idsituacao, databaixa = :databaixa, descricaobaixa = :descricaobaixa, notafiscal = :notafiscal';
        qry := qry + ' WHERE requisicaosaidaid = :requisicao';
        comandos := TAdoCommand.Create(self);
        comandos.Connection := dmCOmprasEstoque.conexao;
        with comandos do
        begin
          CommandText := qry;
          Parameters.Clear;
          // Adicionando os parametros no command
          Parameters.AddParameter.Name := 'idalmoxarifado';
          Parameters.AddParameter.Name := 'idcentroconsumo';
          Parameters.AddParameter.Name := 'datarequisicao';
          Parameters.AddParameter.Name := 'dataentrega';
          Parameters.AddParameter.Name := 'descricao';
          Parameters.AddParameter.Name := 'idsituacao';
          Parameters.AddParameter.Name := 'databaixa';
          Parameters.AddParameter.Name := 'descricaobaixa';
          Parameters.AddParameter.Name := 'notafiscal';
          Parameters.AddParameter.Name := 'requisicao';

          // Atribuindo valores aos parametros
          Parameters.ParamByName('idalmoxarifado').Value :=
            dblAlmoxarifadoLanc.KeyValue;
          Parameters.ParamByName('idcentroconsumo').Value :=
            dblCentroConsumoLanc.KeyValue;
          Parameters.ParamByName('datarequisicao').Value :=
            FormatDateTime('yyyy-mm-dd', dtpRequisicao.Date);
          Parameters.ParamByName('dataentrega').Value :=
            FormatDateTime('yyyy-mm-dd', dtpEntrega.Date);
          Parameters.ParamByName('descricao').Value :=
            UpperCase(edtObservacao.Text);
          Parameters.ParamByName('idsituacao').Value :=
            dlbSituacaoRequisicao.KeyValue;
          Parameters.ParamByName('databaixa').Value :=
            FormatDateTime('yyyy-mm-dd', dtpBaixa.Date);
          Parameters.ParamByName('descricaobaixa').Value :=
            UpperCase(edtDescricaoBaixa.Text);
          Parameters.ParamByName('notafiscal').Value := edtNotaFiscal.Text;
          Parameters.ParamByName('requisicao').Value :=
            dmCOmprasEstoque.qryRequisicaoSaida.FieldByName('requisicaosaidaid')
            .AsInteger;
          try
            dmCOmprasEstoque.conexao.BeginTrans;
            Execute;
            qry := 'DELETE FROM ITENSREQUISICAOSAIDA WHERE idReqSaida = ''' +
              dmCOmprasEstoque.qryRequisicaoSaida.FieldByName
              ('requisicaosaidaid').AsString + '''';
            dmCOmprasEstoque.comandos.CommandText := qry;
            dmCOmprasEstoque.comandos.Execute;

            requisicao := dmCOmprasEstoque.qryRequisicaoSaida.FieldByName
              ('requisicaosaidaid').AsInteger;

            ClientDataSet1.First;

            while not ClientDataSet1.Eof do
            begin
              qry := 'INSERT INTO ITENSREQUISICAOSAIDA(idreqsaida, idproduto, quantidade) ';
              qry := qry + ' VALUES(:idreqsaida, :idproduto, :quantidade) ';
              CommandText := qry;
              Parameters.Clear;
              Parameters.AddParameter.Name := 'idreqsaida';
              Parameters.AddParameter.Name := 'idproduto';
              Parameters.AddParameter.Name := 'quantidade';

              Parameters.ParamByName('idreqsaida').Value := requisicao;
              Parameters.ParamByName('idproduto').Value :=
                ClientDataSet1CODIGO.AsInteger;
              Parameters.ParamByName('quantidade').Value :=
                ClientDataSet1QUANTIDADE.AsFloat;
              // Parameters.ParamByName('valorunitario').Value := ClientDataSet1VALORUNITARIO.AsFloat;
              // Parameters.ParamByName('valortotal').Value := ClientDataSet1quantidade.AsInteger * ClientDataSet1VALORUNITARIO.AsFloat;
              Execute;
              ClientDataSet1.Next
            end;
            dmCOmprasEstoque.conexao.CommitTrans;
            MessageBox(Application.Handle, 'Registro atualizado com sucesso.',
              'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
            limpaCampos;
          Except
            on e: Exception do
            begin
              ShowMessage(e.Message);
              dmCOmprasEstoque.conexao.RollbackTrans;
            end;
          end;
        end;
      end; // Fim do caso E
  end;
  tipooperacao := ' ';
  // end
  // else begin
  // Messagebox(Application.Handle,'O mês para realização do lançamento não está ativado.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
  // btnCancelarClick(self);
  // end;

end;

procedure TfrmRequisicaoSaida.chkAlmoxarifadoClick(Sender: TObject);
begin
  if (dblAlmoxarifado.Text = '') then
    chkAlmoxarifado.Checked := false
end;

procedure TfrmRequisicaoSaida.chkCentroConsumoClick(Sender: TObject);
begin
  if (dblCentroConsumo.Text = '') then
    chkCentroConsumo.Checked := false
end;

procedure TfrmRequisicaoSaida.chkNFClick(Sender: TObject);
begin
  if (edtNf.Text = '') then
    chkNF.Checked := false
end;

procedure TfrmRequisicaoSaida.chkSituacaoClick(Sender: TObject);
begin
  if (dblSituacaoRequisicao.Text = '') then
    chkSituacao.Checked := false
end;

procedure TfrmRequisicaoSaida.DBGrid1DblClick(Sender: TObject);
begin
  limpaCampos;
  with dmCOmprasEstoque do
  begin
    dtpRequisicao.DateTime := qryRequisicaoSaida.FieldByName('datarequisicao')
      .AsDateTime;
    dtpEntrega.DateTime := qryRequisicaoSaida.FieldByName('dataentrega')
      .AsDateTime;
    dtpBaixa.DateTime := qryRequisicaoSaida.FieldByName('databaixa').AsDateTime;
    edtNotaFiscal.Text := qryRequisicaoSaida.FieldByName('notafiscal').AsString;
    dlbSituacaoRequisicao.KeyValue := qryRequisicaoSaida.FieldByName
      ('idsituacao').AsInteger;
    dblCentroConsumoLanc.KeyValue := qryRequisicaoSaida.FieldByName
      ('idcentroconsumo').AsInteger;
    dblAlmoxarifadoLanc.KeyValue := qryRequisicaoSaida.FieldByName
      ('idalmoxarifado').AsInteger;
    edtDescricaoBaixa.Text := qryRequisicaoSaida.FieldByName
      ('descricaobaixa').AsString;
    edtObservacao.Text := qryRequisicaoSaida.FieldByName('descricao').AsString;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
      ('SELECT * FROM ITENSREQUISICAOSAIDA AS IR JOIN PRODUTO AS P ON P.PRODUTOID = IR.IDPRODUTO WHERE IDREQSAIDA = '''
      + qryRequisicaoSaida.FieldByName('requisicaosaidaid').AsString + '''');
    qryAux.Open;
    ClientDataSet1.Open;
    while not qryAux.Eof do
    begin
      ClientDataSet1.Insert;
      ClientDataSet1CODIGO.Value := qryAux.FieldByName('idproduto').AsInteger;
      ClientDataSet1DESCRICAO.AsString :=
        qryAux.FieldByName('descricao').AsString;
      ClientDataSet1QUANTIDADE.Value :=
        qryAux.FieldByName('quantidade').AsFloat;
      ClientDataSet1VALORUNITARIO.Value :=
        qryAux.FieldByName('valorunitario').AsFloat;
      ClientDataSet1.Post;
      qryAux.Next;
    end;
    PageControl1.ActivePageIndex := 1;
  end;
end;

procedure TfrmRequisicaoSaida.dblAlmoxarifadoCloseUp(Sender: TObject);
begin
  if (dblAlmoxarifado.Text <> '') then
    chkAlmoxarifado.Checked := true
  else
    chkAlmoxarifado.Checked := false
end;

procedure TfrmRequisicaoSaida.dblCentroConsumoCloseUp(Sender: TObject);
begin
  if (dblCentroConsumo.Text <> '') then
    chkCentroConsumo.Checked := true
  else
    chkCentroConsumo.Checked := false
end;

procedure TfrmRequisicaoSaida.dblProdutosRequisicaoEnter(Sender: TObject);
begin
  keybd_event(VK_DOWN, 1, 0, 0);
end;

procedure TfrmRequisicaoSaida.dblProdutosRequisicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisicaoSaida.dblSituacaoRequisicaoCloseUp(Sender: TObject);
begin
  if (dblSituacaoRequisicao.Text <> '') then
    chkSituacao.Checked := true
  else
    chkSituacao.Checked := false
end;

procedure TfrmRequisicaoSaida.dtpDeBaixaChange(Sender: TObject);
begin
  chkDataBaixa.Checked := true;

end;

procedure TfrmRequisicaoSaida.dtpDeRequisicaoChange(Sender: TObject);
begin
  chkRequisicao.Checked := true;
end;

procedure TfrmRequisicaoSaida.dtpRequisicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmRequisicaoSaida.edtNfChange(Sender: TObject);
begin
  if (edtNf.Text <> '') then
    chkNF.Checked := true
  else
    chkNF.Checked := false
end;

procedure TfrmRequisicaoSaida.edtNotaFiscalKeyPress(Sender: TObject;
  var Key: Char);
// var qry : string;
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    { Localiza o itens de um nota fiscal, foi retiradom pois o sistema ira calcular
      pelo preco medio.
      qry := 'SELECT NFS.*, P.DESCRICAO FROM NFSALDO AS NFS ';
      qry := qry + ' JOIN PRODUTO AS P ON P.PRODUTOID = NFS.PRODUTOID ';
      qry := qry + ' WHERE NFS.NF = ''' + edtNotaFiscal.Text + '''';
      with dmComprasEstoque do begin
      qryNFSaldo.Close;
      qryNFSaldo.SQL.Clear;
      qryNFSaldo.SQL.Add(qry);
      qryNFSaldo.Open;
      try
      frmRelItensNFSaida := TfrmRelItensNFSaida.create(self);
      frmRelItensNFSaida.ShowModal;
      finally
      frmRelItensNFSaida.Free;
      end;
      //atualizar o saldo do produto
      //atualizar o saldo de Nf
      end; }

  end;

end;

procedure TfrmRequisicaoSaida.edtProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  produto, prodQry: String;
begin
  { with (dmCOmprasEstoque.qryProdutosRequisicao) do
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

procedure TfrmRequisicaoSaida.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    btnAdicionarItensClick(self);

end;

(* procedure TfrmRequisicaoSaida.esvaziaMemoryTable;
  begin
  ClientDataSet1.Open;
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do begin
  ClientDataSet1.Delete;
  end;
  ClientDataSet1.Close;
  end; *)

procedure TfrmRequisicaoSaida.Excluir1Click(Sender: TObject);
begin
  if not ClientDataSet1.IsEmpty then
    ClientDataSet1.Delete;
end;

procedure TfrmRequisicaoSaida.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  with dmCOmprasEstoque do
  begin
    qryAlmoxarifado.Open;
    qryCentroConsumo.Open;
    qrySituacaoRequisicao.Open;
    qryProdutosRequisicao.Open;
    dtpDeRequisicao.DateTime :=
      StrToDateTime(FormatDateTime('01/mm/yyyy', now));
    dtpAteRequisicao.DateTime := now;
    dtpDeBaixa.DateTime := now;
    dtpAteBaixa.DateTime := now;
    dtpRequisicao.DateTime := now;
    dtpBaixa.DateTime := now;
    dtpEntrega.DateTime := now;

  end;
end;

procedure TfrmRequisicaoSaida.habilitaBotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmRequisicaoSaida.limpaCampos;
begin
  dtpRequisicao.DateTime := now;
  dtpBaixa.DateTime := now;
  dtpEntrega.DateTime := now;
  edtNotaFiscal.Clear;
  dlbSituacaoRequisicao.KeyValue := 0;
  dblAlmoxarifadoLanc.KeyValue := 0;
  dblCentroConsumoLanc.KeyValue := 0;
  edtDescricaoBaixa.Clear;
  edtObservacao.Clear;
  // dblProdutosRequisicao.KeyValue := 0;
  // edtQuantidadecli.Clear;
  // esvaziaMemoryTable;
  ativarClientDataSet();

end;

procedure TfrmRequisicaoSaida.ativarClientDataSet;
begin
  if (ClientDataSet1.Active = true) then
  begin
    ClientDataSet1.EmptyDataSet;
    ClientDataSet1.Close;
  end;
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.Open;
end;

procedure TfrmRequisicaoSaida.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

end.
