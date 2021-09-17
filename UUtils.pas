unit UUtils;

interface

uses
  SysUtils,
  StdCtrls;

type
  TUtils = class
  public
    function FormatarComoMoeda(Componente: TEdit; var Key: Char): TEdit;
    function CleanString(value: String): String;
  end;

implementation

// @Retorna TObject - Usar no Evento KeyPress do TEdit
function TUtils.FormatarComoMoeda(Componente: TEdit; var Key: Char): TEdit;
var
  str_valor: String;
  dbl_valor: double;

  Caracteres, Caracteres2, Caracteres3: TSysCharSet;
begin
  Caracteres := ['0' .. '9', #8, #9];
  Caracteres2 := ['0' .. '9'];
  Caracteres3 := [#8, #9];
  // backspace, enter, virgula e numeros de zero a nove.
  { verificando se estamos recebendo o TEdit realmente }
  IF Componente is TEdit THEN
  BEGIN
    { se tecla pressionada e' um numero, backspace ou del deixa passar }
    IF CharInSet(Key, Caracteres) THEN
    BEGIN
      { guarda valor do TEdit com que vamos trabalhar }
      str_valor := TEdit(Componente).Text;
      { verificando se nao esta vazio }
      IF str_valor = EmptyStr THEN
        str_valor := '0,00';
      { se valor numerico ja insere na string temporaria }
      IF CharInSet(Key, Caracteres2) THEN
        str_valor := Concat(str_valor, Key);
      { retira pontos e virgulas se tiver! }
      str_valor := Trim(StringReplace(str_valor, '.', '',
        [rfReplaceAll, rfIgnoreCase]));
      str_valor := Trim(StringReplace(str_valor, ',', '',
        [rfReplaceAll, rfIgnoreCase]));
      { inserindo 2 casas decimais }
      dbl_valor := strTofloat(str_valor);
      dbl_valor := (dbl_valor / 100);

      { reseta posicao do tedit }
      TEdit(Componente).SelStart := Length(TEdit(Componente).Text);
      { retornando valor tratado ao TEdit }
      TEdit(Componente).Text := FormatFloat('#####0.00', dbl_valor);
    END;
    { se nao e' key relevante entao reseta }
    IF NOT CharInSet(Key, Caracteres3) THEN
      Key := #0;
  END;
  Result := Componente;
end;

function TUtils.CleanString(value: string): String;
begin
  value := StringReplace(value, '.', '', [rfReplaceAll]);
  value := StringReplace(value, '/', '', [rfReplaceAll]);
  value := StringReplace(value, '-', '', [rfReplaceAll]);
  Result := value;
end;

end.
