unit ucadFornecedor;

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
  Vcl.ImgList,
  Vcl.DBCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  System.UITypes,
  Vcl.ToolWin,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Mask,
  Data.DB, System.ImageList, JvExMask, JvToolEdit, JvMaskEdit, JvDBControls,
  UUtils;

type
  TfrmCadFornecedor = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    btnPesquisar: TSpeedButton;
    edtPesquisa: TEdit;
    chkRazaoSocial: TCheckBox;
    chkCpfCnpj: TCheckBox;
    edtcnpjcpf: TMaskEdit;
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
    ToolButton2: TToolButton;
    PageControl3: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
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
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel2: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    ImageListMainMenu: TImageList;
    JvDBMaskEdit1: TJvDBMaskEdit;
    JvDBMaskEdit2: TJvDBMaskEdit;
    ipCic: TJvDBMaskEdit;
    procedure habilitabotoes;
    procedure ToolButton1Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtcnpjcpfChange(Sender: TObject);
    procedure chkRazaoSocialClick(Sender: TObject);
    procedure chkCpfCnpjClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornecedor: TfrmCadFornecedor;
  utils: TUtils;

implementation

{$R *.dfm}

uses
  udmComprasEstoque;

procedure TfrmCadFornecedor.btnCancelarClick(Sender: TObject);
begin
  habilitabotoes;
  Panel1.Enabled := not Panel1.Enabled;
  Panel2.Enabled := not Panel2.Enabled;
  with dmComprasEstoque do
  begin
    qryFornecedor.Cancel;
  end;
end;

procedure TfrmCadFornecedor.btnEditarClick(Sender: TObject);
begin
  habilitabotoes;
  Panel1.Enabled := not Panel1.Enabled;
  Panel2.Enabled := not Panel2.Enabled;
  with dmComprasEstoque do
  begin
    qryFornecedor.Edit;
  end;
  ipCic.SetFocus;
end;

procedure TfrmCadFornecedor.btnExcluirClick(Sender: TObject);
begin
  with dmComprasEstoque do
  begin
    if MessageDlg('Deseja excluir este fornecedor.', mtConfirmation, mbYesNo, 0)
      = mrYes then
    Begin
      qryFornecedor.Delete;
      MessageBox(Application.Handle, 'Registro excluído com sucesso.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
    End;
  end;
end;

procedure TfrmCadFornecedor.btnNovoClick(Sender: TObject);
begin
  habilitabotoes;
  Panel1.Enabled := not Panel1.Enabled;
  Panel2.Enabled := not Panel2.Enabled;
  with dmComprasEstoque do
  begin
    qryFornecedor.Insert;
    ipCic.SetFocus;
  end;
end;

procedure TfrmCadFornecedor.btnPesquisarClick(Sender: TObject);
var
  qry: string;
begin
  qry := 'SELECT * FROM FORNECEDOR WHERE 1 ';
  if chkRazaoSocial.Checked then
    qry := qry + ' AND razaosocial like ''' +
      UpperCase(edtPesquisa.Text) + '%''';
  if chkCpfCnpj.Checked then
    qry := qry + ' AND CPFCNPJ = ''' + edtcnpjcpf.Text + '''';

  qry := qry + ' ORDER BY razaosocial ';
  with dmComprasEstoque do
  begin
    qryFornecedor.Close;
    qryFornecedor.SQL.Clear;
    qryFornecedor.SQL.Add(qry);
    qryFornecedor.Open;
  end;

end;

procedure TfrmCadFornecedor.btnSalvarClick(Sender: TObject);
begin
  habilitabotoes;
  Panel1.Enabled := not Panel1.Enabled;
  Panel2.Enabled := not Panel2.Enabled;
  with dmComprasEstoque do
  begin
    qryFornecedor.Post;
    MessageBox(Application.Handle, 'Registro salvo com sucesso.',
      'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
    PageControl1.ActivePageIndex := 1;
    btnPesquisarClick(self);
  end;
end;

procedure TfrmCadFornecedor.chkCpfCnpjClick(Sender: TObject);
begin
  if (edtcnpjcpf.Text = '') then
    chkCpfCnpj.Checked := false;
end;

procedure TfrmCadFornecedor.chkRazaoSocialClick(Sender: TObject);
begin
  if (edtPesquisa.Text = '') then
    chkRazaoSocial.Checked := false;
end;

procedure TfrmCadFornecedor.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmCadFornecedor.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  DBEdit2KeyPress(self, Key);
end;

procedure TfrmCadFornecedor.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TfrmCadFornecedor.edtcnpjcpfChange(Sender: TObject);
begin
  if (edtcnpjcpf.Text <> '') then
    chkCpfCnpj.Checked := true
  else
    chkCpfCnpj.Checked := false;
end;

procedure TfrmCadFornecedor.edtPesquisaChange(Sender: TObject);
begin
  if (edtPesquisa.Text <> '') then
    chkRazaoSocial.Checked := true
  else
    chkRazaoSocial.Checked := false;
end;

procedure TfrmCadFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmComprasEstoque do
  begin
    qryFornecedor.Close;
    qryFornecedor.SQL.Clear;
    qryFornecedor.SQL.Add(' SELECT * FROM fornecedor ORDER BY razaosocial ');
    qryCidades.Close;
    qryBancos.Close;
  end;
end;

procedure TfrmCadFornecedor.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  PageControl3.ActivePageIndex := 0;
  with dmComprasEstoque do
  begin
    qryFornecedor.Open;
    qryCidades.Open;
    qryBancos.Open;
  end;
end;

procedure TfrmCadFornecedor.habilitabotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmCadFornecedor.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

end.
