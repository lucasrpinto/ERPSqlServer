unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, cCadCategoria,
  uDTMConexao, uEnum2;

type
  TfrmCadCategorias = class(TfrmTelaHeranca)
    qryListagemcategoriaId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure edtCategoriaIdChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria : TCategoria;

    function Excluir : Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro) : Boolean; override;
    procedure PreencherNovoCodigo;


  public
     constructor Create(AOwner: TComponent); override;

     destructor Destroy; override;
  end;

var
  frmCadCategorias: TfrmCadCategorias;

implementation

{$R *.dfm}

procedure TfrmCadCategorias.PreencherNovoCodigo;
var
  NextID: Integer;
  Query: TZQuery;
begin
  if edtCategoriaId.Text = EmptyStr then
  begin
    // Somente gere o ID se ele não foi atribuído ainda
    Query := TZQuery.Create(nil);
    try
      Query.Connection := dtmConexao.ConexaoDB;  // Sua conexão Zeos existente
      Query.SQL.Text := 'SELECT MAX(categoriaId) AS MaxID FROM categorias';
      Query.Open;

      NextID := Query.FieldByName('MaxID').AsInteger + 1;
      edtCategoriaId.Text := IntToStr(NextID);
    finally
      Query.Free;
    end;
  end;

  // Continua com a lógica de gravação
  inherited;
end;



procedure TfrmCadCategorias.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Seleciona(qryListagem.FieldByName('categoriaId').AsInteger) then
    begin
      edtCategoriaId.Text := IntToStr(oCategoria.codigo);
      edtDescricao.Text := oCategoria.descricao;
    end
    else
      begin
        btnCancelar.Click;
        Abort;
      end;

  inherited;

end;

procedure TfrmCadCategorias.btnGravarClick(Sender: TObject);
begin
  if edtCategoriaId.Text<>EmptyStr then
     oCategoria.codigo:=StrToInt(edtCategoriaId.Text)
  else
     oCategoria.codigo:=0;

  oCategoria.descricao:=edtDescricao.Text;



  inherited;
end;

procedure TfrmCadCategorias.btnNovoClick(Sender: TObject);
begin
  inherited;
  PreencherNovoCodigo;

  edtDescricao.SetFocus;
end;


constructor TfrmCadCategorias.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  oCategoria := TCategoria.Create(dtmConexao.ConexaoDB);
end;

destructor TfrmCadCategorias.Destroy;
begin
  oCategoria.Free;
  inherited Destroy;
end;



procedure TfrmCadCategorias.edtCategoriaIdChange(Sender: TObject);
begin
    inherited;
end;

{$region 'OVERRIDE'}
function TfrmCadCategorias.Excluir: Boolean;
begin
  if oCategoria.Seleciona(qryListagem.FieldByName('categoriaId').AsInteger) then
    begin
      Result := oCategoria.Excluir;
    end;

end;


function TfrmCadCategorias.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if EstadoDoCadastro=ecInserir then
     Result:= oCategoria.Inserir
  else if EstadoDoCadastro=ecAlterar then
     Result:= oCategoria.Atualizar;
end;

end.
{$endergion}


procedure TfrmCadCategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    FreeAndNil(oCategoria)
end;

procedure TfrmCadCategorias.FormCreate(Sender: TObject);
begin

  inherited;
  oCategoria := TCategoria.Create(dtmConexao.ConexaoDB);
  IndiceAtual := 'categoriaId';
end;

