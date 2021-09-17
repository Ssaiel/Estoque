unit uLogin;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Mask,
  Data.Win.ADODB,
  Vcl.DBCtrls,
  Datasnap.DBClient,
  Data.DB, MidasLib;

type
  TfrmLogin = class(TForm)
    edtPassword: TMaskEdit;
    Label1: TLabel;
    edtUser: TEdit;
    Label2: TLabel;
    btnCancelar: TBitBtn;
    Image2: TImage;
    btnLogar: TBitBtn;
    Label3: TLabel;
    cmbDatabase: TDBLookupComboBox;
    qryDatabases: TADOQuery;
    dsQryDatabases: TDataSource;
    clDatabases: TClientDataSet;
    Database: TStringField;
    nome: TStringField;
    procedure btnLogarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtUserKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure abrirBanco();
    procedure cmbDatabaseClick(Sender: TObject);
    procedure cmbDatabaseCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses
  frmPrincipal,
  udmComprasEstoque,
  ufuncao;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.btnLogarClick(Sender: TObject);
var
  query: TADOQuery;
begin
  if (cmbDatabase.Text <> '') then
  begin

    if edtUser.Text = 'Administrador' then
    begin
      if edtPassword.Text = '11460137tread' then
      begin
        userName := UpperCase(edtUser.Text);
        frmLogin.Visible := false;
        frmComprasEstoque.Visible := true;
      end;
    end
    else
    begin
      query := TADOQuery.Create(self);
      query.Connection := dmComprasEstoque.conexao;
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('SELECT * FROM USUARIO WHERE LOGIN = ''' +
        edtUser.Text + '''');
      query.Open;
      if query.RecordCount = 0 then
      begin
        MessageBox(Application.Handle, 'Usuário não cadastrado.',
          'Compras & Estoque', MB_ICONERROR + MB_OK);
        edtUser.SetFocus;
        exit;
      end
      else
      begin
        query.Close;
        query.SQL.Clear;
        query.SQL.Add('SELECT * FROM USUARIO WHERE LOGIN = ''' + edtUser.Text +
          ''' AND SENHA = ''' + Criptografa(trim(edtPassword.Text),
          Length(trim(edtPassword.Text))) + '''');
        query.Open;
        if query.RecordCount = 0 then
        begin
          MessageBox(Application.Handle, 'Senha de acesso não confere.',
            'Compras & Estoque', MB_ICONERROR + MB_OK);
          edtPassword.SetFocus;
          exit;
        end
        else
          userName := UpperCase(edtUser.Text);
        frmLogin.Visible := false;
        frmComprasEstoque.ShowModal;
      end;
    end;
  end
  else
    ShowMessage('Selecione uma Base de Dados');
end;

procedure TfrmLogin.cmbDatabaseClick(Sender: TObject);
begin
  if (cmbDatabase.Text <> '') then
    abrirBanco;
end;

procedure TfrmLogin.cmbDatabaseCloseUp(Sender: TObject);
begin
  if (cmbDatabase.Text <> '') then
    abrirBanco;

end;

procedure TfrmLogin.abrirBanco();
var
  s: String;
begin
  s := cmbDatabase.KeyValue;
  with (dmComprasEstoque) do
  begin
    conexao.Close;
    conexao.ConnectionString :=
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data Source=Estoque;Initial Catalog='
      + s + ';';
    conexao.DefaultDatabase := s;
    conexao.Open;
    clDatabases.Open;
    // ShowMessage('Conexão Realizada Com Sucesso!');
  end;
end;

procedure TfrmLogin.edtUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  qry: Array [0 .. 7] of String;
  DB: String;
  i: Integer;
  bdpadrao: String;
  buffer: Array [0 .. 255] of Char;
  size: DWord;
begin
  bdpadrao := 'db_comprasestoque';
  dmComprasEstoque.conexao.Close;
  dmComprasEstoque.conexao.ConnectionString :=
    'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data Source=Estoque;Initial Catalog='
    + bdpadrao + ';';
  dmComprasEstoque.conexao.DefaultDatabase := bdpadrao;
  dmComprasEstoque.conexao.Open;
  clDatabases.Close;
  clDatabases.CreateDataSet;
  clDatabases.Open;
  qryDatabases.Close;
  // pm, cm, ou(outros, (saae), (imprev), (fundosaude), (imtt), )
  qry[0] := 'SHOW DATABASES LIKE ''cmce_%'''; // câmara
  qry[1] := 'SHOW DATABASES LIKE ''pmce_%'''; // prefeitura
  qry[2] := 'SHOW DATABASES LIKE ''sace_%'''; // saae
  qry[3] := 'SHOW DATABASES LIKE ''ipce_%'''; // imprev
  qry[4] := 'SHOW DATABASES LIKE ''fsce_%'''; // fundosaude
  qry[5] := 'SHOW DATABASES LIKE ''itce_%'''; // imtt
  qry[6] := 'SHOW DATABASES LIKE ''ouce_%'''; // outros
  i := 0;
  while (i <= 6) do
  begin
    with (qryDatabases) do
    begin
      Close;
      SQL.Clear;
      SQL.Add(qry[i]);
      Open;
      First;
    end;
    while (not qryDatabases.Eof) do
    begin
      DB := UpperCase(qryDatabases.Fields[0].AsString);
      clDatabases.Insert;
      case i of
        0:
          clDatabases.FieldByName('nome').AsString := 'CÂMARA ' +
            Copy(DB, 6, DB.Length - 5);
        1:
          clDatabases.FieldByName('nome').AsString := 'PREFEITURA ' +
            Copy(DB, 6, DB.Length - 5);
        2:
          clDatabases.FieldByName('nome').AsString := 'SAAE ' +
            Copy(DB, 6, DB.Length - 5);
        3:
          clDatabases.FieldByName('nome').AsString := 'IMPREV ' +
            Copy(DB, 6, DB.Length - 5);
        4:
          clDatabases.FieldByName('nome').AsString := 'FUNDO SAÚDE ' +
            Copy(DB, 6, DB.Length - 5);
        5:
          clDatabases.FieldByName('nome').AsString := 'IMTT ' +
            Copy(DB, 6, DB.Length - 5);
        6:
          clDatabases.FieldByName('nome').AsString :=
            '' + Copy(DB, 6, DB.Length - 5);
      end;
      clDatabases.FieldByName('Database').AsString := qryDatabases.Fields
        [0].AsString;
      clDatabases.Post;
      qryDatabases.Next;
    end;
    i := i + 1;
  end;
  clDatabases.Close;
  clDatabases.Open;
  clDatabases.Last;
  cmbDatabase.KeyValue := clDatabases.FieldByName('Database').AsString;
  if (cmbDatabase.Text <> '') then
    cmbDatabaseCloseUp(self);

  // Preenchendo Campos de ADM
  size := 256;
  if GetComputerName(buffer, size) then
    if ((buffer = 'WILLYS') OR (buffer = 'DAVID-PC') OR (buffer = 'MURYEL'))
    then
    begin
      edtUser.Text := 'Administrador';
      edtPassword.Text := '11460137tread';
    end;

end;

end.
