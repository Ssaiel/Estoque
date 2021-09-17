unit uRelItensNFSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Datasnap.DBClient, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Vcl.DBCtrls, Data.Win.ADODB, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmRelItensNFSaida = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    qryConsultaItens: TADOQuery;
    qryConsultaItensdatarequisicao: TDateField;
    qryConsultaItensrequisicaocompraID: TAutoIncField;
    qryConsultaItensordemcompraID: TIntegerField;
    qryConsultaItensCentroConsumo: TStringField;
    qryConsultaItensnomefantasia: TStringField;
    qryConsultaItensformapagamento: TStringField;
    qryConsultaItenssituacaorequisicao: TStringField;
    qryConsultaItensobservacaojustificativa: TStringField;
    qryConsultaItenslicitacao: TStringField;
    qryConsultaItenscodigoproduto: TIntegerField;
    qryConsultaItensnomeproduto: TStringField;
    DataSource1: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    BitBtn1: TBitBtn;
    qryConsultaItensvalorunitario: TBCDField;
    qryConsultaItensidalmoxarifado: TIntegerField;
    qryConsultaItensidcentroconsumo: TIntegerField;
    qryConsultaItensidfornecedor: TStringField;
    DataSource2: TDataSource;
    qryConsultaItensquantidade: TBCDField;
    ClientDataSet1TEMP: TClientDataSet;
    ClientDataSet1TEMPCodigo: TIntegerField;
    ClientDataSet1TEMPdescricaoproduto: TStringField;
    ClientDataSet1TEMPquantidade: TFloatField;
    ClientDataSet1TEMPvalorunitario: TFloatField;
    ClientDataSet1TEMPtotal: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure atualizarGrid();
    procedure DBGrid1ColExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelItensNFSaida: TfrmRelItensNFSaida;

implementation

{$R *.dfm}

uses udmComprasEstoque, uEntradaProdutos;

procedure TfrmRelItensNFSaida.BitBtn1Click(Sender: TObject);
begin
  with frmEntradaProdutos do
  begin
    edtPedidoCompra.Text := qryConsultaItensordemcompraID.AsString;
    dblAlmoxarifadoLanc.KeyValue := qryConsultaItensidalmoxarifado.Value;
    dblFornecedorLanc.KeyValue := qryConsultaItensidfornecedor.Value;

    try
      dtpRequisicao.DateTime :=
        StrToDate(FormatDateTime('dd/mm/yyyy',
        qryConsultaItensdatarequisicao.Value));
    Except
      ShowMessage('Data de Requisição dos Itens fora do Período de Liberação.');
      dtpRequisicao.DateTime := dtpRequisicao.MaxDate;
    end;

    ClientDataSet2.close;
    ClientDataSet2.CreateDataSet;
    { ClientDataSet2.Open;
      ClientDataSet2.EmptyDataSet; }

    ClientDataSet2.Open;
    frmRelItensNFSaida.ClientDataSet1TEMP.First;
    while not frmRelItensNFSaida.ClientDataSet1TEMP.Eof do
    begin
      ClientDataSet2.Insert;
      ClientDataSet2codigo.Value :=
        frmRelItensNFSaida.ClientDataSet1TEMPCodigo.Value;
      ClientDataSet2descricao.AsString :=
        frmRelItensNFSaida.ClientDataSet1TEMPdescricaoproduto.AsString;
      ClientDataSet2quantidade.Value :=
        frmRelItensNFSaida.ClientDataSet1TEMPquantidade.Value;
      ClientDataSet2precounitario.Value :=
        frmRelItensNFSaida.ClientDataSet1TEMPvalorunitario.Value;
      { total }

      ClientDataSet2.Post;
      frmRelItensNFSaida.ClientDataSet1TEMP.Next;
    end;
    atualizaGrid;

  end;

end;

procedure TfrmRelItensNFSaida.atualizarGrid();
begin
  if (not ClientDataSet1TEMP.IsEmpty) then
  begin
    with (ClientDataSet1TEMP) do
    begin
      Edit;
      ClientDataSet1TEMPtotal.Value := ClientDataSet1TEMPquantidade.Value *
        ClientDataSet1TEMPvalorunitario.Value;
      Post;
      Next;
    end;
  end;
end;

procedure TfrmRelItensNFSaida.DBGrid1ColExit(Sender: TObject);
begin
  atualizarGrid();
end;

procedure TfrmRelItensNFSaida.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13, #37, #38, #39, #40]) then
  begin
    atualizarGrid;
  end;
end;

procedure TfrmRelItensNFSaida.DBLookupComboBox1Click(Sender: TObject);
var
  qry: String;
begin
  qry := 'SELECT requisicaocompraID, req.datarequisicao, ordemcompraID, cc.descricao as CentroConsumo, f.razaosocial as nomefantasia, ';
  qry := qry +
    ' fp.descricao as formapagamento, sr.descricao as situacaorequisicao, req.observacaojustificativa, req.licitacao, ';
  qry := qry +
    ' irc.idproduto as codigoproduto , p.descricao as nomeproduto, irc.quantidade, ';
  qry := qry + ' irc.valorunitario, REQ.* ';
  qry := qry + ' FROM requisicaocompra as req ';
  qry := qry +
    ' left join itensrequisicaocompra as irc on irc.idrequisicaocompra = req.requisicaocompraid';
  qry := qry +
    ' left join centroconsumo as cc on cc.centroconsumoID = req.idcentroconsumo ';
  qry := qry +
    ' left join fornecedor as f on f.cpfcnpj = req.idfornecedor  or f.codigo = req.idfornecedor ';
  qry := qry + ' join produto as p on p.produtoid = irc.idproduto ';
  qry := qry +
    ' left join formapagamento as fp on fp.idformapagamento = req.idformapagamento ';
  qry := qry +
    ' left join situacaorequisicao as sr on sr.situacaorequisicaoid = req.idsituacao ';
  qry := qry +
    ' left join almoxarifado as alm on alm.almoxarifadoID = req.idalmoxarifado ';
  qry := qry +
    ' left join pessoas as pes on pes.pessoasID = alm.idresponsavelautorizacao ';
  qry := qry + ' where  requisicaocompraID = ''' +
    inttostr(DBLookupComboBox1.KeyValue) + '''';
  qry := qry + ' AND  ordemcompraID IS NOT NULL ';
  qry := qry + ' AND  idsituacao = 1';
  qry := qry + ' order by irc.quantidade, nomeproduto asc ';
  with qryConsultaItens do
  begin
    close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
    ClientDataSet1TEMP.close;
    ClientDataSet1TEMP.CreateDataSet;
    ClientDataSet1TEMP.Open;
    ClientDataSet1TEMP.EmptyDataSet;
    while not Eof do
    begin
      ClientDataSet1TEMP.Insert;
      ClientDataSet1TEMPCodigo.Value := qryConsultaItenscodigoproduto.Value;
      ClientDataSet1TEMPdescricaoproduto.Value :=
        qryConsultaItensnomeproduto.Value;
      ClientDataSet1TEMPquantidade.Value := qryConsultaItensquantidade.Value;
      ClientDataSet1TEMPvalorunitario.Value :=
        qryConsultaItensvalorunitario.Value;
      ClientDataSet1TEMPtotal.Value := qryConsultaItensquantidade.Value *
        qryConsultaItensvalorunitario.Value;
      ClientDataSet1TEMP.Post;
      Next;
    end;
  end;

end;

procedure TfrmRelItensNFSaida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmComprasEstoque.qryListaRequisicaoCompraEntrada.close;
end;

procedure TfrmRelItensNFSaida.FormShow(Sender: TObject);

begin
  dmComprasEstoque.qryListaRequisicaoCompraEntrada.Open;
end;

procedure TfrmRelItensNFSaida.Timer1Timer(Sender: TObject);
begin
  atualizarGrid();
end;

end.
