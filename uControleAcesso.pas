unit uControleAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,Data.Win.ADODB, Vcl.ImgList,
  Vcl.Buttons;

type
  TfrmLiberacaoAcessoUsuario = class(TForm)
    TreeView1: TTreeView;
    ImageList1: TImageList;
    btnSalvar: TBitBtn;
    btnMarcarTodas: TBitBtn;
    btnDesmarcarTodas: TBitBtn;
    btnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    arvoreVariaveis: TTreeView;
    procedure FormShow(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnMarcarTodasClick(Sender: TObject);
    procedure btnDesmarcarTodasClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure carregaPerfil(xlogin : String);



  private
    { Private declarations }
  public
    { Public declarations }
//     usuario: String;
  end;

var
  frmLiberacaoAcessoUsuario: TfrmLiberacaoAcessoUsuario;
  No2 ,subNo2 : TTreeNode;
  arvoreVariaveis : TTreeView;

implementation

{$R *.dfm}

uses frmPrincipal, udmComprasEstoque;

procedure TfrmLiberacaoAcessoUsuario.btnMarcarTodasClick(Sender: TObject);
var
  I: Integer;

begin
   TreeView1.Items.BeginUpdate;
   for I := 0 to TreeView1.Items.Count-1 do begin
       TreeView1.Items[i].ImageIndex := 1;
       TreeView1.Items[i].SelectedIndex := 1;
       TreeView1.Items[i].StateIndex := 1;
   end;
   TreeView1.Items.EndUpdate;
end;

procedure TfrmLiberacaoAcessoUsuario.btnDesmarcarTodasClick(Sender: TObject);
var
  I: Integer;

begin
   TreeView1.Items.BeginUpdate;
   for I := 0 to TreeView1.Items.Count-1 do begin
       TreeView1.Items[i].ImageIndex := 0;
       TreeView1.Items[i].SelectedIndex := 0;
       TreeView1.Items[i].StateIndex := 0;
   end;
   TreeView1.Items.EndUpdate;
end;

procedure TfrmLiberacaoAcessoUsuario.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmLiberacaoAcessoUsuario.FormShow(Sender: TObject);
var
  I, J, K, p: Integer;
  NO, subno : TTreeNode;
  menu:String;
begin
//      arvoreVariaveis := TTreeView.Create(self);
      arvoreVariaveis.Items.Clear;
      TreeView1.Items.Clear;
      for I := 0 to frmComprasEstoque.MainMenu1.Items.Count-1 do begin
            //Adiciona os menus principais
            menu := frmComprasEstoque.MainMenu1.Items[i].Caption;
            p := pos('&',menu);
            if p > 0  then
               Delete(menu,p,1);
            No := TreeView1.Items.Add(nil,menu);
            No2 := arvoreVariaveis.Items.Add(nil,frmComprasEstoque.MainMenu1.Items[i].Name);

            for j := 0 to frmComprasEstoque.MainMenu1.Items[i].Count - 1 do begin
              if frmComprasEstoque.MainMenu1.Items[i].Items[j].Caption <> '-' then begin
                 //Adiciona os menus secundários
                 menu := frmComprasEstoque.MainMenu1.Items[i].Items[j].Caption;
                 p := pos('&',menu);
                 if p > 0  then
                    Delete(menu,p,1);
                 subno:=TreeView1.Items.AddChild(no,menu);
                 subNo2:=arvoreVariaveis.Items.AddChild(No2,frmComprasEstoque.MainMenu1.Items[i].Items[j].Name);
                 //Verifica se o menu secundário possui submenu
                 if frmComprasEstoque.MainMenu1.Items[i].Items[j].Count <> 0 then begin
                     for k := 0 to frmComprasEstoque.MainMenu1.Items[i].Items[j].Count - 1 do
                        if frmComprasEstoque.MainMenu1.Items[i].Items[j].Items[k].Caption <> '-' then begin
                           //adiciona os submenus
                           menu := frmComprasEstoque.MainMenu1.Items[i].Items[j].Items[k].Caption;
                           p := pos('&',menu);
                           if p > 0  then
                              Delete(menu,p,1);
                           TreeView1.Items.AddChild(subno,menu);
                           arvoreVariaveis.Items.AddChild(subNo2,frmComprasEstoque.MainMenu1.Items[i].Items[j].Items[k].Name);
                        end;
                 end;
              end;
            end;
      end;
      TreeView1.FullExpand;
      carregaPerfil(Label1.Caption);

end;

procedure TfrmLiberacaoAcessoUsuario.btnSalvarClick(Sender: TObject);
var
  I: Integer;
  menus: TStringList;
  comand : TADOCommand;
begin
   menus := TStringList.Create();
   for I := 0 to TreeView1.Items.Count-1 do begin
      if TreeView1.Items[i].SelectedIndex = 1 then
         menus.Add(UpperCase(arvoreVariaveis.Items[i].Text));
   end;
   comand := TADOCommand.Create(self);
   comand.Connection := dmComprasEstoque.conexao;
   comand.CommandText := 'DELETE FROM USUARIOPERMISSAO WHERE LOGIN = ''' + Label1.Caption +'''';
   comand.Execute;
   for I := 0 to menus.Count-1 do begin
      comand.CommandText := 'INSERT INTO USUARIOPERMISSAO(LOGIN, MENUSISTEMA) VALUES(';
      comand.CommandText := comand.CommandText + ''''+  Label1.Caption + ''',''' + menus.Strings[i] + ''')';
      comand.Execute;
   end;
   btnDesmarcarTodasClick(self);


end;

procedure TfrmLiberacaoAcessoUsuario.carregaPerfil(xlogin: String);
Var qry: string;
    query : TADOQuery;
    i:integer;
begin
   query:= TADOQuery.Create(self);
   query.Connection := dmComprasEstoque.conexao;
   qry := 'SELECT * FROM USUARIOPERMISSAO WHERE LOGIN = ''' + LowerCase(xlogin) + '''';
   query.Close;
   query.SQL.Clear;
   query.SQL.Add(qry);
   query.Open;
   while not query.Eof do begin
      TreeView1.Items.BeginUpdate;
      for I := 0 to arvoreVariaveis.Items.Count-1 do begin
          if( UpperCase(arvoreVariaveis.Items[i].Text) = query.FieldByName('menusistema').AsString) then begin
               TreeView1.Items[i].ImageIndex := 1;
               TreeView1.Items[i].SelectedIndex := 1;
               TreeView1.Items[i].StateIndex := 1;
          end;
      end;
      TreeView1.Items.EndUpdate;
      query.Next;
   end;
end;

procedure TfrmLiberacaoAcessoUsuario.TreeView1Click(Sender: TObject);
var
   node : TTreeNode;
begin
    node := TreeView1.Selected;
    TreeView1.Items.BeginUpdate;
    if TreeView1.Items[node.AbsoluteIndex].ImageIndex = 0 then begin
       TreeView1.Items[node.AbsoluteIndex].ImageIndex := 1;
       TreeView1.Items[node.AbsoluteIndex].SelectedIndex := 1;
       TreeView1.Items[node.AbsoluteIndex].StateIndex := 1;
    end
    else begin
       TreeView1.Items[node.AbsoluteIndex].ImageIndex := 0;
       TreeView1.Items[node.AbsoluteIndex].SelectedIndex := 0;
       TreeView1.Items[node.AbsoluteIndex].StateIndex := 0;
    end;
    TreeView1.Items.EndUpdate;
    TreeView1.Refresh;

end;

end.

