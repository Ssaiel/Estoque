unit uCadProdutos;

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
  Vcl.StdCtrls,
  Vcl.ImgList,
  Vcl.DBCtrls,
  Vcl.ExtCtrls,
  System.UITypes,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Data.Win.ADODB,
  Data.DB, System.ImageList;

type
  TfrmCadProdutos = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    btnPesquisar: TSpeedButton;
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
    Label4: TLabel;
    Label5: TLabel;
    chkCategoria: TCheckBox;
    chkTipoMaterial: TCheckBox;
    chkUnidadeMedida: TCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtDescricaoProduto: TEdit;
    edtEstoqueMinimo: TEdit;
    edtEstoqueMaximo: TEdit;
    edtPeso: TEdit;
    dblCategoria: TDBLookupComboBox;
    dblTipoMaterial: TDBLookupComboBox;
    dblUnidadeMedida: TDBLookupComboBox;
    Label9: TLabel;
    edtEstoque: TEdit;
    ToolButton2: TToolButton;
    chkNomeProduto: TCheckBox;
    edtNomeProduto: TEdit;
    SpeedButton1: TSpeedButton;
    ImageListMainMenu: TImageList;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure habilitaBotoes;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure limpaCampos;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure carragaDados;
    procedure chkNomeProdutoClick(Sender: TObject);
    procedure chkCategoriaClick(Sender: TObject);
    procedure chkTipoMaterialClick(Sender: TObject);
    procedure chkUnidadeMedidaClick(Sender: TObject);
    procedure edtDescricaoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtNomeProdutoChange(Sender: TObject);
    procedure DBLookupComboBox3CloseUp(Sender: TObject);
    procedure DBLookupComboBox4CloseUp(Sender: TObject);
    procedure DBLookupComboBox5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;
  tipo: Char;
  codigo: integer;

implementation

{$R *.dfm}

uses
  udmComprasEstoque;

procedure TfrmCadProdutos.btnCancelarClick(Sender: TObject);
begin
  Panel1.Enabled := false;
  habilitaBotoes;

end;

procedure TfrmCadProdutos.btnEditarClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitaBotoes;
  tipo := 'E';
end;

procedure TfrmCadProdutos.btnExcluirClick(Sender: TObject);
var
  qry: string;
  meuscomandos: TADOCommand;

begin
  meuscomandos := TADOCommand.Create(Self);
  meuscomandos.Connection := dmComprasEstoque.conexao;
  if MessageDlg('Deseja excluir este produto?', mtConfirmation, mbYesNo, 0) = mrYes
  then
  begin
    try
      qry := 'DELETE FROM PRODUTO WHERE PRODUTOID = :CODIGO';
      meuscomandos.CommandText := qry;
      meuscomandos.Parameters.Clear;
      meuscomandos.Parameters.AddParameter.Name := 'CODIGO';
      meuscomandos.Parameters.ParamByName('CODIGO').Value := codigo;
      dmComprasEstoque.conexao.BeginTrans;
      meuscomandos.Execute;
      dmComprasEstoque.conexao.CommitTrans;
      MessageBox(Application.Handle, 'Registro excluído com sucesso.',
        'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
      PageControl1.ActivePageIndex := 1;
      btnPesquisarClick(Self);
    except
      on e: Exception do
      begin
        ShowMessage(e.Message);
        dmComprasEstoque.conexao.RollbackTrans;
      end;

    end;
  end;
end;

procedure TfrmCadProdutos.btnNovoClick(Sender: TObject);
begin
  Panel1.Enabled := true;
  habilitaBotoes;
  tipo := 'N';
  edtDescricaoProduto.SetFocus;
  edtEstoqueMinimo.Text := '1';
  edtEstoqueMaximo.Text := '99999';
  edtPeso.Text := '0';
  edtEstoque.Text := '0';

end;

procedure TfrmCadProdutos.btnPesquisarClick(Sender: TObject);
var
  qry: string;
begin

  qry := 'Select p.*, c.descricao as categoria, u.descricao as unidade, tp.descricao as tipo ';
  qry := qry +
    ' from Produto p , categoria c , unidademedida u, tipoproduto tp ';
  qry := qry + ' where p.idcategoria = c.categoriaid ';
  qry := qry + ' and p.idunidade = u.unidadeid ';
  qry := qry + ' and p.idtipo = tp.tipoid ';
  if chkCategoria.Checked then
    qry := qry + ' and p.idcategoria = ''' +
      intToStr(DBLookupComboBox3.KeyValue) + '''';
  if chkTipoMaterial.Checked then
    qry := qry + ' and p.idtipo = ''' +
      intToStr(DBLookupComboBox4.KeyValue) + '''';
  if chkUnidadeMedida.Checked then
    qry := qry + ' and p.idunidade = ''' +
      intToStr(DBLookupComboBox5.KeyValue) + '''';

  if chkNomeProduto.Checked then
    qry := qry + ' and p.descricao Like ''' + trim(edtNomeProduto.Text) + '%''';

  with dmComprasEstoque, qryProdutos do
  begin
    close;
    SQL.Clear;
    SQL.Add(qry);
    open;
  end;

end;

procedure TfrmCadProdutos.btnSalvarClick(Sender: TObject);
var
  qry: string;
  meuscomandos: TADOCommand;

begin
  meuscomandos := TADOCommand.Create(Self);
  meuscomandos.Connection := dmComprasEstoque.conexao;
  habilitaBotoes;
  case tipo of
    'N':
      begin
        qry := ' INSERT INTO PRODUTO(descricao,idcategoria, idtipo, idunidade, peso, estoqueminino, estoquemaximo, estoque)';
        qry := qry +
          ' VALUES (:descricao,:idcategoria, :idtipo, :idunidade, :peso, :estoqueminimo, :estoquemaximo, :estoque)';
        meuscomandos.CommandText := qry;
        meuscomandos.Parameters.Clear;
        // Adicionando os parametros no command
        meuscomandos.Parameters.AddParameter.Name := 'descricao';
        meuscomandos.Parameters.AddParameter.Name := 'idcategoria';
        meuscomandos.Parameters.AddParameter.Name := 'idtipo';
        meuscomandos.Parameters.AddParameter.Name := 'idunidade';
        meuscomandos.Parameters.AddParameter.Name := 'peso';
        meuscomandos.Parameters.AddParameter.Name := 'estoqueminimo';
        meuscomandos.Parameters.AddParameter.Name := 'estoquemaximo';
        meuscomandos.Parameters.AddParameter.Name := 'estoque';
        // Atribuindo valores aos parametros
        meuscomandos.Parameters.ParamByName('descricao').Value :=
          UpperCase(edtDescricaoProduto.Text);
        meuscomandos.Parameters.ParamByName('idcategoria').Value :=
          dblCategoria.KeyValue;
        meuscomandos.Parameters.ParamByName('idtipo').Value :=
          dblTipoMaterial.KeyValue;
        meuscomandos.Parameters.ParamByName('idunidade').Value :=
          dblUnidadeMedida.KeyValue;

        meuscomandos.Parameters.ParamByName('peso').Value :=
          UpperCase(edtPeso.Text);
        meuscomandos.Parameters.ParamByName('estoqueminimo').Value :=
          edtEstoqueMinimo.Text;
        meuscomandos.Parameters.ParamByName('estoquemaximo').Value :=
          edtEstoqueMaximo.Text;
        meuscomandos.Parameters.ParamByName('estoque').Value := edtEstoque.Text;

        try
          dmComprasEstoque.conexao.BeginTrans;
          meuscomandos.Execute;
          dmComprasEstoque.conexao.CommitTrans;
          MessageBox(Application.Handle, 'Cadastro realizado com sucesso.',
            'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
        Except
          on e: Exception do
          begin
            ShowMessage(e.Message);
            dmComprasEstoque.conexao.RollbackTrans;
          end;
        end;
      end;
    'E':
      Begin
        qry := ' UPDATE PRODUTO SET descricao = :descricao,idcategoria = :idcategoria, idtipo = :idtipo';
        qry := qry +
          ' , idunidade = :idunidade, peso = :peso, estoqueminino = :estoqueminimo, estoquemaximo = :estoquemaximo';
        qry := qry + ' , estoque = :estoque';
        qry := qry + ' WHERE produtoID = :codi ';
        meuscomandos.CommandText := qry;
        meuscomandos.Parameters.Clear;
        // Adicionando os parametros no command
        meuscomandos.Parameters.AddParameter.Name := 'descricao';
        meuscomandos.Parameters.AddParameter.Name := 'idcategoria';
        meuscomandos.Parameters.AddParameter.Name := 'idtipo';
        meuscomandos.Parameters.AddParameter.Name := 'idunidade';
        meuscomandos.Parameters.AddParameter.Name := 'peso';
        meuscomandos.Parameters.AddParameter.Name := 'estoqueminimo';
        meuscomandos.Parameters.AddParameter.Name := 'estoquemaximo';
        meuscomandos.Parameters.AddParameter.Name := 'estoque';
        meuscomandos.Parameters.AddParameter.Name := 'codi';
        // Atribuindo valores aos parametros
        meuscomandos.Parameters.ParamByName('descricao').Value :=
          UpperCase(edtDescricaoProduto.Text);
        meuscomandos.Parameters.ParamByName('idcategoria').Value :=
          dblCategoria.KeyValue;
        meuscomandos.Parameters.ParamByName('idtipo').Value :=
          dblTipoMaterial.KeyValue;
        meuscomandos.Parameters.ParamByName('idunidade').Value :=
          dblUnidadeMedida.KeyValue;

        meuscomandos.Parameters.ParamByName('peso').Value :=
          UpperCase(edtPeso.Text);
        meuscomandos.Parameters.ParamByName('estoqueminimo').Value :=
          edtEstoqueMinimo.Text;
        meuscomandos.Parameters.ParamByName('estoquemaximo').Value :=
          edtEstoqueMaximo.Text;
        meuscomandos.Parameters.ParamByName('estoque').Value := edtEstoque.Text;
        meuscomandos.Parameters.ParamByName('codi').Value := codigo;

        try
          dmComprasEstoque.conexao.BeginTrans;
          meuscomandos.Execute;
          dmComprasEstoque.conexao.CommitTrans;
          MessageBox(Application.Handle, 'Registro salvo com sucesso.',
            'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
        Except
          on e: Exception do
          begin
            ShowMessage(e.Message);
            dmComprasEstoque.conexao.RollbackTrans;
          end;
        end;
      end;
  end;
  limpaCampos;
  btnPesquisarClick(Self);
end;

procedure TfrmCadProdutos.carragaDados;
begin
  with dmComprasEstoque do
  begin
    edtDescricaoProduto.Text := qryProdutos.FieldByName('descricao').AsString;
    dblCategoria.KeyValue := qryProdutos.FieldByName('idcategoria').AsInteger;
    dblTipoMaterial.KeyValue := qryProdutos.FieldByName('idtipo').AsInteger;
    dblUnidadeMedida.KeyValue := qryProdutos.FieldByName('idunidade').AsInteger;
    edtEstoqueMinimo.Text := qryProdutos.FieldByName('estoqueminino').AsString;
    edtEstoqueMaximo.Text := qryProdutos.FieldByName('estoquemaximo').AsString;
    edtPeso.Text := qryProdutos.FieldByName('peso').AsString;
    edtEstoque.Text := qryProdutos.FieldByName('estoque').AsString;
  end;
end;

procedure TfrmCadProdutos.chkCategoriaClick(Sender: TObject);
begin
  DBLookupComboBox3.SetFocus;
  if DBLookupComboBox3.Text = '' then
    chkCategoria.Checked := false;
end;

procedure TfrmCadProdutos.chkNomeProdutoClick(Sender: TObject);
begin
  edtNomeProduto.SetFocus;
  if edtNomeProduto.Text = '' then
    chkNomeProduto.Checked := false;
end;

procedure TfrmCadProdutos.chkTipoMaterialClick(Sender: TObject);
begin
  DBLookupComboBox4.SetFocus;
  if DBLookupComboBox4.Text = '' then
    chkTipoMaterial.Checked := false;
end;

procedure TfrmCadProdutos.chkUnidadeMedidaClick(Sender: TObject);
begin
  DBLookupComboBox5.SetFocus;
  if DBLookupComboBox5.Text = '' then
    chkUnidadeMedida.Checked := false;
end;

procedure TfrmCadProdutos.DBGrid1DblClick(Sender: TObject);
begin
  codigo := dmComprasEstoque.qryProdutos.FieldByName('produtoId').AsInteger;
  PageControl1.ActivePageIndex := 1;
  carragaDados;
end;

procedure TfrmCadProdutos.DBLookupComboBox3CloseUp(Sender: TObject);
begin
  if (DBLookupComboBox3.Text <> '') then
    chkCategoria.Checked := true
  else
    chkCategoria.Checked := false;
end;

procedure TfrmCadProdutos.DBLookupComboBox4CloseUp(Sender: TObject);
begin
  if (DBLookupComboBox4.Text <> '') then
    chkTipoMaterial.Checked := true
  else
    chkTipoMaterial.Checked := false;
end;

procedure TfrmCadProdutos.DBLookupComboBox5Click(Sender: TObject);
begin
  if (DBLookupComboBox5.Text <> '') then
    chkUnidadeMedida.Checked := true
  else
    chkUnidadeMedida.Checked := false;
end;

procedure TfrmCadProdutos.edtDescricaoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmCadProdutos.edtNomeProdutoChange(Sender: TObject);
begin
  if (edtNomeProduto.Text <> '') then
    chkNomeProduto.Checked := true
  else
    chkNomeProduto.Checked := false;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmComprasEstoque do
  begin
    qryCategorias.close;
    qryUnidade.close;
    qryTipoProduto.close;
  end;
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  with dmComprasEstoque do
  begin
    qryCategorias.open;
    qryUnidade.open;
    qryTipoProduto.open;
  end;
end;

procedure TfrmCadProdutos.habilitaBotoes;
begin
  btnNovo.Enabled := not btnNovo.Enabled;
  btnEditar.Enabled := not btnEditar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
end;

procedure TfrmCadProdutos.limpaCampos;
begin
  edtDescricaoProduto.Clear;
  edtEstoqueMinimo.Clear;
  edtEstoqueMaximo.Clear;
  edtPeso.Clear;
  dblCategoria.KeyValue := 0;
  dblTipoMaterial.KeyValue := 0;
  dblUnidadeMedida.KeyValue := 0;

end;

procedure TfrmCadProdutos.SpeedButton1Click(Sender: TObject);
Var
  xDescricao: String;
begin
  xDescricao := InputBox('Inclusão de Tipo de Material',
    'Descrição do Tipo', '');
  if xDescricao <> '' then
  begin
    dmComprasEstoque.comandos.CommandText :=
      'INSERT INTO TIPOPRODUTO(DESCRICAO) VALUES(''' + xDescricao + ''')';
    dmComprasEstoque.comandos.Execute;
    dmComprasEstoque.qryTipoProduto.close;
    dmComprasEstoque.qryTipoProduto.open;
  end;

end;

procedure TfrmCadProdutos.ToolButton1Click(Sender: TObject);
begin
  close;
end;

end.
