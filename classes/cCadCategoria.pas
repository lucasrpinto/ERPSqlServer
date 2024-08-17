unit cCadCategoria;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs; //Lista de Units

type
  TCategoria = class //Declaração do tipo da classe

  private
    F_categoriaId : Integer;
    F_descricao : String;
    function getCodigo: Integer;
    function getDescricao: string;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: string);

  public
    constructor Create; //Constructor da Classe
    destructor Destroy; override; //Destroi a Classe usar o Override por causa de sobrescrever

  published
    property codigo    : Integer  read getCodigo    write setCodigo;
    property descricao : string   read getDescricao write setDescricao;


  end;


implementation

{ TCategoria }

constructor TCategoria.Create;
begin

end;

destructor TCategoria.Destroy;
begin

  inherited;
end;

function TCategoria.getCodigo: Integer;
begin
  Result := Self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
  Result := Self.F_descricao;
end;

procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
  Self.F_descricao := Value;
end;

end.
