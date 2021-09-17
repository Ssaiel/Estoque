unit Funcoes;

interface
uses SysUtils, System.Classes;

  type
  TFuncoes = class
public
    function retirarChar(val: string): String;
    function comparaValores(s1, s2: string): Boolean;
  end;


implementation



function TFuncoes.retirarChar(val: string): String;
  var
  x : Integer;
  Const ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  Const SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
  begin
    val := StringReplace(val, '.', '', [rfReplaceAll]);
    val := StringReplace(val, '/', '', [rfReplaceAll]);
    val := StringReplace(val, '-', '', [rfReplaceAll]);
    val := StringReplace(val, ' ', '', [rfReplaceAll]);
    For x := 1 to Length(val) do
    begin
      if Pos(val[x],ComAcento)<>0 Then
      begin
        val[x] := SemAcento[Pos(val[x],ComAcento)];
      end;
    result := val;
    end;
  end;

  function TFuncoes.comparaValores(s1, s2 : String) : Boolean;
  begin
    s1 := retirarChar(s1);
    s2 := retirarChar(s2);
    Result := s1.Equals(s2);
  end;

end.
