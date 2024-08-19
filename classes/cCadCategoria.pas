unit cCadCategoria;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection; //Lista de Units

type
  TCategoria = class //Declaração do tipo da classe

  private
    ConexaoDB : TZConnection;
    F_categoriaId : Integer;
    F_descricao : String;
    function getCodigo: Integer;
    function getDescricao: string;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: string);

  public
    constructor Create (aConexao : TZConnection); //Constructor da Classe
    destructor Destroy; override; //Destroi a Classe usar o Override por causa de sobrescrever

    function Gravar : Boolean;
    function Atualizar : Boolean;
    function Apagar : Boolean;
    function Seleciona (id : Integer) : Boolean;

  published
    property codigo    : Integer  read getCodigo    write setCodigo;
    property descricao : string   read getDescricao write setDescricao;


  end;


implementation

{ TCategoria }


{$region 'Constructor and Desctructor'}
constructor TCategoria.Create(aConexao : TZConnection);
begin
  ConexaoDB := aConexao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;
{$endregion}



{$region 'CRUD'}
function TCategoria.Apagar: Boolean;
begin
  ShowMessage('Apagado');
  Result := True;
end;

function TCategoria.Atualizar: Boolean;
begin
  ShowMessage('Atualizado');
  Result := True;
end;

function TCategoria.Gravar: Boolean;
begin
  ShowMessage('Gravado');
  Result := True;
end;

function TCategoria.Seleciona(id: Integer): Boolean;
begin
  Result := True;
end;
{$endregion}


{$region 'Get'}
function TCategoria.getCodigo: Integer;
begin
  Result := Self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
  Result := Self.F_descricao;
end;
{$endregion}


{$region 'Set'}
procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
  Self.F_descricao := Value;
end;
{$endregion}


end.
