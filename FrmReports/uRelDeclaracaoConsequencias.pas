unit uRelDeclaracaoConsequencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, frxClass,
  Data.DB, Data.Win.ADODB, udmComprasEstoque, frxDBSet;

type
  TfrmDeclaracao = class(TForm)
    Label1: TLabel;
    dtMes: TDateTimePicker;
    Label2: TLabel;
    btnGerar: TButton;
    rptDeclaracao: TfrxReport;
    qryDeclaracao: TADOQuery;
    dsDeclaracao: TDataSource;
    frxDeclaracao: TfrxDBDataset;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeclaracao: TfrmDeclaracao;

implementation

{$R *.dfm}

procedure TfrmDeclaracao.btnGerarClick(Sender: TObject);
var
  script: String;
begin
  script := 'SELECT *, ''' + FormatDateTime('MM', dtMes.DateTime) +
    ''' as mes, ''' + FormatDateTime('yyyy', dtMes.DateTime) +
    ''' as ano  FROM entidade';
  qryDeclaracao.SQL.Clear;
  qryDeclaracao.SQL.Add(script);
  qryDeclaracao.Open;
  rptDeclaracao.LoadFromFile('Relatorios/RelatorioDeclaracaoConsequencia.fr3');
  rptDeclaracao.ShowReport();

end;

end.
