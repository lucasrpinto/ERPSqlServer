inherited frmCadCategorias: TfrmCadCategorias
  Caption = 'Cadastro de Categorias'
  ClientHeight = 364
  ClientWidth = 790
  ExplicitWidth = 796
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 315
    Width = 790
    ExplicitTop = 315
    ExplicitWidth = 790
    inherited btnNovo: TBitBtn
      Left = 6
      Top = 15
      ExplicitLeft = 6
      ExplicitTop = 15
    end
    inherited btnAlterar: TBitBtn
      Left = 99
      Top = 15
      Width = 93
      ExplicitLeft = 99
      ExplicitTop = 15
      ExplicitWidth = 93
    end
    inherited btnCancelar: TBitBtn
      Left = 196
      Top = 15
      Width = 92
      ExplicitLeft = 196
      ExplicitTop = 15
      ExplicitWidth = 92
    end
    inherited btnGravar: TBitBtn
      Left = 291
      Top = 15
      Width = 100
      ExplicitLeft = 291
      ExplicitTop = 15
      ExplicitWidth = 100
    end
    inherited btnExcluir: TBitBtn
      Left = 395
      Top = 15
      ExplicitLeft = 395
      ExplicitTop = 15
    end
    inherited dbnNavigator: TDBNavigator
      Left = 489
      Top = 14
      Width = 184
      Hints.Strings = ()
      ExplicitLeft = 489
      ExplicitTop = 14
      ExplicitWidth = 184
    end
    inherited btnFechar: TBitBtn
      Left = 689
      ExplicitLeft = 689
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 790
    Height = 315
    ActivePage = tabManutencao
    ExplicitWidth = 790
    ExplicitHeight = 315
    inherited tabListagem: TTabSheet
      ExplicitWidth = 782
      ExplicitHeight = 287
      inherited pnlListagemTopo: TPanel
        Width = 782
        ExplicitWidth = 782
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
        Width = 782
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
      ExplicitWidth = 782
      ExplicitHeight = 287
      object edtCategoriaId: TLabeledEdit
        Tag = 1
        Left = 0
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 43
        EditLabel.Height = 18
        EditLabel.Caption = 'C'#243'digo'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -15
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        OnChange = edtCategoriaIdChange
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 112
        Width = 513
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 62
        EditLabel.Height = 18
        EditLabel.Caption = 'Descri'#231#227'o'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -15
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
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
