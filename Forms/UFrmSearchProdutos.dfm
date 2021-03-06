object FrmSearchProdutos: TFrmSearchProdutos
  Left = 0
  Top = 0
  Caption = 'Selecionar Produto'
  ClientHeight = 377
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI Semilight'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 25
    Caption = 'Produtos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 475
    Top = 40
    Width = 246
    Height = 17
    Margins.Left = 475
    Margins.Top = 40
    Margins.Right = 0
    Align = alTop
    Caption = 'Categoria'
    ExplicitLeft = 455
    ExplicitWidth = 53
  end
  object Label3: TLabel
    Left = 8
    Top = 39
    Width = 43
    Height = 17
    Caption = 'Produto'
  end
  object grdProdutos: TJvDBUltimGrid
    AlignWithMargins = True
    Left = 3
    Top = 93
    Width = 715
    Height = 234
    Align = alBottom
    DataSource = dsProdutos
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI Semilight'
    TitleFont.Style = []
    OnCellClick = grdProdutosCellClick
    OnDblClick = grdProdutosDblClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 21
    TitleRowHeight = 21
    Columns = <
      item
        Expanded = False
        FieldName = 'produtoID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estoque'
        Title.Caption = 'Qtd. em Estoque'
        Visible = True
      end>
  end
  object ipSCategoria: TDBLookupComboBox
    AlignWithMargins = True
    Left = 475
    Top = 62
    Width = 243
    Height = 25
    Margins.Left = 475
    Margins.Top = 0
    Align = alBottom
    KeyField = 'categoriaID'
    ListField = 'descricao'
    ListSource = dsCategorias
    TabOrder = 1
    OnCloseUp = ipSCategoriaCloseUp
    ExplicitLeft = 470
  end
  object ipSProduto: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 62
    Width = 441
    Height = 25
    TabOrder = 2
    OnKeyUp = ipSProdutoKeyUp
  end
  object btnConfirmar: TButton
    AlignWithMargins = True
    Left = 500
    Top = 333
    Width = 218
    Height = 41
    Margins.Left = 500
    Align = alBottom
    Caption = 'Selecionar Produto'
    ModalResult = 1
    TabOrder = 3
    ExplicitLeft = 560
    ExplicitWidth = 158
  end
  object Button2: TButton
    Left = 91
    Top = 7
    Width = 129
    Height = 33
    Caption = 'Novo Produto'
    TabOrder = 4
    OnClick = Button2Click
  end
  object qryProdutos: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from produto')
    Left = 376
    Top = 152
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 560
    Top = 200
  end
  object qryCategorias: TADOQuery
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from categoria')
    Left = 416
    Top = 16
  end
  object dsCategorias: TDataSource
    DataSet = qryCategorias
    Left = 352
    Top = 8
  end
end
