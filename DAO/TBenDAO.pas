unit TBenDAO;

interface

uses
  SysUtils,
  TBen,
  Data.DB,
  Data.Win.ADODB,
  udmComprasEstoque;

type
  UItemDAO = class
    public
      constructor Create( )overload;
      function getQtdItensPorPeriodo(
        dtInicial : TDate;
        dtFinal   : TDate ) : Integer;
      function getQtdItensForaDoPeriodo(
        dtInicial : TDate;
        dtFinal   : TDate ) : Integer;
      function getQtdItensTotal( ) : Integer;
  end;

var
  qry : TADOQuery;
  ben : UBen;

implementation

constructor UItemDAO.Create;
  begin
    inherited;
    qry := TADOQuery.Create( nil );
    qry.Connection := dmComprasEstoque.Conexao;
  end;

function UItemDAO.getQtdItensPorPeriodo(
  dtInicial : TDate;
  dtFinal   : TDate ) : Integer;
  var
    qtdItens : Integer;
    script : String;
  begin
    //
    script := 'SELECT Count(ben_codigo) as Quantidade FROM bens b ';
    script := script + 'WHERE b.ben_data_depreciacao BETWEEN (''' +
      FormatDateTime( 'yyyy-mm-dd', dtInicial ) + ''') AND (''' +
      FormatDateTime( 'yyyy-mm-dd', dtFinal ) + ''')';
    with ( qry ) do
    begin
      SQL.Clear;
      SQL.Add( script );
      Open;
      qtdItens := FieldByName( 'Quantidade' ).AsInteger;
      Close;
    end;
    Result := qtdItens;
  end;

function UItemDAO.getQtdItensTotal( ) : Integer;
  var
    qtdItens : Integer;
    script : String;
  begin
    //
    script := 'SELECT Count(entradaID) as Quantidade FROM entradaproduto e ';
    with ( qry ) do
    begin
      SQL.Clear;
      SQL.Add( script );
      Open;
      qtdItens := FieldByName( 'Quantidade' ).AsInteger;
      Close;
    end;
    Result := qtdItens;
  end;

function UItemDAO.getQtdItensForaDoPeriodo(
  dtInicial : TDate;
  dtFinal   : TDate ) : Integer;
  var
    qtdItens, qtdTotal : Integer;
    script : String;
  begin
    //
    script := 'SELECT Count(entradaID) as Quantidade FROM entradaproduto e ';
    script := script + 'WHERE e.dataentrada BETWEEN (''' +
      FormatDateTime( 'yyyy-mm-dd', dtInicial ) + ''') AND (''' +
      FormatDateTime( 'yyyy-mm-dd', dtFinal ) + ''')';

    with ( qry ) do
    begin
      SQL.Clear;
      SQL.Add( script );
      Open;
      qtdItens := FieldByName( 'Quantidade' ).AsInteger;
      qtdTotal := getQtdItensTotal( );
      // Quantidade TOTAL - Quantidade de Itens no Prazo = total de itens FORA DA LIBERAÇÃO
      qtdItens := qtdTotal - qtdItens;
      Close;
    end;
    Result := qtdItens;
  end;

end.
