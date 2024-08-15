unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadCategorias = class(TfrmTelaHeranca)
    qryListagemcategoriaId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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

procedure TfrmCadCategorias.FormCreate(Sender: TObject);
begin

  inherited;

  IndiceAtual := 'categoriaId';
end;

end.
