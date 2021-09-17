unit TCorrecaoBanco;

interface

uses
  udmComprasEstoque,
  SysUtils,
  System.Classes,
  Data.DB,
  Data.Win.ADODB,
  Dialogs,
  Funcoes;

function produtoCorrigirUnidadeMedida( ) : String;
procedure alterarProdutoUnidadeMedida(
  novo   : String;
  iditem : String );
procedure corrigirAcentuacao;

var
  qryUpdate : TADOQuery;
  qryProdutos : TADOQuery;
  qryUnidadeMedida : TADOQuery;

implementation

function produtoCorrigirUnidadeMedida( ) : String;
  var
    desc : String;
    i : integer;
  begin
    // ItemLicitaca��o X Unidade de Medida
    qryUpdate := TADOQuery.Create( nil );
    qryUpdate.Connection := dmComprasEstoque.Conexao;
    qryProdutos := TADOQuery.Create( nil );
    qryProdutos.Connection := dmComprasEstoque.Conexao;
    qryProdutos.SQL.Clear;
    qryProdutos.SQL.Add( 'SELECT * from produto' );
    qryProdutos.Open;
    qryUnidadeMedida := TADOQuery.Create( nil );
    qryUnidadeMedida.Connection := dmComprasEstoque.Conexao;
    qryUnidadeMedida.SQL.Add( 'SELECT * FROM unidademedida' );
    qryProdutos.Open;
    with ( qryProdutos ) do
    begin
      while ( not Eof ) do
      begin
        desc := FieldByName( 'unidadeMedida' ).asString;
        if ( ( desc = 'UN' ) or ( desc = 'UM' ) or ( desc = 'UND' ) or
          ( desc = 'UNI' ) or ( desc = 'UNID' ) or ( desc = 'UNIDADE' ) or
          ( desc = 'UNIDADES' ) )
        then
          alterarProdutoUnidadeMedida( 'UN', FieldByName( 'produtoID' )
            .asString )

        else if ( ( desc = 'CX' ) or ( desc = ' CAIXA' ) or
          ( desc = 'CAIXAS' ) )
        then
          alterarProdutoUnidadeMedida( 'CX', FieldByName( 'produtoID' )
            .asString )

        else if ( ( desc = 'PCT' ) or ( desc = ' PCTS' ) or ( desc = 'POTE' ) )
        then
          alterarProdutoUnidadeMedida( 'PCT', FieldByName( 'produtoID' )
            .asString )
        else if ( ( desc = 'RL' ) or ( desc = ' ROLO' ) or ( desc = 'ROLOS' ) )
        then
          alterarProdutoUnidadeMedida( 'RL', FieldByName( 'produtoID' )
            .asString )
        else
        begin
          i := 0;
          while ( not qryUnidadeMedida.Eof ) do
          begin
            if ( desc = qryUnidadeMedida.FieldByName( 'descricao' ).asString )
            then
            begin
              i := 1;
              alterarProdutoUnidadeMedida( desc, FieldByName( 'produtoID' )
                .asString );
              break;
            end
            else
              i := 0;
          end;
          if ( i = 0 )
          then
            alterarProdutoUnidadeMedida( 'OUTRO', FieldByName( 'produtoID' )
              .asString );
        end;
        Next;
      end;
    end;
    ShowMessage( 'Tabela ItemLicita��o (Unidades de Medida) Corrigida.' );
  end;

procedure alterarProdutoUnidadeMedida(
  novo   : String;
  iditem : String );
  var
    qry : String;

  begin
    qry := 'UPDATE produto set ' + ' unidadeMedida = ''' + novo + ''' ,' +
      ' idunidade = (select u.unidadeId from unidademedida u where u.descricao = '''
      + novo + ''') ' + ' WHERE produtoID = ' + iditem;

    qryUpdate.SQL.Clear;
    qryUpdate.SQL.Add( qry );
    qryUpdate.ExecSQL;
  end;

procedure corrigirAcentuacao;
  var
    qry : String;
  begin
    qry := ' UPDATE produto set ';
    qry := qry + ' descricao = TRIM(UCASE(descricao)), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''A''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''A''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''A''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''A''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''E''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''E''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''E''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''I''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''I''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''I''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''O''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''O''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''O''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''O''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''U''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''U''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''U''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''U''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''�'',''C''), ';
    qry := qry + ' descricao = REPLACE(descricao ,''/'',''-'') ';
    qryUpdate := TADOQuery.Create( nil );
    with ( qryUpdate ) do
    begin
      Connection := dmComprasEstoque.Conexao;
      SQL.Clear;
      SQL.Add( qry );
      ExecSQL;
      Free;
    end;
  end;

end.
