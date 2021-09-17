object frmRelSaidaProdutos: TfrmRelSaidaProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Sa'#237'da de Produtos'
  ClientHeight = 298
  ClientWidth = 675
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
    Width = 121
    Height = 17
    Caption = 'No Ordem Sa'#237'da'
    TabOrder = 1
  end
  object chkCategoria: TCheckBox
    Left = 352
    Top = 224
    Width = 97
    Height = 17
    Caption = 'Categoria'
    TabOrder = 2
  end
  object chkCentroConsumo: TCheckBox
    Left = 8
    Top = 224
    Width = 169
    Height = 17
    Caption = 'Centro de Consumo'
    TabOrder = 3
  end
  object chkProduto: TCheckBox
    Left = 8
    Top = 150
    Width = 97
    Height = 17
    Caption = 'Produto'
    TabOrder = 4
  end
  object chkLocalArmazenamento: TCheckBox
    Left = 192
    Top = 93
    Width = 169
    Height = 17
    Caption = 'Local de Armazenamento'
    TabOrder = 5
  end
  object edtPedido: TEdit
    Left = 192
    Top = 39
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object dblCategoria: TDBLookupComboBox
    Left = 352
    Top = 247
    Width = 297
    Height = 21
    KeyField = 'categoriaID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryCategorias
    TabOrder = 7
  end
  object dblArmazenamento: TDBLookupComboBox
    Left = 192
    Top = 116
    Width = 457
    Height = 21
    KeyField = 'almoxarifadoID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryAlmoxarifado
    TabOrder = 8
  end
  object dblCentroConsumo: TDBLookupComboBox
    Left = 8
    Top = 247
    Width = 313
    Height = 21
    KeyField = 'centroconsumoID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryCentroConsumo
    TabOrder = 9
  end
  object dblProduto: TDBLookupComboBox
    Left = 8
    Top = 173
    Width = 641
    Height = 21
    KeyField = 'produtoID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryProdRequisicao
    TabOrder = 10
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
    TabOrder = 11
    OnClick = BitBtn1Click
  end
  object DBEdit1: TDBEdit
    Left = 448
    Top = 376
    Width = 1304
    Height = 21
    DataField = 'Almoxarifado'
    TabOrder = 12
  end
  object chkNFEntrada: TCheckBox
    Left = 344
    Top = 16
    Width = 121
    Height = 17
    Caption = 'No NF Entrada'
    TabOrder = 13
  end
  object edtNFEntrada: TMaskEdit
    Left = 344
    Top = 39
    Width = 118
    Height = 21
    EditMask = '!000.000.000;1;0'
    MaxLength = 11
    TabOrder = 14
    Text = '   .   .   '
  end
  object qryRelSaidaProduto: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select ent.logo, ent.nome as prefeitura, ent.nomeuf as estado, e' +
        'nt.cnpj, EP.datasaida as Data, FORN.descricao as centroconsumo, ' +
        ' PROD.produtoID, PROD.descricao, '
      ' IEP.quantidade , (  (SELECT sum(precomedio)'
      '                       FROM PRECOMEDIO '
      '                       WHERE mes Between '#39'01'#39' AND '#39'12'#39'  '
      '                       AND idalmox = ALM.almoxarifadoid  '
      
        '                       AND idproduto = PROD.produtoid )) AS valo' +
        'rtotal,  ALM.DESCRICAO as Almoxarifado '
      'from ordemsaidaestoque as EP  '
      
        'join itensordemsaida as IEP on IEP.idordemsaida = EP.ordemsaidaI' +
        'd  '
      
        'join almoxarifado as ALM on ALM.almoxarifadoID = EP.idalmoxarifa' +
        'do  '
      
        'join centroconsumo as FORN on FORN.centroconsumoID = EP.idCentro' +
        'Consumo  '
      'join produto as PROD on PROD.produtoID = IEP.idproduto  '
      'join entidade as ent'
      'WHERE  EP.DATASAIDA BETWEEN '#39'2014-01-01'#39' AND '#39'2015-12-31'#39
      'GROUP BY ALM.almoxarifadoID, EP.datasaida, PROD.produtoID '
      'ORDER BY ALM.almoxarifadoID, EP.datasaida, PROD.produtoID')
    Left = 432
    Top = 80
    object qryRelSaidaProdutoData: TDateField
      FieldName = 'Data'
    end
    object qryRelSaidaProdutocentroconsumo: TStringField
      FieldName = 'centroconsumo'
      Size = 100
    end
    object qryRelSaidaProdutoprodutoID: TIntegerField
      FieldName = 'produtoID'
    end
    object qryRelSaidaProdutodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryRelSaidaProdutovalortotal: TFMTBCDField
      FieldName = 'valortotal'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object qryRelSaidaProdutoAlmoxarifado: TStringField
      FieldName = 'Almoxarifado'
      Size = 100
    end
    object qryRelSaidaProdutologo: TStringField
      FieldName = 'logo'
      Size = 150
    end
    object qryRelSaidaProdutoprefeitura: TStringField
      FieldName = 'prefeitura'
      Size = 150
    end
    object qryRelSaidaProdutoestado: TStringField
      FieldName = 'estado'
      Size = 45
    end
    object qryRelSaidaProdutocnpj: TStringField
      FieldName = 'cnpj'
    end
    object qryRelSaidaProdutoquantidade: TBCDField
      FieldName = 'quantidade'
      Precision = 10
      Size = 3
    end
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
    ReportOptions.LastChange = 42564.439837557870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 488
    Top = 152
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxEntidade
        DataSetName = 'frxEntidade'
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
          Left = 360.055350000000000000
          Top = 104.606370000000000000
          Width = 355.275820000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Movimento de Sa'#237'da')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 148.559060000000000000
          Top = 3.779530000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
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
        object frxDBDataset1CNPJ: TfrxMemoView
          Left = 147.401670000000000000
          Top = 83.149660000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            'CNPJ: [frxDBDataset1."CNPJ"]')
        end
        object frxDBDataset1NomeEntidade: TfrxMemoView
          Left = 147.401670000000000000
          Top = 52.913420000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          DataField = 'NomeEntidade'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."NomeEntidade"]')
          ParentFont = False
        end
        object frxDBDataset1NomeEstado: TfrxMemoView
          Left = 147.401670000000000000
          Top = 26.456710000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NomeEstado'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."NomeEstado"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 948.662030000000000000
          Top = 109.606370000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        object Memo12: TfrxMemoView
          Left = 389.291590000000000000
          Top = 0.220470000000000000
          Width = 200.315090000000000000
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
          Left = 763.465060000000000000
          Top = 0.220470000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
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
          Left = 861.732840000000000000
          Top = 0.220470000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Pre'#231'o M'#233'dio')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 963.780150000000000000
          Top = 0.220470000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
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
        object Memo6: TfrxMemoView
          Left = 79.370130000000000000
          Top = 0.220470000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Centro de Consumo')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 0.220470000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 302.362400000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxRelatorioData: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000020000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'Data'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."Data"]')
          ParentFont = False
        end
        object frxRelatorioprodutoID: TfrxMemoView
          Left = 389.291590000000000000
          Top = 3.779530000000020000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'produtoID'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."produtoID"]')
          ParentFont = False
        end
        object frxRelatoriodescricao: TfrxMemoView
          Left = 434.645950000000000000
          Top = 3.779530000000020000
          Width = 313.700990000000000000
          Height = 13.228346460000000000
          DataField = 'descricao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."descricao"]')
          ParentFont = False
        end
        object frxRelatorioquantidade: TfrxMemoView
          Left = 763.465060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'quantidade'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
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
            '[frxDBDataset1."quantidade"]')
          ParentFont = False
        end
        object frxRelatoriovalorunitario: TfrxMemoView
          Left = 857.953310000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'valortotal'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
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
            '[frxDBDataset1."valortotal"]')
          ParentFont = False
        end
        object frxRelatorioFornecedor: TfrxMemoView
          Left = 86.929190000000000000
          Top = 3.779530000000020000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          DataField = 'centroconsumo'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."centroconsumo"]')
          ParentFont = False
        end
        object frxDBDataset1totalprecomedio: TfrxMemoView
          Left = 960.000620000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
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
            '[frxDBDataset1."totalprecomedio"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 83.149660000000000000
          Top = 22.677180000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '1')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        Condition = '<frxDBDataset1."Almoxarifado">'
        StartNewPage = True
        object frxDBDataset1Almoxarifado: TfrxMemoView
          Left = 222.992270000000000000
          Top = 1.000000000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Almoxarifado'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."Almoxarifado"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 1.000000000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Local de Armazenamento: ')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 21.897650000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 374.173470000000000000
        Width = 1046.929810000000000000
        object Memo17: TfrxMemoView
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total R$')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 2.897650000000000000
          Width = 1043.150280000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 3.220470000000000000
          Top = 22.677180000000000000
          Width = 1043.150280000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object frxDBDataset1totalprecomedio1: TfrxMemoView
          Left = 948.662030000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
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
            '[SUM(<frxDBDataset1."totalprecomedio">,MasterData1)]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 857.953310000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
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
            '[SUM(<frxDBDataset1."valortotal">,MasterData1)]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 729.449290000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
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
            '[SUM(<frxDBDataset1."quantidade">,MasterData1)]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 147.401670000000000000
        Top = 419.527830000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object frxEntidaderesp1_nome: TfrxMemoView
          Left = 86.929190000000000000
          Top = 91.456710000000000000
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
          Left = 544.252320000000000000
          Top = 91.456710000000000000
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
          Left = 86.929190000000000000
          Top = 114.133890000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
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
          Left = 544.252320000000000000
          Top = 114.133890000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
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
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Data=Data'
      'produtoID=produtoID'
      'descricao=descricao'
      'centroConsumo=centroConsumo'
      'quantidade=quantidade'
      'Valortotal=Valortotal'
      'Almoxarifado=Almoxarifado'
      'totalprecomedio=totalprecomedio'
      'cnpj=cnpj'
      'logo=logo'
      'nomeestado=nomeestado'
      'nomeentidade=nomeentidade')
    DataSet = ClientDataSet1
    BCDToCurrency = False
    Left = 576
    Top = 112
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      4A0100009619E0BD01000000180000000C0000000000030000004A0104446174
      6104000600000000000970726F6475746F494404000100000000000964657363
      726963616F01004900000001000557494454480200020096000D63656E74726F
      436F6E73756D6F01004900000001000557494454480200020096000A7175616E
      74696461646508000400000000000A56616C6F72746F74616C08000400000000
      000C416C6D6F786172696661646F010049000000010005574944544802000200
      96000F746F74616C707265636F6D6564696F080004000000000004636E706A01
      00490000000100055749445448020002001400046C6F676F0100490000000100
      0557494454480200020096000A6E6F6D6565737461646F010049000000010005
      57494454480200020096000C6E6F6D65656E7469646164650100490000000100
      0557494454480200020096000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 208
    object ClientDataSet1Data: TDateField
      FieldName = 'Data'
    end
    object ClientDataSet1produtoID: TIntegerField
      FieldName = 'produtoID'
    end
    object ClientDataSet1descricao: TStringField
      FieldName = 'descricao'
      Size = 150
    end
    object ClientDataSet1centroConsumo: TStringField
      FieldName = 'centroConsumo'
      Size = 150
    end
    object ClientDataSet1quantidade: TFloatField
      FieldName = 'quantidade'
    end
    object ClientDataSet1Valortotal: TFloatField
      FieldName = 'Valortotal'
    end
    object ClientDataSet1Almoxarifado: TStringField
      FieldName = 'Almoxarifado'
      Size = 150
    end
    object ClientDataSet1totalprecomedio: TFloatField
      FieldName = 'totalprecomedio'
    end
    object ClientDataSet1cnpj: TStringField
      FieldName = 'cnpj'
    end
    object ClientDataSet1logo: TStringField
      FieldName = 'logo'
      Size = 150
    end
    object ClientDataSet1nomeestado: TStringField
      FieldName = 'nomeestado'
      Size = 150
    end
    object ClientDataSet1nomeentidade: TStringField
      FieldName = 'nomeentidade'
      Size = 150
    end
  end
  object DataSource1: TDataSource
    DataSet = qryRelSaidaProduto
    Left = 400
    Top = 184
  end
  object qryEntidade: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from entidade')
    Left = 256
    Top = 120
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
    Left = 328
    Top = 120
  end
end
