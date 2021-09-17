unit uManutencaoBancoDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ImgList, Vcl.ToolWin,
  Vcl.StdCtrls;

type
  TfrmManutencaoBancoDados = class(TForm)
    Memo1: TMemo;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    OpenDialog1: TOpenDialog;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencaoBancoDados: TfrmManutencaoBancoDados;
  xFile : TStringList;
implementation

{$R *.dfm}

uses udmComprasEstoque;

procedure TfrmManutencaoBancoDados.ToolButton1Click(Sender: TObject);
begin
   xFile := TStringList.Create();
   OpenDialog1.Execute();
   if OpenDialog1.FileName <> '' then
      xFile.LoadFromFile(OpenDialog1.FileName);
   Memo1.Text := xFile.Text;
end;

procedure TfrmManutencaoBancoDados.ToolButton2Click(Sender: TObject);
var
  I: Integer;
begin
   try
      dmComprasEstoque.conexao.BeginTrans;
      for I := 0 to xFile.Count-1 do begin
         if xFile.Strings[i] <> '' then begin
            dmComprasEstoque.comandos.CommandText := xFile.Strings[i];
            dmComprasEstoque.comandos.Execute;
         end;
      end;
      dmComprasEstoque.conexao.CommitTrans;
      MessageBox(Application.Handle,PChar('Manuteção realizada com sucesso.'),'Compras & Estoque',MB_ICONINFORMATION + MB_OK);
      except on E: Exception do begin
         dmComprasEstoque.conexao.RollbackTrans;
         MessageBox(Application.Handle,PChar('Ocorreu um erro durante a execução do script.' + #13 + e.Message),'Compras & Estoque',MB_ICONERROR + MB_OK);
      end;
   end;
end;

procedure TfrmManutencaoBancoDados.ToolButton3Click(Sender: TObject);
begin
   Close;
end;

end.
