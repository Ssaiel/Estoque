unit ProdutosDAO;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.menus,
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
  IniFiles,
  DateUtils,
  udmComprasEstoque,
  TLiberacao,
  ufuncao,
  UItemRequisicaoCompra;

function cadastrarProdutos( items : TList ) : TList;
function cadastrarProduto( item : TItemRequisicaoCompra )
  : TItemRequisicaoCompra;
function pegarUltimoCadastrado( ) : Integer;

implementation

var
  items, itemsReserva : TList;

function cadastrarProdutos( items : TList ) : TList;
  var
    i : Integer;
    qryProdutos : TADOQuery;
    qry, produtoID : String;
    item : TItemRequisicaoCompra;
  begin

    qryProdutos := TADOQuery.Create( nil );
    with ( qryProdutos ) do
    begin
      qry := '';
      Connection := dmComprasEstoque.conexao;
      item := TItemRequisicaoCompra.Create( );
      for i := 0 to items.Count - 1 do
      begin
        item := items[ i ];
        qry := 'INSERT INTO produtos(estoque, descricao) VALUES(''';
        qry := qry + item.quantidade + ''', ''';
        qry := qry + item.descricao + ''')';
        qryProdutos.SQL.Add( qry );
        qryProdutos.ExecSQL;
        produtoID := IntToStr( pegarUltimoCadastrado( ) );
        // buscar ultimo ID Cadastrado
        item.idproduto := produtoID;
        items[ i ] := item;
      end;
    end;
    Result := items;
  end;

function cadastrarProduto( item : TItemRequisicaoCompra )
  : TItemRequisicaoCompra;
  var
    qryProdutos : TADOQuery;
    qry, produtoID : String;
  begin
    qryProdutos := TADOQuery.Create( nil );
    with ( qryProdutos ) do
    begin

      Connection := dmComprasEstoque.conexao;
      qry := '';
      qry := 'INSERT INTO produto(estoque, descricao) VALUES(''' +
        item.quantidade + ''', ''' + item.descricao + ''')';
      qryProdutos.SQL.Add( qry );
      qryProdutos.ExecSQL;
      produtoID := IntToStr( pegarUltimoCadastrado( ) );
      // buscar ultimo ID Cadastrado
      item.idproduto := produtoID;
    end;
    Result := item;
  end;

function pegarUltimoCadastrado( ) : Integer;
  var
    qryUltimo : TADOQuery;
    ultimoID : Integer;
  begin
    //
    qryUltimo := TADOQuery.Create( nil );
    qryUltimo.Connection := dmComprasEstoque.conexao;
    qryUltimo.SQL.Clear;
    qryUltimo.SQL.Add
      ( 'SELECT produtoID FROM produto ORDER BY produtoID DESC LIMIT 1' );
    qryUltimo.Open;
    ultimoID := qryUltimo.FieldByName( 'produtoID' ).AsInteger;
    qryUltimo.Free;
    Result := ultimoID;
  end;

end.
