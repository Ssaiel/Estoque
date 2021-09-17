unit TAbertura;

interface

type
  UAbertura = class
    ano : Integer;
    status : String;
    public
      procedure setAbertura(
        ano    : Integer;
        status : String );
  end;

implementation

procedure UAbertura.setAbertura(
  ano    : Integer;
  status : String );
  begin
    Self.ano := ano;
    Self.status := status;
  end;

end.

