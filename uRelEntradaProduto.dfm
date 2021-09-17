object frmRelEntradaProduto: TfrmRelEntradaProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Entrada de Produto'
  ClientHeight = 376
  ClientWidth = 689
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 169
    Height = 121
    Caption = '  Per'#237'odo '
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 19
      Width = 15
      Height = 13
      Caption = 'De'
    end
    object Label2: TLabel
      Left = 13
      Top = 72
      Width = 20
      Height = 13
      Caption = 'At'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtpDe: TDateTimePicker
      Left = 13
      Top = 35
      Width = 124
      Height = 21
      Date = 42026.474448287040000000
      Time = 42026.474448287040000000
      TabOrder = 0
    end
    object dtpAte: TDateTimePicker
      Left = 13
      Top = 89
      Width = 124
      Height = 21
      Date = 42026.474499189810000000
      Time = 42026.474499189810000000
      TabOrder = 1
    end
  end
  object chkPedido: TCheckBox
    Left = 192
    Top = 16
    Width = 97
    Height = 17
    Caption = 'Pedido'
    TabOrder = 1
  end
  object chkNotaFiscal: TCheckBox
    Left = 352
    Top = 16
    Width = 97
    Height = 17
    Caption = 'Nota Fiscal'
    TabOrder = 2
  end
  object chkEmpenho: TCheckBox
    Left = 192
    Top = 82
    Width = 129
    Height = 17
    Caption = 'Empenho/Processo'
    TabOrder = 3
  end
  object chkCategoria: TCheckBox
    Left = 352
    Top = 232
    Width = 97
    Height = 17
    Caption = 'Categoria'
    TabOrder = 4
  end
  object chkFornecedor: TCheckBox
    Left = 352
    Top = 160
    Width = 97
    Height = 17
    Caption = 'Fornecedor'
    TabOrder = 5
  end
  object chkProduto: TCheckBox
    Left = 8
    Top = 232
    Width = 97
    Height = 17
    Caption = 'Produto'
    TabOrder = 6
  end
  object chkLocalArmazenamento: TCheckBox
    Left = 8
    Top = 160
    Width = 169
    Height = 17
    Caption = 'Local de Armazenamento'
    TabOrder = 7
  end
  object edtPedido: TEdit
    Left = 192
    Top = 39
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object edtEmpenho: TEdit
    Left = 192
    Top = 105
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object dblCategoria: TDBLookupComboBox
    Left = 352
    Top = 255
    Width = 297
    Height = 21
    KeyField = 'categoriaID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryCategorias
    TabOrder = 10
  end
  object dblArmazenamento: TDBLookupComboBox
    Left = 8
    Top = 183
    Width = 313
    Height = 21
    KeyField = 'almoxarifadoID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryAlmoxarifado
    TabOrder = 11
  end
  object dblFornecedor: TDBLookupComboBox
    Left = 352
    Top = 183
    Width = 297
    Height = 21
    KeyField = 'cpfcnpj'
    ListField = 'razaosocial'
    ListSource = dmComprasEstoque.dsQryFornecedor
    TabOrder = 12
  end
  object dblProduto1: TDBLookupComboBox
    Left = 8
    Top = 255
    Width = 262
    Height = 21
    KeyField = 'produtoID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryProdRequisicao
    TabOrder = 13
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 22
    Width = 113
    Height = 42
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
    TabOrder = 14
    OnClick = BitBtn1Click
  end
  object edtNotaFiscal: TMaskEdit
    Left = 352
    Top = 39
    Width = 118
    Height = 21
    EditMask = '!000.000.000;1;0'
    MaxLength = 11
    TabOrder = 15
    Text = '   .   .   '
    OnChange = edtNotaFiscalChange
  end
  object edtProduto: TEdit
    Left = 268
    Top = 255
    Width = 53
    Height = 21
    NumbersOnly = True
    TabOrder = 16
    TextHint = 'C'#243'digo'
  end
  object dblProduto: TJvDBLookupEdit
    Left = 8
    Top = 282
    Width = 262
    Height = 21
    LookupDisplay = 'descricao'
    LookupField = 'produtoID'
    LookupSource = dmComprasEstoque.dsQryProdRequisicao
    TabOrder = 17
    Text = 'dblProduto'
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42026.505460891200000000
    ReportOptions.LastChange = 43602.648405555560000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 464
    Top = 136
    Datasets = <
      item
        DataSet = frxEntidade
        DataSetName = 'frxEntidade'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxRelatorio'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 132.283550000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 326.039580000000000000
          Top = 102.606370000000000000
          Width = 434.645950000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Movimento de Entrada')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 149.559060000000000000
          Top = 3.779530000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Sistema de Compras e Estoque')
          ParentFont = False
        end
        object Logomarca: TfrxPictureView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 124.724490000000000000
          Height = 109.606370000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxRelatorioprefeitura: TfrxMemoView
          Left = 149.559060000000000000
          Top = 50.913420000000000000
          Width = 555.590910000000000000
          Height = 26.456710000000000000
          DataField = 'prefeitura'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxRelatorio."prefeitura"]')
          ParentFont = False
        end
        object frxRelatoriocnpj: TfrxMemoView
          Left = 149.559060000000000000
          Top = 79.370130000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Memo.UTF8W = (
            'CNPJ: [frxRelatorio."cnpj"]')
        end
        object frxRelatorioestado: TfrxMemoView
          Left = 149.559060000000000000
          Top = 26.456710000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          DataField = 'estado'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Memo.UTF8W = (
            '[frxRelatorio."estado"]')
        end
        object Memo18: TfrxMemoView
          Left = 816.378480000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Per'#237'odo de Listagem:')
          ParentFont = False
        end
        object periodo: TfrxMemoView
          Left = 816.378480000000000000
          Top = 18.897650000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'periodo')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 2.236240000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 71.811070000000000000
          Top = 2.236240000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 152.740260000000000000
          Top = 2.236240000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empenho')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 226.771800000000000000
          Top = 2.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'NF')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 336.378170000000000000
          Top = 2.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 544.252320000000000000
          Top = 2.236240000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo/Descri'#231#227'o do Produto')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 761.024120000000000000
          Top = 2.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 854.512370000000000000
          Top = 2.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Unit.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 963.780150000000000000
          Top = 2.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 0.118120000000000000
          Top = 22.661410000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxRelatorio'
        RowCount = 0
        StartNewPage = True
        object Memo11: TfrxMemoView
          Left = 6.267780000000010000
          Top = 3.102350000000010000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Local de Armazenamento:')
          ParentFont = False
        end
        object frxRelatorioAlmoxarifado: TfrxMemoView
          Left = 202.803340000000000000
          Top = 3.102350000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Almoxarifado'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxRelatorio."Almoxarifado"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 26.456710000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxRelatorio'
        RowCount = 0
        Stretched = True
        object frxRelatorioPedido: TfrxMemoView
          Left = 7.559060000000000000
          Top = 2.000000000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'Pedido'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRelatorio."Pedido"]')
          ParentFont = False
        end
        object frxRelatorioData: TfrxMemoView
          Left = 71.811070000000000000
          Top = 2.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'Data'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRelatorio."Data"]')
          ParentFont = False
        end
        object frxRelatorioEmpenho: TfrxMemoView
          Left = 154.740260000000000000
          Top = 2.000000000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'Empenho'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRelatorio."Empenho"]')
          ParentFont = False
        end
        object frxRelatorionotafiscal: TfrxMemoView
          Left = 226.771800000000000000
          Top = 2.000000000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'notafiscal'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRelatorio."notafiscal"]')
          ParentFont = False
        end
        object frxRelatorioFornecedor: TfrxMemoView
          Left = 336.378170000000000000
          Top = 2.000000000000000000
          Width = 196.535560000000000000
          Height = 30.236240000000000000
          DataField = 'Fornecedor'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRelatorio."Fornecedor"]')
          ParentFont = False
        end
        object frxRelatorioprodutoID: TfrxMemoView
          Left = 544.252320000000000000
          Top = 2.000000000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'produtoID'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRelatorio."produtoID"]')
          ParentFont = False
        end
        object frxRelatoriodescricao: TfrxMemoView
          Left = 589.606680000000000000
          Top = 2.000000000000000000
          Width = 170.078850000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          DataField = 'descricao'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRelatorio."descricao"]')
          ParentFont = False
        end
        object frxRelatorioquantidade: TfrxMemoView
          Left = 761.024120000000000000
          Top = 2.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'quantidade'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
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
            '[frxRelatorio."quantidade"]')
          ParentFont = False
        end
        object frxRelatoriovalorunitario: TfrxMemoView
          Left = 845.173780000000000000
          Top = 2.000000000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'valorunitario'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxRelatorio."valorunitario"]')
          ParentFont = False
        end
        object frxRelatoriovalortotal: TfrxMemoView
          Left = 956.221090000000000000
          Top = 2.000000000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'valortotal'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxRelatorio."valortotal"]')
          ParentFont = False
        end
        object frxRelatoriodesconto1: TfrxMemoView
          Left = 434.645950000000000000
          Top = 15.118120000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Visible = False
          DataField = 'desconto'
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Memo.UTF8W = (
            '[frxRelatorio."desconto"]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 196.535560000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        object Memo8: TfrxMemoView
          Left = 657.638220000000000000
          Top = 4.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 752.346940000000000000
          Top = 4.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxRelatorio."quantidade">,DetailData1)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo10: TfrxMemoView
          Left = 833.496600000000000000
          Top = 4.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxRelatorio."valorunitario">,DetailData1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 941.323440000000000000
          Top = 4.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxRelatorio."valortotal">,DetailData1)]')
          ParentFont = False
        end
        object frxRelatoriodesconto: TfrxMemoView
          Left = 332.598640000000000000
          Top = 37.795280470000000000
          Width = 419.527830000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto: R$ [SUM(<frxRelatorio."desconto">, DetailData1)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 752.126470000000000000
          Top = 37.795300000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = frxDBDataset1
          DataSetName = 'frxRelatorio'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total Com Desconto: R$ [SUM(<frxRelatorio."valortotal">,DetailDa' +
              'ta1) - SUM(<frxRelatorio."desconto">, DetailData1)]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Top = 30.236220472440900000
          Width = 1054.488870000000000000
          Color = clBlack
          Frame.Color = clSilver
          Diagonal = True
        end
        object Line5: TfrxLineView
          Top = 64.252010000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxEntidaderesp1_nome: TfrxMemoView
          Left = 81.811070000000000000
          Top = 129.929190000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxEntidade
          DataSetName = 'frxEntidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxEntidade."resp1_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxEntidade."resp1_nome"]')
          ParentFont = False
        end
        object frxEntidaderesp2_nome: TfrxMemoView
          Left = 542.913730000000000000
          Top = 129.929190000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxEntidade
          DataSetName = 'frxEntidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.ApplyFrame = True
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxEntidade."resp2_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxEntidade."resp2_nome"]')
          ParentFont = False
        end
        object frxEntidaderesp1_cargo: TfrxMemoView
          Left = 81.811070000000000000
          Top = 153.385900000000000000
          Width = 400.630180000000000000
          Height = 22.677180000000000000
          DataField = 'resp1_cargo'
          DataSet = frxEntidade
          DataSetName = 'frxEntidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxEntidade."resp1_cargo"]')
          ParentFont = False
        end
        object frxEntidaderesp2_cargo: TfrxMemoView
          Left = 542.913730000000000000
          Top = 153.385900000000000000
          Width = 400.630180000000000000
          Height = 22.677180000000000000
          DataField = 'resp2_cargo'
          DataSet = frxEntidade
          DataSetName = 'frxEntidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxEntidade."resp2_cargo"]')
          ParentFont = False
        end
      end
    end
  end
  object qryRelEntradaProduto: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select ent.logo, ent.nome as prefeitura, ent.nomeuf as estado, e' +
        'nt.cnpj,  entradaID as Entrada, idOrdemCompra as Pedido, EP.data' +
        'entrada as Data, empenhoprocesso as Empenho,'
      
        'notafiscal , FORN.NomeFantasia as Fornecedor, PROD.produtoID, PR' +
        'OD.descricao, IEP.quantidade , '
      
        'IEP.valorunitario,  IEP.valortotal, ALM.DESCRICAO as Almoxarifad' +
        'o,'
      
        '(ep.valoracrescimodesconto / (select count(*) from entradaprodut' +
        'o join itensentradaproduto on itensentradaproduto.identradaprodu' +
        'to = entradaproduto.entradaID where entradaID = ep.entradaID)) '
      'as '#39'desconto'#39
      'from entradaproduto as EP'
      
        'join itensentradaproduto as IEP on IEP.identradaproduto = EP.ent' +
        'radaID'
      
        'join almoxarifado as ALM on ALM.almoxarifadoID = EP.CodAlmoxarif' +
        'ado'
      
        'join fornecedor as FORN on FORN.cpfcnpj = EP.codFornecedor OR FO' +
        'RN.codigo = EP.codFornecedor'
      'join produto as PROD on PROD.produtoID = IEP.idproduto'
      'join categoria as CAT on CAT.categoriaID = PROD.idcategoria'
      'join entidade as ent '
      
        'ORDER BY ALM.almoxarifadoID, entradaID, Pedido, EP.dataentrada, ' +
        'PROD.produtoID')
    Left = 432
    Top = 80
    object qryRelEntradaProdutoestado: TStringField
      FieldName = 'estado'
      Size = 45
    end
    object qryRelEntradaProdutologo: TStringField
      FieldName = 'logo'
      Size = 150
    end
    object qryRelEntradaProdutoprefeitura: TStringField
      FieldName = 'prefeitura'
      Size = 150
    end
    object qryRelEntradaProdutodesconto: TFMTBCDField
      FieldName = 'desconto'
      ReadOnly = True
      Precision = 14
      Size = 6
    end
    object qryRelEntradaProdutocnpj: TStringField
      FieldName = 'cnpj'
      EditMask = '00.000.000/000-00;1;_'
    end
    object qryRelEntradaProdutoEntrada: TIntegerField
      FieldName = 'Entrada'
    end
    object qryRelEntradaProdutoPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object qryRelEntradaProdutoData: TDateField
      FieldName = 'Data'
    end
    object qryRelEntradaProdutoEmpenho: TStringField
      FieldName = 'Empenho'
    end
    object qryRelEntradaProdutonotafiscal: TStringField
      FieldName = 'notafiscal'
    end
    object qryRelEntradaProdutoFornecedor: TStringField
      FieldName = 'Fornecedor'
      Size = 100
    end
    object qryRelEntradaProdutoprodutoID: TIntegerField
      FieldName = 'produtoID'
    end
    object qryRelEntradaProdutodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryRelEntradaProdutovalorunitario: TBCDField
      FieldName = 'valorunitario'
      Precision = 10
      Size = 2
    end
    object qryRelEntradaProdutovalortotal: TBCDField
      FieldName = 'valortotal'
      Precision = 10
      Size = 2
    end
    object qryRelEntradaProdutoAlmoxarifado: TStringField
      FieldName = 'Almoxarifado'
      Size = 100
    end
    object qryRelEntradaProdutoquantidade: TBCDField
      FieldName = 'quantidade'
      Precision = 10
      Size = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = qryRelEntradaProduto
    Left = 328
    Top = 80
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxRelatorio'
    CloseDataSource = False
    FieldAliases.Strings = (
      'logo=logo'
      'prefeitura=prefeitura'
      'estado=estado'
      'cnpj=cnpj'
      'Entrada=Entrada'
      'Pedido=Pedido'
      'Data=Data'
      'Empenho=Empenho'
      'notafiscal=notafiscal'
      'Fornecedor=Fornecedor'
      'produtoID=produtoID'
      'descricao=descricao'
      'valorunitario=valorunitario'
      'valortotal=valortotal'
      'Almoxarifado=Almoxarifado'
      'quantidade=quantidade'
      'desconto=desconto')
    DataSet = qryRelEntradaProduto
    BCDToCurrency = False
    Left = 560
    Top = 104
  end
  object qryEntidade: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from entidade')
    Left = 624
    Top = 176
  end
  object frxEntidade: TfrxDBDataset
    UserName = 'frxEntidade'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nome=nome'
      'logradouro=logradouro'
      'numero=numero'
      'complemento=complemento'
      'bairro=bairro'
      'cidade=cidade'
      'uf=uf'
      'nomeuf=nomeuf'
      'cep=cep'
      'telefone=telefone'
      'fax=fax'
      'cnpj=cnpj'
      'slogan=slogan'
      'febraban=febraban'
      'logo=logo'
      'rodape1=rodape1'
      'rodape2=rodape2'
      'mestrabalho=mestrabalho'
      'serialentidade=serialentidade'
      'serialvalidade=serialvalidade'
      'mesExercicio=mesExercicio'
      'anoExercicio=anoExercicio'
      'resp1_nome=resp1_nome'
      'resp1_cic=resp1_cic'
      'resp1_cargo=resp1_cargo'
      'resp2_nome=resp2_nome'
      'resp2_cic=resp2_cic'
      'resp2_cargo=resp2_cargo'
      'resp3_nome=resp3_nome'
      'resp3_cic=resp3_cic'
      'resp3_cargo=resp3_cargo')
    DataSet = qryEntidade
    BCDToCurrency = False
    Left = 552
    Top = 176
  end
end
