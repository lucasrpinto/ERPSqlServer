unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, cCadCategoria;

type
  TfrmCadCategorias = class(TfrmTelaHeranca)
    qryListagemcategoriaId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oCategoria : TCategoria;
  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
  end;

var
  frmCadCategorias: TfrmCadCategorias;

implementation

{$R *.dfm}


procedure TfrmCadCategorias.btnGravarClick(Sender: TObject);
begin
  oCategoria.codigo := 100;
  oCategoria.descricao := 'TESTE';

  ShowMessage(oCategoria.descricao);

  inherited;

end;

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
  oCategoria := TCategoria.Create;
  IndiceAtual := 'categoriaId';
end;

end.
