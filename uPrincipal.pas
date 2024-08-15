unit uPrincipal;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter;
type
  TdtmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIOS1: TMenuItem;
    menuCliente: TMenuItem;
    N1: TMenuItem;
    menuCategoria: TMenuItem;
    menuProduto: TMenuItem;
    N2: TMenuItem;
    menuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    N3: TMenuItem;
    PRODUTO1: TMenuItem;
    N4: TMenuItem;
    VENDA1: TMenuItem;
    N5: TMenuItem;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuCategoriaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;
var
  dtmPrincipal: TdtmPrincipal;
implementation
{$R *.dfm}
uses uCadCategorias;
procedure TdtmPrincipal.menuCategoriaClick(Sender: TObject);
var
  frmCadCategorias: TfrmCadCategorias;
begin
  frmCadCategorias := TfrmCadCategorias.Create(self);
  try
    frmCadCategorias.ShowModal;
  finally
    frmCadCategorias.Free;
  end;
end;
procedure TdtmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmConexao);
end;
procedure TdtmPrincipal.FormCreate(Sender: TObject);
begin
  dtmConexao := TdtmConexao.Create(Self);
  // Configura��o do Banco de Dados
  with dtmConexao.ConexaoDB do
  begin
    Protocol := 'mssql';
    LibraryLocation := 'C:\Workspace\Andamento\ERP_SQLServer\ntwdblib.dll';
    HostName := '.\SQL2014';
    Port := 1433;
    User := 'sa';
    Password := '2014';
    Database := 'vendas';
    Connected := True;
  end;
  TeclaEnter := TMREnter.Create(self);
  TeclaEnter.FocusEnabled := True;
  TeclaEnter.FocusColor := clInfoBk;
end;
procedure TdtmPrincipal.menuFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;
end.
