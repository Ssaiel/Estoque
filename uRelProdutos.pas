unit uRelProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  frxClass, frxDBSet, Data.DB, Data.Win.ADODB, frxExportRTF, frxExportPDF;

type
  TfrmRelatorioProdutos = class(TForm)
    chkCategoria: TCheckBox;
    chkTipoMaterial: TCheckBox;
    dblCategoria: TDBLookupComboBox;
    dblTipoMaterial: TDBLookupComboBox;
    btnImprimir: TBitBtn;
    qryRelatorioProdutos: TADOQuery;
    dsQryRelProdutos: TDataSource;
    frxDBRelatorioProdutos: TfrxDBDataset;
    frxRelatorioProdutos: TfrxReport;
    CheckBox1: TCheckBox;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioProdutos: TfrmRelatorioProdutos;

implementation

{$R *.dfm}

uses udmComprasEstoque;

procedure TfrmRelatorioProdutos.btnImprimirClick(Sender: TObject);
var qry : String;
begin
    qry := 'Select  e.nome as prefeitura, e.nomeuf as nomeestado, e.cnpj, e.logo, ';
    qry := qry + ' p.produtoID as CodigoProduto, p.descricao as NomeProduto, p.estoqueminino, p.estoquemaximo, p.estoque, ';
    qry := qry + ' c.descricao as Categoria, t.descricao as TipoProduto, u.descricao as Unidade ';
    qry := qry + ' from produto as p ';
    qry := qry + ' join entidade as e ';
    qry := qry + ' join categoria as c on c.categoriaID = p.idcategoria ';
    qry := qry + ' join tipoproduto as t on t.tipoId = p.idtipo ';
    qry := qry + ' join unidademedida as u on u.unidadeID = p.idunidade' ;
    qry := qry + ' WHERE 1';
    if chkCategoria.Checked then
        qry := qry + ' AND c.categoriaID = ''' + intToStr(dblCategoria.KeyValue) + '''';
    if chkTipoMaterial.Checked then
        qry := qry + ' AND t.tipoID = ''' + inttoStr(dblTipoMaterial.KeyValue) + '''';
    with qryRelatorioProdutos do begin
        Close;
        SQL.Clear;
        SQL.Add(qry);
        Open;
        if qryRelatorioProdutos.RecordCount <> 0  then begin
            frxRelatorioProdutos.LoadFromFile('Relatorios\RelatorioProdutos.fr3');
            if  FileExists(qryRelatorioProdutos.FieldByName('logo').AsString) = true then
                TfrxPictureView(frxRelatorioProdutos.FindComponent('Logomarca')).Picture.LoadFromFile(qryRelatorioProdutos.FieldByName('logo').AsString);
            if CheckBox1.Checked then
              TfrxGroupHeader(frxRelatorioProdutos.FindComponent('GroupHeader1')).StartNewPage := true;

            frxRelatorioProdutos.ShowReport();
        end
        else
            MessageBox(Application.Handle,'Não há itens a serem listados.', 'Compras & Estoque', MB_ICONINFORMATION + MB_OK)

    end;

end;

procedure TfrmRelatorioProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    with dmComprasEstoque do begin
      qryCategorias.Close;
      qryAlmoxarifado.Close;
      qryTipoProduto.Close;
    end;
end;

procedure TfrmRelatorioProdutos.FormShow(Sender: TObject);
begin
    with dmComprasEstoque do begin
      qryCategorias.Open;
      qryAlmoxarifado.Open;
      qryTipoProduto.Open;
    end;
end;

end.

