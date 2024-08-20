unit cCadCategoria;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils;//Lista de uses

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

    function Inserir : Boolean;
    function Atualizar : Boolean;
    function Excluir : Boolean;
    function Seleciona (id : Integer) : Boolean;

  published
    property codigo    : Integer  read getCodigo    write setCodigo;
    property descricao : string   read getDescricao write setDescricao;


  end;


implementation

{ TCategoria }


{$region 'Constructor and Desctructor'}
constructor TCategoria.Create(aConexao: TZConnection);
begin
  inherited Create;  // Chama o construtor da classe pai, se necessário
  ConexaoDB := aConexao;  // Atribui a conexão passada como argumento
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;
{$endregion}



{$region 'CRUD'}
function TCategoria.Excluir: Boolean;
var Qry, QryCheck : TZQuery;
    LastId : Integer;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                 'Código: '+IntToStr(F_categoriaId)+#13+
                 'Descrição: '+F_descricao, TMsgDlgType.mtConfirmation, [mbYes, mbNo],0) = mrNo then
    begin
      Result := False;
      abort;
    end;

    Try
      Result := true;

      // Primeiro, verificar se o ID atual é o último
      QryCheck := TZQuery.Create(nil);
      Try
        QryCheck.Connection := ConexaoDB;
        QryCheck.SQL.Text := 'SELECT MAX(categoriaId) AS LastId FROM categorias';
        QryCheck.Open;

        LastId := QryCheck.FieldByName('LastId').AsInteger;

        // Verifica se o ID que será excluido é o ultimo

        if F_categoriaId = LastId then
          begin
            Qry := TZQuery.Create(nil);
            Try
              Qry.Connection := ConexaoDB;
              Qry.SQL.Clear;
              Qry.SQL.Add('DELETE FROM categorias '+
                          ' WHERE categoriaId =:categoriaId ');
              Qry.ParamByName('categoriaId').AsInteger := F_categoriaId;
              Qry.ExecSQL;

              // Resetar o ID sequencial
              Qry.SQL.Text := 'DBCC CHECKIDENT (categorias, RESEED, :NewValue)';
              Qry.ParamByName('NewValue').AsInteger := LastId - 1;
              Qry.ExecSQL;
            Finally
              Qry.Free;
            End;
          end
          else
            begin
              // se não for o último, apenas exclui sem alterar o sequencial
              Qry := TZQuery.Create(nil);
              Try
                Qry.Connection := ConexaoDB;
                Qry.SQL.Clear;
                Qry.SQL.Add('DELETE FROM categorias WHERE categoriaId = :categoriaId');
                Qry.ParamByName('categoriaId').AsInteger := F_categoriaId;
                Qry.ExecSQL;
              Finally
                Qry.Free;
              End;
            end;
      Finally
        QryCheck.Free;
      End;


      Except
        Result := False;
      End;
end;

function TCategoria.Atualizar: Boolean;
var Qry : TZQuery;
begin
  Try
    Result := True;

    Qry := TZQuery.Create(Nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE categorias ' +
                '        SET descricao =:descricao ' +
                ' WHERE categoriaId = :categoriaId ');
    Qry.ParamByName('categoriaId').AsInteger := Self.F_categoriaId;
    Qry.ParamByName('descricao').AsString    := Self.F_descricao;
    Try
      Qry.ExecSQL;

    Except
      Result := False;
    End;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TCategoria.Inserir: Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;

    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO categorias (descricao) values (:descricao)');
    Qry.ParamByName('descricao').AsString :=Self.F_descricao;
    Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    Except
      ConexaoDB.Rollback;
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TCategoria.Seleciona(id: Integer): Boolean;
var Qry : TZQuery;
begin
  Try
    Result := True;

    Qry := TZQuery.Create(Nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT categoriaId, ' +
                '        descricao ' +
                ' FROM categorias ' +
                ' WHERE categoriaId = :categoriaId ');
    Qry.ParamByName('categoriaId').AsInteger := id;
    Try
      Qry.Open;

      Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
      Self.F_descricao   := Qry.FieldByName('descricao').AsString;
    Except
      Result := False;
    End;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
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
