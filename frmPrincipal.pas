unit frmPrincipal;

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
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.ExtCtrls,
  Data.Win.ADODB,
  Data.DB,
  frxClass,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,
  IdBaseComponent,
  IdSASL,
  IdSASLUserPass,
  IdSASL_CRAMBase,
  IdSASL_CRAM_SHA1,
  IdSASL_CRAM_MD5,
  Vcl.DBCtrls,
  DateUtils,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  uCadastroEmpresa,
  FuncoesDB,
  TControleAtivacao,
  TEmpresa,
  TEmpresaDAO,
  TLiberacao,
  TLiberacaoDAO,
  Vcl.Buttons, System.ImageList, Vcl.Mask, JvExMask, JvToolEdit, JvDBLookup,
  JvDBLookupComboEdit, uRelSolicitacaoOrdemCompra;

type
  TfrmComprasEstoque = class(TForm)
    ImageList1ToolBar: TImageList;
    MainMenu1: TMainMenu;
    menuCadastro: TMenuItem;
    mmCadAlmoxarifado: TMenuItem;
    mmCadEntidade: TMenuItem;
    mmCadCategoria: TMenuItem;
    mmCadCentroConsumo: TMenuItem;
    mmCadFornecedores: TMenuItem;
    mmCadPessoas: TMenuItem;
    mmCadProdutos: TMenuItem;
    N1: TMenuItem;
    mmSair: TMenuItem;
    menuLancamento: TMenuItem;
    mmLancEntradaProduto: TMenuItem;
    mmLancOrdemCompra: TMenuItem;
    mmLancSaidaEstoque: TMenuItem;
    menuRequisicao: TMenuItem;
    mmReqRequisicaoCompra: TMenuItem;
    mmReqRequisicaoSaida: TMenuItem;
    menuRelatorio: TMenuItem;
    menuSeguranca: TMenuItem;
    menuAjuda: TMenuItem;
    mmSobre: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    btnToolSair: TToolButton;
    mmRelEntradaProduto: TMenuItem;
    mmRelSadaEstoque: TMenuItem;
    mmRelMovFisFinan: TMenuItem;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    RecalcularPreoMdiuo1: TMenuItem;
    N2: TMenuItem;
    mmRelCadastrais: TMenuItem;
    submnRelCadastAlmoxarifado: TMenuItem;
    submnRelCadastFornecedores1: TMenuItem;
    submnRelCadastProdutos: TMenuItem;
    submnRelCadastCategoria: TMenuItem;
    submnRelCadastCentrodeConsumo1: TMenuItem;
    N3: TMenuItem;
    mmRelEstoqFisicoFinan: TMenuItem;
    Image1: TImage;
    ToolButton9: TToolButton;
    ToolButton15: TToolButton;
    mmUnidMed: TMenuItem;
    MenuConfiguracoes: TMenuItem;
    mmConfigAtivacaoSistema: TMenuItem;
    mmConfigAberturaFechamentoAno: TMenuItem;
    mmCadastrodeUsuario: TMenuItem;
    N4: TMenuItem;
    mmBackup: TMenuItem;
    N5: TMenuItem;
    ManutenoBancodeDados1: TMenuItem;
    Label1: TLabel;
    qryFechamentoAno: TADOQuery;
    BackupeRestaurao1: TMenuItem;
    UnidadedeMedida1: TMenuItem;
    CorrigirAcentuao1: TMenuItem;
    dtExercicio: TDateTimePicker;
    btnRecalcular: TBitBtn;
    ImageListMainMenu: TImageList;
    MovFsFinPorCategoria1: TMenuItem;
    EntradasporCentrodeCusto1: TMenuItem;
    RequisiodeSada1: TMenuItem;
    N6: TMenuItem;
    Declaraode1: TMenuItem;
    OrdemdeCompra1: TMenuItem;
    CorreodeEstoqueFsico1: TMenuItem;
    procedure mmCadAlmoxarifadoClick(Sender: TObject);
    procedure mmCadEntidadeClick(Sender: TObject);
    procedure mmCadCategoriaClick(Sender: TObject);
    procedure mmCadCentroConsumoClick(Sender: TObject);
    procedure mmCadProdutosClick(Sender: TObject);
    procedure mmCadFornecedoresClick(Sender: TObject);
    procedure mmCadPessoasClick(Sender: TObject);
    procedure mmReqRequisicaoCompraClick(Sender: TObject);
    procedure mmLancOrdemCompraClick(Sender: TObject);
    procedure mmLancEntradaProdutoClick(Sender: TObject);
    procedure mmReqRequisicaoSaidaClick(Sender: TObject);
    procedure mmLancSaidaEstoqueClick(Sender: TObject);
    procedure btnToolSairClick(Sender: TObject);
    procedure mmSairClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure mmRelEntradaProdutoClick(Sender: TObject);
    procedure mmRelSadaEstoqueClick(Sender: TObject);
    procedure mmRelMovFisFinanClick(Sender: TObject);
    procedure RecalcularPreoMdiuo1Click(Sender: TObject);
    procedure submnRelCadastProdutosClick(Sender: TObject);
    procedure submnRelCadastCategoriaClick(Sender: TObject);
    procedure submnRelCadastCentrodeConsumo1Click(Sender: TObject);
    procedure submnRelCadastFornecedores1Click(Sender: TObject);
    procedure submnRelCadastAlmoxarifadoClick(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure mmRelEstoqFisicoFinanClick(Sender: TObject);
    procedure mmUnidMedClick(Sender: TObject);
    procedure mmConfigAtivacaoSistemaClick(Sender: TObject);
    procedure mmConfigAberturaFechamentoAnoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmCadastrodeUsuarioClick(Sender: TObject);
    procedure mmBackupClick(Sender: TObject);
    procedure mmSobreClick(Sender: TObject);
    procedure ManutenoancodeDados1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UnidadedeMedida1Click(Sender: TObject);
    procedure CorrigirAcentuao1Click(Sender: TObject);
    procedure setarDataExercicio();
    procedure atualizarBarraStatus(empresa: UEmpresa);
    procedure dtExercicioChange(Sender: TObject);
    procedure MovFsFinPorCategoria1Click(Sender: TObject);
    procedure RequisiodeSada1Click(Sender: TObject);
    procedure Declaraode1Click(Sender: TObject);
    procedure CorreodeEstoqueFsico1Click(Sender: TObject);
    procedure OrdemdeCompra1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComprasEstoque: TfrmComprasEstoque;
  anoAberto: String;
  dataInicio: TDateTime;
  dataFim: TDateTime;

implementation

uses
  ufrmCadAlmoxarifado,
  uCadEntidade,
  ucadCategoria,
  ucadCentroConsumo,
  uCadProdutos,
  ucadFornecedor,
  uCadPessoas,
  uReqCompras,
  uOrdemCompra,
  uEntradaProdutos,
  uRequisicaoSaida,
  uOrdemSaidaEstoque,
  uRelEntradaProduto,
  uRelSaidaProdutos,
  uRelFisicoFinanceiro,
  udmComprasEstoque,
  uRelProdutos,
  uRelMovimentoFisicoEstoque,
  uCadUnidadeMedida,
  uAtivacaoSistema,
  uAberturaFechamentoAno,
  uLogin,
  uCadastroUsuarioSistema,
  ufuncao,
  uBackupSistema,
  uSobre,
  uManutencaoBancoDados,
  urelFisicoFinanceiroPorCategoria,
  uRelRequisicaoEntrada,
  uRelDeclaracaoConsequencias,
  TCorrecaoBanco;
{$R *.dfm}

procedure TfrmComprasEstoque.mmCadastrodeUsuarioClick(Sender: TObject);
begin
  try
    frmCadastroUsuarioSistema := TfrmCadastroUsuarioSistema.Create(self);
    frmCadastroUsuarioSistema.showmodal;
  finally
    frmCadastroUsuarioSistema.free;
  end;
end;

procedure TfrmComprasEstoque.submnRelCadastCategoriaClick(Sender: TObject);
begin
  with dmComprasEstoque, qryRelatorioCategoria do
  begin
    Close;
    Open;
    if qryRelatorioCategoria.RecordCount <> 0 then
    begin
      frxRelatorioCAtegoria.LoadFromFile('Relatorios\RelatorioCategorias.fr3');
      if FileExists(qryRelatorioCategoria.FieldByName('logo').AsString) = true
      then
        TfrxPictureView(frxRelatorioCAtegoria.FindComponent('Logomarca'))
          .Picture.LoadFromFile(qryRelatorioCategoria.FieldByName('logo')
          .AsString);

      frxRelatorioCAtegoria.ShowReport();
    end
    else
      MessageBox(Application.Handle, 'Não há itens a serem listados.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK)

  end;
end;

procedure TfrmComprasEstoque.submnRelCadastCentrodeConsumo1Click
  (Sender: TObject);
begin
  with dmComprasEstoque, qryRelatorioCentroConsumo do
  begin
    Close;
    Open;
    if qryRelatorioCentroConsumo.RecordCount <> 0 then
    begin
      frxRelatorioCentroConsumo.LoadFromFile
        ('Relatorios\RelatorioCentroConsumo.fr3');
      if FileExists(qryRelatorioCentroConsumo.FieldByName('logo').AsString) = true
      then
        TfrxPictureView(frxRelatorioCentroConsumo.FindComponent('Logomarca'))
          .Picture.LoadFromFile(qryRelatorioCentroConsumo.FieldByName('logo')
          .AsString);

      frxRelatorioCentroConsumo.ShowReport();
    end
    else
      MessageBox(Application.Handle, 'Não há itens a serem listados.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK)

  end;
end;

procedure TfrmComprasEstoque.mmRelEntradaProdutoClick(Sender: TObject);
begin
  try
    frmRelEntradaProduto := TfrmRelEntradaProduto.Create(self);
    frmRelEntradaProduto.showmodal;
  finally
    frmRelEntradaProduto.free;
  end;
end;

procedure TfrmComprasEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  aux: String;
begin
  frmLogin.Visible := true;
  frmComprasEstoque.Visible := False;

  aux := 'cmd.exe /c "mysqldump --opt --flush-logs --triggers --port=3306';
  aux := aux + ' --user=root --password=';
  aux := aux + ' --result-file=backup\backup_' + FormatDateTime('ddmmyyy_hhmm',
    now) + '.sql --databases ' + dmComprasEstoque.Conexao.DefaultDatabase;

  // ShowMessage(aux);
  if not createProcessSimple(aux) then
    MessageBox(Application.Handle,
      'Ocorreu um erro durente a realização do backup!', 'Compras & Estoque',
      MB_ICONERROR + MB_OK)
  else
    MessageBox(Application.Handle, 'Backup Realizado com sucesso!',
      'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmComprasEstoque.FormCreate(Sender: TObject);
var
  s: String;
begin

  try
    dmComprasEstoque.Conexao.Open;
  except
    on E: Exception do
    begin
      s := String(E.Message);
      MessageBox(Handle, 'Não conseguimos conectar à sua Base de Dados.' + #13 +
        'Por favor, verifique se o Banco de Dados está ativo, e tente novamente: ',
        'Compras e Estoque - Erro de Conexão', 0);
      ShowMessage(s);
      Application.Terminate;
      abort;
    end;
  end;

  try
    frmLogin := TfrmLogin.Create(self);
    frmLogin.showmodal;
  finally
    frmLogin.free;
  end;
end;

procedure TfrmComprasEstoque.FormShow(Sender: TObject);
var
  liberacao: ULiberacao;
  liberacaoDAO: ULiberacaoDAO;
  empresa: UEmpresa;
  empresaDAO: UEmpresaDAO;
begin
  RotinadeAtualizacoes;
  liberacaoDAO := ULiberacaoDAO.Create;
  liberacao := liberacaoDAO.getLiberacao;
  empresaDAO := UEmpresaDAO.Create;
  empresa := empresaDAO.getEmpresa;
  // 0 - Verificar Primeiro acesso ao Sistema
  if (empresa = nil) then
  begin
    // chamar form de Cadastro de Dados Gerais
    try
      frmCadastroEmpresa := TfrmCadastroEmpresa.Create(self);
      frmCadastroEmpresa.showmodal;
    finally
      frmCadastroEmpresa.free;
      empresa := empresaDAO.getEmpresa;
    end;
  end;
  // 1 - Verificar SE já existe liberação de Sistema
  if (liberacao <> nil) // se não existir liberação
  then
  begin
    liberacao.cnpj := empresa.cnpj;
    // 2 - Verificar SE liberacao é válida
    if (liberacaoDAO.validarLiberacao(liberacao)) then
    begin
      // 3 - Verificar SE Data de Exercicio está dentro da Data de Liberação
      if (TControleAtivacao.verificarDataExercicio()) then
      begin

        // datepicker de Exercicio recebe a data de Exercicio
        setarDataExercicio();

        // 4- Verificar SE há algum item com data Fora do Prazo de Liberação
        if (TControleAtivacao.verificarDatasItens() = 0) then
        begin
          // 5 - Verificar Prazo para Término da Liberação
          TControleAtivacao.verificarPrazoFimLiberacao;
          // Habilitando Menus de Acordo com as Permissões do Usuário
          habilitaMenus(MainMenu1, dmComprasEstoque.qryAux, UserName);
          atualizarBarraStatus(empresa);
        end // fim_if 4.
        else
        begin
          MessageBox(Handle,
            'Foram encontrados itens fora do seu Prazo de Liberação. Por favor Contate o Suporte para Correção de Dados',
            'Compras E Estoque', 0);
          Application.Terminate;
        end;
      end // fim_if 3.
      else // else 3. SE não tem exercicio, atualizar para data Inicial de Liberação
      begin
        empresaDAO.atualizarExercicio(empresa);
      end;
    end // fim_if 2.
    else // else 2.
    begin
      ShowMessage
        ('Erro 002: Chave de Ativação Inválida. Por favor contate o suporte.');
      Application.Terminate;
    end; // fim_else 2.

  end // fim_if 1.
  else // else 1.
  begin
    // SE usuário recusar ativação do Sistema: Exit \o/
    if (TControleAtivacao.pedirLiberacao() = False) then
    begin
      Application.Terminate;
    end;
  end; // fim_else 1.

end;

procedure TfrmComprasEstoque.setarDataExercicio();
var
  lib: ULiberacao;
  libDAO: ULiberacaoDAO;
  empDAO: UEmpresaDAO;
begin
  { Validar Liberação }

  libDAO := ULiberacaoDAO.Create;
  lib := libDAO.getLiberacao;
  empDAO := UEmpresaDAO.Create;
  dtExercicio.Date := empDAO.getDataExercicio;
  dtExercicio.MaxDate := libDAO.getDataFinalLiberacao;
  dtExercicio.MinDate := libDAO.getDataInicialLiberacao;
end;

procedure TfrmComprasEstoque.atualizarBarraStatus(empresa: UEmpresa);
var
  buffer: Array [0 .. 255] of char;
  size: DWord;
begin
  StatusBar1.Panels[0].Text := empresa.nome;

  StatusBar1.Panels[1].Text := 'Login: ' + UserName;

  // micro
  size := 256;
  if GetComputerName(buffer, size) then
    StatusBar1.Panels[2].Text := 'Micro: ' + buffer;

  // Data por extenso;
  StatusBar1.Panels[3].Text := FormatDateTime('DDDDDD', now);
end;

procedure TfrmComprasEstoque.ManutenoancodeDados1Click(Sender: TObject);
begin
  if UpperCase(UserName) = 'ADMINISTRADOR' then
  begin
    try
      frmManutencaoBancoDados := TfrmManutencaoBancoDados.Create(self);
      frmManutencaoBancoDados.showmodal;
    finally
      frmManutencaoBancoDados.free;
    end;
  end
  else
    MessageBox(Application.Handle,
      PChar('Menu de acesso exclusivo do Administrador do sistema.'),
      'Compras & Estoque', MB_ICONERROR + MB_OK);

end;

procedure TfrmComprasEstoque.submnRelCadastFornecedores1Click(Sender: TObject);
begin
  with dmComprasEstoque, qryRelatorioFornecedor do
  begin
    Close;
    Open;
    if qryRelatorioFornecedor.RecordCount <> 0 then
    begin
      frxRelatorioFornecedor.LoadFromFile('Relatorios\RelatorioFornecedor.fr3');
      if FileExists(qryRelatorioFornecedor.FieldByName('logo').AsString) = true
      then
        TfrxPictureView(frxRelatorioFornecedor.FindComponent('Logomarca'))
          .Picture.LoadFromFile(qryRelatorioFornecedor.FieldByName('logo')
          .AsString);

      frxRelatorioFornecedor.ShowReport();
    end
    else
      MessageBox(Application.Handle, 'Não há itens a serem listados.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK)
  end;
end;

procedure TfrmComprasEstoque.mmRelEstoqFisicoFinanClick(Sender: TObject);
begin
  try
    frmRelatorioMovimentoFisicoEstoque :=
      TfrmRelatorioMovimentoFisicoEstoque.Create(Application);
    frmRelatorioMovimentoFisicoEstoque.showmodal;
  finally
    frmRelatorioMovimentoFisicoEstoque.free;
  end;
end;

procedure TfrmComprasEstoque.mmRelMovFisFinanClick(Sender: TObject);
begin
  try
    frmRelFisicoFinanceiro := TfrmRelFisicoFinanceiro.Create(self);
    frmRelFisicoFinanceiro.showmodal;
  finally
    frmRelFisicoFinanceiro.free;
  end;
end;

procedure TfrmComprasEstoque.mmBackupClick(Sender: TObject);

begin
  try
    frmBackupSistema := TfrmBackupSistema.Create(self);
    frmBackupSistema.showmodal;
  finally
    frmBackupSistema.free;
  end;
  { REALIZANDO BACKUP
    aux := 'cmd.exe /c "mysqldump --opt --flush-logs --triggers --port=3306';
    aux := aux + ' --user=root --password= ';
    aux := aux + ' --result-file=backup\backup.sql --databases db_comprasestoque "';

    //   ShowMessage(aux);
    if not createProcessSimple(aux) then
    ShowMessage('BACKUP NÃO FOI PROCESSADO!')
    else
    ShowMessage('Backup Realizado!'); }

  { REALIZANDO O RESTORE }
  { aux := 'cmd.exe /c "mysql -u root '; //usuário root sem senha
    aux := aux + ' db_comprasestoque < backup\backup.sql"'; // edtlBanco.text é o nome da base de dados
    // ShowMessage(aux);
    if not createProcessSimple(aux) then
    ShowMessage('RESTAURAÇÃO NÃO FOI PROCESSADA!')
    else
    ShowMessage('Restauração Realizada!'); }

end;

procedure TfrmComprasEstoque.mmCadAlmoxarifadoClick(Sender: TObject);
begin
  try
    frmAlmoxarifado := TfrmAlmoxarifado.Create(self);
    frmAlmoxarifado.showmodal;
  finally
    frmAlmoxarifado.free;
  end;
end;

procedure TfrmComprasEstoque.mmCadCategoriaClick(Sender: TObject);
begin
  try
    frmCadCategoria := TfrmCadCategoria.Create(self);
    frmCadCategoria.showmodal;
  finally
    frmCadCategoria.free;
  end;
end;

procedure TfrmComprasEstoque.mmCadCentroConsumoClick(Sender: TObject);
begin
  try
    frmCadCentroConsumo := TfrmCadCentroConsumo.Create(self);
    frmCadCentroConsumo.showmodal;
  finally
    frmCadCentroConsumo.free;
  end;
end;

procedure TfrmComprasEstoque.mmCadEntidadeClick(Sender: TObject);
begin
  try
    frmCadEntidade := TfrmCadEntidade.Create(self);
    frmCadEntidade.showmodal;
  finally
    frmCadEntidade.free;

  end;
end;

procedure TfrmComprasEstoque.mmCadFornecedoresClick(Sender: TObject);
begin
  try
    frmCadFornecedor := TfrmCadFornecedor.Create(self);
    frmCadFornecedor.showmodal;
  finally
    frmCadFornecedor.free;
  end;
end;

procedure TfrmComprasEstoque.mmCadPessoasClick(Sender: TObject);
begin
  try
    frmCadPessoas := TfrmCadPessoas.Create(self);
    frmCadPessoas.showmodal;

  finally
    frmCadPessoas.free;
  end;
end;

procedure TfrmComprasEstoque.mmCadProdutosClick(Sender: TObject);
begin
  try
    frmCadProdutos := TfrmCadProdutos.Create(self);
    frmCadProdutos.showmodal;
  finally
    frmCadProdutos.free;
  end;
end;

procedure TfrmComprasEstoque.mmLancEntradaProdutoClick(Sender: TObject);
var
  lib: ULiberacao;
  libDAO: ULiberacaoDAO;
begin
  { Validar Liberação }

  libDAO := ULiberacaoDAO.Create;
  lib := libDAO.getLiberacao;
  frmEntradaProdutos := TfrmEntradaProdutos.Create(self);

  frmEntradaProdutos.dtpRequisicao.Date := libDAO.getDataInicialLiberacao;
  frmEntradaProdutos.dtpRequisicao.MaxDate := libDAO.getDataFinalLiberacao;
  frmEntradaProdutos.dtpRequisicao.MinDate := libDAO.getDataInicialLiberacao;
  frmEntradaProdutos.showmodal;
end;

procedure TfrmComprasEstoque.mmLancOrdemCompraClick(Sender: TObject);
begin
  try
    frmOrdemCompra := TfrmOrdemCompra.Create(self);
    frmOrdemCompra.showmodal;
  finally
    frmOrdemCompra.free;

  end;
end;

procedure TfrmComprasEstoque.mmLancSaidaEstoqueClick(Sender: TObject);
begin
  try
    frmOrdemSaidaEstoque := TfrmOrdemSaidaEstoque.Create(self);
    frmOrdemSaidaEstoque.showmodal;

  finally
    frmOrdemSaidaEstoque.free;
  end;
end;

procedure TfrmComprasEstoque.mmReqRequisicaoCompraClick(Sender: TObject);
var
  lib: ULiberacao;
  libDAO: ULiberacaoDAO;
begin
  try
    libDAO := ULiberacaoDAO.Create;
    lib := libDAO.getLiberacao;
    frmRequisicaoCompra := TfrmRequisicaoCompra.Create(self);

    frmRequisicaoCompra.dtpRequisicao.Date := libDAO.getDataInicialLiberacao;
    frmRequisicaoCompra.dtpRequisicao.MaxDate := libDAO.getDataFinalLiberacao;
    frmRequisicaoCompra.dtpRequisicao.MinDate := libDAO.getDataInicialLiberacao;
    frmRequisicaoCompra.showmodal;
  finally
    frmRequisicaoCompra.free;
  end;
end;

procedure TfrmComprasEstoque.mmReqRequisicaoSaidaClick(Sender: TObject);
begin
  try
    frmRequisicaoSaida := TfrmRequisicaoSaida.Create(self);
    frmRequisicaoSaida.showmodal;
  finally
    frmRequisicaoSaida.free;

  end;
end;

procedure TfrmComprasEstoque.mmSairClick(Sender: TObject);
begin
  btnToolSairClick(self);
end;

procedure TfrmComprasEstoque.mmSobreClick(Sender: TObject);
begin
  try
    frmSobre := TFrmSobre.Create(self);
    frmSobre.showmodal;
  finally
    frmSobre.free;
  end;
end;

procedure TfrmComprasEstoque.submnRelCadastProdutosClick(Sender: TObject);
begin
  try
    frmRelatorioProdutos := TfrmRelatorioProdutos.Create(self);
    frmRelatorioProdutos.showmodal;
  finally
    frmRelatorioProdutos.free;
  end;
end;

procedure TfrmComprasEstoque.RecalcularPreoMdiuo1Click(Sender: TObject);
var
  qry: String;
  qryConsulta, qryConsultaTempo: TADOQuery;
  Comandos: TADOCommand;
begin
  qryConsulta := TADOQuery.Create(self);
  qryConsulta.Connection := dmComprasEstoque.Conexao;
  frmComprasEstoque.Cursor := crSQLWait;
  Application.ProcessMessages;
  qry := 'Select month(E.dataentrada) as Mes, e.CodAlmoxarifado, idproduto, year(E.dataentrada) as Ano, ';
  qry := qry +
    ' sum(quantidade) as Qtde, sum(valortotal)/sum(quantidade) as Total ';
  qry := qry + ' from ItensEntradaproduto as IE ';
  qry := qry +
    '  join Entradaproduto as e on e.entradaID = IE.identradaproduto ';
  qry := qry + ' group by month(dataentrada) ,  e.CodAlmoxarifado, idproduto ';
  qry := qry +
    ' order by idproduto, month(e.dataentrada), e.CodAlmoxarifado, year(E.dataentrada)';
  with qryConsulta do
  Begin
    Close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
    Comandos := TADOCommand.Create(self);
    Comandos.Connection := dmComprasEstoque.Conexao;
    Comandos.CommandText := 'DELETE FROM PRECOMEDIO';
    Comandos.Execute;
    while not Eof do
    begin
      qry := 'INSERT INTO precoMedio(idproduto, mes,  idAlmoxarifado, quantidade, precomedio ) ';
      qry := qry +
        ' VALUES(:idproduto, :mes, :idAlmox, :quantidade, :valormedio)';
      Comandos.CommandText := qry;
      Comandos.Parameters.Clear;
      Comandos.Parameters.AddParameter.Name := 'idproduto';
      Comandos.Parameters.AddParameter.Name := 'mes';
      // Comandos.Parameters.AddParameter.Name := 'ano';
      Comandos.Parameters.AddParameter.Name := 'idAlmox';
      Comandos.Parameters.AddParameter.Name := 'quantidade';
      Comandos.Parameters.AddParameter.Name := 'valormedio';

      Comandos.Parameters.ParamByName('idproduto').Value :=
        qryConsulta.FieldByName('idproduto').AsInteger;
      Comandos.Parameters.ParamByName('mes').Value :=
        qryConsulta.FieldByName('Mes').AsInteger;
      // comandos.Parameters.ParamByName('ano').Value := qryConsulta.FieldByName('Ano').AsInteger;
      Comandos.Parameters.ParamByName('idAlmox').Value :=
        qryConsulta.FieldByName('CodAlmoxarifado').AsInteger;
      Comandos.Parameters.ParamByName('quantidade').Value :=
        qryConsulta.FieldByName('Qtde').AsFloat;
      Comandos.Parameters.ParamByName('valormedio').Value :=
        qryConsulta.FieldByName('Total').AsFloat;
      Comandos.Execute;

      // if  UpperCase(ufuncao.userName) = 'ADMINISTRADOR' then Begin

      qry := 'UPDATE ESTOQUEPRODUTO SET ENTRADA = ' +
        StringReplace(qryConsulta.FieldByName('Qtde').AsString, ',', '.',
        [rfReplaceAll]);
      qry := qry + ' WHERE MES = ''' + qryConsulta.FieldByName('Mes')
        .AsString + '''';
      qry := qry + '  AND idproduto = ''' + qryConsulta.FieldByName('idproduto')
        .AsString + '''';

      Comandos.CommandText := qry;
      Comandos.Parameters.Clear;
      Comandos.Execute;

      qry := 'UPDATE ESTOQUEPRODUTO SET SALDO = ENTRADA - SAIDA ';
      qry := qry + ' WHERE MES = ''' + qryConsulta.FieldByName('Mes')
        .AsString + '''';
      qry := qry + '  AND idproduto = ''' + qryConsulta.FieldByName('idproduto')
        .AsString + '''';

      Comandos.CommandText := qry;
      Comandos.Parameters.Clear;
      Comandos.Execute;
      // End;
      next;
    end;

    // ATUALIZA O SALDO DE ACORDO COM AS SAIDAS
    // if  UpperCase(ufuncao.userName) = 'ADMINISTRADOR' then Begin
    qry := 'Select month(e.datasaida) as Mes, e.idalmoxarifado, IE.idproduto, year(e.datasaida) as Ano, ';
    qry := qry + ' sum(IE.quantidade) as Qtde ';
    qry := qry + ' from itensordemsaida as IE ';
    qry := qry +
      ' join ordemsaidaestoque as e on e.ordemsaidaId = IE.idordemsaida ';
    qry := qry + ' group by month(e.datasaida) ,  e.idalmoxarifado, idproduto ';
    qry := qry +
      ' order by idproduto, month(e.datasaida), e.idalmoxarifado, year(e.datasaida)';

    qryConsultaTempo := TADOQuery.Create(self);
    qryConsultaTempo.Connection := dmComprasEstoque.Conexao;

    qryConsultaTempo.Close;
    qryConsultaTempo.SQL.Clear;
    qryConsultaTempo.SQL.Add(qry);
    qryConsultaTempo.Open;

    while not qryConsultaTempo.Eof do
    begin
      qry := 'UPDATE ESTOQUEPRODUTO SET SAIDA = ' +
        StringReplace(qryConsultaTempo.FieldByName('Qtde').AsString, ',', '.',
        [rfReplaceAll]);
      qry := qry + ' WHERE MES = ''' + qryConsultaTempo.FieldByName('Mes')
        .AsString + '''';
      qry := qry + '  AND idproduto = ''' + qryConsultaTempo.FieldByName
        ('idproduto').AsString + '''';

      Comandos.CommandText := qry;
      Comandos.Parameters.Clear;
      Comandos.Execute;

      qry := 'UPDATE ESTOQUEPRODUTO SET SALDO = ENTRADA - SAIDA ';
      qry := qry + ' WHERE MES = ''' + qryConsultaTempo.FieldByName('Mes')
        .AsString + '''';
      qry := qry + '  AND idproduto = ''' + qryConsultaTempo.FieldByName
        ('idproduto').AsString + '''';

      Comandos.CommandText := qry;
      Comandos.Parameters.Clear;
      Comandos.Execute;
      qryConsultaTempo.next;
    end;

    // End;

    frmComprasEstoque.Cursor := crDefault;
    MessageBox(Application.Handle,
      'Recalculo de preço médio realizado com sucesso.', 'Compras & Estoque',
      MB_ICONINFORMATION + MB_OK);
  End;

end;

procedure TfrmComprasEstoque.RequisiodeSada1Click(Sender: TObject);
begin
  try
    frmRelRequisicaoEntrada := TfrmRelRequisicaoEntrada.Create(self);
    frmRelRequisicaoEntrada.showmodal;
  finally
    frmRelRequisicaoEntrada.free;
  end;
end;

procedure TfrmComprasEstoque.mmRelSadaEstoqueClick(Sender: TObject);
begin
  try
    frmRelSaidaProdutos := TfrmRelSaidaProdutos.Create(self);
    frmRelSaidaProdutos.showmodal;
  finally
    frmRelSaidaProdutos.free;
  end;
end;

procedure TfrmComprasEstoque.ToolButton2Click(Sender: TObject);
begin
  if mmCadFornecedores.Enabled then
    mmCadFornecedoresClick(self);
end;

procedure TfrmComprasEstoque.ToolButton4Click(Sender: TObject);
begin
  if mmCadProdutos.Enabled then
    mmCadProdutosClick(self);
end;

procedure TfrmComprasEstoque.ToolButton5Click(Sender: TObject);
begin
  if mmLancOrdemCompra.Enabled then
    mmLancOrdemCompraClick(self);
end;

procedure TfrmComprasEstoque.ToolButton6Click(Sender: TObject);
begin
  if mmReqRequisicaoSaida.Enabled then
    mmReqRequisicaoSaidaClick(self);
end;

procedure TfrmComprasEstoque.ToolButton7Click(Sender: TObject);
begin
  if mmLancEntradaProduto.Enabled then
    mmLancEntradaProdutoClick(self);
end;

procedure TfrmComprasEstoque.ToolButton8Click(Sender: TObject);
begin
  if mmLancSaidaEstoque.Enabled then
    mmLancSaidaEstoqueClick(self);
end;

procedure TfrmComprasEstoque.ToolButton9Click(Sender: TObject);
begin
  if mmReqRequisicaoCompra.Enabled then
    mmReqRequisicaoCompraClick(self);
end;

procedure TfrmComprasEstoque.UnidadedeMedida1Click(Sender: TObject);
begin
  //
  produtoCorrigirUnidadeMedida();
end;

procedure TfrmComprasEstoque.mmUnidMedClick(Sender: TObject);
begin
  try
    frmCadUnidadeMedida := TfrmCadUnidadeMedida.Create(self);
    frmCadUnidadeMedida.showmodal;
  finally
    frmCadUnidadeMedida.free;
  end;
end;

procedure TfrmComprasEstoque.MovFsFinPorCategoria1Click(Sender: TObject);
begin
  Try
    frmRelFisFinPorCategoria := TfrmRelFisFinPorCategoria.Create(self);
    frmRelFisFinPorCategoria.showmodal;
  Finally
    frmRelFisFinPorCategoria.free;
  End;
end;

procedure TfrmComprasEstoque.OrdemdeCompra1Click(Sender: TObject);
var
  frm: TFrmRelOrdemCompra;
begin
  //
  frm := TFrmRelOrdemCompra.Create(self);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmComprasEstoque.mmConfigAberturaFechamentoAnoClick
  (Sender: TObject);
begin
  Try
    frmAberturaFechamentoAno := TfrmAberturaFechamentoAno.Create(self);
    frmAberturaFechamentoAno.showmodal;
  Finally
    frmAberturaFechamentoAno.free;
  End;
end;

procedure TfrmComprasEstoque.submnRelCadastAlmoxarifadoClick(Sender: TObject);
begin
  with dmComprasEstoque, qryRelatorioAlmoxarifado do
  begin
    Close;
    Open;
    if qryRelatorioAlmoxarifado.RecordCount <> 0 then
    begin
      frxRelatorioAlmoxarifado.LoadFromFile
        ('Relatorios\RelatorioAlmoxarifado.fr3');
      if FileExists(qryRelatorioAlmoxarifado.FieldByName('logo').AsString) = true
      then
        TfrxPictureView(frxRelatorioAlmoxarifado.FindComponent('Logomarca'))
          .Picture.LoadFromFile(qryRelatorioAlmoxarifado.FieldByName('logo')
          .AsString);

      frxRelatorioAlmoxarifado.ShowReport();
    end
    else
      MessageBox(Application.Handle, 'Não há itens a serem listados.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK)
  end;
end;

procedure TfrmComprasEstoque.mmConfigAtivacaoSistemaClick(Sender: TObject);
begin
  try
    frmAtivacaoSistema := TfrmAtivacaoSistema.Create(self);
    frmAtivacaoSistema.showmodal;
  finally
    frmAtivacaoSistema.free;
    dmComprasEstoque.qryExercicio.Close;
    dmComprasEstoque.qryExercicio.Open;
  end;
end;

procedure TfrmComprasEstoque.btnToolSairClick(Sender: TObject);
var
  aux: String;
begin
  frmLogin.Visible := true;
  frmComprasEstoque.Visible := False;

  aux := 'cmd.exe /c "mysqldump --opt --flush-logs --triggers --port=3306';
  aux := aux + ' --user=root --password=';
  aux := aux + ' --result-file=backup\backup_' + FormatDateTime('ddmmyyy_hhmm',
    now) + '.sql --databases ' + dmComprasEstoque.Conexao.DefaultDatabase;

  // ShowMessage(aux);
  if not createProcessSimple(aux) then
    MessageBox(Application.Handle,
      'Ocorreu um erro durente a realização do backup!', 'Compras & Estoque',
      MB_ICONERROR + MB_OK)
  else
    MessageBox(Application.Handle, 'Backup Realizado com sucesso!',
      'Compras & Estoque', MB_ICONINFORMATION + MB_OK);

end;

procedure TfrmComprasEstoque.CorreodeEstoqueFsico1Click(Sender: TObject);
var
  scr: String;
begin
  //
  scr := ' INSERT IGNORE into estoqueproduto(idproduto, mes,ano,entrada, saida, saldo)  '
    + ' select  idproduto, DATE_FORMAT(ios.datasaida, ''%m''), ' +
    ' DATE_FORMAT(ios.datasaida, ''%Y''), ' +
    '  0, sum(ios.quantidade), (0-sum( ios.quantidade))   ' +
    ' from itensordemsaida ios ' + ' where ios.idproduto not in ( ' +
    ' select ep.idproduto ' + ' from estoqueproduto ep	 ' +
    ' where ep.mes = DATE_FORMAT(ios.datasaida, ''%m'') and  ' +
    ' ep.ano = DATE_FORMAT(ios.datasaida, ''%Y'')  ' + ' ) ' +
    ' group by ios.idproduto, datasaida ';

  rodarScript(scr);
  ShowMessage('Estoque Físico Corrigido');
end;

procedure TfrmComprasEstoque.CorrigirAcentuao1Click(Sender: TObject);
begin
  //
  corrigirAcentuacao;
  ShowMessage('Acentuações Corrigidas Com Sucesso.');
end;

procedure TfrmComprasEstoque.Declaraode1Click(Sender: TObject);
var
  frmDeclaracao: TfrmDeclaracao;
begin
  frmDeclaracao := TfrmDeclaracao.Create(self);
  frmDeclaracao.showmodal;
  //
end;

procedure TfrmComprasEstoque.dtExercicioChange(Sender: TObject);
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
  if (empresaDAO.atualizar(empresa)) then
  begin
    if (empresa.mesExercicio = '12') then
    begin
      MenuConfiguracoes.Items[0].Enabled := true;
    end
    else
    begin
      MenuConfiguracoes.Items[0].Enabled := False;
    end;

  end;
  //
end;

end.
