unit ufrmCadAlmoxarifado;

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
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.ComCtrls,
  Vcl.ImgList,
  Vcl.ToolWin,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Data.Win.ADODB,
  Data.DB,
  System.UITypes;

type
  TfrmAlmoxarifado = class( TForm )
    PageControl1 : TPageControl;
    TabSheet2 : TTabSheet;
    TabSheet3 : TTabSheet;
    ToolBar1 : TToolBar;
    btnNovo : TToolButton;
    btnEditar : TToolButton;
    btnSalvar : TToolButton;
    btnCancelar : TToolButton;
    btnExcluir : TToolButton;
    ToolButton6 : TToolButton;
    ToolButton7 : TToolButton;
    ToolButton8 : TToolButton;
    ToolButton9 : TToolButton;
    ToolButton10 : TToolButton;
    DBGrid1 : TDBGrid;
    GroupBox1 : TGroupBox;
    Label1 : TLabel;
    edtPesquisa : TEdit;
    btnPesquisar : TSpeedButton;
    Panel1 : TPanel;
    Label2 : TLabel;
    Label3 : TLabel;
    Label4 : TLabel;
    Label5 : TLabel;
    DBLookupComboBox1 : TDBLookupComboBox;
    DBLookupComboBox2 : TDBLookupComboBox;
    edtNivelDotacao : TEdit;
    edtNomeAlmoxarifado : TEdit;
    ToolButton1 : TToolButton;
    ToolButton2 : TToolButton;
    ImageListMainMenu : TImageList;
    procedure btnPesquisarClick( Sender : TObject );
    procedure btnNovoClick( Sender : TObject );
    procedure btnEditarClick( Sender : TObject );
    procedure btnSalvarClick( Sender : TObject );
    procedure DBGrid1DblClick( Sender : TObject );
    procedure carregaDados( );
    procedure FormShow( Sender : TObject );
    procedure habilitabotoes( );
    procedure btnCancelarClick( Sender : TObject );
    procedure btnExcluirClick( Sender : TObject );
    procedure limpaCampos( );
    procedure FormClose(
      Sender     : TObject;
      var Action : TCloseAction );
    procedure ToolButton1Click( Sender : TObject );
    procedure edtNomeAlmoxarifadoKeyPress(
      Sender  : TObject;
      var Key : Char );
    private
      { Private declarations }
    public
      { Public declarations }
  end;

var
  frmAlmoxarifado : TfrmAlmoxarifado;
  tipo : Char;
  // armazena o codigo escolhido pelo duplo clique no grid.
  codigo : integer;

implementation

{$R *.dfm}

uses
  udmComprasEstoque;

procedure TfrmAlmoxarifado.btnPesquisarClick( Sender : TObject );
  var
    qry : String;
  begin
    with dmComprasEstoque do
    begin
      qryAlmoxarifado.Close;
      qryAlmoxarifado.SQL.Clear;
      qry := 'SELECT * FROM ALMOXARIFADO';
      if edtPesquisa.Text <> ''
      then
        qry := qry + ' WHERE DESCRICAO LIKE ''' + edtPesquisa.Text + '%''';
      qry := qry + ' ORDER BY ALMOXARIFADOID';
      qryAlmoxarifado.SQL.Add( qry );
      qryAlmoxarifado.Open;
    end;
  end;

procedure TfrmAlmoxarifado.carregaDados;
  begin
    edtNomeAlmoxarifado.Text := dmComprasEstoque.qryAlmoxarifado.FieldByName
      ( 'descricao' ).AsString;
    DBLookupComboBox1.KeyValue := dmComprasEstoque.qryAlmoxarifado.FieldByName
      ( 'idresponsavelautorizacao' ).AsInteger;
    DBLookupComboBox2.KeyValue := dmComprasEstoque.qryAlmoxarifado.FieldByName
      ( 'idresponsaveldespacho' ).AsInteger;
    edtNivelDotacao.Text := dmComprasEstoque.qryAlmoxarifado.FieldByName
      ( 'niveldotacao' ).AsString;
  end;

procedure TfrmAlmoxarifado.DBGrid1DblClick( Sender : TObject );
  begin
    codigo := dmComprasEstoque.qryAlmoxarifado.FieldByName( 'almoxarifadoid' )
      .AsInteger;
    PageControl1.ActivePageIndex := 1;
    dmComprasEstoque.qryResponsavelDespacho.Open;
    dmComprasEstoque.qryResponsavelAutorizacao.Open;
    carregaDados( );
  end;

procedure TfrmAlmoxarifado.edtNomeAlmoxarifadoKeyPress(
  Sender  : TObject;
  var Key : Char );
  begin
    if Key = #13
    then
    begin
      Key := #0;
      Perform( WM_NEXTDLGCTL, 0, 0 );
    end;

  end;

procedure TfrmAlmoxarifado.FormClose(
  Sender     : TObject;
  var Action : TCloseAction );
  begin
    with dmComprasEstoque do
    begin
      qryAlmoxarifado.Close( );
      qryResponsavelDespacho.Close;
      qryResponsavelAutorizacao.Close;
    end;
  end;

procedure TfrmAlmoxarifado.FormShow( Sender : TObject );
  begin
    PageControl1.ActivePageIndex := 1;
    btnPesquisarClick( self );
  end;

procedure TfrmAlmoxarifado.habilitabotoes;
  begin
    btnNovo.Enabled := not btnNovo.Enabled;
    btnEditar.Enabled := not btnEditar.Enabled;
    btnSalvar.Enabled := not btnSalvar.Enabled;
    btnCancelar.Enabled := not btnCancelar.Enabled;
    btnExcluir.Enabled := not btnExcluir.Enabled;
  end;

procedure TfrmAlmoxarifado.limpaCampos;
  begin
    edtNomeAlmoxarifado.Clear;
    edtNivelDotacao.Clear;
    DBLookupComboBox1.KeyValue := 0;
    DBLookupComboBox2.KeyValue := 0;

  end;

procedure TfrmAlmoxarifado.ToolButton1Click( Sender : TObject );
  begin
    frmAlmoxarifado.Close;
  end;

procedure TfrmAlmoxarifado.btnNovoClick( Sender : TObject );
  begin
    habilitabotoes;
    limpaCampos;
    tipo := 'N';
    Panel1.Enabled := not Panel1.Enabled;
    with dmComprasEstoque do
    begin
      qryResponsavelDespacho.Open;
      qryResponsavelAutorizacao.Open;
    end;
    edtNomeAlmoxarifado.SetFocus;
  end;

procedure TfrmAlmoxarifado.btnCancelarClick( Sender : TObject );
  begin
    habilitabotoes;
    Panel1.Enabled := not Panel1.Enabled;
  end;

procedure TfrmAlmoxarifado.btnEditarClick( Sender : TObject );
  begin
    habilitabotoes;
    tipo := 'E';
    Panel1.Enabled := not Panel1.Enabled;
    edtNomeAlmoxarifado.SetFocus;
  end;

procedure TfrmAlmoxarifado.btnExcluirClick( Sender : TObject );
  var
    qry : string;
    meuscomandos : TADOCommand;

  begin
    meuscomandos := TADOCommand.Create( self );
    meuscomandos.Connection := dmComprasEstoque.conexao;
    if MessageDlg( 'Deseja excluir este registro?', mtConfirmation, mbYesNo,
      0 ) = mrYes
    then
    begin
      try
        qry := 'DELETE FROM ALMOXARIFADO WHERE ALMOXARIFADOID = :CODIGO';
        meuscomandos.CommandText := qry;
        meuscomandos.Parameters.Clear;
        meuscomandos.Parameters.AddParameter.Name := 'CODIGO';
        meuscomandos.Parameters.ParamByName( 'CODIGO' ).Value := codigo;
        dmComprasEstoque.conexao.BeginTrans;
        meuscomandos.Execute;
        dmComprasEstoque.conexao.CommitTrans;
        MessageBox( Application.Handle, 'Registro excluído com sucesso.',
          'Compras & Estoque', MB_ICONINFORMATION + MB_OK );
        PageControl1.ActivePageIndex := 0;
        btnPesquisarClick( self );
      except
        on e : Exception do
        begin
          ShowMessage( e.Message );
          dmComprasEstoque.conexao.RollbackTrans;
        end;

      end;
    end;

  end;

procedure TfrmAlmoxarifado.btnSalvarClick( Sender : TObject );
  var
    qry : string;
    meuscomandos : TADOCommand;
  begin
    meuscomandos := TADOCommand.Create( self );
    meuscomandos.Connection := dmComprasEstoque.conexao;
    habilitabotoes;

    case tipo of
      'N' :
        begin
          qry := ' INSERT INTO ALMOXARIFADO(descricao,idresponsavelautorizacao,idresponsaveldespacho,niveldotacao)';
          qry := qry + ' VALUES (:descricao,:respoAuto,:respDesp,:nivel)';
          meuscomandos.CommandText := qry;
          meuscomandos.Parameters.Clear;
          // Adicionando os parametros no command
          meuscomandos.Parameters.AddParameter.Name := 'descricao';
          meuscomandos.Parameters.AddParameter.Name := 'respoAuto';
          meuscomandos.Parameters.AddParameter.Name := 'respDesp';
          meuscomandos.Parameters.AddParameter.Name := 'nivel';
          // Atribuindo valores aos parametros
          meuscomandos.Parameters.ParamByName( 'descricao' ).Value :=
            UpperCase( edtNomeAlmoxarifado.Text );
          meuscomandos.Parameters.ParamByName( 'respoAuto' ).Value :=
            DBLookupComboBox1.KeyValue;
          meuscomandos.Parameters.ParamByName( 'respDesp' ).Value :=
            DBLookupComboBox2.KeyValue;
          meuscomandos.Parameters.ParamByName( 'nivel' ).Value :=
            UpperCase( edtNivelDotacao.Text );
          try
            dmComprasEstoque.conexao.BeginTrans;
            meuscomandos.Execute;
            dmComprasEstoque.conexao.CommitTrans;
            MessageBox( Application.Handle, 'Cadastro realizado com sucesso.',
              'Compras & Estoque', MB_ICONINFORMATION + MB_OK );
          Except
            on e : Exception do
            begin
              ShowMessage( e.Message );
              dmComprasEstoque.conexao.RollbackTrans;
            end;
          end;
        end;
      'E' :
        Begin
          qry := ' UPDATE ALMOXARIFADO SET descricao = :descr , idresponsavelautorizacao = :rAuto , idresponsaveldespacho = :rdesp , niveldotacao = :niv';
          qry := qry + ' WHERE almoxarifadoID = :codi ';
          meuscomandos.CommandText := qry;
          meuscomandos.Parameters.Clear;
          // Adicionando os parametros no command
          meuscomandos.Parameters.AddParameter.Name := 'descr';
          meuscomandos.Parameters.AddParameter.Name := 'rAuto';
          meuscomandos.Parameters.AddParameter.Name := 'rdesp';
          meuscomandos.Parameters.AddParameter.Name := 'niv';
          meuscomandos.Parameters.AddParameter.Name := 'codi';
          // Atribuindo valores aos parametros
          meuscomandos.Parameters.ParamByName( 'descr' ).Value :=
            UpperCase( edtNomeAlmoxarifado.Text );
          meuscomandos.Parameters.ParamByName( 'rAuto' ).Value :=
            DBLookupComboBox1.KeyValue;
          meuscomandos.Parameters.ParamByName( 'rdesp' ).Value :=
            DBLookupComboBox2.KeyValue;
          meuscomandos.Parameters.ParamByName( 'niv' ).Value :=
            UpperCase( edtNivelDotacao.Text );
          meuscomandos.Parameters.ParamByName( 'codi' ).Value := codigo;
          try
            dmComprasEstoque.conexao.BeginTrans;
            meuscomandos.Execute;
            dmComprasEstoque.conexao.CommitTrans;
            MessageBox( Application.Handle, 'Alteração realizada com sucesso.',
              'Compras & Estoque', MB_ICONINFORMATION + MB_OK );
          Except
            on e : Exception do
            begin
              ShowMessage( e.Message );
              dmComprasEstoque.conexao.RollbackTrans;
            end;
          end;
        end;
    end;
    limpaCampos;
    Panel1.Enabled := not Panel1.Enabled;
    btnPesquisarClick( self );
  end;

end.
