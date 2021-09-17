unit uAberturaFechamentoAno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls,Data.Win.ADODB;

type
  TfrmAberturaFechamentoAno = class(TForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAberturaFechamentoAno: TfrmAberturaFechamentoAno;

implementation

{$R *.dfm}

uses udmComprasEstoque;

procedure TfrmAberturaFechamentoAno.BitBtn1Click(Sender: TObject);
var
    query : TADOQuery;
    adoComando : TADOCommand;
begin
    if RadioGroup1.ItemIndex = -1 then begin
      MessageBox(Application.Handle,'Por favor, informe a operação.','Compras & Estoque',MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    query := TADOQuery.Create(self);
    query.Connection := dmComprasEstoque.conexao;
    adoComando := TADOCommand.Create(self);
    adoComando.Connection := dmComprasEstoque.conexao;
    if RadioGroup1.ItemIndex = 0 then begin
        query.Close;
        query.SQL.Clear;
        query.SQL.Add('SELECT ANO, Status FROM ABERTURAFECHAMENTOANUAL WHERE STATUS = ''A''' );
        query.Open;
        if query.RecordCount = 0 then begin
            adoComando.CommandText := 'INSERT INTO ABERTURAFECHAMENTOANUAL(ano,status) values('+ FormatDateTime('yyyy',DateTimePicker1.Date) + ', ''A'' )';
            adoComando.Execute;
            MessageBox(Application.Handle,'Exercício aberto com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK);
        end
        else begin
            if(query.FieldByName('ano').AsString = FormatDateTime('yyyy',DateTimePicker1.Date)) then
                MessageBox(Application.Handle,'Este exercício já está aberto','Compras & Estoque', MB_ICONINFORMATION + MB_OK)
            else
                ShowMessage('O exercício de ' + query.FieldByName('ano').AsString  + ' está em aberto.' + #13 + 'Feche-o para abrir outro exercício.');
        end;
    end
    else begin
        query.Close;
        query.SQL.Clear;
        query.SQL.Add('SELECT ANO, Status FROM ABERTURAFECHAMENTOANUAL WHERE STATUS = ''A''' + ' AND ANO = ''' + FormatDateTime('yyyy',DateTimePicker1.DateTime) +'''');
        query.Open;
        if query.RecordCount = 0 then begin
            MessageBox(Application.Handle,'O exercício informado não existe.','Compras & Estoque', MB_ICONINFORMATION + MB_OK);
        end
        else begin
            adoComando.CommandText := 'UPDATE ABERTURAFECHAMENTOANUAL SET STATUS = ''F'' WHERE ANO = '+ FormatDateTime('yyyy',DateTimePicker1.Date);
            adoComando.Execute;
            MessageBox(Application.Handle,'Exercício fechado com sucesso.','Compras & Estoque', MB_ICONINFORMATION + MB_OK);
        end;

    end;






end;

end.
