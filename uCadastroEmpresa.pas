unit uCadastroEmpresa;

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
  TEmpresa,
  TEmpresaDAO;

type
  TfrmCadastroEmpresa = class( TForm )
    Label1 : TLabel;
    edtEmpresa : TEdit;
    Label2 : TLabel;
    edtCnpj : TEdit;
    Label3 : TLabel;
    edtCidade : TEdit;
    Label4 : TLabel;
    edtEndereco : TEdit;
    Label5 : TLabel;
    edtTelefone : TEdit;
    Label7 : TLabel;
    btnCadastrar : TButton;
    procedure btnCadastrarClick( Sender : TObject );
    private
      { Private declarations }
    public
      { Public declarations }
  end;

var
  frmCadastroEmpresa : TfrmCadastroEmpresa;

implementation

{$R *.dfm}

procedure TfrmCadastroEmpresa.btnCadastrarClick( Sender : TObject );
  var
    empresa : UEmpresa;
    empresaDAO : UEmpresaDAO;
  begin

    if ( ( edtEmpresa.Text = '' ) and ( edtCnpj.Text = '' ) )
    then
    begin
      ShowMessage( 'Por favor, preencha os campos obrigatórios' );
    end
    else
    begin
      try
        empresaDAO := UEmpresaDAO.Create;
        with ( empresa ) do
        begin
          empresa := UEmpresa.Create;
          nome := edtEmpresa.Text;
          cnpj := edtCnpj.Text;
          endereco := edtEndereco.Text;
          telefone := edtTelefone.Text;
          cidade := edtCidade.Text;
          mesExercicio := '';
          anoExercicio := '';
          empresaDAO.inserir( empresa );
          Self.Close;
        end;
      Except
        ShowMessage( 'Erro no Cadastro da Nova Empresa - Tente Novamente' );
      end;
    end;
  end;

end.
