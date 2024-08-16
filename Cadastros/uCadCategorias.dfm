inherited frmCadCategorias: TfrmCadCategorias
  Caption = 'Cadastro de Categorias'
  ClientHeight = 364
  ClientWidth = 901
  ExplicitWidth = 907
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 315
    Width = 901
    ExplicitTop = 315
    ExplicitWidth = 901
    inherited btnNovo: TBitBtn
      Left = 6
      Top = 15
      ExplicitLeft = 6
      ExplicitTop = 15
    end
    inherited btnAlterar: TBitBtn
      Left = 102
      Top = 15
      Width = 93
      ExplicitLeft = 102
      ExplicitTop = 15
      ExplicitWidth = 93
    end
    inherited btnCancelar: TBitBtn
      Left = 203
      Top = 15
      Width = 92
      ExplicitLeft = 203
      ExplicitTop = 15
      ExplicitWidth = 92
    end
    inherited btnGravar: TBitBtn
      Left = 301
      Top = 15
      Width = 100
      ExplicitLeft = 301
      ExplicitTop = 15
      ExplicitWidth = 100
    end
    inherited btnExcluir: TBitBtn
      Left = 407
      Top = 15
      ExplicitLeft = 407
      ExplicitTop = 15
    end
    inherited dbnNavigator: TDBNavigator
      Left = 503
      Top = 14
      Hints.Strings = ()
      ExplicitLeft = 503
      ExplicitTop = 14
    end
    inherited btnFechar: TBitBtn
      Left = 802
      ExplicitLeft = 802
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 901
    Height = 315
    ActivePage = tabManutencao
    ExplicitWidth = 901
    ExplicitHeight = 315
    inherited tabListagem: TTabSheet
      ExplicitWidth = 893
      ExplicitHeight = 287
      inherited pnlListagemTopo: TPanel
        Width = 893
        ExplicitWidth = 893
        inherited lblIndice: TLabel
          Top = 2
          ExplicitTop = 2
        end
        inherited mskPesquisar: TMaskEdit
          Width = 451
          ExplicitWidth = 451
        end
        inherited btnPesquisar: TBitBtn
          Left = 457
          Top = 23
          Visible = False
          ExplicitLeft = 457
          ExplicitTop = 23
        end
      end
      inherited grdListagem: TDBGrid
        Width = 893
        Height = 226
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 455
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 893
      ExplicitHeight = 287
      object edtCategoriaId: TLabeledEdit
        Left = 0
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Tag = 1
        Left = 0
        Top = 96
        Width = 513
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT categoriaId,'#11
      '             descricao'
      'FROM categorias')
    Left = 628
    Top = 24
    object qryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'descricao'
      Size = 30
    end
  end
  inherited dtsListagem: TDataSource
    DataSet = qryListagem
    Left = 676
    Top = 24
  end
end
