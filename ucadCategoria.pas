unit ucadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, System.UITypes, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, System.ImageList;

type
  TfrmCadCategoria = class(TForm)
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
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    ToolButton2: TToolButton;
    ImageListMainMenu: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure habilitabotoes;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

uses udmComprasEstoque;

procedure TfrmCadCategoria.btnCancelarClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled ;
  habilitabotoes;
  with dmComprasEstoque do begin
    qryCategorias.Cancel;
  end;
end;

procedure TfrmCadCategoria.btnEditarClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  habilitabotoes;
  with dmComprasEstoque do begin
    qryCategorias.Edit;
  end;
  DBEdit1.SetFocus;
end;

procedure TfrmCadCategoria.btnExcluirClick(Sender: TObject);
begin
  with dmComprasEstoque do begin
    if MessageDlg('Deseja excluir esta categoria?',mtConfirmation,mbYesNo,0) = mrYes then Begin
        qryCategorias.Delete;
        MessageBox(Application.Handle,'Registro excluído com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK );
    End;
  end;
end;

procedure TfrmCadCategoria.btnNovoClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  DBEdit1.SetFocus;
  habilitabotoes;
  with dmComprasEstoque do begin
    qryCategorias.insert;
  end;
end;

procedure TfrmCadCategoria.btnSalvarClick(Sender: TObject);
begin
  Panel1.Enabled := not Panel1.Enabled;
  habilitabotoes;
  with dmComprasEstoque do begin
    qryCategorias.Post;
  end;
  MessageBox(Application.Handle,'Cadastro realizado com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK );
end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmComprasEstoque do begin
    qryCategorias.close;
  end;
end;

procedure TfrmCadCategoria.FormShow(Sender: TObject);
begin
  with dmComprasEstoque do begin
    qryCategorias.Open;
  end;
end;

procedure TfrmCadCategoria.habilitabotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmCadCategoria.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

end.
