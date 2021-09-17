unit uOrdemSaidaEstoque;

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
  Vcl.ToolWin,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.Grids,
  Data.Win.ADODB,
  Vcl.DBGrids,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.ExtCtrls,
  System.UITypes,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Mask,
  TEmpresa,
  TEmpresaDAO,
  TLiberacao,
  TLiberacaoDAO, System.ImageList, JvExMask, JvToolEdit, JvDBLookup;

type
  TfrmOrdemSaidaEstoque = class(TForm)
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    chkSituacao: TCheckBox;
    chkCentroConsumo: TCheckBox;
    dblCentroConsumo: TDBLookupComboBox;
    dblSituacaoReq: TDBLookupComboBox;
    btnConsultar: TBitBtn;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    btnSalvar: TToolButton;
    ToolButton10: TToolButton;
    btnExcluir: TToolButton;
    ToolButton1: TToolButton;
    DBGrid2: TDBGrid;
    StatusBar1: TStatusBar;
    chkLocalArmazenamento: TCheckBox;
    dblLocalArmazenamento: TDBLookupComboBox;
    Panel1: TPanel;
    btnEditar: TToolButton;
    btnNovo: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    Label3: TLabel;
    dtpDataSaida: TDateTimePicker;
    Label5: TLabel;
    edtNumeroRequisicao: TEdit;
    Label6: TLabel;
    dblAlmoxarifado: TDBLookupComboBox;
    Label7: TLabel;
    dblCConsumo: TDBLookupComboBox;
    Label8: TLabel;
    edtDescricao: TEdit;
    Panel2: TPanel;
    Label9: TLabel;
    Label12: TLabel;
    edtQuantidade: TEdit;
    btnAdicionarItens: TBitBtn;
    DataSource1: TDataSource;
    Label4: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    edtNFEntrada: TEdit;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Codigo: TIntegerField;
    ClientDataSet1DESCRICAO: TStringField;
    ClientDataSet1quantidade: TFloatField;
    ClientDataSet1valorunitario: TFloatField;
    qryUpdateEstoqueProduto: TADOQuery;
    edtFracao: TEdit;
    Label11: TLabel;
    clProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    qryProdutos: TADOQuery;
    clProdutosid: TIntegerField;
    clProdutosdescricao: TStringField;
    clProdutosestoque: TFloatField;
    chkRequisicao: TCheckBox;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    ToolButton7: TToolButton;
    ToolButton12: TToolButton;
    ImageListMainMenu: TImageList;
    dtExercicio: TDateTimePicker;
    Label13: TLabel;
    edtProduto: TEdit;
    BitBtn1: TBitBtn;
    dblProdutosRequisicao: TJvDBLookupEdit;
    procedure ativarClientDataSet;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure atualizaSaldoNF(codigoProduto: integer; codigoFornecedor: string;
      notaFiscal: string; Quantidade: Real; valorUnitario: Real);
    procedure atualizaSaldoEstoque(codigoProduto: integer; Quantidade: Real);
    procedure dtpDataSaidaKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicionarItensClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure habilitaBotoes;
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dblProdutosRequisicaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure limparcampos;
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtQuantidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure restaurarEstoque();

    procedure restaurarUmEstoque;
    procedure edtFracaoKeyPress(Sender: TObject; var Key: Char);
    procedure atualizarQuantidadeProdutos();
    procedure ativarAdicaoItens;
    procedure desativarAdicaoItens;
    procedure dtpDeChange(Sender: TObject);
    procedure dblSituacaoReqCloseUp(Sender: TObject);
    procedure dblCentroConsumoCloseUp(Sender: TObject);
    procedure dblLocalArmazenamentoCloseUp(Sender: TObject);
    procedure chkSituacaoClick(Sender: TObject);
    procedure chkCentroConsumoClick(Sender: TObject);
    procedure chkLocalArmazenamentoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure dtExercicioChange(Sender: TObject);
    procedure setarDataExercicio();
    procedure edtProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblProdutosRequisicaoEnter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemSaidaEstoque: TfrmOrdemSaidaEstoque;
  opcao: Char;
  ultimoIdProduto: integer;

implementation

{$R *.dfm}

uses
  udmComprasEstoque,
  uListaReqSaida,
  ufuncao;

procedure TfrmOrdemSaidaEstoque.atualizaSaldoEstoque(codigoProduto: integer;
  Quantidade: Real);
var
  qry, qtdeStr: string;
  comandos: TADOQuery;
begin
  dmComprasEstoque.conexao.Open;
  comandos := TADOQuery.Create(self);
  comandos.Connection := dmComprasEstoque.conexao;
  qtdeStr := ufuncao.formatDouble(Quantidade);
  qry := 'UPDATE PRODUTO SET ESTOQUE = ESTOQUE - ' + qtdeStr;
  qry := qry + ' WHERE produtoid = ' + IntToStr(codigoProduto);
  comandos.Close;
  comandos.SQL.Clear;
  comandos.SQL.ADD(qry);
  comandos.ExecSQL;
end;

procedure TfrmOrdemSaidaEstoque.atualizaSaldoNF(codigoProduto: integer;
  codigoFornecedor, notaFiscal: string; Quantidade: Real; valorUnitario: Real);
var
  qry: string;
  comandos: TADOCommand;
  qryTemp: TADOQuery;
begin
  qryTemp := TADOQuery.Create(self);
  qryTemp.Connection := dmComprasEstoque.conexao;

  comandos := TADOCommand.Create(self);
  comandos.Connection := dmComprasEstoque.conexao;

  qry := 'UPDATE ESTOQUEPRODUTO SET SAIDA = SAIDA + ' +
    StringReplace(FloatToStr(Quantidade), ',', '.', [rfReplaceAll]);
  qry := qry + ' WHERE idproduto = ''' + IntToStr(codigoProduto) + '''';
  qry := qry + ' AND MES = ''' + FormatDateTime('mm', dtpDataSaida.Date) + '''';
  qry := qry + ' AND ANO = ''' + FormatDateTime('yyyy',
    dtpDataSaida.Date) + '''';
  qryTemp.Close;
  qryTemp.SQL.Clear;
  qryTemp.SQL.ADD(qry);
  qryTemp.ExecSQL;
  // comandos.CommandText := qry;
  // comandos.Parameters.Clear;

  { comandos.Parameters.AddParameter.Name := 'QTDE';
    //      comandos.Parameters.AddParameter.Name := 'nf';
    comandos.Parameters.AddParameter.Name := 'produto';
    comandos.Parameters.ParamByName('QTDE').Value := Quantidade;
    //      comandos.Parameters.ParamByName('nf').Value := notaFiscal;
    comandos.Parameters.ParamByName('produto').Value := codigoProduto; }


  // comandos.Execute;

  qry := 'UPDATE ESTOQUEPRODUTO SET SALDO = ENTRADA - SAIDA ';
  qry := qry + ' WHERE idproduto = ''' + IntToStr(codigoProduto) + '''';
  qry := qry + ' AND MES = ''' + FormatDateTime('mm', dtpDataSaida.Date) + '''';
  qry := qry + ' AND ANO = ''' + FormatDateTime('yyyy',
    dtpDataSaida.Date) + '''';

  // with dmComprasEstoque do begin
  comandos.CommandText := qry;
  comandos.Parameters.Clear;
  { comandos.Parameters.AddParameter.Name := 'QTDE';
    //      comandos.Parameters.AddParameter.Name := 'nf';
    comandos.Parameters.AddParameter.Name := 'produto';
    comandos.Parameters.ParamByName('QTDE').Value := Quantidade;
    //      comandos.Parameters.ParamByName('nf').Value := notaFiscal;
    comandos.Parameters.ParamByName('produto').Value := codigoProduto; }
  comandos.Execute;

  qry := 'SELECT sum(saldo) as saldo FROM ESTOQUEPRODUTO WHERE IDPRODUTO = ''' +
    IntToStr(codigoProduto) + '''';
  // qry := qry + ' AND MES = ''' + FormatDateTime('mm',dtpDataSaida.Date) + '''';
  // qry := qry + ' AND ANO = ''' + FormatDateTime('yyyy',dtpDataSaida.Date) + '''';
  qryTemp.Close;
  qryTemp.SQL.Clear;
  qryTemp.SQL.ADD(qry);
  qryTemp.Open;
  {
    qry := 'UPDATE PRODUTO SET ESTOQUE = ' +
    StringReplace( qryTemp.FieldByName( 'SALDO' ).AsString, ',', '.',
    [ rfReplaceAll ] );
    qry := qry + ' WHERE PRODUTOID = ' + IntToStr( codigoProduto );
    comandos.CommandText := qry;
    comandos.Execute; }


  // end;

end;

procedure TfrmOrdemSaidaEstoque.btnAdicionarItensClick(Sender: TObject);
var
  qry, totalS, quebrado, descProduto: String;
  i, comparar: Boolean;
  qtd, estoque, total: Double;
  qryProd: TADOQuery;
  iqtd, x, j, idProduto: integer;
begin

  if (dblProdutosRequisicao.Text = '') then
    exit;

  idProduto := clProdutos.FieldByName('id').AsInteger;
  descProduto := clProdutos.FieldByName('descricao').AsString;
  qryProd := TADOQuery.Create(self);
  qryProd.Connection := dmComprasEstoque.conexao;
  iqtd := StrToInt(edtQuantidade.Text); // Parte Inteira da Quantidade
  estoque := StrToFloat(Edit1.Text);
  if (edtFracao.Text <> '') // Se houver Parte Fracionária:
  then
  begin
    x := 1;
    for j := 0 to Length(edtFracao.Text) - 1 do
      x := x * 10;
    // Concatenar Inteiro com Fração
    iqtd := StrToInt(edtQuantidade.Text + edtFracao.Text);
    qtd := iqtd / x;

  end
  else
  begin
    edtFracao.Text := '0';
    qtd := iqtd;
  end;

  if (qtd <= estoque) then
  begin
    total := estoque - qtd;
    clProdutos.Edit;
    clProdutos.FieldByName('estoque').AsFloat := total;
    clProdutos.Post;
    if (total = 0) then
    begin
      clProdutos.Delete;
    end;

    i := true;
    {
      totalS := FloatToStr( total );
      totalS := StringReplace( totalS, ',', '.', [ rfReplaceAll ] );
      qry := 'UPDATE produto set estoque = ';
      qry := qry + totalS;
      qry := qry + ' WHERE produtoID = ' +
      inttostr( dblProdutosRequisicao.KeyValue );
      with ( qryProd ) do
      begin
      Close;
      SQL.Clear;
      // ShowMessage( qry );
      SQL.Add( qry );
      ExecSQL;
      i := true;
      end; }
    ShowMessage('Quantidade Retirada: ' + FloatToStr(qtd) + #13 +
      'Quantidade Restante: ' + FloatToStr(total));

  end
  else
  begin
    ShowMessage('Quantidade Indisponivel.');
    i := false;
  end;
  if (i = true) then
  begin
    ClientDataSet1.Open;
    ClientDataSet1.Insert;
    ClientDataSet1Codigo.Value := idProduto;
    ClientDataSet1DESCRICAO.AsString := descProduto;
    ClientDataSet1quantidade.Value := qtd;
    ClientDataSet1.Post;
    // Edit1.Text := '0';
  end;
  Edit1.Text := '0';
  edtQuantidade.Clear;
  dblProdutosRequisicao.SetFocus;
  dmComprasEstoque.qryProdutosRequisicao.Close;
  dmComprasEstoque.qryProdutosRequisicao.Open;
end;

procedure TfrmOrdemSaidaEstoque.btnCancelarClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  habilitaBotoes;
  limparcampos;
  desativarAdicaoItens;
end;

procedure TfrmOrdemSaidaEstoque.btnConsultarClick(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT rs.*, alm.descricao as LocalArmazenamento, cc.descricao as CentroConsumo';
  // , dd.descricao as SituacaoRequisicao ';
  qry := qry + ' FROM ORDEMSAIDAESTOQUE rs ';
  qry := qry +
    ' join almoxarifado as alm on alm.almoxarifadoID = rs.idalmoxarifado ';
  qry := qry +
    ' join centroconsumo as cc on cc.centroconsumoID = rs.idcentroconsumo ';
  // qry := qry + ' join situacaorequisicao as dd on dd.situacaorequisicaoId = rs.idsituacao ';
  qry := qry + ' WHERE 1 ';
  if (chkRequisicao.Checked) then
    qry := qry + '   AND datasaida between ''' + FormatDateTime('yyyy-mm-dd',
      dtpDe.DateTime) + ''' AND ''' + FormatDateTime('yyyy-mm-dd',
      dtpAte.DateTime) + '''';
  if chkSituacao.Checked then
    qry := qry + ' AND rs.idsituacao = ''' +
      IntToStr(dblSituacaoReq.KeyValue) + '''';
  if chkCentroConsumo.Checked then
    qry := qry + ' AND rs.idcentroconsumo = ''' +
      IntToStr(dblCentroConsumo.KeyValue) + '''';
  if chkLocalArmazenamento.Checked then
    qry := qry + ' AND rs.idalmoxarifado = ''' +
      IntToStr(dblLocalArmazenamento.KeyValue) + '''';
  with dmComprasEstoque do
  begin
    qryOrdemSaidaEstoque.Close;
    qryOrdemSaidaEstoque.SQL.Clear;
    qryOrdemSaidaEstoque.SQL.ADD(qry);
    qryOrdemSaidaEstoque.Open;
  end;
end;

procedure TfrmOrdemSaidaEstoque.btnEditarClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  habilitaBotoes;
  opcao := 'E';
  dtpDataSaida.SetFocus;
  atualizarQuantidadeProdutos;
  desativarAdicaoItens;
  clProdutos.Open;
end;

procedure TfrmOrdemSaidaEstoque.btnExcluirClick(Sender: TObject);
Var
  qry: String;
begin
  if ClientDataSet1.IsEmpty then
  begin
    Messagebox(Application.Handle, 'Não há itens a serem excluídos.',
      'Compras & Estoque', MB_ICONEXCLAMATION + MB_OK);
  end
  else
  begin
    if MessageDlg('Deseja excluir a requisicao?', mtConfirmation, mbYesNo, 0) = mrYes
    then
    begin
      try
        dmComprasEstoque.conexao.BeginTrans;
        ClientDataSet1.First;
        while not ClientDataSet1.Eof do
        begin
          qry := 'UPDATE ESTOQUEPRODUTO SET SAIDA = SAIDA - ' +
            ClientDataSet1quantidade.AsString;
          qry := qry + ' WHERE IDPRODUTO = ''' + ClientDataSet1Codigo.AsString +
            ''' AND MES = ''' + FormatDateTime('mm', dtpDataSaida.Date) +
            ''' AND ANO = ''' + FormatDateTime('yyyy',
            dtpDataSaida.Date) + '''';
          dmComprasEstoque.comandos.CommandText := qry;

          { dmComprasEstoque.comandos.Parameters.Clear;
            dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'QTDE';
            dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'MES';
            dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'ANO';
            dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'IDPRODUTO';

            dmComprasEstoque.comandos.Parameters.ParamByName('QTDE').Value := ClientDataSet1QUANTIDADE.AsInteger;
            dmComprasEstoque.comandos.Parameters.ParamByName('MES').Value := FormatDateTime('mm',dtpDataSaida.Date);
            dmComprasEstoque.comandos.Parameters.ParamByName('ANO').Value := FormatDateTime('yyyy',dtpDataSaida.Date);
            dmComprasEstoque.comandos.Parameters.ParamByName('IDPRODUTO').Value := ClientDataSet1CODIGO.AsInteger; }

          dmComprasEstoque.comandos.Execute;

          qry := 'UPDATE ESTOQUEPRODUTO SET SALDO = ENTRADA - SAIDA ';
          qry := qry + ' WHERE IDPRODUTO = ''' + ClientDataSet1Codigo.AsString +
            ''' AND MES = ''' + FormatDateTime('mm', dtpDataSaida.Date) +
            ''' AND ANO = ''' + FormatDateTime('yyyy',
            dtpDataSaida.Date) + '''';
          dmComprasEstoque.comandos.CommandText := qry;
          dmComprasEstoque.comandos.Execute;
          //
          qry := 'UPDATE PRODUTO SET ESTOQUE = ESTOQUE + ' +
            ClientDataSet1quantidade.AsString;
          qry := qry + ' WHERE PRODUTOID = ''' +
            ClientDataSet1Codigo.AsString + '''';
          dmComprasEstoque.comandos.CommandText := qry;
          //
          dmComprasEstoque.comandos.Parameters.Clear;
          dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'QTDE';
          dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'IDPRODUTO';

          dmComprasEstoque.comandos.Parameters.ParamByName('QTDE').Value :=
            ClientDataSet1quantidade.AsInteger;
          dmComprasEstoque.comandos.Parameters.ParamByName('IDPRODUTO').Value :=
            ClientDataSet1Codigo.AsInteger;

          dmComprasEstoque.comandos.Execute;

          ClientDataSet1.Next;
        end;

        dmComprasEstoque.comandos.CommandText :=
          'DELETE FROM ITENSORDEMSAIDA WHERE IDordemsaida = ''' +
          dmComprasEstoque.qryItensOrdemSaida.FieldByName('ORDEMSAIDAID')
          .AsString + '''';
        dmComprasEstoque.comandos.Execute;
        dmComprasEstoque.comandos.CommandText :=
          'DELETE FROM ORDEMSAIDAESTOQUE WHERE Ordemsaidaid = ''' +
          dmComprasEstoque.qryItensOrdemSaida.FieldByName('ORDEMSAIDAID')
          .AsString + '''';
        dmComprasEstoque.comandos.Execute;
        dmComprasEstoque.conexao.CommitTrans;
        Messagebox(Application.Handle, 'Registro excluído com sucesso.',
          'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
        limparcampos;
      except
        on E: Exception do
        begin
          Messagebox(Application.Handle,
            'Não foi possível realizar a exclusão da requisição.',
            'Compra & Estoque', MB_ICONERROR + MB_OK);
          dmComprasEstoque.conexao.RollbackTrans;
        end;
      end;
    end;
  end;
  btnConsultarClick(self);
  desativarAdicaoItens;
end;

procedure TfrmOrdemSaidaEstoque.btnSalvarClick(Sender: TObject);
var
  qry: string;
  comandos: TADOCommand;
  ordcompra: integer;
  // QueryTemp : TADOQuery;
begin

  if ClientDataSet1.IsEmpty then
  begin
    Messagebox(Application.Handle, 'Adicione itens para confirmar o lançamento',
      'Compras & Estoque', MB_ICONERROR + MB_OK);
    exit;
  end;
  // QueryTemp := TADOQuery.Create(self);
  // QueryTemp.Connection := dmComprasEstoque.conexao;
  // if verificaliberacao(QueryTemp, strToint(FormatDateTime('yyyy',dtpDataSaida.Date)),strToint(FormatDateTime('mm',dtpDataSaida.Date)) ) then begin

  Panel1.Enabled := not Panel1.Enabled;
  habilitaBotoes;

  if opcao = 'N' then
  begin
    qry := 'INSERT INTO ORDEMSAIDAESTOQUE (DATASAIDA, IDREQUISICAOSAIDA, IDALMOXARIFADO,IDCENTROCONSUMO, DESCRICAO, notafiscal) ';
    qry := qry +
      ' VALUES(:DATASAIDA, :IDREQUISICAOSAIDA, :IDALMOXARIFADO, :IDCENTROCONSUMO, :DESCRICAO, :notafiscal)';
    comandos := TADOCommand.Create(self);
    comandos.Connection := dmComprasEstoque.conexao;
    comandos.CommandText := qry;
    comandos.Parameters.Clear;
    // Adicionando os parametros no command
    comandos.Parameters.AddParameter.Name := 'DATASAIDA';
    comandos.Parameters.AddParameter.Name := 'IDREQUISICAOSAIDA';
    comandos.Parameters.AddParameter.Name := 'IDALMOXARIFADO';
    comandos.Parameters.AddParameter.Name := 'IDCENTROCONSUMO';
    comandos.Parameters.AddParameter.Name := 'DESCRICAO';
    comandos.Parameters.AddParameter.Name := 'NOTAFISCAL';
    comandos.Parameters.ParamByName('DATASAIDA').Value := dtpDataSaida.DateTime;
    // comandos.Parameters.ParamByName('DATASAIDA').Value := now; //dmComprasEstoque.qryOrdemCompra.FieldByName('datarequisicao').AsDateTime;
    comandos.Parameters.ParamByName('IDREQUISICAOSAIDA').Value :=
      edtNumeroRequisicao.Text;
    // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('requisicaosaidaid').AsInteger;
    comandos.Parameters.ParamByName('IDALMOXARIFADO').Value :=
      dblAlmoxarifado.KeyValue;
    // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('idAlmoxarifado').AsInteger;
    comandos.Parameters.ParamByName('IDCENTROCONSUMO').Value :=
      dblCConsumo.KeyValue;
    // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('idcentroconsumo').AsInteger;
    comandos.Parameters.ParamByName('DESCRICAO').Value := edtDescricao.Text;
    // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('descricao').AsString;
    comandos.Parameters.ParamByName('NOTAFISCAL').Value := edtNFEntrada.Text;
    try
      dmComprasEstoque.conexao.BeginTrans;
      comandos.Execute;
      qry := 'SELECT ORDEMsaidaID FROM ORDEMsaidaestoque ORDER BY ORDEMsaidaID DESC LIMIT 1';
      dmComprasEstoque.qryAux.Close;
      dmComprasEstoque.qryAux.SQL.Clear;
      dmComprasEstoque.qryAux.SQL.ADD(qry);
      dmComprasEstoque.qryAux.Open;
      ordcompra := dmComprasEstoque.qryAux.FieldByName('ordemsaidaid')
        .AsInteger;
      // inserir os itens da requisicao de saida
      // dmComprasEstoque.qryItensOrdemSaida.First;
      ClientDataSet1.First;
      while not ClientDataSet1.Eof do
      begin
        qry := 'INSERT INTO ITENSORDEMSAIDA(TIPOMOVIMENTO, DATASAIDA, IDPRODUTO, IDALMOX, IDCCONSUMO, QUANTIDADE,  IDORDEMSAIDA) ';
        qry := qry +
          ' VALUES(:TIPOMOVIMENTO,:DATASAIDA, :IDPRODUTO, :IDALMOX, :IDCCONSUMO, :QUANTIDADE, :IDORDEMSAIDA) ';
        comandos.CommandText := qry;
        comandos.Parameters.Clear;
        // Adicionando os parametros no command
        comandos.Parameters.AddParameter.Name := 'TIPOMOVIMENTO';
        comandos.Parameters.AddParameter.Name := 'DATASAIDA';
        comandos.Parameters.AddParameter.Name := 'IDPRODUTO';
        comandos.Parameters.AddParameter.Name := 'IDALMOX';
        comandos.Parameters.AddParameter.Name := 'IDCCONSUMO';
        comandos.Parameters.AddParameter.Name := 'QUANTIDADE';
        comandos.Parameters.AddParameter.Name := 'IDORDEMSAIDA';
        // comandos.Parameters.AddParameter.Name := 'VALORUNITARIO';
        // comandos.Parameters.AddParameter.Name := 'VALORTOTAL';
        comandos.Parameters.ParamByName('TIPOMOVIMENTO').Value := '2';
        // dmComprasEstoque.qryOrdemCompra.FieldByName('datarequisicao').AsDateTime;
        comandos.Parameters.ParamByName('DATASAIDA').Value :=
          dtpDataSaida.DateTime;
        comandos.Parameters.ParamByName('IDPRODUTO').Value :=
          ClientDataSet1Codigo.Value;
        // .qryItensOrdemSaida.FieldByName('idproduto').AsInteger;
        comandos.Parameters.ParamByName('IDALMOX').Value :=
          dblAlmoxarifado.KeyValue;
        // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('idalmoxarifado').AsInteger;
        comandos.Parameters.ParamByName('IDCCONSUMO').Value :=
          dblCConsumo.KeyValue;
        // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('idcentroconsumo').AsInteger;
        comandos.Parameters.ParamByName('QUANTIDADE').Value :=
          ClientDataSet1quantidade.Value;
        // dmComprasEstoque.qryItensOrdemSaida.FieldByName('quantidade').AsInteger;
        comandos.Parameters.ParamByName('IDORDEMSAIDA').Value := ordcompra;
        // comandos.Parameters.ParamByName('VALORUNITARIO').Value := dmComprasEstoque.qryItensOrdemSaida.FieldByName('valorunitario').AsFloat;
        // comandos.Parameters.ParamByName('VALORTOTAL').Value := dmComprasEstoque.qryItensOrdemSaida.FieldByName('quantidade').AsInteger * dmComprasEstoque.qryItensOrdemSaida.FieldByName('valorunitario').AsFloat;
        comandos.Execute;
        ClientDataSet1.Next;
      end;
      // Coloca o numero da saída do estoque na requisição que a originou
      if (edtNumeroRequisicao.Text <> '') AND (edtNumeroRequisicao.Text <> '0')
      then
      begin
        qry := 'UPDATE REQUISICAOsaida SET idSituacao = 2,  idORDEMsaida = :ordem WHERE requisicaosaidaid = :req';
        comandos.CommandText := qry;
        comandos.Parameters.Clear;
        // Adicionando os parametros no command
        comandos.Parameters.AddParameter.Name := 'ordem';
        comandos.Parameters.AddParameter.Name := 'req';
        comandos.Parameters.ParamByName('ordem').Value := ordcompra;
        comandos.Parameters.ParamByName('req').Value :=
          edtNumeroRequisicao.Text;
        // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('requisicaosaidaid').AsInteger;
        comandos.Execute;
      end;
      dmComprasEstoque.conexao.CommitTrans;
      // Atualizar o saldo de estoque e o saldo de NF
      ClientDataSet1.First;
      while not ClientDataSet1.Eof do
      begin

        //
        // ATUALIZAÇÃO DE SALDO NF
        atualizaSaldoNF(ClientDataSet1Codigo.AsInteger, '', '',
          ClientDataSet1quantidade.AsFloat, 0);

        //
        // ATUALIZAÇÃO DE ESTOQUE
        atualizaSaldoEstoque(ClientDataSet1Codigo.AsInteger,
          ClientDataSet1quantidade.AsFloat);
        ClientDataSet1.Next;
      end;

      // ClientDataSet1.Close;
      btnConsultarClick(self);
      Messagebox(Application.Handle,
        PChar('Ordem de Saída No ' + IntToStr(ordcompra) +
        ' gerada com sucesso.'), 'Compras & Estoque',
        MB_ICONINFORMATION + MB_OK);
      limparcampos;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
        dmComprasEstoque.conexao.RollbackTrans;
      end;
    end;
    { /***FIM_CADASTRO***/ }
  end
  Else
  begin
    try
      // ESTORNADO DADOS SAIDAS
      dmComprasEstoque.conexao.BeginTrans;
      dmComprasEstoque.qryItensOrdemSaida.First;

      comandos := TADOCommand.Create(self);
      comandos.Connection := dmComprasEstoque.conexao;

      while not dmComprasEstoque.qryItensOrdemSaida.Eof do
      begin
        qry := 'UPDATE ESTOQUEPRODUTO SET SAIDA = SAIDA - ' +
          StringReplace
          (FloatToStr(dmComprasEstoque.qryItensOrdemSaida.FieldByName
          ('quantidade').AsFloat), ',', '.', [rfReplaceAll]) +
          ', SALDO = SALDO + ' + StringReplace
          (FloatToStr(dmComprasEstoque.qryItensOrdemSaida.FieldByName
          ('quantidade').AsFloat), ',', '.', [rfReplaceAll]);
        qry := qry + ' WHERE IDPRODUTO = ''' +
          IntToStr(dmComprasEstoque.qryItensOrdemSaida.FieldByName('idproduto')
          .AsInteger) + ''' AND MES = ''' + FormatDateTime('mm',
          dtpDataSaida.Date) + ''' AND ANO = ''' + FormatDateTime('yyyy',
          dtpDataSaida.Date) + '''';

        { QueryTemp.Close;
          QueryTemp.SQL.Clear;
          QueryTemp.SQL.Add(qry);
          QueryTemp.ExecSQL; }
        dmComprasEstoque.comandos.CommandText := '';
        dmComprasEstoque.comandos.CommandText := qry;
        { comandos.Parameters.Clear;
          dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'QTDE';
          dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'MES';
          dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'ANO';
          dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'IDPRODUTO';

          dmComprasEstoque.comandos.Parameters.ParamByName('QTDE').Value := dmComprasEstoque.qryItensOrdemSaida.fieldbyname('quantidade').asinteger;
          dmComprasEstoque.comandos.Parameters.ParamByName('MES').Value := FormatDateTime('mm',dtpDataSaida.Date);
          dmComprasEstoque.comandos.Parameters.ParamByName('ANO').Value := FormatDateTime('yyyy',dtpDataSaida.Date);
          dmComprasEstoque.comandos.Parameters.ParamByName('IDPRODUTO').Value := dmComprasEstoque.qryItensOrdemSaida.fieldbyname('idproduto').asinteger;
        }
        dmComprasEstoque.comandos.Execute;

        // dmComprasEstoque.comandos.Parameters.Clear;

        { qry := 'UPDATE PRODUTO SET ESTOQUE  = ESTOQUE + ' +
          StringReplace
          ( FloatToStr( dmComprasEstoque.qryItensOrdemSaida.FieldByName
          ( 'quantidade' ).AsFloat ), ',', '.', [ rfReplaceAll ] );
          qry := qry + ' WHERE PRODUTOID = ''' +
          inttostr( dmComprasEstoque.qryItensOrdemSaida.FieldByName
          ( 'idproduto' ).AsInteger ) + '''';
          dmComprasEstoque.comandos.CommandText := '';
          dmComprasEstoque.comandos.CommandText := qry;
          dmComprasEstoque.comandos.Execute; }
        { dmComprasEstoque.comandos.Parameters.Clear;
          dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'QTDE';
          dmComprasEstoque.comandos.Parameters.AddParameter.Name := 'IDPRODUTO';

          dmComprasEstoque.comandos.Parameters.ParamByName('QTDE').Value := dmComprasEstoque.qryItensOrdemSaida.fieldbyname('quantidade').asinteger;
          dmComprasEstoque.comandos.Parameters.ParamByName('IDPRODUTO').Value := dmComprasEstoque.qryItensOrdemSaida.fieldbyname('idproduto').asinteger;
        }

        dmComprasEstoque.qryItensOrdemSaida.Next;
      end;

      dmComprasEstoque.qryItensOrdemSaida.First;
      comandos.CommandText :=
        'DELETE FROM ITENSORDEMSAIDA WHERE IDORDEMSAIDA = ''' +
        dmComprasEstoque.qryItensOrdemSaida.FieldByName('ordemsaidaid')
        .AsString + '''';
      comandos.Execute;
      comandos.CommandText :=
        'DELETE FROM ORDEMSAIDAESTOQUE WHERE ordemsaidaid = ''' +
        dmComprasEstoque.qryItensOrdemSaida.FieldByName('ordemsaidaid')
        .AsString + '''';
      comandos.Execute;

      // INSERINDDO NOVAMENTE  CONTINUAR
      qry := 'INSERT INTO ORDEMSAIDAESTOQUE (DATASAIDA, IDREQUISICAOSAIDA, IDALMOXARIFADO,IDCENTROCONSUMO, DESCRICAO) ';
      qry := qry +
        ' VALUES(:DATASAIDA, :IDREQUISICAOSAIDA, :IDALMOXARIFADO, :IDCENTROCONSUMO, :DESCRICAO)';

      comandos.CommandText := qry;
      comandos.Parameters.Clear;
      // Adicionando os parametros no command
      comandos.Parameters.AddParameter.Name := 'DATASAIDA';
      comandos.Parameters.AddParameter.Name := 'IDREQUISICAOSAIDA';
      comandos.Parameters.AddParameter.Name := 'IDALMOXARIFADO';
      comandos.Parameters.AddParameter.Name := 'IDCENTROCONSUMO';
      comandos.Parameters.AddParameter.Name := 'DESCRICAO';
      // comandos.Parameters.AddParameter.Name := 'NOTAFISCAL';
      // comandos.Parameters.ParamByName('DATA').Value := StrToDateTime(FormatDateTime('yyyy-mm-dd',dmComprasEstoque.qryOrdemCompra.FieldByName('datarequisicao').AsDateTime));
      comandos.Parameters.ParamByName('DATASAIDA').Value :=
        dtpDataSaida.DateTime;
      // now; //dmComprasEstoque.qryOrdemCompra.FieldByName('datarequisicao').AsDateTime;
      comandos.Parameters.ParamByName('IDREQUISICAOSAIDA').Value :=
        edtNumeroRequisicao.Text;
      // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('requisicaosaidaid').AsInteger;
      comandos.Parameters.ParamByName('IDALMOXARIFADO').Value :=
        dblAlmoxarifado.KeyValue;
      // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('idAlmoxarifado').AsInteger;
      comandos.Parameters.ParamByName('IDCENTROCONSUMO').Value :=
        dblCConsumo.KeyValue;
      // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('idcentroconsumo').AsInteger;
      comandos.Parameters.ParamByName('DESCRICAO').Value := edtDescricao.Text;
      // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('descricao').AsString;
      // comandos.Parameters.ParamByName('NOTAFISCAL').Value := dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('notafiscal').AsString;

      comandos.Execute;
      qry := 'SELECT ORDEMsaidaID FROM ORDEMsaidaestoque ORDER BY ORDEMsaidaID DESC LIMIT 1';
      dmComprasEstoque.qryAux.Close;
      dmComprasEstoque.qryAux.SQL.Clear;
      dmComprasEstoque.qryAux.SQL.ADD(qry);
      dmComprasEstoque.qryAux.Open;
      ordcompra := dmComprasEstoque.qryAux.FieldByName('ordemsaidaid')
        .AsInteger;
      // inserir os itens da requisicao de saida
      // dmComprasEstoque.qryItensOrdemSaida.First;
      ClientDataSet1.First;
      while not ClientDataSet1.Eof do
      begin
        qry := 'INSERT INTO ITENSORDEMSAIDA(TIPOMOVIMENTO, DATASAIDA, IDPRODUTO, IDALMOX, IDCCONSUMO, QUANTIDADE,  IDORDEMSAIDA) ';
        qry := qry +
          ' VALUES(:TIPOMOVIMENTO,:DATASAIDA, :IDPRODUTO, :IDALMOX, :IDCCONSUMO, :QUANTIDADE, :IDORDEMSAIDA) ';
        comandos.CommandText := qry;
        comandos.Parameters.Clear;
        // Adicionando os parametros no command
        comandos.Parameters.AddParameter.Name := 'TIPOMOVIMENTO';
        comandos.Parameters.AddParameter.Name := 'DATASAIDA';
        comandos.Parameters.AddParameter.Name := 'IDPRODUTO';
        comandos.Parameters.AddParameter.Name := 'IDALMOX';
        comandos.Parameters.AddParameter.Name := 'IDCCONSUMO';
        comandos.Parameters.AddParameter.Name := 'QUANTIDADE';
        comandos.Parameters.AddParameter.Name := 'IDORDEMSAIDA';
        // comandos.Parameters.AddParameter.Name := 'VALORUNITARIO';
        // comandos.Parameters.AddParameter.Name := 'VALORTOTAL';
        comandos.Parameters.ParamByName('TIPOMOVIMENTO').Value := '2';
        // dmComprasEstoque.qryOrdemCompra.FieldByName('datarequisicao').AsDateTime;
        comandos.Parameters.ParamByName('DATASAIDA').Value :=
          dtpDataSaida.DateTime; // now;
        comandos.Parameters.ParamByName('IDPRODUTO').Value :=
          ClientDataSet1Codigo.Value;
        // .qryItensOrdemSaida.FieldByName('idproduto').AsInteger;
        comandos.Parameters.ParamByName('IDALMOX').Value :=
          dblAlmoxarifado.KeyValue;
        // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('idalmoxarifado').AsInteger;
        comandos.Parameters.ParamByName('IDCCONSUMO').Value :=
          dblCConsumo.KeyValue;
        // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('idcentroconsumo').AsInteger;
        comandos.Parameters.ParamByName('QUANTIDADE').Value :=
          ClientDataSet1quantidade.Value;
        // dmComprasEstoque.qryItensOrdemSaida.FieldByName('quantidade').AsInteger;
        comandos.Parameters.ParamByName('IDORDEMSAIDA').Value := ordcompra;
        // comandos.Parameters.ParamByName('VALORUNITARIO').Value := dmComprasEstoque.qryItensOrdemSaida.FieldByName('valorunitario').AsFloat;
        // comandos.Parameters.ParamByName('VALORTOTAL').Value := dmComprasEstoque.qryItensOrdemSaida.FieldByName('quantidade').AsInteger * dmComprasEstoque.qryItensOrdemSaida.FieldByName('valorunitario').AsFloat;
        comandos.Execute;
        ClientDataSet1.Next;
      end;
      // Coloca o numero da saída do estoque na requisição que a originou
      if ((edtNumeroRequisicao.Text <> '') AND (edtNumeroRequisicao.Text <> '0'))
      then
      begin
        qry := 'UPDATE REQUISICAOsaida SET idsituacao = 2, idORDEMsaida = :ordem WHERE requisicaosaidaid = :req';
        comandos.CommandText := qry;
        comandos.Parameters.Clear;
        // Adicionando os parametros no command
        comandos.Parameters.AddParameter.Name := 'ordem';
        comandos.Parameters.AddParameter.Name := 'req';
        comandos.Parameters.ParamByName('ordem').Value := ordcompra;
        comandos.Parameters.ParamByName('req').Value :=
          edtNumeroRequisicao.Text;
        // dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('req=sicaosaidaid').AsInteger;
        comandos.Execute;
      end;

      ClientDataSet1.First;
      while not ClientDataSet1.Eof do
      begin
        atualizaSaldoNF(ClientDataSet1Codigo.AsInteger, '', '',
          ClientDataSet1quantidade.AsFloat, 0);
        // O Saldo do Estoque não é alterado, pois na ALTERAÇÃO de Saida, a adição e modificação de Quantidade de Itens é bloqueada.
        // atualizaSaldoEstoque(dmComprasEstoque.qryItensOrdemSaida.FieldByName('idproduto').AsInteger,dmComprasEstoque.qryItensOrdemSaida.FieldByName('quantidade').AsInteger);
        ClientDataSet1.Next;
      end;
      limparcampos;

      dmComprasEstoque.conexao.CommitTrans;

      // Atualizar o saldo de estoque e o saldo de NF

      Messagebox(Application.Handle, 'Ordem de Saída atualizada com sucesso.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK);

    except
      on E: Exception do
      begin
        Messagebox(Application.Handle,
          'Não foi possível realizar a exclusão da requisição.',
          'Compra & Estoque', MB_ICONERROR + MB_OK);
        dmComprasEstoque.conexao.RollbackTrans;
      end;
    end;
  end;
  // end
  // else begin
  // Messagebox(Application.Handle,'O mês para realização do lançamento não está ativado.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
  // btnCancelarClick(self);
  // end;
  // atualizarQuantidadeProdutos;
  desativarAdicaoItens;
end;

procedure TfrmOrdemSaidaEstoque.chkCentroConsumoClick(Sender: TObject);
begin
  if (dblCentroConsumo.Text = '') then
    chkCentroConsumo.Checked := false;
end;

procedure TfrmOrdemSaidaEstoque.chkLocalArmazenamentoClick(Sender: TObject);
begin
  if (dblLocalArmazenamento.Text = '') then
    chkLocalArmazenamento.Checked := false;
end;

procedure TfrmOrdemSaidaEstoque.chkSituacaoClick(Sender: TObject);
begin
  if (dblSituacaoReq.Text = '') then
    chkSituacao.Checked := false;
end;

procedure TfrmOrdemSaidaEstoque.dblCentroConsumoCloseUp(Sender: TObject);
begin
  if (dblCentroConsumo.Text <> '') then
    chkCentroConsumo.Checked := true
  else
    chkCentroConsumo.Checked := false;
end;

procedure TfrmOrdemSaidaEstoque.dblLocalArmazenamentoCloseUp(Sender: TObject);
begin
  if (dblLocalArmazenamento.Text <> '') then
    chkLocalArmazenamento.Checked := true
  else
    chkLocalArmazenamento.Checked := false;
end;

procedure TfrmOrdemSaidaEstoque.dblProdutosRequisicaoEnter(Sender: TObject);
begin
  keybd_event(VK_DOWN, 1, 0, 0);
end;

procedure TfrmOrdemSaidaEstoque.dblProdutosRequisicaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Edit1.Text := clProdutos.FieldByName('estoque').AsString;

end;

procedure TfrmOrdemSaidaEstoque.dblSituacaoReqCloseUp(Sender: TObject);
begin
  if (dblSituacaoReq.Text <> '') then
    chkSituacao.Checked := true
  else
    chkSituacao.Checked := false;
end;

procedure TfrmOrdemSaidaEstoque.dtpDataSaidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmOrdemSaidaEstoque.dtpDeChange(Sender: TObject);
begin
  chkRequisicao.Checked := true;
end;

procedure TfrmOrdemSaidaEstoque.dtExercicioChange(Sender: TObject);
var
  empresa: UEmpresa;
  empresaDAO: UEmpresaDAO;
begin
  //
  // FormatDateTime( '', dtInicial );
  empresaDAO := UEmpresaDAO.Create;
  empresa := empresaDAO.getEmpresa;
  empresa.mesExercicio := FormatDateTime('MM', dtExercicio.Date);
  empresa.anoExercicio := FormatDateTime('yyyy', dtExercicio.Date);
  empresaDAO.atualizar(empresa);

  qryProdutos.Close;
  qryProdutos.Open;
  atualizarQuantidadeProdutos
  //
end;

procedure TfrmOrdemSaidaEstoque.DBGrid1DblClick(Sender: TObject);
var
  qry: string;
begin
  limparcampos;
  if btnNovo.Enabled = false then
    habilitaBotoes;

  qry := 'SELECT OS.ORDEMSAIDAID, OS.datasaida as datarequisicao, idrequisicaosaida as idreqsaida, alm.almoxarifadoid as idalmoxarifado, alm.descricao as LocalArmazenamento, ';
  qry := qry +
    ' cc.centroconsumoID as idcentroconsumo , cc.descricao as CentroConsumo, OS.descricao, ios.itensordemSaidaID, ios.idproduto, ';
  qry := qry + ' p.descricao as nome, quantidade, ios.itensordemsaidaid ';
  qry := qry + ' FROM ordemsaidaestoque as OS ';
  qry := qry +
    ' join itensordemsaida as ios on ios.idordemsaida = OS.ordemsaidaId ';
  qry := qry +
    ' join almoxarifado as alm on alm.almoxarifadoID = OS.idalmoxarifado ';
  qry := qry +
    ' join centroconsumo as cc on cc.centroconsumoID = OS.idCentroConsumo ';
  qry := qry + ' join produto as p on p.produtoID = ios.idproduto ';
  qry := qry + ' WHERE idordemsaida = ''' +
    dmComprasEstoque.qryOrdemSaidaEstoque.FieldByName('ordemsaidaid')
    .AsString + '''';
  with dmComprasEstoque do
  begin
    qryItensOrdemSaida.Close;
    qryItensOrdemSaida.SQL.Clear;
    qryItensOrdemSaida.SQL.ADD(qry);
    qryItensOrdemSaida.Open;
    ClientDataSet1.Open;
    while not qryItensOrdemSaida.Eof do
    begin
      ClientDataSet1.Insert;
      ClientDataSet1Codigo.Value := qryItensOrdemSaida.FieldByName('idproduto')
        .AsInteger;
      ClientDataSet1DESCRICAO.AsString := qryItensOrdemSaida.FieldByName
        ('nome').AsString;
      ClientDataSet1quantidade.Value := qryItensOrdemSaida.FieldByName
        ('quantidade').AsFloat;
      dblCConsumo.KeyValue := qryItensOrdemSaida.FieldByName('idcentroconsumo')
        .AsInteger;
      dblAlmoxarifado.KeyValue := qryItensOrdemSaida.FieldByName
        ('idalmoxarifado').AsInteger;
      dtpDataSaida.DateTime := qryItensOrdemSaida.FieldByName('datarequisicao')
        .AsDateTime;
      edtNumeroRequisicao.Text := qryItensOrdemSaida.FieldByName
        ('idreqsaida').AsString;
      edtDescricao.Text := qryItensOrdemSaida.FieldByName('descricao').AsString;
      ClientDataSet1.Post;
      qryItensOrdemSaida.Next;
    end;
  end;
  PageControl1.ActivePageIndex := 1;
end;

procedure TfrmOrdemSaidaEstoque.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmOrdemSaidaEstoque.edtFracaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnAdicionarItensClick(self);
    edtFracao.SetFocus;
    edtQuantidade.Clear;
  end;
end;

procedure TfrmOrdemSaidaEstoque.edtProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  produto, prodQry: String;
begin
  { with (clProdutos) do
    begin
    First;
    produto := UpperCase(edtProduto.Text);
    while (not Eof) do
    begin
    prodQry := Copy(FieldByName('descricao').AsString, 1, Length(produto));
    if (prodQry = produto) then
    begin
    ultimoIdProduto := FieldByName('id').AsInteger;
    dblProdutosRequisicao.KeyValue := FieldByName('id').AsInteger;
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
    Edit1.Text := clProdutos.FieldByName('estoque').AsString;
  finally

  end;
end;

procedure TfrmOrdemSaidaEstoque.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    // btnAdicionarItensClick( self );
    edtFracao.SetFocus;
    edtQuantidade.Clear;
  end;
end;

procedure TfrmOrdemSaidaEstoque.edtQuantidadeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DECIMAL) then
  begin
    edtFracao.SetFocus;
    { edtQuantidade.Text := Copy( edtQuantidade.Text, 1,
      Length( edtQuantidade.Text ) - 1 ); }
  end;
end;

procedure TfrmOrdemSaidaEstoque.ExcluirItem1Click(Sender: TObject);
begin
  if MessageDlg('Confirmar exclusão do item?', mtConfirmation, mbYesNo, 0) = mrYes
  then
  begin
    // with dmComprasEstoque, comandos do begin

    // restaurarUmEstoque;
    ativarAdicaoItens;
    restaurarEstoque;
    ClientDataSet1.Delete;
    // CommandText := 'DELETE FROM ITENSREQUISICAOSAIDA  WHERE ITENSREQUISICAOSAIDAID = ''' + qryItensOrdemSaida.FieldByName('ITENSREQUISICAOSAIDAID').AsString + '''';
    // Execute;
    // end;
  end;

end;

procedure TfrmOrdemSaidaEstoque.restaurarUmEstoque;
var
  qryProd: TADOQuery;
begin
  qryProd := TADOQuery.Create(self);
  qryProd.Connection := dmComprasEstoque.conexao;
  if (btnSalvar.Enabled) then
  begin
    with (ClientDataSet1) do
    begin
      qryProd.Close;
      qryProd.SQL.Clear;
      qryProd.SQL.ADD('UPDATE produto SET estoque = estoque + ' +
        ClientDataSet1quantidade.AsString + ' WHERE produtoID = ''' +
        ClientDataSet1Codigo.AsString + '''');
      qryProd.ExecSQL;
      // UPDATE produto SET estoque = estoque + fieldByName('estoque').asFloat where produtoID = codigo
    end;
  end;
end;

procedure TfrmOrdemSaidaEstoque.restaurarEstoque();
var
  qryProd: TADOQuery;
  i: integer;
begin
  if (ClientDataSet1.RecordCount > 0) then
  begin
    //
    i := 0;
    with (clProdutos) do
    begin
      //
      First;
      while (not Eof) do
      begin
        if (clProdutosid.Value = ClientDataSet1Codigo.Value) then
        begin
          Edit;
          clProdutosestoque.Value := clProdutosestoque.Value +
            ClientDataSet1quantidade.Value;
          i := 1;
          break;
        end;
        Next;
      end;
      if (i = 0) then
      begin
        Insert;
        clProdutosid.Value := ClientDataSet1Codigo.Value;
        clProdutosdescricao.Value := ClientDataSet1DESCRICAO.Value;
        clProdutosestoque.Value := ClientDataSet1quantidade.Value;
      end;
      Post;
    end;
  end;
end;

procedure TfrmOrdemSaidaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // restaurarEstoque;
  with dmComprasEstoque do
  begin
    qryCentroConsumo.Close;
    qryAlmoxarifado.Close;
    qrySituacaoRequisicao.Close;
    qryProdutosRequisicao.Close;
    qryOrdemSaidaEstoque.Close;
    qryItensOrdemSaida.Close;
  end;

end;

procedure TfrmOrdemSaidaEstoque.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  with dmComprasEstoque do
  begin
    qryProdutos.Open;
    qryCentroConsumo.Open;
    qryAlmoxarifado.Open;
    qryProdutosRequisicao.Open;
    qrySituacaoRequisicao.Open;
  end;
  dtpDe.DateTime := StrToDateTime(FormatDateTime('01/mm/yyyy', now));
  dtpDataSaida.DateTime := now;
  dtpAte.DateTime := now;
  btnConsultarClick(self);

  setarDataExercicio;
end;

procedure TfrmOrdemSaidaEstoque.habilitaBotoes;
begin
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmOrdemSaidaEstoque.limparcampos;
begin
  dtpDataSaida.DateTime := now;
  Edit1.Clear;
  edtNFEntrada.Clear;
  edtNumeroRequisicao.Clear;
  dblAlmoxarifado.KeyValue := 0;
  dblCConsumo.KeyValue := 0;
  edtDescricao.Clear;
  dblProdutosRequisicao.LookupValue := '';
  edtQuantidade.Clear;

  dmComprasEstoque.qryProdutosRequisicao.Close;
  dmComprasEstoque.qryProdutosRequisicao.Open;
  DBGrid2.ReadOnly := true;

  ativarClientDataSet;

end;

procedure TfrmOrdemSaidaEstoque.ativarClientDataSet;
begin
  if (ClientDataSet1.Active = true) then
  begin
    ClientDataSet1.EmptyDataSet;
    ClientDataSet1.Close;
  end;
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.Open;
end;

procedure TfrmOrdemSaidaEstoque.SpeedButton1Click(Sender: TObject);
begin
  try
    frmListaReqSaida := TfrmListaReqSaida.Create(self);
    frmListaReqSaida.showmodal();
  finally
    frmListaReqSaida.free;
  end;
end;

procedure TfrmOrdemSaidaEstoque.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrdemSaidaEstoque.btnAnteriorClick(Sender: TObject);
begin
  if (dmComprasEstoque.qryOrdemSaidaEstoque.FindPrior) then
  begin
    DBGrid1DblClick(self);
    btnProximo.Enabled := true;
  end
  else
    btnAnterior.Enabled := false;
end;

procedure TfrmOrdemSaidaEstoque.btnNovoClick(Sender: TObject);
begin

  Panel1.Enabled := not Panel1.Enabled;
  limparcampos;
  habilitaBotoes;
  dtpDataSaida.SetFocus;
  opcao := 'N';
  dtpDataSaida.SetFocus;
  DBGrid2.ReadOnly := false;
  dmComprasEstoque.qryProdutosRequisicao.Close;
  dmComprasEstoque.qryProdutosRequisicao.Open;
  atualizarQuantidadeProdutos;
  ativarAdicaoItens;

end;

procedure TfrmOrdemSaidaEstoque.btnProximoClick(Sender: TObject);
begin
  if (dmComprasEstoque.qryOrdemSaidaEstoque.FindNext) then
  begin
    DBGrid1DblClick(self);
    btnAnterior.Enabled := true;
  end
  else
    btnProximo.Enabled := false;
end;

procedure TfrmOrdemSaidaEstoque.setarDataExercicio();
var
  lib: ULiberacao;
  libDAO: ULiberacaoDAO;
  empDAO: UEmpresaDAO;
begin
  { Validar Liberação }
  empDAO := UEmpresaDAO.Create;
  libDAO := ULiberacaoDAO.Create;
  lib := libDAO.getLiberacao;

  dtExercicio.Date := empDAO.getDataExercicio;
  dtExercicio.MaxDate := libDAO.getDataFinalLiberacao;
  dtExercicio.MinDate := libDAO.getDataInicialLiberacao;
end;

procedure TfrmOrdemSaidaEstoque.ativarAdicaoItens;
begin
  DBGrid2.ReadOnly := false;
  dblProdutosRequisicao.Enabled := true;
  edtQuantidade.Enabled := true;
  edtFracao.Enabled := true;
  btnAdicionarItens.Enabled := true;

end;

procedure TfrmOrdemSaidaEstoque.desativarAdicaoItens;
begin
  // DBGrid2.ReadOnly := true;
  dblProdutosRequisicao.Enabled := false;
  edtQuantidade.Enabled := false;
  edtFracao.Enabled := false;
  btnAdicionarItens.Enabled := false;
end;

procedure TfrmOrdemSaidaEstoque.atualizarQuantidadeProdutos;
begin
  //
  with (qryProdutos) do
  begin
    Close;
    Open;
  end;
  clProdutos.Close;
  clProdutos.CreateDataSet;
  clProdutos.Open;
  clProdutos.EmptyDataSet;
  qryProdutos.First;
  while (not qryProdutos.Eof) do
  begin
    with (qryProdutos) do
    begin
      clProdutos.Insert;
      clProdutosid.Value := FieldByName('ProdutoID').AsInteger;
      clProdutosestoque.Value := FieldByName('estoque').AsFloat;
      clProdutosdescricao.Value := FieldByName('descricao').AsString;
      clProdutos.Post;
      Next;
    end;
  end;
  dblProdutosRequisicao.LookupSource := dsProdutos;
  dblProdutosRequisicao.LookupField := 'id';
  dblProdutosRequisicao.LookupDisplay := 'descricao';
  qryProdutos.Close;
end;

end.
