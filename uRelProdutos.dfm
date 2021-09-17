object frmRelatorioProdutos: TfrmRelatorioProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Produtos'
  ClientHeight = 178
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object chkCategoria: TCheckBox
    Left = 16
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Categoria'
    TabOrder = 0
  end
  object chkTipoMaterial: TCheckBox
    Left = 16
    Top = 101
    Width = 129
    Height = 17
    Caption = 'Tipo de Material'
    TabOrder = 1
  end
  object dblCategoria: TDBLookupComboBox
    Left = 16
    Top = 47
    Width = 337
    Height = 21
    KeyField = 'categoriaID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryCategorias
    TabOrder = 2
  end
  object dblTipoMaterial: TDBLookupComboBox
    Left = 16
    Top = 124
    Width = 337
    Height = 21
    KeyField = 'tipoId'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryTipoMaterial
    TabOrder = 3
  end
  object btnImprimir: TBitBtn
    Left = 384
    Top = 32
    Width = 117
    Height = 46
    Caption = 'Visualizar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFF9D9D9D5959595959595959595959595959595959595959595959599D9D
      9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B6B6BF8F8F8F8F8F8F8F8F8F8
      F8F8F8F8F8F8F8F8F8F8F8F8F8F86B6B6BFFFFFFFFFFFFFFFFFF919191444444
      4444446A6A6AB5B5B5EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFB5B5B56A6A
      6A4C4C4C444444919191494949C0C0C0C1C0C15252527271728B8B8B8C8A8B8B
      8B8C8B8A8B8A8B8C8C8C8C737373555454C3C2C3C1C1C24949494F4F4FC5C5C5
      C7C7C74C4B4D4B4C4C4B4B4B4B4A4B4B4C4B4C4C4D4D4D4E4E4E4E5152515253
      53CAC9C9C9CACA4F4F4F575757D1D1D1D4D4D4D4D4D4D4D5D4D4D4D4D4D4D4D3
      D3D4D4D4D4D4D4D4D4D5D4D6D6D6D7D7D7D7D8D8D6D5D5575757606060DFDFDF
      E3E3E359595A595A5A59595A59595A5A595A59595A59595A595A5A59595A5959
      5AE5E7E6E4E4E4606060686868F0F0F0F5F5F561626261616261626262616261
      6262616262626162626261626162626262F5F5F5F1F1F1686868929292F1F0F1
      F8F8F768696A69696A69696969696969696A6969696969696969696969696969
      69F8F8F8F1F0F1909090D0D0D0B0B0B0EFEFEF6E6E6E6E6E6E6E6E6E6E6E6E6E
      6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6EEFEFEFB9B9B9CECECEFFFFFFB4B4B4
      8282824D4D4DC8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C84D4D
      4D828282B4B4B4FFFFFFFFFFFFFFFFFFFFFFFF5F5F5FD4D4D4D4D4D4D4D4D4D4
      D4D4D4D4D4D4D4D4D4D4D4D4D4D45F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF696969E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E16969
      69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF747474EDEDEDEDEDEDEDEDEDED
      EDEDEDEDEDEDEDED747474747474AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF7D7D7DF5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F57D7D7DB3B3B3FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B784848484848484848484
      8484848484848484B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 4
    OnClick = btnImprimirClick
  end
  object CheckBox1: TCheckBox
    Left = 384
    Top = 124
    Width = 117
    Height = 17
    Caption = 'Quebrar P'#225'gina'
    TabOrder = 5
  end
  object qryRelatorioProdutos: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select  e.nome as prefeitura, e.nomeuf as nomeestado, e.cnpj, e.' +
        'logo,'
      
        'p.produtoID as CodigoProduto, p.descricao as NomeProduto, p.esto' +
        'queminino, p.estoquemaximo, p.estoque,'
      
        'c.descricao as Categoria, t.descricao as TipoProduto, u.descrica' +
        'o as Unidade'
      'from produto as p'
      'join entidade as e'
      'join categoria as c on c.categoriaID = p.idcategoria'
      'join tipoproduto as t on t.tipoId = p.idtipo'
      'join unidademedida as u on u.unidadeID = p.idunidade')
    Left = 136
    Top = 96
  end
  object dsQryRelProdutos: TDataSource
    DataSet = qryRelatorioProdutos
    Left = 248
    Top = 88
  end
  object frxDBRelatorioProdutos: TfrxDBDataset
    UserName = 'frxDBRelatorioProdutos'
    CloseDataSource = False
    DataSource = dsQryRelProdutos
    BCDToCurrency = False
    Left = 152
    Top = 8
  end
  object frxRelatorioProdutos: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42047.555270682900000000
    ReportOptions.LastChange = 43602.667725856480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 248
    Top = 8
    Datasets = <
      item
        DataSet = frxDBRelatorioProdutos
        DataSetName = 'frxDBRelatorioProdutos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Logomarca: TfrxPictureView
          Left = 11.338590000000000000
          Top = 7.559060000000000000
          Width = 120.944960000000000000
          Height = 102.047310000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          Left = 151.181200000000000000
          Top = 3.779530000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Sistema de Compra e Estoque')
        end
        object frxDBRelatorioProdutosnomeestado: TfrxMemoView
          Left = 151.181200000000000000
          Top = 30.236240000000000000
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          DataField = 'nomeestado'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."nomeestado"]')
          ParentFont = False
        end
        object frxDBRelatorioProdutosprefeitura: TfrxMemoView
          Left = 151.181200000000000000
          Top = 60.472480000000000000
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          DataField = 'prefeitura'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."prefeitura"]')
          ParentFont = False
        end
        object frxDBRelatorioProdutoscnpj: TfrxMemoView
          Left = 151.181200000000000000
          Top = 90.708720000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          Memo.UTF8W = (
            'CNPJ: [frxDBRelatorioProdutos."cnpj"]')
        end
        object Date: TfrxMemoView
          Left = 634.961040000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 253.228510000000000000
          Top = 132.283550000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Produtos')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBRelatorioProdutos."Categoria"'
        object frxDBRelatorioProdutosCategoria: TfrxMemoView
          Left = 2.559060000000000000
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria: [frxDBRelatorioProdutos."Categoria"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 1.881880000000000000
          Top = 20.897650000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        DataSet = frxDBRelatorioProdutos
        DataSetName = 'frxDBRelatorioProdutos'
        RowCount = 0
        Stretched = True
        object frxDBRelatorioProdutosCodigoProduto: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'CodigoProduto'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."CodigoProduto"]')
          ParentFont = False
        end
        object frxDBRelatorioProdutosNomeProduto: TfrxMemoView
          Left = 52.913420000000000000
          Top = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'NomeProduto'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."NomeProduto"]')
          ParentFont = False
        end
        object frxDBRelatorioProdutosTipoProduto: TfrxMemoView
          Left = 319.228510000000000000
          Top = 3.779530000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'TipoProduto'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."TipoProduto"]')
          ParentFont = False
        end
        object frxDBRelatorioProdutosUnidade: TfrxMemoView
          Left = 474.189240000000000000
          Top = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'Unidade'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."Unidade"]')
          ParentFont = False
        end
        object frxDBRelatorioProdutosestoque: TfrxMemoView
          Left = 527.102660000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'estoque'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."estoque"]')
          ParentFont = False
        end
        object frxDBRelatorioProdutosestoqueminino: TfrxMemoView
          Left = 589.575140000000000000
          Top = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'estoqueminino'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."estoqueminino"]')
          ParentFont = False
        end
        object frxDBRelatorioProdutosestoquemaximo: TfrxMemoView
          Left = 640.488560000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'estoquemaximo'
          DataSet = frxDBRelatorioProdutos
          DataSetName = 'frxDBRelatorioProdutos'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelatorioProdutos."estoquemaximo"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 2.779530000000000000
          Top = 26.456710000000000000
          Width = 714.331170000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Color = clGray
          Diagonal = True
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 3.559060000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo/Nome Produto')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 319.008040000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Material')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 473.968770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'U. Med.')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 534.441250000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estoque')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 594.913730000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'M'#237'nimo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 666.724800000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'M'#225'ximo')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 1.000000000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 377.953000000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 22.354360000000000000
          Top = 12.559060000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Itens Listados: ')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 113.063080000000000000
          Top = 12.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 483.779840000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 634.961040000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'g.[Page#]')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 352
    Top = 16
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 344
    Top = 80
  end
end
