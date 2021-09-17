program prjComprasEstoque;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {frmComprasEstoque},
  ufrmCadAlmoxarifado in 'ufrmCadAlmoxarifado.pas' {frmAlmoxarifado},
  udmComprasEstoque in 'udmComprasEstoque.pas' {dmComprasEstoque: TDataModule},
  uCadEntidade in 'uCadEntidade.pas' {frmCadEntidade},
  ucadCategoria in 'ucadCategoria.pas' {frmCadCategoria},
  ucadCentroConsumo in 'ucadCentroConsumo.pas' {frmCadCentroConsumo},
  uCadProdutos in 'uCadProdutos.pas' {frmCadProdutos},
  ucadFornecedor in 'ucadFornecedor.pas' {frmCadFornecedor},
  uCadPessoas in 'uCadPessoas.pas' {frmCadPessoas},
  uReqCompras in 'uReqCompras.pas' {frmRequisicaoCompra},
  uOrdemCompra in 'uOrdemCompra.pas' {frmOrdemCompra},
  uTipoOrdemCompra in 'uTipoOrdemCompra.pas' {frmTipoOrdemCompra},
  uEntradaProdutos in 'uEntradaProdutos.pas' {frmEntradaProdutos},
  uRequisicaoSaida in 'uRequisicaoSaida.pas' {frmRequisicaoSaida},
  uRelItensNFSaida in 'uRelItensNFSaida.pas' {frmRelItensNFSaida},
  uOrdemSaidaEstoque in 'uOrdemSaidaEstoque.pas' {frmOrdemSaidaEstoque},
  Vcl.Themes,
  Vcl.Styles,
  uRelEntradaProduto in 'uRelEntradaProduto.pas' {frmRelEntradaProduto},
  uRelSaidaProdutos in 'uRelSaidaProdutos.pas' {frmRelSaidaProdutos},
  uRelFisicoFinanceiro in 'uRelFisicoFinanceiro.pas' {frmRelFisicoFinanceiro},
  uListaReqSaida in 'uListaReqSaida.pas' {frmListaReqSaida},
  uRelProdutos in 'uRelProdutos.pas' {frmRelatorioProdutos},
  uRelMovimentoFisicoEstoque in 'uRelMovimentoFisicoEstoque.pas' {frmRelatorioMovimentoFisicoEstoque},
  uCadUnidadeMedida in 'uCadUnidadeMedida.pas' {frmCadUnidadeMedida},
  uAtivacaoSistema in 'uAtivacaoSistema.pas' {frmAtivacaoSistema},
  uAberturaFechamentoAno in 'uAberturaFechamentoAno.pas' {frmAberturaFechamentoAno},
  ufuncao in 'ufuncao.pas',
  uLogin in 'uLogin.pas' {frmLogin},
  uCadastroUsuarioSistema in 'uCadastroUsuarioSistema.pas' {frmCadastroUsuarioSistema},
  uControleAcesso in 'uControleAcesso.pas' {frmLiberacaoAcessoUsuario},
  uBackupSistema in 'uBackupSistema.pas' {frmBackupSistema},
  uManutencaoBancoDados in 'uManutencaoBancoDados.pas' {frmManutencaoBancoDados},
  uSobre in 'uSobre.pas' {frmSobre},
  Funcoes in 'Funcoes.pas',
  UItemRequisicaoCompra in 'UItemRequisicaoCompra.pas',
  ProdutosDAO in 'ProdutosDAO.pas',
  TCorrecaoBanco in 'TCorrecaoBanco.pas',
  TLiberacao in 'Classes\TLiberacao.pas',
  TLiberacaoDAO in 'DAO\TLiberacaoDAO.pas',
  TEmpresa in 'Classes\TEmpresa.pas',
  FuncoesDB in 'DAO\FuncoesDB.pas',
  TEmpresaDAO in 'DAO\TEmpresaDAO.pas',
  uCadastroEmpresa in 'uCadastroEmpresa.pas' {frmCadastroEmpresa},
  TControleAtivacao in 'TControleAtivacao.pas',
  TAbertura in 'Classes\TAbertura.pas',
  TAberturaDAO in 'DAO\TAberturaDAO.pas',
  TBen in 'Classes\TBen.pas',
  TBenDAO in 'DAO\TBenDAO.pas',
  urelFisicoFinanceiroPorCategoria in 'urelFisicoFinanceiroPorCategoria.pas' {frmRelFisFinPorCategoria},
  uRelEntradaPorCentroConsumo in 'uRelEntradaPorCentroConsumo.pas' {Form1},
  uRelRequisicaoEntrada in 'uRelRequisicaoEntrada.pas' {frmRelRequisicaoEntrada},
  uRelDeclaracaoConsequencias in 'FrmReports\uRelDeclaracaoConsequencias.pas' {frmDeclaracao},
  uRelSolicitacaoOrdemCompra in 'FrmReports\uRelSolicitacaoOrdemCompra.pas' {FrmRelOrdemCompra},
  UUtils in 'UUtils.pas',
  TOrdemCompraDAO in 'DAO\TOrdemCompraDAO.pas',
  TRequisicaoCompraDAO in 'DAO\TRequisicaoCompraDAO.pas',
  ExLookupEdit in '..\..\ExtendedComponents\ExLookupEdit.pas',
  UFrmSearchProdutos in 'Forms\UFrmSearchProdutos.pas' {FrmSearchProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Compras e Estoque';
  Application.CreateForm(TdmComprasEstoque, dmComprasEstoque);
  Application.CreateForm(TfrmComprasEstoque, frmComprasEstoque);
  Application.CreateForm(TfrmCadastroEmpresa, frmCadastroEmpresa);
  Application.CreateForm(TfrmRelFisFinPorCategoria, frmRelFisFinPorCategoria);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmRelRequisicaoEntrada, frmRelRequisicaoEntrada);
  Application.CreateForm(TfrmDeclaracao, frmDeclaracao);
  Application.CreateForm(TFrmRelOrdemCompra, FrmRelOrdemCompra);
  Application.CreateForm(TFrmSearchProdutos, FrmSearchProdutos);
  Application.Run;

end.
