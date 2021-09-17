unit uListaReqSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmListaReqSaida = class(TForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    BitBtn1: TBitBtn;
    qryConsultaItens: TADOQuery;
    DataSource1: TDataSource;
    qryConsultaItensrequisicaosaidaId: TAutoIncField;
    qryConsultaItensdatarequisicao: TDateField;
    qryConsultaItensdataentrega: TDateField;
    qryConsultaItensdescricao: TStringField;
    qryConsultaItensidOrdemSaida: TIntegerField;
    qryConsultaItensCentroConsumo: TStringField;
    qryConsultaItenssituacaorequisicao: TStringField;
    qryConsultaItenscodigoproduto: TIntegerField;
    qryConsultaItensnomeproduto: TStringField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    qryConsultaItensidalmoxarifado: TIntegerField;
    qryConsultaItensidcentroconsumo: TIntegerField;
    qryConsultaItensidsituacao: TIntegerField;
    qryConsultaItensdatabaixa: TDateField;
    qryConsultaItensdescricaobaixa: TStringField;
    qryConsultaItensnotafiscal: TStringField;
    qryConsultaItensquantidade: TBCDField;
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaReqSaida: TfrmListaReqSaida;

implementation

{$R *.dfm}

uses udmComprasEstoque, uOrdemSaidaEstoque;

procedure TfrmListaReqSaida.BitBtn1Click(Sender: TObject);
begin
  with frmOrdemSaidaEstoque do
  begin
    edtNumeroRequisicao.Text := dmComprasEstoque.qryListaRequisicaoSaida.
      FieldByName('requisicaosaidaId').AsString;
    edtNumeroRequisicao.SetFocus;
    dblAlmoxarifado.KeyValue := qryConsultaItensidalmoxarifado.Value;
    dblCConsumo.KeyValue := qryConsultaItensidcentroconsumo.Value;
    edtDescricao.Text := qryConsultaItensdescricao.AsString;
    dtpDataSaida.DateTime := qryConsultaItensdatarequisicao.Value;
    ClientDataSet1.Open;
    while not qryConsultaItens.Eof do
    begin
      ClientDataSet1.Insert;
      ClientDataSet1CODIGO.Value := qryConsultaItenscodigoproduto.AsInteger;
      ClientDataSet1DESCRICAO.AsString := qryConsultaItensnomeproduto.AsString;
      ClientDataSet1QUANTIDADE.Value := qryConsultaItensquantidade.AsFloat;
      ClientDataSet1.Post;
      qryConsultaItens.Next;
    end;

  end;

end;

procedure TfrmListaReqSaida.DBLookupComboBox1Click(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT req.*, cc.descricao as CentroConsumo, ';
  qry := qry + ' sr.descricao as situacaorequisicao, ';
  qry := qry +
    ' irc.idproduto as codigoproduto , p.descricao as nomeproduto, irc.quantidade ';
  qry := qry + ' FROM requisicaosaida as req ';
  qry := qry +
    ' join itensrequisicaosaida as irc on irc.idreqsaida = req.requisicaosaidaId ';
  qry := qry +
    ' join centroconsumo as cc on cc.centroconsumoID = req.idcentroconsumo ';
  qry := qry + ' join produto as p on p.produtoid = irc.idproduto ';
  qry := qry +
    ' join situacaorequisicao as sr on sr.situacaorequisicaoid = req.idsituacao ';
  qry := qry + ' Where idsituacao = 1 ';
  qry := qry + ' AND requisicaosaidaid = ''' +
    dmComprasEstoque.qryListaRequisicaoSaida.FieldByName('requisicaosaidaId')
    .AsString + ''' ';
  with qryConsultaItens do
  begin
    close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
  end;

end;

procedure TfrmListaReqSaida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmComprasEstoque.qryListaRequisicaoSaida.close;
end;

procedure TfrmListaReqSaida.FormShow(Sender: TObject);
begin
  dmComprasEstoque.qryListaRequisicaoSaida.Open;
end;

end.
