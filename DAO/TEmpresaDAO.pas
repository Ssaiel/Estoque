unit TEmpresaDAO;

interface

uses
  Data.DB,
  Data.Win.ADODB,
  udmComprasEstoque,
  SysUtils,
  TLiberacao,
  TLiberacaoDAO,
  TEmpresa;

type
  UEmpresaDAO = class
    public
      function atualizarExercicio( empresa : UEmpresa ) : UEmpresa;
      function atualizar( empresa : UEmpresa ) : boolean;
      function inserir( empresa : UEmpresa ) : boolean;
      function getEmpresa( ) : UEmpresa;
      function getDataExercicio( ) : TDate;
  end;

var
  qryEmpresa : TADOQuery;

implementation

// atualiza a data de Exericio para a Data Inicial da Liberação
function UEmpresaDAO.atualizarExercicio( empresa : UEmpresa ) : UEmpresa;
  var
    liberacao : ULiberacao;
    liberacaoDAO : ULiberacaoDAO;
  begin
    empresa := getEmpresa;
    liberacaoDAO := ULiberacaoDAO.Create;
    liberacao := liberacaoDAO.getLiberacao;
    empresa.mesExercicio := liberacao.mesInicial;
    empresa.anoExercicio := liberacao.anoInicial;
    atualizar( empresa );
    Result := empresa;
  end;

function UEmpresaDAO.getEmpresa( ) : UEmpresa;
  var
    script : String;
    empresa : UEmpresa;
  begin
    //
    script := 'SELECT * FROM entidade';
    qryEmpresa := TADOQuery.Create( nil );
    qryEmpresa.Connection := dmComprasEstoque.Conexao;
    try
      with ( qryEmpresa ) do
      begin
        SQL.Clear;
        SQL.Add( script );
        Open;
        empresa := nil;
        while ( not eof ) do
        begin
          empresa := UEmpresa.Create;
          empresa.nome := FieldByName( 'nome' ).AsString;
          empresa.cnpj := FieldByName( 'cnpj' ).AsString;

          if ( ( FieldByName( 'mesExercicio' ).IsNull ) or
            ( FieldByName( 'anoExercicio' ).IsNull ) or
            ( empresa.mesExercicio = '' ) or ( empresa.anoExercicio = '' ) )
          then
          begin
            // empresa := atualizarExercicio( empresa );
          end;
          empresa.mesExercicio := FieldByName( 'mesExercicio' ).AsString;
          empresa.anoExercicio := FieldByName( 'anoExercicio' ).AsString;
          Next;
        end;
        Result := empresa;
      end;
    Except
      Result := nil;
    end;

  end;

function UEmpresaDAO.atualizar( empresa : UEmpresa ) : boolean;
  var
    script : String;
  begin
    try
      script := 'UPDATE entidade SET ';
      script := script + ' mesExercicio = ' + empresa.mesExercicio + ' , ';
      script := script + ' anoExercicio = ' + empresa.anoExercicio + ' , ';
      script := script + ' nome = ''' + empresa.nome + ''' , ';
      script := script + ' cnpj = ''' + empresa.cnpj + ''' ';
      qryEmpresa := TADOQuery.Create( nil );
      qryEmpresa.Connection := dmComprasEstoque.Conexao;
      with ( qryEmpresa ) do
      begin
        SQL.Clear;
        SQL.Add( script );
        ExecSQL;
        Free;
      end;
      Result := True;
    Except
      Result := False;
    end;
  end;

function UEmpresaDAO.inserir( empresa : UEmpresa ) : boolean;
  var
    script : String;
  begin
    try
      script := 'INSERT INTO entidade( cnpj, nome, logradouro, cidade, mesExercicio, anoExercicio ) VALUES (';
      script := script + '''' + empresa.cnpj + ''', ''' + empresa.nome +
        ''', ''' + empresa.endereco + ''' , ''' + empresa.cidade + ''' , ''' +
        empresa.mesExercicio + ''' , ''' + empresa.anoExercicio + ''' )';
      qryEmpresa := TADOQuery.Create( nil );
      qryEmpresa.Connection := dmComprasEstoque.Conexao;
      with ( qryEmpresa ) do
      begin
        SQL.Clear;
        SQL.Add( script );
        ExecSQL;
        Free;
      end;
      Result := True;
    Except
      Result := False;
    end;
  end;

function UEmpresaDAO.getDataExercicio( ) : TDate;
  var
    empresa : UEmpresa;
  begin
    empresa := getEmpresa;
    Result := StrToDate( '01/' + empresa.mesExercicio + '/' +
      empresa.anoExercicio );
  end;

end.
