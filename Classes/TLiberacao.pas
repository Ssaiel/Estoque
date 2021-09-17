unit TLiberacao;

interface

uses
  IdBaseComponent,
  IdSASL,
  IdSASLUserPass,
  IdSASL_CRAMBase,
  IdSASL_CRAM_MD5,
  Data.Win.ADODB,
  SysUtils,
  udmComprasEstoque;

type
  ULiberacao = class
    mesFinal : String;
    anoFinal : String;
    mesInicial : String;
    anoInicial : String;
    chave : String;
    cnpj : String;
    status : Integer;
    idSistema : Integer;
    protected
      constructor Criar(
        mesFinal   : String;
        anoFinal   : String;
        mesInicial : String;
        anoInicial : String;
        chave      : String;
        cnpj       : String;
        status     : Integer;
        idSistema  : Integer );
    public

      procedure atualizarExercicio( );

    var
      md5GeraCodigoHash : TIdSASLCRAMMD5;
      qry : TADOQuery;
  end;

implementation

constructor ULiberacao.Criar(
  mesFinal   : String;
  anoFinal   : String;
  mesInicial : String;
  anoInicial : String;
  chave      : String;
  cnpj       : String;
  status     : Integer;
  idSistema  : Integer );
  begin
    inherited create( );
    Self.mesInicial := mesInicial;
    Self.anoInicial := anoInicial;
    Self.mesFinal := mesFinal;
    Self.anoFinal := anoFinal;
    Self.chave := chave;
    Self.cnpj := cnpj;
    Self.status := status;
    Self.idSistema := 9;
    //
  end;





// true: Cadastrado
// false: Não Cadastrado

procedure ULiberacao.atualizarExercicio( );
  begin
    qry.SQL.Clear;
    qry.SQL.Add( 'update empresa SET mesExercicio = ' + mesInicial +
      ' , anoExercicio = ' + anoInicial );
    qry.ExecSQL;
  end;

end.

