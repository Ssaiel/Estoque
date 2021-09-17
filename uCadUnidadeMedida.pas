unit uCadUnidadeMedida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Grids, System.UITypes, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadUnidadeMedida = class(TForm)
    DBGrid1: TDBGrid;
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
    ImageListMainMenu: TImageList;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure habilitaBotoes;
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidadeMedida: TfrmCadUnidadeMedida;

implementation

{$R *.dfm}

uses udmComprasEstoque;

procedure TfrmCadUnidadeMedida.btnCancelarClick(Sender: TObject);
begin
    dmComprasEstoque.qryUnidade.Cancel;
    habilitaBotoes;
end;

procedure TfrmCadUnidadeMedida.btnEditarClick(Sender: TObject);
begin
    dmComprasEstoque.qryUnidade.Edit;
    habilitaBotoes;
    DBEdit1.SetFocus;
end;

procedure TfrmCadUnidadeMedida.btnExcluirClick(Sender: TObject);
begin
    if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
       dmComprasEstoque.qryUnidade.Delete;
       MessageBox(Application.Handle,'Registro excluído com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK );
    end;

end;

procedure TfrmCadUnidadeMedida.btnNovoClick(Sender: TObject);
begin
    dmComprasEstoque.qryUnidade.Insert;
    habilitaBotoes;
    DBEdit1.SetFocus;
end;

procedure TfrmCadUnidadeMedida.btnSalvarClick(Sender: TObject);
begin
    dmComprasEstoque.qryUnidade.post;
    MessageBox(Application.Handle,'Cadastro realizado com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK );
    habilitaBotoes;
end;

procedure TfrmCadUnidadeMedida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmComprasEstoque.qryUnidade.close;
end;

procedure TfrmCadUnidadeMedida.FormShow(Sender: TObject);
begin
  dmComprasEstoque.qryUnidade.Open;
end;

procedure TfrmCadUnidadeMedida.habilitaBotoes;
begin
    btnNovo.Enabled := not btnNovo.Enabled;
    btnEditar.Enabled := not btnEditar.Enabled;
    btnSalvar.Enabled := not btnSalvar.Enabled;
    btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure TfrmCadUnidadeMedida.ToolButton1Click(Sender: TObject);
begin
  close;
end;

end.
