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
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
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

procedure TfrmCadCategorias.btnGravarClick(Sender: TObject);
begin
  if (edtDescricao.Text = EmptyStr) then
    begin
      ShowMessage('Preencha o campo de descrição.');
      edtDescricao.SetFocus;
      Exit;
    end
  else
    begin
      edtDescricao.Color := clWindow;
      edtDescricao.Font.Color := clWindowText;
    end;

  inherited;

end;

procedure TfrmCadCategorias.btnNovoClick(Sender: TObject);
begin
    edtCategoriaId.ReadOnly := True;

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

procedure TfrmCadCategorias.FormCreate(Sender: TObject);
begin

  inherited;

  IndiceAtual := 'categoriaId';
end;

end.
