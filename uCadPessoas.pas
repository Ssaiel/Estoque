unit uCadPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.UITypes, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask;

type
  TfrmCadPessoas = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btnPesquisar: TSpeedButton;
    edtPesquisa: TEdit;
    TabSheet3: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    btnNovo: TToolButton;
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
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    ToolButton2: TToolButton;
    Label4: TLabel;
    edtCPF: TEdit;
    ImageListMainMenu: TImageList;
    procedure FormShow(Sender: TObject);
    procedure habilitabotoes;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoas: TfrmCadPessoas;

implementation

{$R *.dfm}

uses udmComprasEstoque;

procedure TfrmCadPessoas.btnCancelarClick(Sender: TObject);
begin
  habilitabotoes;
  WITH dmComprasEstoque do
    qryPessoas.Cancel;
  Panel1.Enabled := false;
end;

procedure TfrmCadPessoas.btnEditarClick(Sender: TObject);
begin
  habilitabotoes;
  Panel1.Enabled := true;
  WITH dmComprasEstoque do
    qryPessoas.Edit;
  DBEdit1.SetFocus;
end;

procedure TfrmCadPessoas.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este usuário?',mtConfirmation,mbYesNo,0) = mrYes then Begin
    WITH dmComprasEstoque do
      qryPessoas.Delete;
    MessageBox(Application.Handle,'Registro excluído com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK );
  End;
end;

procedure TfrmCadPessoas.btnNovoClick(Sender: TObject);
begin
  habilitabotoes;
  Panel1.Enabled := true;
  WITH dmComprasEstoque do
    qryPessoas.Insert;
  DBEdit1.SetFocus;
end;

procedure TfrmCadPessoas.btnPesquisarClick(Sender: TObject);
var   qry : string;
begin

  qry := 'SELECT * FROM PESSOAS WHERE cpf <> 0 ';

  if edtPesquisa.Text <> '' then
      qry := qry + ' AND  NOME LIKE ''' + UpperCase(edtPesquisa.Text) + '%''';
  if edtCPF.Text <> '' then
      qry := qry + ' AND CPF = ''' + edtCPF.Text + '''';

  with dmComprasEstoque, qryPessoas do begin
    close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
  end;
end;

procedure TfrmCadPessoas.btnSalvarClick(Sender: TObject);
begin
  habilitabotoes;
  WITH dmComprasEstoque do
    qryPessoas.Post;

    MessageBox(Application.Handle,'Cadastro realizado com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK );
    Panel1.Enabled := false;
end;

procedure TfrmCadPessoas.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then begin
       key := #0;
       Perform(WM_NEXTDLGCTL, 0 , 0);
    end;

end;

procedure TfrmCadPessoas.DBGrid1DblClick(Sender: TObject);
begin
    PageControl1.ActivePageIndex := 1;
end;

procedure TfrmCadPessoas.edtCPFKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13  then
      btnPesquisarClick(self);
end;

procedure TfrmCadPessoas.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13  then
      btnPesquisarClick(self);
end;

procedure TfrmCadPessoas.FormShow(Sender: TObject);
begin
    PageControl1.ActivePageIndex := 1;
    with dmComprasEstoque, qryPessoas do begin
      open;
    end;

end;

procedure TfrmCadPessoas.habilitabotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmCadPessoas.ToolButton1Click(Sender: TObject);
begin
  close;
end;

end.

