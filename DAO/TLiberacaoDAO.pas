unit TLiberacaoDAO;

interface

uses
  IdBaseComponent,
  IdSASL,
  IdSASLUserPass,
  IdSASL_CRAMBase,
  IdSASL_CRAM_MD5,
  Data.Win.ADODB,
  DateUtils,
  SysUtils,
  udmComprasEstoque,
  TLiberacao,
  ufuncao,
  TEmpresa;

type
  ULiberacaoDAO = class

  public
    function getLiberacao(): ULiberacao;
    function gerarChave(liberacao: ULiberacao): ULiberacao;
    function inserir(liberacao: ULiberacao): Boolean;
    function validarLiberacao(liberacao: ULiberacao): Boolean;
    function getDiasFimLiberacao(liberacao: ULiberacao): Integer;
    function getDataInicialLiberacao(): TDate;
    function getDataFinalLiberacao(): TDate;
    constructor Create overload;
  end;

var
  qry: TADOQuery;
  md5GeraCodigoHash: TIdSASLCRAMMD5;

implementation

uses
  TEmpresaDAO;

constructor ULiberacaoDAO.Create;
begin
  inherited;
  qry := TADOQuery.Create(nil);
  qry.Connection := dmComprasEstoque.Conexao;
end;

function ULiberacaoDAO.getLiberacao(): ULiberacao;
var
  liberacao: ULiberacao;
  dados: String;
  i: Integer;
begin
  with (qry) do
  begin
    dados := 'SELECT * FROM liberacao where status = 1';
    Close;
    SQL.Clear;
    SQL.Add(dados);
    Open;
    First;
    liberacao := ULiberacao.Create;
    while (not eof) do
    begin
      if ((FieldByName('anoInicial').IsNull) or
        (FieldByName('anoInicial').AsString = '') or
        (FieldByName('mesInicial').IsNull) or
        (FieldByName('mesInicial').AsString = '')) then
      begin
        i := 0;
      end
      else
        i := 1;

      liberacao.mesFinal := FieldByName('mesFinal').AsString;
      liberacao.anoFinal := FieldByName('anoFinal').AsString;
      liberacao.chave := FieldByName('chave').AsString;
      liberacao.status := FieldByName('status').AsInteger;
      liberacao.mesInicial := FieldByName('mesInicial').AsString;
      liberacao.anoInicial := FieldByName('anoInicial').AsString;
      liberacao.idSistema := 10;

      Next;
    end;
  end;
  if (i = 0) then
    Result := nil
  else
    Result := liberacao;
  //
end;

function ULiberacaoDAO.gerarChave(liberacao: ULiberacao): ULiberacao;
begin

  md5GeraCodigoHash := TIdSASLCRAMMD5.Create(nil);
  liberacao.cnpj := removeCaracterEstranho(liberacao.cnpj);
  liberacao.chave := md5GeraCodigoHash.BuildKeydAuth(liberacao.cnpj,
    IntToStr(liberacao.idSistema) + liberacao.mesInicial.Substring(0, 12) +
    liberacao.anoInicial + liberacao.mesFinal.Substring(0, 12) +
    liberacao.anoFinal);

  liberacao.chave := liberacao.chave.Substring(0, 4) + '-' +
    liberacao.chave.Substring(4, 4) + '-' + liberacao.chave.Substring(8, 4);
  Result := liberacao;

end;

function ULiberacaoDAO.validarLiberacao(liberacao: ULiberacao): Boolean;
var
  empresa: UEmpresa;
  empresaDAO: UEmpresaDAO;
begin
  empresaDAO := UEmpresaDAO.Create;
  empresa := empresaDAO.getEmpresa;
  liberacao.cnpj := removeCaracterEstranho(empresa.cnpj);
  if (gerarChave(liberacao).chave <> liberacao.chave) then
  begin
    Result := false;
    { ShowMessage
      ( 'Há uma divergência entre os dados de Liberação no seu sistema. Por favor, contate o Suporte para verificação de Dados. '
      + #13 + ' Contato: https://www.infortread.com.br ' + #13 +
      ' Email: suporte@infortread.com.br' + #13 );
      Application.Terminate; }
  end
  else
    Result := true;
end;

function ULiberacaoDAO.inserir(liberacao: ULiberacao): Boolean;
begin
  //
  with (qry) do
  begin
    qry := TADOQuery.Create(nil);
    Connection := dmComprasEstoque.Conexao;
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM liberacao WHERE chave = ''' +
      liberacao.chave + '''');
    Open;
  end;
  if (qry.RecordCount = 0) then
  // A Chave Inserida não existe no banco, então cadastrar
  begin
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add
      ('INSERT INTO liberacao(anoFinal, mesFinal, anoInicial, mesInicial, chave, status) VALUES('''
      + liberacao.anoFinal + ''',''' + liberacao.mesFinal + ''', ''' +
      liberacao.anoInicial + ''',''' + liberacao.mesInicial + ''', ''' +
      liberacao.chave + ''', 1)');
    qry.ExecSQL;

    qry.SQL.Clear;
    // setando as outras chaves cadastradas para Status = 0
    qry.SQL.Add('update liberacao SET status = 0 where chave <> ''' +
      liberacao.chave + '''');
    qry.ExecSQL;
    Result := true;
  end
  else
    Result := false;
  { ShowMessage( 'A Ativação requisitada já está ativada.' ); }
end;

function ULiberacaoDAO.getDiasFimLiberacao(liberacao: ULiberacao): Integer;
var
  dataFimLiberacao, dataAtual: TDate;

begin
  dataFimLiberacao := EndOfAMonth(StrToInt(liberacao.anoFinal),
    StrToInt(liberacao.mesFinal));
  dataAtual := Now;
  Result := DaysBetween(dataAtual, dataFimLiberacao);
end;

function ULiberacaoDAO.getDataFinalLiberacao(): TDate;
var
  liberacao: ULiberacao;
begin
  liberacao := getLiberacao();
  Result := EndOfAMonth(StrToInt(liberacao.anoFinal),
    StrToInt(liberacao.mesFinal));
end;

function ULiberacaoDAO.getDataInicialLiberacao(): TDate;
var
  liberacao: ULiberacao;
begin
  liberacao := getLiberacao();
  try
    Result := StrToDate('01/' + liberacao.mesInicial + '/' +
      liberacao.anoInicial)
  Except
    Result := StrToDate('01/01/1989');
  end;
end;

end.
