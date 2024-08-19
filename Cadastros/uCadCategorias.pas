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
  private
    { Private declarations }
    oCategoria : TCategoria;

    function Excluir : Boolean; override;
    function Gravar(EstadoDOCadastro:TEstadoDoCadastro) : Boolean; override;


  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
  end;

var
  frmCadCategorias: TfrmCadCategorias;

implementation

{$R *.dfm}



constructor TfrmCadCategorias.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Inicialize aqui recursos específicos da TfrmCadCategorias, se necessário
end;

destructor TfrmCadCategorias.Destroy;
begin
  // Libere aqui recursos específicos da TfrmCadCategorias, se necessário
  inherited Destroy;
end;


{$region 'OVERRIDE'}
function TfrmCadCategorias.Excluir: Boolean;
begin
  Result := oCategoria.Apagar;
end;


function TfrmCadCategorias.Gravar(EstadoDOCadastro: TEstadoDoCadastro): Boolean;
begin
  if (EstadoDoCadastro = ecInserir) then
    Result := oCategoria.Gravar
  else if (EstadoDoCadastro = ecAlterar) then
    Result := oCategoria.Atualizar;
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

