unit TOrdemCompraDAO;

interface

uses
  SysUtils,
  TBen,
  Data.DB,
  Data.Win.ADODB,
  udmComprasEstoque;

type
  UOrdemCompraDAO = class
    constructor Create;
    function delete(idOrdemCompra: String): boolean;
  end;

var
  qry: TADOQuery;

implementation

constructor UOrdemCompraDAO.Create;
begin
  //
  qry := TADOQuery.Create(nil);
  qry.Connection := dmComprasEstoque.conexao;

end;

function UOrdemCompraDAO.delete(idOrdemCompra: String): boolean;
var
  script: String;
begin
  //
  script := ' DELETE FROM ORDEMCOMPRA WHERE ordemcompraID = ' + idOrdemCompra;
  qry.SQL.Clear;
  qry.SQL.Add(script);
  qry.ExecSQL;
  //
  Result := true;
end;

end.
