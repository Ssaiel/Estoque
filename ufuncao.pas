unit ufuncao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.menus,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  IdBaseComponent,
  IdSASL,
  IdSASLUserPass,
  IdSASL_CRAMBase,
  IdSASL_CRAM_MD5,
  Data.Win.ADODB,
  IniFiles;

function verificaliberacao(
  query : TAdoQuery;
  ano   : integer;
  mes   : integer ) : Boolean;
function AsciiToInt( Caracter : Char ) : integer;
Function Criptografa(
  texto : string;
  chave : integer ) : String;
Function DesCriptografa(
  texto : string;
  chave : integer ) : String;
procedure habilitaMenus(
  var xMenu : TMainMenu;
  query     : TAdoQuery;
  xLogin    : String );
function CreateProcessSimple( cmd : string ) : Boolean;
function removeCaracterEstranho( frase : String ) : String;
function formatCNPJ( xcnpj : string ) : string;
function formatDouble( qtdeD : double ) : string;
function DoubleToDB( camp : String ) : String;
// procedure conectaBanco(conexao : TADOConnection);

var
  userName : String;

var
  banco : String;

implementation

uses
  udmComprasEstoque;

function DoubleToDB( camp : String ) : String;
  begin
    //
    Result := StringReplace( camp, ',', '.', [ rfReplaceAll ] );

  end;

function formatDouble( qtdeD : double ) : string;
  var
    qtdeStr : String;
  begin
    qtdeStr := FloatToStr( qtdeD );
    qtdeStr := StringReplace( qtdeStr, ',', '.', [ rfReplaceAll ] );
    Result := qtdeStr;
  end;

function formatCNPJ( xcnpj : string ) : string;
  Var
    xTemp : String;
  begin
    xTemp := xcnpj.Substring( 0, 2 ) + '.' + xcnpj.Substring( 2, 3 ) + '.' +
      xcnpj.Substring( 5, 3 ) + '/' + xcnpj.Substring( 8, 4 ) + '-' +
      xcnpj.Substring( 12, 2 );
    Result := xTemp;
  end;

function verificaliberacao(
  query : TAdoQuery;
  ano   : integer;
  mes   : integer ) : Boolean;
  var
    qry : String;
  begin
    qry := 'SELECT * FROM LIBERACAOMENSAL WHERE ANO = ''' + intToStr( ano ) +
      ''' AND MES = ''' + intToStr( mes ) + '''';
    query.Close;
    query.SQL.Clear;
    query.SQL.Add( qry );
    query.Open;
    if query.RecordCount = 0
    then
      Result := false
    else
      Result := true;
  end;

function AsciiToInt( Caracter : Char ) : integer;
  var
    i : integer;
  begin
    i := 32;
    while i < 255 do
    begin
      if Chr( i ) = Caracter
      then
        Break;
      i := i + 1;
    end;
    Result := i;
  end;

Function Criptografa(
  texto : string;
  chave : integer ) : String;
  var
    cont : integer;
    retorno : string;
  begin
    if ( trim( texto ) = EmptyStr ) or ( chave = 0 )
    then
    begin
      Result := texto;
    end
    else
    begin
      retorno := '';
      for cont := 1 to length( texto ) do
      begin
        retorno := retorno + Chr( AsciiToInt( texto[ cont ] ) + chave );
      end;
      Result := retorno;
    end;
  end;

Function DesCriptografa(
  texto : string;
  chave : integer ) : String;
  var
    cont : integer;
    retorno : string;
  begin
    if ( trim( texto ) = EmptyStr ) or ( chave = 0 )
    then
    begin
      Result := texto;
    end
    else
    begin
      retorno := '';
      for cont := 1 to length( texto ) do
      begin
        retorno := retorno + Chr( AsciiToInt( texto[ cont ] ) - chave );
      end;
      Result := retorno;
    end;
  end;

procedure desabilitaMenu( var xMenu : TMainMenu );
  var
    i : integer;
    J : integer;
    K : integer;
  begin
    for i := 0 to xMenu.Items.Count - 1 do
    begin
      xMenu.Items[ i ].Enabled := false;
      if xMenu.Items[ i ].Count <> 0
      then
      begin
        for J := 0 to xMenu.Items[ i ].Count - 1 do
        begin
          xMenu.Items[ i ].Items[ J ].Enabled := false;
          if xMenu.Items[ i ].Items[ J ].Count <> 0
          then
            for K := 0 to xMenu.Items[ i ].Items[ J ].Count - 1 do
              xMenu.Items[ i ].Items[ J ].Items[ K ].Enabled := false;
        end;
      end;
    end;
  end;

procedure habilitaMenus(
  var xMenu : TMainMenu;
  query     : TAdoQuery;
  xLogin    : String );
  var
    i : integer;
    J : integer;
    K : integer;
  begin
    if UpperCase( xLogin ) <> 'ADMINISTRADOR'
    then
    Begin
      desabilitaMenu( xMenu );
      query.Close;
      query.SQL.Clear;
      query.SQL.Add( 'SELECT * FROM USUARIOPERMISSAO WHERE LOGIN = ''' +
        UpperCase( xLogin ) + '''' );
      query.Open;
      if query.RecordCount = 0
      then
      begin
        desabilitaMenu( xMenu );
      end
      else
      begin
        query.First;
        while not query.Eof do
        begin
          for i := 0 to xMenu.Items.Count - 1 do
          begin
            if xMenu.Items[ i ].Count <> 0
            then
            begin
              for J := 0 to xMenu.Items[ i ].Count - 1 do
              begin
                if xMenu.Items[ i ].Items[ J ].Count <> 0
                then
                  for K := 0 to xMenu.Items[ i ].Items[ J ].Count - 1 do
                  begin
                    if UpperCase( xMenu.Items[ i ].Items[ J ].Items[ K ].Name )
                      = query.FieldByName( 'menusistema' ).AsString
                    then
                      xMenu.Items[ i ].Items[ J ].Items[ K ].Enabled := true;
                  end;
                if UpperCase( xMenu.Items[ i ].Items[ J ].Name )
                  = query.FieldByName( 'menusistema' ).AsString
                then
                  xMenu.Items[ i ].Items[ J ].Enabled := true;
              end;
              if UpperCase( xMenu.Items[ i ].Name )
                = query.FieldByName( 'menusistema' ).AsString
              then
                xMenu.Items[ i ].Enabled := true;
            end;
          end;
          query.Next;
        end;
      end;
    end;
  end;

function CreateProcessSimple( cmd : string ) : Boolean;
  var
    SUInfo : TStartupInfo;
    ProcInfo : TProcessInformation;
  begin
    FillChar( SUInfo, SizeOf( SUInfo ), #0 );
    SUInfo.cb := SizeOf( SUInfo );
    SUInfo.dwFlags := STARTF_USESHOWWINDOW;
    SUInfo.wShowWindow := SW_HIDE;
    Result := CreateProcess( nil, PChar( cmd ), nil, nil, false,
      CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo );
    if Result
    then
    begin
      WaitForSingleObject( ProcInfo.hProcess, INFINITE );
      CloseHandle( ProcInfo.hProcess );
      CloseHandle( ProcInfo.hThread );
    end;
  end;

function removeCaracterEstranho( frase : String ) : String;
  var
    i : integer;
  begin
    for i := 0 to frase.length - 1 do
    begin
      case frase[ i ] of
        '.' :
          Begin
            frase := StringReplace( frase, '.', '',
              [ rfReplaceAll, rfIgnoreCase ] );
          End;
        '/' :
          Begin
            frase := StringReplace( frase, '/', '',
              [ rfReplaceAll, rfIgnoreCase ] );
          End;
        '-' :
          Begin
            frase := StringReplace( frase, '-', '',
              [ rfReplaceAll, rfIgnoreCase ] );
          End;
      end;
    end;
    Result := frase;
  end;

end.
