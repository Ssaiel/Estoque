object frmRelFisFinPorCategoria: TfrmRelFisFinPorCategoria
  Left = 0
  Top = 0
  Caption = 'Movimento F'#237'sico/Financeiro por Categoria de Entrada'
  ClientHeight = 350
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
      Width = 13
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
  object chkProduto: TCheckBox
    Left = 8
    Top = 146
    Width = 97
    Height = 17
    Caption = 'Produto'
    TabOrder = 1
  end
  object chkLocalArmazenamento: TCheckBox
    Left = 192
    Top = 20
    Width = 169
    Height = 17
    Caption = 'Local de Armazenamento'
    TabOrder = 2
  end
  object dblArmazenamento: TDBLookupComboBox
    Left = 192
    Top = 43
    Width = 281
    Height = 21
    KeyField = 'almoxarifadoID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryAlmoxarifado
    TabOrder = 3
  end
  object dblProduto: TDBLookupComboBox
    Left = 8
    Top = 169
    Width = 465
    Height = 21
    KeyField = 'produtoID'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryProdRequisicao
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 503
    Top = 116
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
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object chkTipoProduto: TCheckBox
    Left = 192
    Top = 93
    Width = 169
    Height = 17
    Caption = 'Tipo de Produto'
    TabOrder = 6
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 183
    Top = 116
    Width = 290
    Height = 21
    KeyField = 'tipoId'
    ListField = 'descricao'
    ListSource = dmComprasEstoque.dsQryTipoMaterial
    TabOrder = 7
  end
  object qryRelFisicoFinanceiro: TADOQuery
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT ent.logo, ent.nome as prefeitura, ent.nomeuf as estado, e' +
        'nt.cnpj, p.produtoID, p.descricao as '#39'NomeProduto'#39', a.categoriaI' +
        'D as CodigoLocalArmazen, a.descricao as LocalArmazenamento, '
      
        '       (SELECT coalesce(Saldo,0) FROM estoqueproduto where idpro' +
        'duto = ie.idproduto and MES = 01 and ANO = 2014 ) as SALDOANTERI' +
        'OR ,  '
      
        '       (SELECT SUM(Quantidade) FROM PRECOMEDIO where idproduto =' +
        ' ie.idproduto) as ENTRADA ,  '
      
        '       (SELECT AVG(precomedio) FROM PRECOMEDIO where idproduto =' +
        ' ie.idproduto ) as PMedio  ,'
      
        '       (SELECT sum(saida) FROM ESTOQUEPRODUTO WHERE idproduto = ' +
        'ie.idproduto ) as SAIDA ,  '
      
        '       (SELECT Sum(saldo) FROM ESTOQUEPRODUTO WHERE idproduto = ' +
        'ie.idproduto ) as SALDO'
      'FROM entradaproduto as E '
      
        'join itensentradaproduto as ie on ie.identradaproduto = e.entrad' +
        'aid'
      'join produto as p on p.produtoID = ie.idproduto'
      ' join categoria as a on a.categoriaID = E.idCategoria '
      'join entidade as ent'
      'GROUP BY a.categoriaID, a.descricao, ie.idproduto, p.descricao'
      'ORDER BY ie.idproduto')
    Left = 440
    Top = 296
    object qryRelFisicoFinanceirologo: TStringField
      FieldName = 'logo'
      Size = 150
    end
    object qryRelFisicoFinanceiroprefeitura: TStringField
      FieldName = 'prefeitura'
      Size = 150
    end
    object qryRelFisicoFinanceiroestado: TStringField
      FieldName = 'estado'
      Size = 45
    end
    object qryRelFisicoFinanceirocnpj: TStringField
      FieldName = 'cnpj'
    end
    object qryRelFisicoFinanceiroprodutoID: TIntegerField
      FieldName = 'produtoID'
    end
    object qryRelFisicoFinanceiroNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 100
    end
    object qryRelFisicoFinanceiroCodigoLocalArmazen: TIntegerField
      FieldName = 'CodigoLocalArmazen'
    end
    object qryRelFisicoFinanceiroLocalArmazenamento: TStringField
      FieldName = 'LocalArmazenamento'
      Size = 100
    end
    object qryRelFisicoFinanceiroSALDOANTERIOR: TBCDField
      FieldName = 'SALDOANTERIOR'
      ReadOnly = True
      Precision = 10
      Size = 3
    end
    object qryRelFisicoFinanceiroENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object qryRelFisicoFinanceiroPMedio: TFMTBCDField
      FieldName = 'PMedio'
      ReadOnly = True
      Precision = 14
      Size = 6
    end
    object qryRelFisicoFinanceiroSAIDA: TFMTBCDField
      FieldName = 'SAIDA'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object qryRelFisicoFinanceiroSALDO: TFMTBCDField
      FieldName = 'SALDO'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CodigoLocalArmazen=CodigoLocalArmazen'
      'LocalArmazenamento=LocalArmazenamento'
      'ProdutoID=ProdutoID'
      'NomeProduto=NomeProduto'
      'PMedio=PMedio'
      'Entrada=Entrada'
      'EntradaFinanceiro=EntradaFinanceiro'
      'Saida=Saida'
      'SaidaFinanceiro=SaidaFinanceiro'
      'Saldo=Saldo'
      'saldofinanceiro=saldofinanceiro'
      'saldoanterior=saldoanterior'
      'saldoanteriorfinanceiro=saldoanteriorfinanceiro'
      'Logo=Logo'
      'Prefeitura=Prefeitura'
      'Estado=Estado'
      'cnpj=cnpj'
      'categoria=categoria'
      'idCategoria=idCategoria')
    DataSet = ClientDataSet1
    BCDToCurrency = False
    Left = 232
    Top = 296
  end
  object frxRelFisicoFinanceiro: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42030.546164872700000000
    ReportOptions.LastChange = 42738.608651620370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 344
    Top = 296
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDescontos
        DataSetName = 'frxDescontos'
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
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 404.409710000000000000
          Top = 105.826840000000000000
          Width = 249.448980000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio F'#237'sico Financeiro')
          ParentFont = False
        end
        object Logomarca: TfrxPictureView
          Left = 11.338590000000000000
          Width = 124.724490000000000000
          Height = 109.606370000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo10: TfrxMemoView
          Left = 149.559060000000000000
          Top = 3.220469999999999000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Sistema de Compras e Estoque')
          ParentFont = False
        end
        object frxDBDataset1cnpj: TfrxMemoView
          Left = 151.181200000000000000
          Top = 79.370130000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '00.000.000/0000-00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CNPJ: [frxDBDataset1."cnpj"]')
          ParentFont = False
        end
        object frxDBDataset1Prefeitura: TfrxMemoView
          Left = 151.181200000000000000
          Top = 52.913420000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'Prefeitura'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."Prefeitura"]')
          ParentFont = False
        end
        object frxDBDataset1Estado: TfrxMemoView
          Left = 151.181200000000000000
          Top = 26.456710000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'Estado'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."Estado"]')
          ParentFont = False
        end
        object periodo: TfrxMemoView
          Left = 755.906000000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Per'#237'odo de Listagem:')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo21: TfrxMemoView
          Left = 755.906000000000000000
          Top = 18.897650000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDescontos."dataInicio"] '#224' [frxDescontos."dataFinal"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDataset1."CodigoLocalArmazen"'
        StartNewPage = True
        object Memo2: TfrxMemoView
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria:')
          ParentFont = False
        end
        object Line12: TfrxLineView
          Left = -0.220470000000000000
          Top = 20.897650000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBDataset1LocalArmazenamento: TfrxMemoView
          Left = 128.504020000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."LocalArmazenamento"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 328.819110000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1produtoID: TfrxMemoView
          Left = 1.779530000000000000
          Top = 2.000000000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataField = 'produtoID'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."produtoID"]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Left = 529.134200000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 612.638220000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 700.701300000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 782.646260000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 953.898270000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 873.614720000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1NomeProduto: TfrxMemoView
          Left = 53.692950000000000000
          Top = 1.000000000000000000
          Width = 215.433210000000000000
          Height = 26.456710000000000000
          DataField = 'NomeProduto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NomeProduto"]')
          ParentFont = False
        end
        object frxDBDataset1PMedio: TfrxMemoView
          Left = 282.685220000000000000
          Top = 2.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'PMedio'
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
            '[frxDBDataset1."PMedio"]')
          ParentFont = False
        end
        object frxDBDataset1ENTRADA: TfrxMemoView
          Left = 534.338900000000000000
          Top = 2.000000000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'ENTRADA'
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
            '[frxDBDataset1."ENTRADA"]')
          ParentFont = False
        end
        object frxDBDataset1SAIDA: TfrxMemoView
          Left = 706.315400000000000000
          Top = 2.000000000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'SAIDA'
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
            '[frxDBDataset1."SAIDA"]')
          ParentFont = False
        end
        object frxDBDataset1SALDO: TfrxMemoView
          Left = 883.850960000000000000
          Top = 2.000000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'SALDO'
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
            '[frxDBDataset1."SALDO"]')
          ParentFont = False
        end
        object frxDBDataset1EntradaFinanceiro: TfrxMemoView
          Left = 617.488560000000000000
          Top = 2.000000000000000000
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
            '[frxDBDataset1."EntradaFinanceiro"]')
          ParentFont = False
        end
        object frxDBDataset1SaidaFinanceiro: TfrxMemoView
          Left = 787.685530000000000000
          Top = 2.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'SaidaFinanceiro'
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
            '[frxDBDataset1."SaidaFinanceiro"]')
          ParentFont = False
        end
        object frxDBDataset1SaldoFinanceiro: TfrxMemoView
          Left = 963.559680000000000000
          Top = 2.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'SaldoFinanceiro'
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
            '[frxDBDataset1."SaldoFinanceiro"]')
          ParentFont = False
        end
        object frxDBDataset1SaldoAnterior: TfrxMemoView
          Left = 366.378170000000000000
          Top = 2.000000000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'SaldoAnterior'
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
            '[frxDBDataset1."SaldoAnterior"]')
          ParentFont = False
        end
        object Line27: TfrxLineView
          Left = 440.409710000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1SaldoAnteriorFinanceiro: TfrxMemoView
          Left = 446.968770000000000000
          Top = 2.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'SaldoAnteriorFinanceiro'
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
            '[frxDBDataset1."SaldoAnteriorFinanceiro"]')
          ParentFont = False
        end
        object Line28: TfrxLineView
          Left = 274.126160000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 360.834880000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftLeft]
          Diagonal = True
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Top = 3.338590000000011000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Codigo/Produto')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 568.827150000000000000
          Top = 3.338590000000011000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Entradas')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 551.370440000000000000
          Top = 29.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'F'#237'sico')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 624.874460000000000000
          Top = 29.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Financeiro')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 733.410020000000000000
          Top = 3.338590000000011000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Sa'#237'das')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 718.291900000000000000
          Top = 29.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'F'#237'sico')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 788.205320000000000000
          Top = 29.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Financeiro')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 22.236240000000010000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 612.417750000000000000
          Top = 22.236240000000010000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 782.646260000000000000
          Top = 22.236240000000010000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Top = 48.692949999999990000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 700.701300000000000000
          Top = 22.236240000000010000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 529.031850000000000000
          Top = 22.236240000000010000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = -0.220470000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          Left = 1047.150280000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 529.031850000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          Left = 700.701300000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo16: TfrxMemoView
          Left = 912.646260000000000000
          Top = 3.338590000000011000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo')
          ParentFont = False
        end
        object Line19: TfrxLineView
          Left = 873.614720000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo17: TfrxMemoView
          Left = 892.984850000000000000
          Top = 30.236240000000010000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'F'#237'sico')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 969.575450000000000000
          Top = 30.236240000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Financeiro')
          ParentFont = False
        end
        object Line20: TfrxLineView
          Left = 954.118740000000000000
          Top = 22.677179999999990000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          Left = 873.614720000000000000
          Top = 22.677179999999990000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo14: TfrxMemoView
          Left = 264.567100000000000000
          Top = 26.456709999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Pre'#231'o M'#233'dio')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 389.055350000000000000
          Top = 3.338590000000011000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo Anterior')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 379.157700000000000000
          Top = 29.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'F'#237'sico')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 452.661720000000000000
          Top = 29.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Financeiro')
          ParentFont = False
        end
        object Line24: TfrxLineView
          Left = 440.205010000000000000
          Top = 22.236240000000010000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line25: TfrxLineView
          Left = 360.819110000000000000
          Top = 22.236240000000010000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 360.819110000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 381.732530000000000000
        Width = 1046.929810000000000000
        object SysMemo10: TfrxSysMemoView
          Left = 264.567100000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."PMedio">,MasterData1)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 98.267780000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Sub Total:')
          ParentFont = False
        end
        object SysMemo11: TfrxSysMemoView
          Left = 532.307360000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."ENTRADA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo12: TfrxSysMemoView
          Left = 615.457020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."EntradaFinanceiro">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo13: TfrxSysMemoView
          Left = 702.724800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SAIDA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo14: TfrxSysMemoView
          Left = 789.315400000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SaidaFinanceiro">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo15: TfrxSysMemoView
          Left = 883.803650000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SALDO">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo16: TfrxSysMemoView
          Left = 963.173780000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SaldoFinanceiro">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo17: TfrxSysMemoView
          Left = 362.787570000000000000
          Top = 0.779530000000022500
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SaldoAnterior">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo18: TfrxSysMemoView
          Left = 445.937230000000000000
          Top = 0.779530000000022500
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SaldoAnteriorFinanceiro">,MasterData1)]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 264.567100000000000000
        Top = 434.645950000000000000
        Width = 1046.929810000000000000
        object Line22: TfrxLineView
          Top = 3.779530000000022000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object Line23: TfrxLineView
          Top = 68.031540000000010000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          Left = 265.173470000000000000
          Top = 11.338590000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."PMedio">,MasterData1)]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 98.874150000000000000
          Top = 11.338590000000010000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral: ')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 532.913730000000000000
          Top = 11.338590000000010000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."ENTRADA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 616.063390000000000000
          Top = 11.338590000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."EntradaFinanceiro">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 703.331170000000000000
          Top = 11.338590000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SAIDA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 789.921770000000000000
          Top = 11.338590000000010000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SaidaFinanceiro">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 884.410020000000000000
          Top = 11.338590000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SALDO">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 963.780150000000000000
          Top = 11.338590000000010000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SaldoFinanceiro">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 363.393940000000000000
          Top = 12.118119999999980000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SaldoAnterior">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo9: TfrxSysMemoView
          Left = 446.543600000000000000
          Top = 12.118119999999980000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
            '[SUM(<frxDBDataset1."SaldoAnteriorFinanceiro">,MasterData1)]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 79.370130000000000000
          Top = 38.574830000000020000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Com Desconto: ')
          ParentFont = False
        end
        object frxDescontosvaloracrescimodesconto: TfrxMemoView
          Left = 967.559680000000000000
          Top = 38.574830000000020000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDescontos
          DataSetName = 'frxDescontos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'R$ 0')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Condition = 'saldoFinanceiro.Value > 0'
              FillType = ftBrush
              Visible = False
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Condition = 'saldoFinanceiro.Value < 0'
              FillType = ftBrush
            end>
        end
        object Memo20: TfrxMemoView
          Left = 789.921770000000000000
          Top = 38.574830000000020000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxDescontos
          DataSetName = 'frxDescontos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              'R$ [SUM(<frxDBDataset1."SaidaFinanceiro">,MasterData1) - <frxDes' +
              'contos."valoracrescimodesconto">]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 616.063390000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDescontos
          DataSetName = 'frxDescontos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              'R$ [SUM(<frxDBDataset1."EntradaFinanceiro">,MasterData1) - <frxD' +
              'escontos."valoracrescimodesconto">'
            ']')
          ParentFont = False
        end
        object saldoFinanceiro: TfrxMemoView
          Left = 953.221090000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ %2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'saldoFinanceiro.Value <= 0'
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            
              '[SUM(<frxDBDataset1."SaldoFinanceiro">,MasterData1) - <frxDescon' +
              'tos."valoracrescimodesconto">]')
          ParentFont = False
        end
        object frxEntidaderesp1_nome: TfrxMemoView
          Left = 86.929190000000000000
          Top = 190.606370000000000000
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
        object frxEntidaderesp1_cargo: TfrxMemoView
          Left = 86.929190000000000000
          Top = 220.842610000000000000
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
        object frxEntidaderesp2_nome: TfrxMemoView
          Left = 551.811380000000000000
          Top = 190.606370000000000000
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
        object frxEntidaderesp2_cargo: TfrxMemoView
          Left = 551.811380000000000000
          Top = 220.842610000000000000
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
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      B50100009619E0BD010000001800000011000000000003000000B50112436F64
      69676F4C6F63616C41726D617A656E0400010000000000124C6F63616C41726D
      617A656E616D656E746F01004900000001000557494454480200020096000950
      726F6475746F494404000100000000000B4E6F6D6550726F6475746F01004900
      0000010005574944544802000200960006504D6564696F080004000000000007
      456E7472616461080004000000000011456E747261646146696E616E63656972
      6F080004000000000005536169646108000400000000000F536169646146696E
      616E636569726F08000400000000000553616C646F08000400000000000F7361
      6C646F66696E616E636569726F08000400000000000D73616C646F616E746572
      696F7208000400000000001773616C646F616E746572696F7266696E616E6365
      69726F0800040000000000044C6F676F01004900000001000557494454480200
      020096000A507265666569747572610100490000000100055749445448020002
      0096000645737461646F01004900000001000557494454480200020032000463
      6E706A01004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 264
    object ClientDataSet1CodigoLocalArmazen: TIntegerField
      FieldName = 'CodigoLocalArmazen'
    end
    object ClientDataSet1LocalArmazenamento: TStringField
      FieldName = 'LocalArmazenamento'
      Size = 150
    end
    object ClientDataSet1ProdutoID: TIntegerField
      FieldName = 'ProdutoID'
    end
    object ClientDataSet1NomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 150
    end
    object ClientDataSet1PMedio: TFloatField
      FieldName = 'PMedio'
    end
    object ClientDataSet1Entrada: TFloatField
      FieldName = 'Entrada'
    end
    object ClientDataSet1EntradaFinanceiro: TFloatField
      FieldName = 'EntradaFinanceiro'
    end
    object ClientDataSet1Saida: TFloatField
      FieldName = 'Saida'
    end
    object ClientDataSet1SaidaFinanceiro: TFloatField
      FieldName = 'SaidaFinanceiro'
    end
    object ClientDataSet1Saldo: TFloatField
      FieldName = 'Saldo'
    end
    object ClientDataSet1saldofinanceiro: TFloatField
      FieldName = 'saldofinanceiro'
    end
    object ClientDataSet1saldoanterior: TFloatField
      FieldName = 'saldoanterior'
    end
    object ClientDataSet1saldoanteriorfinanceiro: TFloatField
      FieldName = 'saldoanteriorfinanceiro'
    end
    object ClientDataSet1Logo: TStringField
      FieldName = 'Logo'
      Size = 150
    end
    object ClientDataSet1Prefeitura: TStringField
      FieldName = 'Prefeitura'
      Size = 150
    end
    object ClientDataSet1Estado: TStringField
      FieldName = 'Estado'
      Size = 50
    end
    object ClientDataSet1cnpj: TStringField
      FieldName = 'cnpj'
    end
  end
  object qryEntradaProduto: TADOQuery
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select '#39'Janeiro'#39' as '#39'dataInicio'#39', '#39'Dezembro'#39' as '#39'dataFinal'#39', ep.' +
        'valoracrescimodesconto'
      'from entradaproduto ep'
      'where ep.dataentrada between '#39'2014-01-01'#39' and '#39'2014-12-28'#39)
    Left = 112
    Top = 296
  end
  object frxDescontos: TfrxDBDataset
    UserName = 'frxDescontos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'dataInicio=dataInicio'
      'dataFinal=dataFinal'
      'valoracrescimodesconto=valoracrescimodesconto')
    DataSet = qryEntradaProduto
    BCDToCurrency = False
    Left = 296
    Top = 209
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
    Left = 184
    Top = 192
  end
  object qryEntidade: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * from Entidade')
    Left = 80
    Top = 192
  end
end
