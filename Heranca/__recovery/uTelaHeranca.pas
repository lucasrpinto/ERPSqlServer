unit uTelaHeranca;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.DBCtrls, uDTMConexao, uEnum2;
type
  TfrmTelaHeranca = class(TForm)
    pnlRodape: TPanel;
    pgcPrincipal: TPageControl;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    dbnNavigator: TDBNavigator;
    btnFechar: TBitBtn;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    EstadoDoCadastro: TEstadoDoCadastro;
    procedure ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir: TBitBtn;
      dbnNavigator: TDBNavigator; pgcPrincipal: TPageControl; Flag: Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; i: Integer);
    function RetornaCampoTraduzido(Campo: String): string;
    procedure ExiberLabelIndice(Campo: String; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
  public
    { Public declarations }
    IndiceAtual : String;
    function Excluir : Boolean; virtual;
    function Gravar(EstadoDOCadastro:TEstadoDoCadastro) : Boolean; virtual;
  end;
var
  frmTelaHeranca: TfrmTelaHeranca;
  FEmModoEdicao: Boolean;
implementation
{$R *.dfm}


{$region 'FUNÇÕES E PROCEDURES'}
procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir: TBitBtn;
  dbnNavigator: TDBNavigator; pgcPrincipal: TPageControl; Flag: Boolean);
begin
  btnNovo.Enabled := Flag;
  btnExcluir.Enabled := Flag;
  btnAlterar.Enabled := Flag;
  dbnNavigator.Enabled := Flag;
  btnFechar.Enabled := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
  btnCancelar.Enabled := not Flag;
  btnGravar.Enabled := not Flag;
end;
procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; i: Integer);
begin
  if (pgcPrincipal.PageCount > 0) and (i < pgcPrincipal.PageCount) then
    pgcPrincipal.TabIndex := i;
end;

function TfrmTelaHeranca.RetornaCampoTraduzido(Campo:String):string;
var i : Integer;
begin
  for i := 0 to qryListagem.Fields.Count - 1 do
     if  UpperCase(qryListagem.Fields[i].FieldName) = UpperCase(Campo) then
      begin
        Result := qryListagem.Fields[i].DisplayLabel;
        Break;
      end;
end;


procedure TfrmTelaHeranca.ExiberLabelIndice(Campo:String; aLabel:TLabel);
begin
  aLabel.Caption := RetornaCampoTraduzido(Campo);
end;


function TfrmTelaHeranca.ExisteCampoObrigatorio : Boolean;
var i : integer;
begin

  Result := False;
  for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TLabeledEdit) then
        begin

          if (TLabeledEdit(Components[i]).Tag = 1) and (TLabeledEdit(Components[i]).Text = EmptyStr) then
            begin

              MessageDlg('Preencha o campo de ' + TLabeledEdit(Components[i]).EditLabel.Caption,
                          mtInformation, [mbOK], 0);

              TLabeledEdit(Components[i]).SetFocus;
              Result := True;

              Break;

            end;


        end;
    end;


end;

{$endregion}

{$region 'MÉTODOS VIRTUAIS'}
function TfrmTelaHeranca.Excluir: Boolean;
begin

  ShowMessage('EXCLUIDO COM SUCESSO');
  Result := True;

end;


function TfrmTelaHeranca.Gravar(EstadoDOCadastro: TEstadoDoCadastro): Boolean;
begin

  if (EstadoDoCadastro = ecInserir) then
    ShowMessage('SALVO COM SUCESSO')
  else if (EstadoDoCadastro = ecAlterar) then
    ShowMessage('ALTERADO COM SUCESSO');

  Result := True;

end;
{$endregion}


{$region 'PROCEDURES DOS BOTÕES'}
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, False);
  FEmModoEdicao := True;
  EstadoDoCadastro := ecInserir;
end;


procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  FEmModoEdicao := True;
  ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, False);
  EstadoDoCadastro := ecAlterar;
end;


procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  FEmModoEdicao := False;
  ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro := ecNenhum;
end;


procedure TfrmTelaHeranca.btnExcluirClick(Sender: TObject);
begin
  if Excluir then
    begin
      ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
      ControlarIndiceTab(pgcPrincipal, 0);
      EstadoDoCadastro := ecNenhum;
    end;

end;


procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  FEmModoEdicao := False;

  if (ExisteCampoObrigatorio) then
    exit;

  try
    if Gravar(EstadoDoCadastro) then
      begin
        ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
        ControlarIndiceTab(pgcPrincipal, 0);
      end;
  finally
    EstadoDoCadastro := ecNenhum;
  end;
end;


procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  qryListagem.IndexFieldNames := IndiceAtual;
  lblIndice.Caption := RetornaCampoTraduzido(IndiceAtual);
  ExiberLabelIndice(IndiceAtual, lblIndice);
end;


procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  qryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;
{$endregion}

{$region 'FormCreate e FormShow'}
procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  if not dtmConexao.ConexaoDB.Connected then
    dtmConexao.ConexaoDB.Connect;

  qryListagem.Connection := dtmConexao.ConexaoDB;
  dtsListagem.DataSet := qryListagem;
  grdListagem.DataSource := dtsListagem;
  dbnNavigator.DataSource := dtsListagem;

  ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
  grdListagem.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,dgTitleClick,dgTitleHotTrack];


end;


procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (qryListagem.SQL.Text <> EmptyStr) then
    begin
      qryListagem.IndexFieldNames := IndiceAtual;
      ExiberLabelIndice(IndiceAtual, lblIndice);
      qryListagem.Open;
    end;
    ControlarIndiceTab(pgcPrincipal, 0);
end;


{$endregion}

end.
