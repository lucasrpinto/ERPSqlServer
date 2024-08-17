program ERP_SQLServer;

uses
  Vcl.Forms,
  uDTMConexao in 'datamodule\uDTMConexao.pas' {dtmConexao: TDataModule},
  uCadCategorias in 'Cadastros\uCadCategorias.pas' {frmCadCategorias},
  uPrincipal in 'uPrincipal.pas' {dtmPrincipal},
  Enter in 'terceiros\Enter.pas',
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uEnum2 in 'Heranca\uEnum2.pas',
  cCadCategoria in 'classes\cCadCategoria.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfrmTelaHeranca, frmTelaHeranca);
  Application.CreateForm(TfrmTelaHeranca, frmTelaHeranca);
  Application.Run;
end.
