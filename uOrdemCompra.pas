unit uOrdemCompra;

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
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Data.Win.ADODB,
  Vcl.Menus,
  System.UITypes,
  Data.DB, System.ImageList;

type
  TfrmOrdemCompra = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    chkSituacao: TCheckBox;
    chkCentroConsumo: TCheckBox;
    chkfornecedor: TCheckBox;
    dblCentroConsumo: TDBLookupComboBox;
    dblFornecedor: TDBLookupComboBox;
    dblSituacaoReq: TDBLookupComboBox;
    btnConsultar: TBitBtn;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    btnSalvar: TToolButton;
    ToolButton10: TToolButton;
    btnExcluir: TToolButton;
    ToolButton8: TToolButton;
    ToolButton1: TToolButton;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    StatusBar1: TStatusBar;
    chkDataRequisicao: TCheckBox;
    ImageListMainMenu: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure dtpDeChange(Sender: TObject);
    procedure dblSituacaoReqClick(Sender: TObject);
    procedure chkSituacaoClick(Sender: TObject);
    procedure dblCentroConsumoClick(Sender: TObject);
    procedure chkCentroConsumoClick(Sender: TObject);
    procedure dblFornecedorCloseUp(Sender: TObject);
    procedure chkfornecedorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    resp: integer;
  end;

var
  frmOrdemCompra: TfrmOrdemCompra;

implementation

{$R *.dfm}

uses
  udmComprasEstoque,
  uTipoOrdemCompra;

procedure TfrmOrdemCompra.btnConsultarClick(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT rc.requisicaocompraID as Requisicao, rc.datarequisicao,situa.descricao as Situacao, cc.descricao as CentroConsumo, alm.descricao as Almoxarifado, ';
  qry := qry + ' forn.nomefantasia as Fornecedor ';
  qry := qry + ' FROM requisicaocompra as rc ';
  qry := qry +
    ' join almoxarifado as alm on alm.almoxarifadoID = rc.idalmoxarifado ';
  qry := qry +
    ' join centroconsumo as cc on cc.centroconsumoID = rc.idcentroconsumo ';
  qry := qry +
    ' join fornecedor as forn on forn.cpfcnpj = rc.idfornecedor or forn.codigo = rc.idfornecedor';
  qry := qry +
    ' join situacaorequisicao as situa on situa.situacaorequisicaoId = rc.idsituacao ';
  qry := qry + ' WHERE 1 ';
  if (chkDataRequisicao.Checked) then
    qry := qry + ' AND datarequisicao between ''' + FormatDateTime('yyyy-mm-dd',
      dtpDe.DateTime) + ''' and ''' + FormatDateTime('yyyy-mm-dd',
      dtpAte.DateTime) + '''';
  qry := qry + '  and rc.ordemcompraid is null ';
  if chkSituacao.Checked then
    qry := qry + ' and rc.idsituacao = ''' +
      IntToStr(dblSituacaoReq.KeyValue) + '''';
  if chkCentroConsumo.Checked then
    qry := qry + ' and rc.idcentroconsumo = ''' +
      IntToStr(dblCentroConsumo.KeyValue) + '''';
  if chkfornecedor.Checked then
    qry := qry + ' and (rc.idfornecedor = ''' + IntToStr(dblFornecedor.KeyValue)
      + ''' OR rc.idfornecedor = ''' + dmComprasEstoque.qryFornecedor.
      FieldByName('codigo').AsString + ''')';
  with dmComprasEstoque do
  begin
    qryOrdemCompra.Close;
    qryOrdemCompra.SQL.Clear;
    qryOrdemCompra.SQL.Add(qry);
    qryOrdemCompra.Open;
  end;

end;

procedure TfrmOrdemCompra.btnExcluirClick(Sender: TObject);
var
  qry: string;
  // comandos : TAdoCommand;
begin
  if dmComprasEstoque.qryDetalhesOrdemCompra.IsEmpty then
  begin
    if MessageDlg('Deseja excluir esta requisição de compra?', mtConfirmation,
      mbYesNo, 0) = mrYes then
    begin
      try
        dmComprasEstoque.conexao.BeginTrans;
        qry := 'DELETE FROM ITENSREQUISICAOCOMPRA WHERE idrequisicaocompra = '''
          + dmComprasEstoque.qryOrdemCompra.FieldByName('Requisicao')
          .AsString + '''';
        dmComprasEstoque.comandos.CommandText := qry;
        dmComprasEstoque.comandos.Execute;

        qry := 'DELETE FROM REQUISICAOCOMPRA WHERE requisicaocompraid = ''' +
          dmComprasEstoque.qryOrdemCompra.FieldByName('Requisicao')
          .AsString + '''';
        dmComprasEstoque.comandos.CommandText := qry;
        dmComprasEstoque.comandos.Execute;
        dmComprasEstoque.conexao.CommitTrans;

        // limpaCampos;
        dmComprasEstoque.qryDetalhesOrdemCompra.Close;
        MessageBox(Application.Handle, 'Requisição excluída com sucesso.',
          'Compras & Estoque', MB_OK);
      Except
        on e: Exception do
        begin
          dmComprasEstoque.conexao.RollbackTrans;
          MessageBox(Application.Handle, 'Erro ao excluir a requisição.',
            'Compras & Estoque', MB_OK);
        end;
      end;
    end;
  end
  else
  begin
    ShowMessage('Não há itens a serem excluídos.');
  end;

end;

procedure TfrmOrdemCompra.btnSalvarClick(Sender: TObject);
var
  qry: string;
  comandos: TADOCommand;
  ordcompra: integer;
begin
  if not dmComprasEstoque.qryDetalhesOrdemCompra.IsEmpty then
  begin
    try
      frmTipoOrdemCompra := TfrmTipoOrdemCompra.create(Self);
      frmTipoOrdemCompra.ShowModal;
      qry := 'INSERT INTO ORDEMCOMPRA (DATA, IDREQCOMPRA, TIPO) VALUES(:DATA, :IDREQCOMPRA, :TIPO)';
      comandos := TADOCommand.create(Self);
      comandos.Connection := dmComprasEstoque.conexao;
      comandos.CommandText := qry;
      comandos.Parameters.Clear;
      // Adicionando os parametros no command
      comandos.Parameters.AddParameter.Name := 'DATA';
      comandos.Parameters.AddParameter.Name := 'IDREQCOMPRA';
      comandos.Parameters.AddParameter.Name := 'TIPO';

      // comandos.Parameters.ParamByName('DATA').Value := StrToDateTime(FormatDateTime('yyyy-mm-dd',dmComprasEstoque.qryOrdemCompra.FieldByName('datarequisicao').AsDateTime));
      comandos.Parameters.ParamByName('DATA').Value := now;
      // dmComprasEstoque.qryOrdemCompra.FieldByName('datarequisicao').AsDateTime;
      comandos.Parameters.ParamByName('IDREQCOMPRA').Value :=
        dmComprasEstoque.qryOrdemCompra.FieldByName('requisicao').AsInteger;
      comandos.Parameters.ParamByName('TIPO').Value := resp;
      try
        dmComprasEstoque.conexao.BeginTrans;
        comandos.Execute;
        qry := 'SELECT ORDEMCOMPRAID FROM ORDEMCOMPRA ORDER BY ORDEMCOMPRAID DESC LIMIT 1';
        dmComprasEstoque.qryAux.Close;
        dmComprasEstoque.qryAux.SQL.Clear;
        dmComprasEstoque.qryAux.SQL.Add(qry);
        dmComprasEstoque.qryAux.Open;
        ordcompra := dmComprasEstoque.qryAux.FieldByName('ordemcompraid')
          .AsInteger;
        qry := 'UPDATE REQUISICAOCOMPRA ';
        qry := qry + ' SET ORDEMCOMPRAID = ''' + IntToStr(ordcompra) + '''';
        qry := qry + ' WHERE requisicaocompraid = ''' +
          dmComprasEstoque.qryOrdemCompra.FieldByName('requisicao')
          .AsString + '''';
        comandos.CommandText := qry;
        // comandos.Parameters.Clear;
        // Adicionando os parametros no command
        // comandos.Parameters.AddParameter.Name := 'ordem';
        // comandos.Parameters.AddParameter.Name := 'req';
        // comandos.Parameters.ParamByName('ordem').Value := ordcompra;
        // comandos.Parameters.ParamByName('req').Value := dmComprasEstoque.qryOrdemCompra.FieldByName('requisicao').AsInteger;

        comandos.Execute;

        dmComprasEstoque.conexao.CommitTrans;
        dmComprasEstoque.qryDetalhesOrdemCompra.Close;
        PageControl1.ActivePageIndex := 0;
        btnConsultarClick(Self);
        ShowMessage('Ordem de Compra  No ' + IntToStr(ordcompra) +
          ' gerada com sucesso.');
      except
        on e: Exception do
        begin
          // ShowMessage(e.Message);
          dmComprasEstoque.conexao.RollbackTrans;
        end;
      end;
    finally
      frmTipoOrdemCompra.free;
    end;
  end
  Else
  begin
    ShowMessage('Não há itens para serem salvos.');
  end;
end;

procedure TfrmOrdemCompra.chkCentroConsumoClick(Sender: TObject);
begin
  if (dblCentroConsumo.Text = '') then
    chkCentroConsumo.Checked := false;
end;

procedure TfrmOrdemCompra.chkfornecedorClick(Sender: TObject);
begin
  if (dblFornecedor.Text = '') then
    chkfornecedor.Checked := false;
end;

procedure TfrmOrdemCompra.chkSituacaoClick(Sender: TObject);
begin
  if (dblSituacaoReq.Text = '') then
    chkSituacao.Checked := false;
end;

procedure TfrmOrdemCompra.DBGrid1DblClick(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT ir.itensrequisicaoID, ir.idproduto, p.descricao as nome, quantidade ';
  qry := qry + ' FROM itensrequisicaocompra as ir ';
  qry := qry + ' join produto as p on p.produtoID = ir.idproduto ';
  qry := qry + ' Where ir.idrequisicaocompra = ''' +
    dmComprasEstoque.qryOrdemCompra.FieldByName('Requisicao').AsString + '''';
  with dmComprasEstoque do
  begin
    qryDetalhesOrdemCompra.Close;
    qryDetalhesOrdemCompra.SQL.Clear;
    qryDetalhesOrdemCompra.SQL.Add(qry);
    qryDetalhesOrdemCompra.Open;
  end;
  PageControl1.ActivePageIndex := 1;

end;

procedure TfrmOrdemCompra.dblCentroConsumoClick(Sender: TObject);
begin
  if (dblCentroConsumo.Text <> '') then
    chkCentroConsumo.Checked := true
  else
    chkCentroConsumo.Checked := false;
end;

procedure TfrmOrdemCompra.dblFornecedorCloseUp(Sender: TObject);
begin
  if (dblFornecedor.Text <> '') then
    chkfornecedor.Checked := true
  else
    chkfornecedor.Checked := false

end;

procedure TfrmOrdemCompra.dblSituacaoReqClick(Sender: TObject);
begin
  if (dblSituacaoReq.Text <> '') then
    chkSituacao.Checked := true
  else
    chkSituacao.Checked := false;
end;

procedure TfrmOrdemCompra.dtpDeChange(Sender: TObject);
begin
  chkDataRequisicao.Checked := true;
end;

procedure TfrmOrdemCompra.ExcluirItem1Click(Sender: TObject);
var
  qry: string;
begin
  qry := 'DELETE FROM ITENSREQUISICAOCOMPRA WHERE ITENSREQUISICAOID = ''' +
    dmComprasEstoque.qryDetalhesOrdemCompra.FieldByName('ITENSREQUISICAOID')
    .AsString + '''';
  with dmComprasEstoque do
  begin
    comandos.CommandText := qry;
    comandos.Execute;
    qryDetalhesOrdemCompra.Close;
    qryDetalhesOrdemCompra.Open;
  end;

end;

procedure TfrmOrdemCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmComprasEstoque do
  begin
    qrySituacaoRequisicao.Close;
    qryCentroConsumo.Close;
    qryFornecedor.Close;
    qryOrdemCompra.Close;
    qryDetalhesOrdemCompra.Close;
  end;
end;

procedure TfrmOrdemCompra.FormShow(Sender: TObject);
begin
  dtpDe.DateTime := StrToDateTime(FormatDateTime('01/mm/yyyy', now));
  dtpAte.DateTime := now;
  PageControl1.ActivePageIndex := 0;
  with dmComprasEstoque do
  begin
    qrySituacaoRequisicao.Open;
    qryCentroConsumo.Open;
    qryFornecedor.Open;
  end;
  btnConsultarClick(Self);

end;

procedure TfrmOrdemCompra.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

end.
