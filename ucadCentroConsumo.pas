unit ucadCentroConsumo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.UITypes, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask;

type
  TfrmCadCentroConsumo = class(TForm)
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
    DBLookupResponsavelSetor: TDBLookupComboBox;
    ToolButton2: TToolButton;
    DBEdit1: TDBEdit;
    CheckBox1: TCheckBox;
    DBLookupPesquisaResp: TDBLookupComboBox;
    ImageListMainMenu: TImageList;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure habilitabotoes;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCentroConsumo: TfrmCadCentroConsumo;

implementation

{$R *.dfm}

uses udmComprasEstoque;

procedure TfrmCadCentroConsumo.btnCancelarClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  habilitabotoes;
  with dmComprasEstoque do begin
    qryCentroConsumo.Cancel;
  end;

end;

procedure TfrmCadCentroConsumo.btnEditarClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  habilitabotoes;
  with dmComprasEstoque do begin
    qryCentroConsumo.Edit;
  end;
  DBEdit1.SetFocus;

end;

procedure TfrmCadCentroConsumo.btnExcluirClick(Sender: TObject);
begin
  with dmComprasEstoque do begin
    if MessageDlg('Deseja excluir este centro de consumo?',mtConfirmation,mbYesNo,0) = mrYes then Begin
      qryCentroConsumo.Delete;
      MessageBox(Application.Handle,'Registro excluído com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK );
    End;
  end;

end;

procedure TfrmCadCentroConsumo.btnNovoClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  DBEdit1.SetFocus;
  habilitabotoes;
  with dmComprasEstoque do begin
    qryCentroConsumo.Insert;
  end;
end;

procedure TfrmCadCentroConsumo.btnPesquisarClick(Sender: TObject);
var qry :string;
begin
    qry := '  select * from centroconsumo where centroconsumoId > 0 ';
    if(edtPesquisa.Text <> '') then begin
      qry := qry + ' and centroconsumoID = ''' + edtPesquisa.Text + '''';
    end;
    if CheckBox1.Checked then begin
      qry := qry + ' and pessoasID = ''' + IntToStr(DBLookupPesquisaResp.KeyValue) + '''';
    end;
    with dmComprasEstoque do begin
      qryCentroConsumo.Close;
      qryCentroConsumo.SQL.Clear;
      qryCentroConsumo.SQL.Add(qry);
      qryCentroConsumo.Open;
    end;


end;

procedure TfrmCadCentroConsumo.btnSalvarClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  habilitabotoes;
  with dmComprasEstoque do begin
    qryCentroConsumo.Post;
  end;
  MessageBox(Application.Handle,'Cadastro realizado com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK );
  btnPesquisarClick(self);

end;

procedure TfrmCadCentroConsumo.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13  then begin
    key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmCadCentroConsumo.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TfrmCadCentroConsumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmComprasEstoque do begin
    qryCentroConsumo.Close;
    qryPessoas.Close;
  end;

end;

procedure TfrmCadCentroConsumo.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  with dmComprasEstoque do begin
    qryCentroConsumo.Open;
    qryPessoas.Open;
    btnPesquisarClick(self);
  end;
end;

procedure TfrmCadCentroConsumo.habilitabotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmCadCentroConsumo.ToolButton1Click(Sender: TObject);
begin
  close;
end;

end.
