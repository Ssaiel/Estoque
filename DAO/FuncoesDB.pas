unit FuncoesDB;

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
  udmComprasEstoque;
procedure RotinadeAtualizacoes;
procedure deletarCampo(campo: String; tabela: String);
procedure verificarExistencia(campo: String; tabela: String; tipo: String);
procedure alterarCampo(campoAntigo: String; campoNovo: String; tabela: String;
  tipo: String);
procedure rodarScript(script: String);
function executarAtualizacao(arquivo: String): boolean;

implementation

procedure RotinadeAtualizacoes;
var
  script: String;
begin
  //

  // Criação de Campos

  // deletar Campos não úteis (campo, tabela);

  // liberação - adição de campos anoInicial e mesInicial
  verificarExistencia('mesInicial', 'liberacao', 'varchar(8)');
  verificarExistencia('anoInicial', 'liberacao', 'varchar(8)');
  alterarCampo('mesFinalAtivado', 'mesFinal', 'liberacao', 'varchar(8)');
  alterarCampo('anoFinalAtivado', 'anoFinal', 'liberacao', 'varchar(8)');
  rodarScript('ALTER TABLE `entradaproduto`	ADD COLUMN `idCategoria` INT ');
  executarAtualizacao('SQL/UPDATE.SQL');
end;

procedure verificarExistencia(campo: String; tabela: String; tipo: String);
var
  qryContrato: TADOQuery;
  qry: String;
begin
  // verificando se os campos existem, Senão: Cria Campos
  qryContrato := TADOQuery.Create(nil);
  qryContrato.Connection := dmComprasEstoque.Conexao;

  try
    qry := 'SELECT ' + campo + ' from ' + tabela;
    qryContrato.SQL.Add(qry);
    qryContrato.Open;
  Except

    qry := 'ALTER TABLE ' + tabela + ' ADD COLUMN ' + campo + ' ' + tipo +
      ' default null';
    qryContrato.SQL.Clear;
    qryContrato.SQL.Add(qry);
    // ShowMessage( qry );
    qryContrato.ExecSQL;
  end;
  qryContrato.Free;
end;

procedure deletarCampo(campo: String; tabela: String);
var
  qry: String;
  qryContrato: TADOQuery;
begin
  //
  qryContrato := TADOQuery.Create(nil);
  qryContrato.Connection := dmComprasEstoque.Conexao;
  try
    qry := ' ALTER TABLE ' + tabela + ' DROP COLUMN ' + campo;
    qryContrato.SQL.Clear;
    qryContrato.SQL.Add(qry);
    qryContrato.ExecSQL;
  Finally

  end;
  qryContrato.Free;

end;

procedure rodarScript(script: String);
var
  qryScript: TADOQuery;
  error: TStringList;
begin
  qryScript := TADOQuery.Create(nil);
  try
    with (qryScript) do
    begin
      // passando dados de NumeroEmpenho
      Connection := dmComprasEstoque.Conexao;
      SQL.Clear;
      SQL.Add(script);
      ExecSQL;
      Free;
    end;
  Except
    error := TStringList.Create;
    if (FileExists('errorscript.sql')) then
      error.LoadFromFile('errorscript.sql');
    error.Add(script);
    error.SaveToFile('erroscript.sql');
  end;

end;

procedure alterarCampo(campoAntigo: String; campoNovo: String; tabela: String;
  tipo: String);
var
  qryContrato: TADOQuery;
  qry: String;
begin
  // verificando se os campos existem, Senão: Cria Campos
  qryContrato := TADOQuery.Create(nil);
  qryContrato.Connection := dmComprasEstoque.Conexao;

  try
    qry := 'ALTER TABLE ' + tabela + ' CHANGE COLUMN ' + campoAntigo + ' ' +
      campoNovo + ' ' + tipo + ' NOT NULL ';
    qryContrato.SQL.Clear;
    qryContrato.SQL.Add(qry);
    qryContrato.ExecSQL;
    qryContrato.Close;
  Except
    {
      qry := 'ALTER TABLE ' + tabela + ' ADD COLUMN ' + campo + ' ' + tipo +
      ' default null';
      qryContrato.SQL.Clear;
      qryContrato.SQL.Add( qry );
      // ShowMessage( qry );
      qryContrato.ExecSQL; }
  end;
  qryContrato.Free;
end;

function executarAtualizacao(arquivo: String): boolean;
var
  script: TStringList;
  i: Integer;
  qry: TADOQuery;
  logError: TStringList;
begin
  script := TStringList.Create;
  logError := TStringList.Create;
  script.LoadFromFile(arquivo);
  qry := TADOQuery.Create(nil);
  qry.Connection := dmComprasEstoque.Conexao;
  for i := 0 to script.Count - 1 do
  begin
    with (qry) do
    begin
      try
        SQL.Clear;
        SQL.Add(script[i]);
        ExecSQL;
      Except
        on e: Exception do
        begin
          logError.Add('Linha ' + IntToStr(i + 1) + ': ' + e.Message);
        end;
      end;
    end;
  end;
  if (logError.Count > 0) then
    logError.SaveToFile('SQL/Log.txt');
  Result := true;
end;

end.
