unit uAtivacaoSistema;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  IdBaseComponent,
  IdSASL,
  IdSASLUserPass,
  IdSASL_CRAMBase,
  IdSASL_CRAM_MD5,
  Data.Win.ADODB,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  TLiberacao,
  TLiberacaoDAO,
  TEmpresa,
  TEmpresaDAO,
  TAbertura,
  TAberturaDAO,
  udmComprasEstoque, Data.DB;

type
  TfrmAtivacaoSistema = class( TForm )
    Panel1 : TPanel;
    Label10 : TLabel;
    Label11 : TLabel;
    Label12 : TLabel;
    Label13 : TLabel;
    Image1 : TImage;
    Label4 : TLabel;
    Label7 : TLabel;
    Label9 : TLabel;
    btnAtivacao : TSpeedButton;
    Label1 : TLabel;
    Label2 : TLabel;
    Label3 : TLabel;
    edtSerialMes : TMaskEdit;
    dtAte : TDateTimePicker;
    dtDe : TDateTimePicker;
    DBEdit1: TDBEdit;
    procedure FormShow( Sender : TObject );
    procedure btnAtivacaoClick( Sender : TObject );
    procedure FormCreate( Sender : TObject );
    procedure FormClose(
      Sender     : TObject;
      var Action : TCloseAction );
    private
      { Private declarations }
    public
      { Public declarations }
  end;

var
  frmAtivacaoSistema : TfrmAtivacaoSistema;
  idSistema : Integer;
  abertura : UAbertura;
  aberturaDAO : UAberturaDAO;
  mesDe, anoDe, mesAte, anoAte : String;
  tblEntidade : String = 'entidade';

implementation

{$R *.dfm}

uses
  ufuncao;

procedure TfrmAtivacaoSistema.FormClose(
  Sender     : TObject;
  var Action : TCloseAction );

  var
    liberacaoDAO : ULiberacaoDAO;
  begin
    liberacaoDAO := ULiberacaoDAO.Create;
    if ( liberacaoDAO.getLiberacao = nil )
    then
      Application.Terminate;
  end;

procedure TfrmAtivacaoSistema.FormCreate( Sender : TObject );
  begin
    // lblAnoExercicio.Caption := ( FormatDateTime( 'yyyy', NOW ) );
  end;

procedure TfrmAtivacaoSistema.FormShow( Sender : TObject );
  var
    dataInicial, dataFinal : TDate;
    liberacaoDAO : ULiberacaoDAO;
    liberacao : ULiberacao;
  begin
    liberacaoDAO := ULiberacaoDAO.Create;
    dmComprasEstoque.qryEmpresa.Open;

    // dtAte.DateTime := StrToDate( FormatDateTime( '01/01/yyyy', now ) );
    // dtPeriodo.MinDate := StrToDate( FormatDateTime( 'dd/mm/yyyy', now ) );
    try
      liberacao := liberacaoDAO.getLiberacao( );
      // Debuggar esse negócio - Talvez a lógica não seja a melhor =V
      // cê ta certo cara, nem entendi o que tu fez aqui D: D: D: D: D: D:
      dataInicial := liberacaoDAO.getDataInicialLiberacao;
      dataFinal := liberacaoDAO.getDataFinalLiberacao;
    Except
      dataInicial := StrToDate( '01/01/1989' );
    end;

    if ( dataInicial <> StrToDate( '01/01/1989' ) )
    then
    begin
      dtDe.DateTime := dataInicial
    end
    else
      dtDe.DateTime := StrToDate( FormatDateTime( '01/01/yyyy', now ) );
    dtAte.DateTime := dataFinal;
  end;

procedure TfrmAtivacaoSistema.btnAtivacaoClick( Sender : TObject );
  var
    empresa : UEmpresa;
    empresaDAO : UEmpresaDAO;
    liberacao : ULiberacao;
    liberacaoDAO : ULiberacaoDAO;
    id : Integer;
  begin

    id := 8; // id Patrimonio;

    anoDe := FormatDateTime( 'yyyy', dtDe.Date );
    mesDe := FormatDateTime( 'MM', dtDe.Date );
    anoAte := FormatDateTime( 'yyyy', dtAte.Date );
    mesAte := FormatDateTime( 'MM', dtAte.Date );

    liberacao := ULiberacao.Create;
    liberacao.mesInicial := mesDe;
    liberacao.anoInicial := anoDe;
    liberacao.mesFinal := mesAte;
    liberacao.anoFinal := anoAte;
    liberacao.idSistema := id;

    liberacao.cnpj := dmComprasEstoque.qryEmpresa.FieldByName( 'cnpj' )
      .AsString;
    liberacaoDAO := ULiberacaoDAO.Create;
    liberacao := liberacaoDAO.gerarChave( liberacao );
    if ( liberacao.chave = edtSerialMes.Text )
    then
    begin
      if ( liberacaoDAO.inserir( liberacao ) )
      then
      begin
        ShowMessage( 'Sistema Ativado Com Sucesso' );
        { Cadastro de AberturaFechamentoAnual }
        aberturaDAO := UAberturaDAO.Create;
        if ( aberturaDAO.realizarAberturaFechamento( liberacao ) = true )
        then
        begin
          ShowMessage( 'Abertura do Ano de' + liberacao.anoInicial +
            ' Realizada' );
          empresaDAO := UEmpresaDAO.Create;
          empresa := empresaDAO.getEmpresa;
          empresa.mesExercicio := liberacao.mesInicial;
          empresa.anoExercicio := liberacao.anoInicial;
          empresaDAO.atualizar( empresa );
        end
        else
          ShowMessage( 'Falha na Realização de Abertura Anual' );
      end
      else
      begin
        ShowMessage( 'Chave já ativada' );
      end;
      { Cadastro de AberturaFechamentoAnual }
    end // fim if_liberacao correta
    else
      ShowMessage( 'Chave Inválida' );

  end;

end.
