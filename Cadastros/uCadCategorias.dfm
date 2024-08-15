inherited frmCadCategorias: TfrmCadCategorias
  Caption = 'Cadastro de Categorias'
  ClientHeight = 536
  ClientWidth = 888
  ExplicitWidth = 894
  ExplicitHeight = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 487
    Width = 888
    ExplicitTop = 487
    ExplicitWidth = 888
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
      Left = 789
      ExplicitLeft = 789
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 888
    Height = 487
    ExplicitWidth = 888
    ExplicitHeight = 487
    inherited tabListagem: TTabSheet
      ExplicitWidth = 880
      ExplicitHeight = 459
      inherited pnlListagemTopo: TPanel
        Width = 880
        ExplicitWidth = 880
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
        Width = 880
        Height = 398
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
      ExplicitWidth = 880
      ExplicitHeight = 459
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
