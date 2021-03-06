unit UFrmSearchProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.DBCtrls, Vcl.StdCtrls,
  Data.Win.ADODB, udmComprasEstoque, UCadProdutos;

type
  TFrmSearchProdutos = class(TForm)
    grdProdutos: TJvDBUltimGrid;
    ipSCategoria: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    qryProdutos: TADOQuery;
    dsProdutos: TDataSource;
    ipSProduto: TEdit;
    Label3: TLabel;
    qryCategorias: TADOQuery;
    dsCategorias: TDataSource;
    btnConfirmar: TButton;
    Button2: TButton;
    procedure grdProdutosCellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure grdProdutosDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ipSProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fetchProdutos();
    procedure ipSCategoriaCloseUp(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    idProdutoSelecionado: Integer;
  end;

var
  FrmSearchProdutos: TFrmSearchProdutos;

implementation

{$R *.dfm}

procedure TFrmSearchProdutos.Button2Click(Sender: TObject);
begin
  try
    frmCadProdutos := TfrmCadProdutos.Create(self);
    frmCadProdutos.showModal;
  finally
    frmCadProdutos.Free;
    qryProdutos.Close;
    qryProdutos.Open;
    dmComprasEstoque.atualizarProdutos;
  end;
end;

procedure TFrmSearchProdutos.ipSCategoriaCloseUp(Sender: TObject);
begin
  fetchProdutos;
end;

procedure TFrmSearchProdutos.ipSProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  fetchProdutos;
end;

procedure TFrmSearchProdutos.fetchProdutos;
var
  qry: String;
begin
  //
  qry := 'SELECT * FROM produto WHERE descricao LIKE ''' +
    ipSProduto.Text + '%''';

  if (ipSCategoria.Text <> '') then
  begin
    qry := qry + ' AND idcategoria = ' + IntToStr(ipSCategoria.KeyValue);
  end;
  with (qryProdutos) do
  begin
    Close;
    SQL.Clear;
    SQL.Add(qry);
    Open;
  end;

end;

procedure TFrmSearchProdutos.FormShow(Sender: TObject);
begin
  //
  qryCategorias.Open;
  qryProdutos.Open;
end;

procedure TFrmSearchProdutos.grdProdutosCellClick(Column: TColumn);
begin
  //
  self.idProdutoSelecionado := qryProdutos.FieldByName('produtoid').AsInteger;
end;

procedure TFrmSearchProdutos.grdProdutosDblClick(Sender: TObject);
begin
  //
  btnConfirmar.Click;
end;

end.
