unit UEstoqueDAO;

interface

uses
  SysUtils,
  TBen,
  Data.DB,
  Data.Win.ADODB, StdCtrls,
  udmComprasEstoque;

type
  TEstoqueDAO = class
  public
    qryEstoque: TADOQuery;
    //
    constructor Create;
    function selectByIdMesAno(idProduto, mes, ano: Integer): TADOQuery;
    function insert(idProduto, mes, ano: Integer): Boolean;
  end;

implementation

{ TEstoqueDAO }

constructor TEstoqueDAO.Create;
begin
  //
  qryEstoque := TADOQuery.Create();
  qryEstoque.Connection := dmComprasEstoque.conexao;
end;

function TEstoqueDAO.insert(idProduto, mes, ano: Integer): Boolean;
var
  script: String;
begin
  //
  script := ' INSERT INTO ESTOQUEPRODUTO(idProduto, mes, ano) VALUES(' +
    IntToStr(idProduto) + ', ' + IntToStr(mes) + ', ' + IntToStr(ano) + ' ) ';
  with (qryEstoque) do
  begin
    SQL.Clear;
    SQL.Add(script);
    try
      ExecSQL;
    except
      on e: Exception do
      begin
        e.Message;
        Result := False;
        exit;
      end;
    end;
    Result := True;
  end;
end;

function TEstoqueDAO.selectByIdMesAno(idProduto, mes, ano: Integer): TADOQuery;
var
  script: String;
begin
  //
  script := ' SELECT * FROM ESTOQUEPRODUTO WHERE idproduto = ' +
    IntToStr(idProduto) + ' and mes = ' + IntToStr(mes) + ' and ano = ' +
    IntToStr(ano);
  with (qryEstoque) do
  begin
    SQL.Clear;
    SQL.Add(script);
    Open;
  end;
  Result := qryEstoque;
end;

end.
