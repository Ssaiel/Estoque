unit udmComprasEstoque;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.Win.ADODB,
  Data.DB,
  frxClass,
  frxDBSet,
  frxExportRTF,
  frxExportPDF;

type
  TdmComprasEstoque = class(TDataModule)
    conexao: TADOConnection;
    qryAlmoxarifado: TADOQuery;
    comandos: TADOCommand;
    dsQryAlmoxarifado: TDataSource;
    qryPessoas: TADOQuery;
    dsQryPessoas: TDataSource;
    qryResponsavelDespacho: TADOQuery;
    dsQryRespDespacho: TDataSource;
    qryResponsavelAutorizacao: TADOQuery;
    dsQryRespAutorizacao: TDataSource;
    qryEntidade: TADOQuery;
    dsQryEntidade: TDataSource;
    qryCategorias: TADOQuery;
    dsQryCategorias: TDataSource;
    qryCentroConsumo: TADOQuery;
    dsQryCentroConsumo: TDataSource;
    qryFornecedor: TADOQuery;
    dsQryFornecedor: TDataSource;
    qryCidades: TADOQuery;
    dsQryCidades: TDataSource;
    qryPessoaspessoasID: TAutoIncField;
    qryPessoasnome: TStringField;
    qryPessoasfuncao: TStringField;
    qryPessoascpf: TStringField;
    qryProdutos: TADOQuery;
    dsQryProdutos: TDataSource;
    dsQryUnidadeMedida: TDataSource;
    dsQryTipoMaterial: TDataSource;
    qryUnidade: TADOQuery;
    qryTipoProduto: TADOQuery;
    qryFormaPagamento: TADOQuery;
    qrySituacaoRequisicao: TADOQuery;
    dsQryFormaPagamento: TDataSource;
    dsQrySituacaoReq: TDataSource;
    dsQryProdRequisicao: TDataSource;
    qryProdutosRequisicao: TADOQuery;
    qryAux: TADOQuery;
    qryRequisicaoCompras: TADOQuery;
    dsQryRequisicaoCompras: TDataSource;
    qryItensRequisicaoCompra: TADOQuery;
    qryOrdemCompra: TADOQuery;
    dsQryOrdemCompra: TDataSource;
    dsQryDetalhesOrdemCompra: TDataSource;
    qryDetalhesOrdemCompra: TADOQuery;
    qryEntradaProduto: TADOQuery;
    dsQryEntradaProduto: TDataSource;
    dsQryReqSaida: TDataSource;
    qryRequisicaoSaida: TADOQuery;
    dsQryNfSaldo: TDataSource;
    qryNFSaldo: TADOQuery;
    qryOrdemSaidaEstoque: TADOQuery;
    dsQryOrdemSaidaEstoque: TDataSource;
    dsQryItensOrdemSaida: TDataSource;
    qryItensOrdemSaida: TADOQuery;
    qryBancos: TADOQuery;
    dsQryBancos: TDataSource;
    qryListaRequisicaoCompraEntrada: TADOQuery;
    qryListaRequisicaoSaida: TADOQuery;
    dsqryListaReqCompraEntrada: TDataSource;
    dsQryListaReqSaida: TDataSource;
    qryRelatorioCategoria: TADOQuery;
    qryRelatorioCentroConsumo: TADOQuery;
    qryRelatorioFornecedor: TADOQuery;
    qryRelatorioAlmoxarifado: TADOQuery;
    qryUsuariosSistema: TADOQuery;
    dsQryUsuariosSistema: TDataSource;
    qryExercicio: TADOQuery;
    dsQryExercicio: TDataSource;
    qryAtivacao: TADOQuery;
    dsQryAtivacao: TDataSource;
    qryEmpresa: TADOQuery;
    dsQryEmpresa: TDataSource;
    qryEntidadenome: TStringField;
    qryEntidadelogradouro: TStringField;
    qryEntidadenumero: TStringField;
    qryEntidadecomplemento: TStringField;
    qryEntidadebairro: TStringField;
    qryEntidadecidade: TStringField;
    qryEntidadeuf: TStringField;
    qryEntidadenomeuf: TStringField;
    qryEntidadecep: TStringField;
    qryEntidadetelefone: TStringField;
    qryEntidadefax: TStringField;
    qryEntidadecnpj: TStringField;
    qryEntidadeslogan: TStringField;
    qryEntidadefebraban: TStringField;
    qryEntidadelogo: TStringField;
    qryEntidaderodape1: TStringField;
    qryEntidaderodape2: TStringField;
    qryEntidademestrabalho: TIntegerField;
    qryEntidadeserialentidade: TStringField;
    qryEntidadeserialvalidade: TStringField;
    qryEntidademesExercicio: TIntegerField;
    qryEntidadeanoExercicio: TIntegerField;
    qryEntidaderesp1_nome: TStringField;
    qryEntidaderesp1_cic: TStringField;
    qryEntidaderesp1_cargo: TStringField;
    qryEntidaderesp2_nome: TStringField;
    qryEntidaderesp2_cic: TStringField;
    qryEntidaderesp2_cargo: TStringField;
    qryEntidaderesp3_nome: TStringField;
    qryEntidaderesp3_cic: TStringField;
    qryEntidaderesp3_cargo: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure atualizarProdutos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmComprasEstoque: TdmComprasEstoque;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses
  ufuncao;

{$R *.dfm}

procedure TdmComprasEstoque.DataModuleCreate(Sender: TObject);
begin
  // conectaBanco(conexao);
end;

procedure TdmComprasEstoque.atualizarProdutos;
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
  with qryProdutos do
  begin
    Close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
  end;
end;

end.
