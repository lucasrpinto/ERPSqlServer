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
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir: TBitBtn;
      dbnNavigator: TDBNavigator; pgcPrincipal: TPageControl; Flag: Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; i: Integer);
    function RetornaCampoTraduzido(Campo: String): string;
    procedure ExiberLabelIndice(Campo: String; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdit;
  public
    { Public declarations }
    EstadoDoCadastro: TEstadoDoCadastro;
    IndiceAtual : String;
    function Excluir : Boolean; virtual;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro) : Boolean; virtual;
  end;
var
  frmTelaHeranca: TfrmTelaHeranca;
  FEmModoEdicao: Boolean;
implementation
{$R *.dfm}

{$region 'OBSERVA��ES}

  //TAG: 1 - Chave Prim�ria - PK
  //TAG: 2 - Campos Obrigat�rios

{$endregion}


{$region 'FUN��ES E PROCEDURES'}
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

          if (TLabeledEdit(Components[i]).Tag = 2) and (TLabeledEdit(Components[i]).Text = EmptyStr) then
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


procedure TfrmTelaHeranca.DesabilitarEditPK;
var i : integer;
begin

  for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TLabeledEdit) then
        begin

          if (TLabeledEdit(Components[i]).Tag = 1) then
            begin
              TLabeledEdit(Components[i]).ReadOnly := True;
              break;
            end;
        end;
    end;
end;

procedure TfrmTelaHeranca.LimparEdit;
var i : integer;
begin

  for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TLabeledEdit) then
          TLabeledEdit(Components[i]).Text := EmptyStr
      else if (Components[i] is TLabeledEdit) then
          TEdit(Components[i]).Text := '';
    end;
end;

{$endregion}

{$region 'M�TODOS VIRTUAIS'}
function TfrmTelaHeranca.Excluir: Boolean;
begin

  ShowMessage('EXCLUIDO COM SUCESSO');
  Result := True;

end;


function TfrmTelaHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin

  if (EstadoDoCadastro=ecInserir) then
       showmessage('Inserir')
   else if (EstadoDoCadastro=ecAlterar) then
       showmessage('Alterado')
   else
      showmessage('Nada aconteceu');

end;
{$endregion}


{$region 'PROCEDURES DOS BOT�ES'}
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, False);
  FEmModoEdicao := True;
  EstadoDoCadastro := ecInserir;
  LimparEdit;
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
  LimparEdit;
end;


procedure TfrmTelaHeranca.btnExcluirClick(Sender: TObject);
begin
  Try
    if (Excluir) then
      begin
        ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
        ControlarIndiceTab(pgcPrincipal, 0);
        LimparEdit;
        MessageDlg('Excluido com sucesso!', TMsgDlgType.mtInformation, [mbOk], 0);

        qryListagem.Refresh;
      end
    else
      begin
        MessageDlg('Erro na exclus�o', TMsgDlgType.mtError, [mbOk], 0);
      end;
  Finally;
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
    abort;

  try
    if Gravar(EstadoDoCadastro) then
      begin
        ControlarBotoes(btnNovo, btnFechar, btnAlterar, btnCancelar, btnGravar, btnExcluir, dbnNavigator, pgcPrincipal, True);
        ControlarIndiceTab(pgcPrincipal, 0);
        EstadoDoCadastro := ecNenhum;
        LimparEdit;

        MessageDlg('Salvo com sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);

        qryListagem.Refresh;
      end
      else
        begin
          MessageDlg('Erro ao salvar. Tente novamente.', TMsgDlgType.mtError, [mbOk], 0);
        end;
  finally

  end;
end;


procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
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
    DesabilitarEditPK;
end;


{$endregion}

end.

