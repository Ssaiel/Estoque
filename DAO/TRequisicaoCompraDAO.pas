unit TRequisicaoCompraDAO;

interface

uses
  SysUtils,
  TBen,
  Data.DB,
  Data.Win.ADODB,
  udmComprasEstoque;

type
  URequisicaoCompraDAO = class
    constructor Create;
    function delete(idRequisicaoCompra: String): boolean;
    function getIdRequisicaoCompraPorOrdemCompra(idOrdemCompra: String)
      : Integer;
  end;

var
  qry: TADOQuery;

implementation

constructor URequisicaoCompraDAO.Create;
begin
  //
  qry := TADOQuery.Create(nil);
  qry.Connection := dmComprasEstoque.conexao;

end;

function URequisicaoCompraDAO.delete(idRequisicaoCompra: String): boolean;
var
  script: String;
begin
  //
  try
    script := ' DELETE FROM REQUISICAOCOMPRA WHERE requisicaocompraID = ' +
      idRequisicaoCompra;
    qry.SQL.Clear;
    qry.SQL.Add(script);
    qry.ExecSQL;
    //
    script := ' DELETE FROM ITENSREQUISICAOCOMPRA WHERE idrequisicaocompra = ' +
      idRequisicaoCompra;
    qry.SQL.Clear;
    qry.SQL.Add(script);
    qry.ExecSQL;
    Result := true;
  Except
    Result := false;
  end;

end;

function URequisicaoCompraDAO.getIdRequisicaoCompraPorOrdemCompra
  (idOrdemCompra: String): Integer;
var
  script: String;
begin
  //
  script := 'SELECT idreqcompra as idRequisicaoCompra from ordemcompra where ordemcompraID ='
    + idOrdemCompra;
  qry.SQL.Clear;
  qry.SQL.Add(script);
  qry.Open;
  Result := qry.FieldByName('idRequisicaoCompra').AsInteger;
end;

end.
