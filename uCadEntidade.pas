unit uCadEntidade;

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
  Vcl.ComCtrls,
  Vcl.ToolWin,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Data.DB,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.ExtDlgs,
  System.UITypes,
  Data.Win.ADODB, System.ImageList;

type
  TfrmCadEntidade = class(TForm)
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
    ToolButton2: TToolButton;
    ImageListMainMenu: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    OpenPictureDialog1: TOpenPictureDialog;
    dblResp1: TDBLookupComboBox;
    Label15: TLabel;
    dblResp3: TDBLookupComboBox;
    Label16: TLabel;
    dblResp2: TDBLookupComboBox;
    Label17: TLabel;
    qryResp1: TADOQuery;
    qryResp1pessoasID: TAutoIncField;
    qryResp1nome: TStringField;
    qryResp1funcao: TStringField;
    qryResp1cpf: TStringField;
    dsQryResp1: TDataSource;
    qryResp2: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    dsQryResp2: TDataSource;
    qryResp3: TADOQuery;
    AutoIncField2: TAutoIncField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    dsQryResp3: TDataSource;
    Button1: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    PROcedure habilitabotoes();
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure atualizarResponsaveis();
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEntidade: TfrmCadEntidade;

implementation

{$R *.dfm}

uses
  udmComprasEstoque;

procedure TfrmCadEntidade.btnCancelarClick(Sender: TObject);
begin
  habilitabotoes;
  with dmComprasEstoque do
    qryEntidade.Cancel;

  Panel1.Enabled := false;
end;

procedure TfrmCadEntidade.btnEditarClick(Sender: TObject);
begin
  habilitabotoes;
  Panel1.Enabled := true;
  with dmComprasEstoque.qryEntidade do
  begin
    Edit;
    dblResp1.KeyValue := FieldByName('resp1_cic').AsString;
    dblResp2.KeyValue := FieldByName('resp2_cic').AsString;
    dblResp3.KeyValue := FieldByName('resp3_cic').AsString;

  end;
  DBEdit1.SetFocus;
end;

procedure TfrmCadEntidade.btnExcluirClick(Sender: TObject);
begin
  with dmComprasEstoque do
    if MessageDlg('Deseja excluir este Registro?', mtConfirmation, mbYesNo, 0) = mrYes
    then
    Begin
      qryEntidade.Delete;
      MessageBox(Application.Handle, 'Registro excluído com sucesso.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
    End;
end;

procedure TfrmCadEntidade.btnNovoClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitabotoes;
  with dmComprasEstoque do
    qryEntidade.Insert;
  DBEdit1.SetFocus;

end;

procedure TfrmCadEntidade.btnSalvarClick(Sender: TObject);
begin
  habilitabotoes;
  try

    with dmComprasEstoque do
    begin
      qryEntidadelogo.AsString := OpenPictureDialog1.FileName;
      qryEntidade.Post;
      MessageBox(Application.Handle, 'Cadastro realizado com sucesso.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
    end;
  except
  end;

  atualizarResponsaveis();
  Panel1.Enabled := false;
end;

procedure TfrmCadEntidade.Button1Click(Sender: TObject);
begin
  atualizarResponsaveis;
  ShowMessage('Responsáveis Atualizados com Sucesso.');
end;

procedure TfrmCadEntidade.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmCadEntidade.atualizarResponsaveis();
var
  qryEntidade: TADOQuery;
  script: String;
  i: Integer;
begin
  //
  script := 'UPDATE entidade set';
  script := script + ' resp1_nome = ''' + qryResp1.FieldByName('nome').AsString
    + ''', resp2_nome = ''' + qryResp2.FieldByName('nome').AsString +
    ''', resp3_nome = ''' + qryResp3.FieldByName('nome').AsString + ''', ';
  script := script + ' resp1_cic = ''' + qryResp1.FieldByName('cpf').AsString +
    ''', resp2_cic = ''' + qryResp2.FieldByName('cpf').AsString +
    ''', resp3_cic = ''' + qryResp3.FieldByName('cpf').AsString + ''', ';
  script := script + ' resp1_cargo = ''' + qryResp1.FieldByName('funcao')
    .AsString + ''', resp2_cargo = ''' + qryResp2.FieldByName('funcao').AsString
    + ''', resp3_cargo = ''' + qryResp3.FieldByName('funcao').AsString + ''' ';
  qryEntidade := TADOQuery.Create(nil);
  with (qryEntidade) do
  begin
    Connection := dmComprasEstoque.conexao;
    SQL.Text := script;
    ExecSQL;
  end;
end;

procedure TfrmCadEntidade.FormShow(Sender: TObject);
begin
  with dmComprasEstoque.qryEntidade do
  begin
    Open;
    qryResp1.Open;
    qryResp2.Open;
    qryResp3.Open;
    dblResp1.KeyValue := FieldByName('resp1_cic').AsString;
    dblResp2.KeyValue := FieldByName('resp2_cic').AsString;
    dblResp3.KeyValue := FieldByName('resp3_cic').AsString;
    try
      Image1.Picture.LoadFromFile(dmComprasEstoque.qryEntidadelogo.AsString);
    except

    end;

  end;
end;

procedure TfrmCadEntidade.habilitabotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmCadEntidade.Image1DblClick(Sender: TObject);
begin
  OpenPictureDialog1.Execute();
  if OpenPictureDialog1.FileName <> '' then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;

end;

procedure TfrmCadEntidade.ToolButton1Click(Sender: TObject);
begin
  dmComprasEstoque.qryEntidade.Cancel;
  dmComprasEstoque.qryEntidade.Close;
  Close;
end;

end.
