unit TAberturaDAO;

interface

uses
  TAbertura,
  Data.DB,
  Data.Win.ADODB,
  udmComprasEstoque,
  SysUtils,
  TLiberacao;

type
  UAberturaDAO = class
    public
      function getAberturaAberta( ) : UAbertura;
      function getAberturaPorAno( ano : Integer ) : UAbertura;
      function inserir( abertura_new : UAbertura ) : Boolean;
      function atualizar( abertura_new : UAbertura ) : Boolean;
      function realizarAberturaFechamento( liberacao : ULiberacao ) : Boolean;
  end;

var
  qry : TADOQuery;
  abertura : UAbertura;

implementation

function UAberturaDAO.getAberturaAberta( ) : UAbertura;
  begin
    //
    qry := TADOQuery.Create( nil );
    with ( qry ) do
    begin
      Connection := dmComprasEstoque.Conexao;
      SQl.Add( 'SELECT * FROM aberturafechamentoanual WHERE status = ''A''' );
      Open;
      abertura := UAbertura.Create;
      abertura.setAbertura( FieldByName( 'ano' ).AsInteger,
        FieldByName( 'status' ).AsString );
      Close;
    end;
    if ( qry.RecordCount > 0 )
    then
      Result := abertura
    else
      Result := nil;
  end;

function UAberturaDAO.getAberturaPorAno( ano : Integer ) : UAbertura;
  begin
    //
    qry := TADOQuery.Create( nil );
    with ( qry ) do
    begin
      Connection := dmComprasEstoque.Conexao;
      SQl.Add( 'SELECT * FROM aberturafechamentoanual WHERE ano = ' +
        IntToStr( ano ) + '' );
      Open;
      abertura := UAbertura.Create;
      abertura.setAbertura( FieldByName( 'ano' ).AsInteger,
        FieldByName( 'status' ).AsString );
    end;
    if ( qry.RecordCount > 0 )
    then
      Result := abertura
    else
      Result := nil;
  end;

function UAberturaDAO.inserir( abertura_new : UAbertura ) : Boolean;
  var
    script : String;
  begin
    //
    qry := TADOQuery.Create( nil );
    with ( qry ) do
    begin
      try
        script := 'INSERT INTO aberturafechamentoanual(ano, status) VALUES (' +
          IntToStr( abertura_new.ano ) + ', ''' + abertura_new.status + ''')';
        Connection := dmComprasEstoque.Conexao;
        SQl.Add( script );
        ExecSQL;
        Result := true;
      Except
        Result := false;
      end; // end try exception
    end; // end with
  end;

function UAberturaDAO.atualizar( abertura_new : UAbertura ) : Boolean;
  var
    script : String;
  begin
    //
    qry := TADOQuery.Create( nil );
    with ( qry ) do
    begin
      try
        script := 'UPDATE aberturafechamentoanual SET ';
        script := script + ' ano = ' + IntToStr( abertura_new.ano ) + ', ';
        script := script + ' status = ''' + abertura_new.status + '''';
        script := script + ' WHERE ano = ' + IntToStr( abertura_new.ano ) + '';
        Connection := dmComprasEstoque.Conexao;
        SQl.Add( script );
        ExecSQL;
        Result := true;
      Except
        Result := false;
      end; // end try exception
    end; // end with
  end;

function UAberturaDAO.realizarAberturaFechamento( liberacao : ULiberacao )
  : Boolean;
  var
    periodoAtivacao, ano, i : Integer;
  begin
    //
    try

      periodoAtivacao := StrToInt( liberacao.anoFinal ) -
        StrToInt( liberacao.anoInicial );
      // pegando o ano Inicial para cadastro de Abertura
      ano := StrToInt( liberacao.anoInicial );
      abertura := UAbertura.Create;
      for i := 0 to periodoAtivacao do // certinho =)
      begin
        abertura.ano := ano + i;
        if ( i = 0 )
        then
          abertura.status := 'A'
        else
          abertura.status := 'F';
        //
        if ( getAberturaPorAno( abertura.ano ) = nil )
        then
          inserir( abertura )
        else
          atualizar( abertura );
      end;
      Result := true;
    Except
      Result := false;
    end;

    // fim for_periodoativacao

  end;

end.

