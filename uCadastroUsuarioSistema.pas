unit uCadastroUsuarioSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Data.Win.ADODB, Vcl.StdCtrls;

type
  TfrmCadastroUsuarioSistema = class(TForm)
    ImageListMainMenu: TImageList;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    btnNovo: TToolButton;
    ToolButton2: TToolButton;
    btnEditar: TToolButton;
    ToolButton7: TToolButton;
    btnSalvar: TToolButton;
    ToolButton9: TToolButton;
    btnCancelar: TToolButton;
    ToolButton10: TToolButton;
    btnExcluir: TToolButton;
    ToolButton8: TToolButton;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    btnAcessos: TToolButton;
    ToolButton4: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    edtSenha: TMaskEdit;
    edtConfirmacao: TMaskEdit;
    edtLogin: TEdit;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    procedure ToolButton1Click(Sender: TObject);
    procedure habilitaBotoes;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure limparCampos;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAcessosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarioSistema: TfrmCadastroUsuarioSistema;
  tipooperacao : string;

implementation

{$R *.dfm}

uses udmComprasEstoque, ufuncao, uControleAcesso;

procedure TfrmCadastroUsuarioSistema.btnAcessosClick(Sender: TObject);
begin
   try
      frmLiberacaoAcessoUsuario := TfrmLiberacaoAcessoUsuario.Create(self);
      frmLiberacaoAcessoUsuario.Label1.Caption := dmComprasEstoque.qryUsuariosSistema.FieldByName('Login').AsString;
      frmLiberacaoAcessoUsuario.ShowModal;
   finally
      frmLiberacaoAcessoUsuario.Free
   end;
end;

procedure TfrmCadastroUsuarioSistema.btnCancelarClick(Sender: TObject);
begin
   Panel1.Enabled := not Panel1.Enabled;
   habilitaBotoes;
   limparCampos;

end;

procedure TfrmCadastroUsuarioSistema.btnEditarClick(Sender: TObject);
begin
   Panel1.Enabled := not Panel1.Enabled;
   habilitaBotoes;
   edtNome.SetFocus;
   tipooperacao := 'E';
end;

procedure TfrmCadastroUsuarioSistema.btnExcluirClick(Sender: TObject);
var query : TADOCommand;
    qry : string;
begin
      query := TADOCommand.Create(self);
      query.Connection := dmComprasEstoque.conexao;
      qry := 'UPDATE USUARIO SET STATUS = 0 ';
      qry := qry + ' WHERE LOGIN = ''' + edtLogin.Text + ''' ';
      query.CommandText := qry;
      query.Execute;
      MessageBox(Application.Handle,'Usuário excluído com sucesso.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
      habilitaBotoes;
      limparCampos;
      Panel1.Enabled := not Panel1.Enabled;
      frmCadastroUsuarioSistema.OnShow(self);

end;

procedure TfrmCadastroUsuarioSistema.btnNovoClick(Sender: TObject);
begin
   Panel1.Enabled := not Panel1.Enabled;
   limparCampos;
   habilitaBotoes;
   edtNome.SetFocus;
   tipooperacao := 'N';
end;

procedure TfrmCadastroUsuarioSistema.btnSalvarClick(Sender: TObject);
var query : TADOCommand;
    qry : string;
begin
   if edtSenha.Text <> edtConfirmacao.Text then begin
      MessageBox(Application.Handle, 'Senha de acesso não conferem.','Compras & Estoque',MB_ICONERROR + MB_OK);
   end
   else begin
      if tipooperacao = 'N'  then begin
         query := TADOCommand.Create(self);
         query.Connection := dmComprasEstoque.conexao;
         qry := 'INSERT INTO USUARIO(LOGIN, NOME, SENHA, STATUS) VALUES(''';
         qry := qry + edtLogin.Text + ''', ''' + edtNome.Text + ''',''' + Criptografa(trim(edtSenha.Text),Length(Trim(edtSenha.Text))) + ''' , ''1'')';
         query.CommandText := qry;
         query.Execute;
         MessageBox(Application.Handle,'Usuário cadastrado com sucesso.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
         habilitaBotoes;
         limparCampos;
         Panel1.Enabled := not Panel1.Enabled;
         frmCadastroUsuarioSistema.OnShow(self);
      end
      else begin
         query := TADOCommand.Create(self);
         query.Connection := dmComprasEstoque.conexao;
         qry := 'UPDATE USUARIO SET NOME = ''' + edtNome.Text + ''', SENHA = ''' + Criptografa(trim(edtSenha.Text),Length(Trim(edtSenha.Text))) + ''' ';
         qry := qry + ' WHERE LOGIN = ''' + edtLogin.Text + ''' ';
         query.CommandText := qry;
         query.Execute;
         MessageBox(Application.Handle,'Usuário cadastrado com sucesso.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
         habilitaBotoes;
         limparCampos;
         Panel1.Enabled := not Panel1.Enabled;
         frmCadastroUsuarioSistema.OnShow(self);
      end;

   end;

end;

procedure TfrmCadastroUsuarioSistema.DBGrid1DblClick(Sender: TObject);
begin
   edtNome.Text := dmComprasEstoque.qryUsuariosSistema.FieldByName('nome').AsString;
   edtLogin.Text := dmComprasEstoque.qryUsuariosSistema.FieldByName('login').AsString;

end;

procedure TfrmCadastroUsuarioSistema.FormShow(Sender: TObject);
begin
      dmComprasEstoque.qryUsuariosSistema.Close;
      dmComprasEstoque.qryUsuariosSistema.Open;
end;

procedure TfrmCadastroUsuarioSistema.habilitaBotoes;
begin
      btnNovo.Enabled := not btnNovo.Enabled;
      btnEditar.Enabled := not btnEditar.Enabled;
      btnSalvar.Enabled := not btnSalvar.Enabled;
      btnCancelar.Enabled := not btnCancelar.Enabled;
      btnAcessos.Enabled := not btnAcessos.Enabled;
end;

procedure TfrmCadastroUsuarioSistema.limparCampos;
begin
      edtNome.Clear;
      edtSenha.Clear;
      edtConfirmacao.Clear;
      edtLogin.Clear;
end;

procedure TfrmCadastroUsuarioSistema.ToolButton1Click(Sender: TObject);
begin
   close;

end;

end.
