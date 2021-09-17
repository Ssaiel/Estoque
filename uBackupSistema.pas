unit uBackupSistema;

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
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls;

type
  TfrmBackupSistema = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    edtPath: TEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackupSistema: TfrmBackupSistema;

implementation

{$R *.dfm}

uses
  ufuncao,
  udmComprasEstoque;

procedure TfrmBackupSistema.BitBtn1Click(Sender: TObject);
Var
  aux: string;
begin
  if RadioGroup1.ItemIndex = -1 then
  begin
    MessageBox(Application.Handle, 'Informe a operação a ser realizada',
      'Compras & Estoque', MB_ICONEXCLAMATION + MB_OK);
    exit;
  end
  else
  begin
    Cursor := crSQLWait;
    if RadioGroup1.ItemIndex = 0 then
    begin
      { REALIZANDO BACKUP }
      aux := 'cmd.exe /c "mysqldump --opt --flush-logs --triggers --port=3306';
      aux := aux + ' --user=root --password=';
      aux := aux + ' --result-file=backup\backup_' +
        FormatDateTime('ddmmyyy_hhmm', now) + '.sql --databases ' +
        dmComprasEstoque.conexao.DefaultDatabase;

      // ShowMessage(aux);
      if not createProcessSimple(aux) then
        MessageBox(Application.Handle,
          'Ocorreu um erro durente a realização do backup!',
          'Compras & Estoque', MB_ICONERROR + MB_OK)
      else
        MessageBox(Application.Handle, 'Backup Realizado com sucesso!',
          'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
    end
    else
    begin
      { REALIZANDO O RESTORE }

      aux := 'cmd.exe /c "mysql -u root '; // usuário root sem senha

      aux := aux + dmComprasEstoque.conexao.DefaultDatabase + ' < ' +
        edtPath.Text + '"';
      // backup\backup.sql"'; // edtlBanco.text é o nome da base de dados
      ShowMessage(aux);
      if not createProcessSimple(aux) then
        MessageBox(Application.Handle,
          'Restauração do Banco de dados não realizada!', 'Compras & Estoque',
          MB_ICONERROR + MB_OK)
      else
        MessageBox(Application.Handle, 'Restauração Realizada com sucesso!',
          'Compras & Estoque', MB_ICONINFORMATION + MB_OK);
    end;
    frmBackupSistema.Cursor := crDefault;
  end;

end;

procedure TfrmBackupSistema.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmBackupSistema.FormShow(Sender: TObject);
begin
  OpenDialog1.InitialDir := GetCurrentDir + '\backup';
  edtPath.Text := OpenDialog1.InitialDir;
end;

procedure TfrmBackupSistema.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    SpeedButton1.Enabled := false;
  end
  else
    SpeedButton1.Enabled := true;

end;

procedure TfrmBackupSistema.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := GetCurrentDir + '\backup';
  OpenDialog1.Title := 'Backup do Sistema';
  OpenDialog1.Execute();
  edtPath.Text := OpenDialog1.FileName;
end;

end.
