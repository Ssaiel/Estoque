unit TControleAtivacao;

interface

uses
  FuncoesDB,
  TLiberacao,
  TLiberacaoDAO,
  TEmpresa,
  TEmpresaDAO,
  TBen,
  TBenDAO,
  System.SysUtils,
  DateUtils,
  Vcl.Dialogs,
  uAtivacaoSistema,
  System.UITypes;
function verificarDataExercicio( ) : Boolean;
function verificarDatasItens( ) : Integer;
function pedirLiberacao : Boolean;
procedure verificarPrazoFimLiberacao;

implementation

function verificarDataExercicio( ) : Boolean;

  var
    empresa : UEmpresa;
    empresaDAO : UEmpresaDAO;
    liberacao : ULiberacao;
    liberacaoDAO : ULiberacaoDAO;
    dataInicial, dataFinal, dataExercicio : TDate;
  begin
    //
    empresaDAO := UEmpresaDAO.create;
    empresa := empresaDAO.getEmpresa;
    liberacaoDAO := ULiberacaoDAO.create;
    liberacao := liberacaoDAO.getLiberacao;

    dataInicial := liberacaoDAO.getDataInicialLiberacao( );
    dataFinal := liberacaoDAO.getDataFinalLiberacao( );

    dataExercicio := StrToDate( '01/' + empresa.mesExercicio + '/' +
      empresa.anoExercicio );

    // Se a data de Exercicio está dentro do Prazo de Liberação
    if ( ( dataExercicio >= dataInicial ) and ( dataExercicio <= dataFinal ) )
    then
    begin
      Result := true;
    end
    else
    begin
      Result := False;
    end;
  end;

function verificarDatasItens( ) : Integer;
  var
    itemDAO : UItemDAO;
    liberacao : ULiberacao;
    liberacaoDAO : ULiberacaoDAO;
    dataInicial, dataFinal : TDate;
  begin
    //
    liberacaoDAO := ULiberacaoDAO.create;
    itemDAO := UItemDAO.create;
    dataInicial := liberacaoDAO.getDataInicialLiberacao;
    dataFinal := liberacaoDAO.getDataFinalLiberacao;

    Result := itemDAO.getQtdItensForaDoPeriodo( dataInicial, dataFinal );

  end;

function pedirLiberacao : Boolean;
  var
    frmAtivacaoSistema : TfrmAtivacaoSistema;
  begin

    if ( MessageDlg( 'Deseja Realizar a Ativação do Sistema Agora?', mtError,
      mbYesNo, 0 ) = 6 ) // 6 = Yes
    then
    begin
      frmAtivacaoSistema := TfrmAtivacaoSistema.create( nil );
      frmAtivacaoSistema.showmodal;
      Result := true;
    end
    else
      Result := False;
  end;

procedure verificarPrazoFimLiberacao;
  var
    diasFimLiberacao : Integer;
    liberacao : ULiberacao;
    liberacaoDAO : ULiberacaoDAO;
  begin
    //
    liberacaoDAO := ULiberacaoDAO.create;
    liberacao := liberacaoDAO.getLiberacao;
    diasFimLiberacao := liberacaoDAO.getDiasFimLiberacao( liberacao );
    if ( diasFimLiberacao < 7 )
    then
    begin
      ShowMessage( 'Faltam ' + IntToStr( diasFimLiberacao ) +
        ' dias para o fim da sua liberacao. ' + #13 +
        'Por favor, realize a renovação para utilização completa do Sistema' );
    end;
  end;

end.
