object frmRelRequisicaoEntrada: TfrmRelRequisicaoEntrada
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Emiss'#227'o de Requisi'#231#227'o'
  ClientHeight = 210
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI Semilight'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 10
    Top = 8
    Width = 164
    Height = 21
    Caption = 'Emiss'#227'o de Requisi'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 10
    Top = 89
    Width = 93
    Height = 17
    Caption = 'ID da Requisi'#231#227'o'
  end
  object dblRequisicao: TDBLookupComboBox
    Left = 10
    Top = 120
    Width = 227
    Height = 25
    KeyField = 'requisicaocompraID'
    ListField = 'requisicaocompraID'
    ListSource = dsIt
    TabOrder = 0
    OnCloseUp = dblRequisicaoCloseUp
  end
  object Button1: TButton
    Left = 8
    Top = 151
    Width = 229
    Height = 38
    Caption = 'Gerar Requisi'#231#227'o'
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object grpTipoRequisicao: TJvRadioGroup
    Left = 9
    Top = 33
    Width = 228
    Height = 49
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Entrada'
      'Sa'#237'da')
    TabOrder = 2
    OnClick = grpTipoRequisicaoClick
  end
  object frxRelRequisicao: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42570.554346250000000000
    ReportOptions.LastChange = 43537.675603263900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 352
    Top = 40
    Datasets = <
      item
        DataSet = frxRequisicao
        DataSetName = 'frxRequisicao'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 147.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape10: TfrxShapeView
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
        end
        object frxRequisicaonome: TfrxMemoView
          Top = 11.338590000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."nome"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 49.133890000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Requisi'#231#227'o de Compras e Servi'#231'os')
          ParentFont = False
        end
        object frxRequisicaocnpj: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'cnpj'
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."cnpj"]')
          ParentFont = False
        end
        object logo: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 105.826840000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo26: TfrxMemoView
          Top = 109.606370000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#250'mero')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 128.504020000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."requisicaocompraID"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          Left = 71.811070000000000000
          Top = 147.401670000000000000
          Height = -37.795300000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo28: TfrxMemoView
          Left = 71.811070000000000000
          Top = 109.606370000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Local Solicitante:')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          Left = 170.078850000000000000
          Top = 109.606370000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."solicitante_cc"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 71.811070000000000000
          Top = 128.504020000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Local Armazenamento:')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          Left = 192.756030000000000000
          Top = 128.504020000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."solicitante_cc"]')
          ParentFont = False
        end
        object Line14: TfrxLineView
          Left = 597.165740000000000000
          Top = 147.401670000000000000
          Height = -37.795300000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo32: TfrxMemoView
          Left = 597.165740000000000000
          Top = 109.606370000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 597.165740000000000000
          Top = 128.504020000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."datarequisicao"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        DataSet = frxRequisicao
        DataSetName = 'frxRequisicao'
        RowCount = 0
        Stretched = True
        object frxRequisicaoprodutoID: TfrxMemoView
          Left = 41.574830000000000000
          Top = 3.000000000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."produtoID"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 3.000000000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 491.338900000000000000
          Top = 20.897650000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line8: TfrxLineView
          Left = 597.165740000000000000
          Top = 20.897650000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxRequisicaodescricao: TfrxMemoView
          Left = 132.283550000000000000
          Width = 355.275820000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."p_descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line5: TfrxLineView
          Left = 43.354360000000000000
          Top = 22.677180000000000000
          Height = -22.677180000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxRequisicaoum_descricao: TfrxMemoView
          Left = 495.118430000000000000
          Width = 98.267780000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataField = 'um_descricao'
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."um_descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxRequisicaoquantidade: TfrxMemoView
          Left = 600.945270000000000000
          Width = 113.385900000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRequisicao."quantidade"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'calibri'
        Font.Style = [fsBold]
        Height = 45.354360000000000000
        ParentFont = False
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Line9: TfrxLineView
          Left = 718.110700000000000000
          Top = 22.677180000000000000
          Width = -718.110700000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo1: TfrxMemoView
          Top = 3.779530000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 41.574830000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 128.504020000000000000
          Top = 3.779530000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Especifica'#231#227'o de Material ou Servi'#231'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid. M'#233'trica')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 597.165740000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 42.354360000000000000
          Top = 22.677180000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 128.504020000000000000
          Top = 22.677180000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 491.338900000000000000
          Top = 22.677180000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line4: TfrxLineView
          Left = 597.165740000000000000
          Top = 22.677180000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 302.362400000000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Shape3: TfrxShapeView
          Left = 495.118430000000000000
          Top = 105.826840000000000000
          Width = 226.771800000000000000
          Height = 147.401670000000000000
        end
        object Shape1: TfrxShapeView
          Left = 249.448980000000000000
          Top = 105.826840000000000000
          Width = 234.330860000000000000
          Height = 147.401670000000000000
        end
        object Shape2: TfrxShapeView
          Left = 3.779530000000000000
          Top = 105.826840000000000000
          Width = 234.330860000000000000
          Height = 147.401670000000000000
        end
        object Shape9: TfrxShapeView
          Width = 718.110700000000000000
          Height = 90.708720000000000000
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 113.385900000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Chefe da Unidade Solicitante')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 249.448980000000000000
          Top = 113.385900000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Autoriza'#231#227'o')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 495.118430000000000000
          Top = 113.385900000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Forma de Aquisi'#231#227'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 11.338590000000000000
          Top = 196.535560000000000000
          Width = 219.212598430000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
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
          Highlight.Condition = '<frxRequisicao."resp1_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxRequisicao."resp1_nome"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 11.338590000000000000
          Top = 215.433210000000000000
          Width = 219.212598430000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxRequisicao."resp1_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxRequisicao."resp1_cargo"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 257.008040000000000000
          Top = 196.535560000000000000
          Width = 219.212598430000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
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
          Highlight.Condition = '<frxRequisicao."resp2_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxRequisicao."resp2_nome"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 257.008040000000000000
          Top = 215.433210000000000000
          Width = 219.212598430000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxRequisicao."resp1_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxRequisicao."resp2_cargo"]')
          ParentFont = False
        end
        object Shape4: TfrxShapeView
          Left = 502.677490000000000000
          Top = 139.842610000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Memo14: TfrxMemoView
          Left = 525.354670000000000000
          Top = 139.842610000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Compra Direta')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 525.354670000000000000
          Top = 162.519790000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Convite')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 525.354670000000000000
          Top = 185.196970000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Tomada de Pre'#231'o')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 525.354670000000000000
          Top = 207.874150000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Concorr'#234'ncia')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 525.354670000000000000
          Top = 230.551330000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Outras')
          ParentFont = False
        end
        object Shape5: TfrxShapeView
          Left = 502.677490000000000000
          Top = 162.519790000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape6: TfrxShapeView
          Left = 502.677490000000000000
          Top = 185.196970000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape7: TfrxShapeView
          Left = 502.677490000000000000
          Top = 207.874150000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape8: TfrxShapeView
          Left = 502.677490000000000000
          Top = 230.551330000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Justificativa:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 502.677490000000000000
          Top = 139.842610000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxRequisicao."formarequisicao"> <> '#39'0'#39
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 502.677490000000000000
          Top = 185.196970000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxRequisicao."formarequisicao"> <> '#39'2'#39
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 502.677490000000000000
          Top = 207.874150000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxRequisicao."formarequisicao"> <> '#39'3'#39
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 502.677490000000000000
          Top = 230.551330000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxRequisicao."formarequisicao"> <> '#39'4'#39
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 502.677490000000000000
          Top = 162.519790000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxRequisicao."formarequisicao"> <> '#39'1'#39
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
      end
      object Line6: TfrxLineView
        Left = 128.504020000000000000
        Top = 324.260050000000000000
        Height = -30.236240000000000000
        Color = clBlack
        Diagonal = True
      end
      object Line10: TfrxLineView
        Left = 718.110700000000000000
        Top = 325.039580000000000000
        Width = -718.110700000000000000
        Color = clBlack
        Frame.Color = clGray
        Diagonal = True
      end
      object Line11: TfrxLineView
        Left = 491.338900000000000000
        Top = 325.039580000000000000
        Height = -30.236240000000000000
        Color = clBlack
        Frame.Color = 14211288
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Diagonal = True
      end
      object Line12: TfrxLineView
        Left = 597.165740000000000000
        Top = 325.039580000000000000
        Height = -30.236240000000000000
        Color = clBlack
        Frame.Color = 14211288
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        Diagonal = True
      end
    end
  end
  object qryRequisicao: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        DataType = ftWideString
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT e.nome, e.logo, e.cnpj, e.cidade, rc.requisicaocompraID, ' +
        'p.produtoID,'
      
        'cc.descricao as '#39'solicitante_cc'#39', a.descricao as '#39'armazenamento_' +
        'al'#39', '
      
        'rc.datarequisicao, irc.itensrequisicaoID, p.descricao as '#39'p_desc' +
        'ricao'#39', um.descricao as '#39'um_descricao'#39', '
      
        'irc.quantidade, e.resp1_nome, e.resp1_cargo, e.resp2_nome, e.res' +
        'p2_cargo, rc.formarequisicao '
      'FROM itensrequisicaocompra irc'
      
        'left JOIN requisicaocompra rc ON irc.idrequisicaocompra = rc.req' +
        'uisicaocompraID  '
      'left JOIN produto p on irc.idproduto = p.produtoID  '
      'JOIN entidade e '
      'left JOIN unidademedida um ON um.unidadeID = p.idunidade  '
      
        'left JOIN centroconsumo cc ON rc.idcentroconsumo = cc.centrocons' +
        'umoID'
      'left JOIN almoxarifado a ON rc.idalmoxarifado = a.almoxarifadoID'
      'where rc.requisicaocompraid = :id')
    Left = 272
    Top = 40
  end
  object dsRequisicao: TDataSource
    DataSet = qryRequisicao
    Left = 424
    Top = 40
  end
  object frxRequisicao: TfrxDBDataset
    UserName = 'frxRequisicao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nome=nome'
      'cnpj=cnpj'
      'cidade=cidade'
      'requisicaocompraID=requisicaocompraID'
      'produtoID=produtoID'
      'solicitante_cc=solicitante_cc'
      'armazenamento_al=armazenamento_al'
      'datarequisicao=datarequisicao'
      'itensrequisicaoID=itensrequisicaoID'
      'p_descricao=p_descricao'
      'um_descricao=um_descricao'
      'quantidade=quantidade'
      'resp1_nome=resp1_nome'
      'resp1_cargo=resp1_cargo'
      'resp2_nome=resp2_nome'
      'resp2_cargo=resp2_cargo'
      'formarequisicao=formarequisicao')
    DataSet = qryRequisicao
    BCDToCurrency = False
    Left = 504
    Top = 40
  end
  object qryIt: TADOQuery
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM requisicaocompra')
    Left = 576
    Top = 48
  end
  object dsIt: TDataSource
    DataSet = qryIt
    Left = 656
    Top = 48
  end
  object frxReqSaida: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42570.554346250000000000
    ReportOptions.LastChange = 43542.641012696760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 352
    Top = 128
    Datasets = <
      item
        DataSet = frxDBReqSaida
        DataSetName = 'frxReqSaida'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 158.740260000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape10: TfrxShapeView
          Top = 109.606370000000000000
          Width = 721.890230000000000000
          Height = 37.795300000000000000
          Frame.Color = clScrollBar
        end
        object frxRequisicaonome: TfrxMemoView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxReqSaida."nome"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Requisi'#231#227'o de Sa'#237'da')
          ParentFont = False
        end
        object frxRequisicaocnpj: TfrxMemoView
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxReqSaida."cnpj"]')
          ParentFont = False
        end
        object logo: TfrxPictureView
          Left = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 105.826840000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo26: TfrxMemoView
          Top = 109.606370000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#250'mero')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 128.504020000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxReqSaida."requisicaosaidaId"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 71.811070000000000000
          Top = 109.606370000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Local de Origem:')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          Left = 170.078850000000000000
          Top = 109.606370000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxReqSaida."solicitante_cc"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 71.811070000000000000
          Top = 128.504020000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Local Armazenamento:')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          Left = 192.756030000000000000
          Top = 128.504020000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxReqSaida."solicitante_cc"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 597.165740000000000000
          Top = 109.606370000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 597.165740000000000000
          Top = 128.504020000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxReqSaida."datarequisicao"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 37.795300000000000000
        ParentFont = False
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        DataSet = frxDBReqSaida
        DataSetName = 'frxReqSaida'
        RowCount = 0
        Stretched = True
        object frxRequisicaoprodutoID: TfrxMemoView
          ShiftMode = smDontShift
          Left = 49.133890000000000000
          Top = 3.000000000000000000
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxReqSaida."produtoID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.000000000000000000
          Width = 34.015770000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line6: TfrxLineView
          Left = 128.504020000000000000
          Top = 29.456709999999990000
          Height = -30.236240000000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object Line7: TfrxLineView
          Left = 491.338900000000000000
          Top = 20.897650000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line8: TfrxLineView
          Left = 597.165740000000000000
          Top = 20.897650000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxRequisicaodescricao: TfrxMemoView
          Left = 132.283550000000000000
          Top = 0.220469999999977500
          Width = 355.275820000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxReqSaida."p_descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line10: TfrxLineView
          ShiftMode = smDontShift
          Width = -718.110700000000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 43.354360000000000000
          Height = 30.236225350000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object Line11: TfrxLineView
          Left = 491.338900000000000000
          Top = 30.236240000000010000
          Height = -30.236240000000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object Line12: TfrxLineView
          Left = 597.165740000000000000
          Top = 30.236240000000010000
          Height = -30.236240000000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object frxRequisicaoum_descricao: TfrxMemoView
          Left = 495.118430000000000000
          Width = 98.267780000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxReqSaida."um_descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxRequisicaoquantidade: TfrxMemoView
          Left = 600.945270000000000000
          Width = 113.385900000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxReqSaida."quantidade"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 30.236240000000000000
        ParentFont = False
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Line9: TfrxLineView
          Left = 718.110700000000000000
          Top = 22.677179999999990000
          Width = -718.110700000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo1: TfrxMemoView
          Width = 41.574830000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 41.574830000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 128.504020000000000000
          Width = 362.834880000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Especifica'#231#227'o de Material ou Servi'#231'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 491.338900000000000000
          Width = 105.826840000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid. M'#233'trica')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 597.165740000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 43.354360000000000000
          Top = 22.677165350000000000
          Height = -22.677180000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 128.504020000000000000
          Top = -0.000014649999997118
          Height = 22.677165350000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 491.338900000000000000
          Top = -0.000014649999997118
          Height = 22.677165350000000000
          Color = clBlack
          Diagonal = True
        end
        object Line4: TfrxLineView
          Left = 597.165740000000000000
          Top = -0.000014649999997118
          Height = 22.677165350000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 253.228510000000000000
        ParentFont = False
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Left = 404.409710000000000000
          Top = 94.488250000000000000
          Width = 302.362204720000000000
          Height = 147.401670000000000000
        end
        object Shape2: TfrxShapeView
          Left = 11.338590000000000000
          Top = 94.488250000000000000
          Width = 302.362204720000000000
          Height = 147.401670000000000000
        end
        object Shape9: TfrxShapeView
          Top = 15.118119999999980000
          Width = 718.110700000000000000
          Height = 64.252010000000000000
        end
        object Memo7: TfrxMemoView
          Left = 11.338590000000000000
          Top = 102.047310000000000000
          Width = 302.362204720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Chefe da Unidade Solicitante')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 404.409710000000000000
          Top = 102.047310000000000000
          Width = 302.362204720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Autoriza'#231#227'o')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 48.913420000000000000
          Top = 204.094620000000000000
          Width = 226.771653540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxReqSaida."resp1_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxReqSaida."resp1_cargo"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 441.984540000000000000
          Top = 204.094620000000000000
          Width = 226.771653540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<frxReqSaida."resp1_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxReqSaida."resp2_cargo"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 710.551640000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Justificativa:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 49.133890000000000000
          Top = 181.417440000000000000
          Width = 226.771653540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
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
          Highlight.Condition = '<frxReqSaida."resp1_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxReqSaida."resp1_nome"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 442.205010000000000000
          Top = 181.417440000000000000
          Width = 226.771653540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
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
          Highlight.Condition = '<frxReqSaida."resp2_nome"> <> '#39#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxReqSaida."resp2_nome"]')
          ParentFont = False
        end
      end
    end
  end
  object qryReqSaida: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        DataType = ftWideString
        Size = 1
        Value = '2'
      end>
    SQL.Strings = (
      
        'SELECT e.nome, e.logo, e.cnpj, e.cidade, rs.requisicaosaidaId, p' +
        '.produtoID,'
      
        'cc.descricao as '#39'solicitante_cc'#39', a.descricao as '#39'armazenamento_' +
        'al'#39','
      
        'rs.datarequisicao, irs.itensrequisicaosaidaID, p.descricao as '#39'p' +
        '_descricao'#39', um.descricao as '#39'um_descricao'#39','
      
        'irs.quantidade, e.resp1_nome, e.resp1_cargo, e.resp2_nome, e.res' +
        'p2_cargo, rs.idsituacao'
      'FROM itensrequisicaosaida irs'
      'JOIN requisicaosaida rs ON irs.idreqsaida = rs.requisicaosaidaId'
      'left JOIN produto p on irs.idproduto = p.produtoID'
      'JOIN entidade e'
      'left JOIN unidademedida um ON um.unidadeID = p.idunidade'
      
        'left JOIN centroconsumo cc ON rs.idcentroconsumo = cc.centrocons' +
        'umoID'
      'left JOIN almoxarifado a ON rs.idalmoxarifado = a.almoxarifadoID'
      'where rs.requisicaosaidaId = :id')
    Left = 288
    Top = 128
  end
  object dsReqSaida: TDataSource
    DataSet = qryReqSaida
    Left = 424
    Top = 128
  end
  object frxDBReqSaida: TfrxDBDataset
    UserName = 'frxReqSaida'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nome=nome'
      'logo=logo'
      'cnpj=cnpj'
      'cidade=cidade'
      'requisicaosaidaId=requisicaosaidaId'
      'produtoID=produtoID'
      'solicitante_cc=solicitante_cc'
      'armazenamento_al=armazenamento_al'
      'datarequisicao=datarequisicao'
      'itensrequisicaosaidaID=itensrequisicaosaidaID'
      'p_descricao=p_descricao'
      'um_descricao=um_descricao'
      'quantidade=quantidade'
      'resp1_nome=resp1_nome'
      'resp1_cargo=resp1_cargo'
      'resp2_nome=resp2_nome'
      'resp2_cargo=resp2_cargo'
      'idsituacao=idsituacao')
    DataSet = qryReqSaida
    BCDToCurrency = False
    Left = 504
    Top = 128
  end
  object qryItsaida: TADOQuery
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM requisicaosaida')
    Left = 576
    Top = 136
  end
  object dsItSaida: TDataSource
    DataSet = qryItsaida
    Left = 656
    Top = 136
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43542.584706446800000000
    ReportOptions.LastChange = 43542.585017928200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 288
    Top = 184
    Datasets = <
      item
        DataSet = frxDBReqSaida
        DataSetName = 'frxReqSaida'
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Height = 37.795300000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBReqSaida
        DataSetName = 'frxReqSaida'
        RowCount = 0
        Stretched = True
        object frxRequisicaoprodutoID: TfrxMemoView
          ShiftMode = smDontShift
          Left = 49.133890000000000000
          Top = 3.000000000000000000
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."produtoID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.000000000000000000
          Width = 34.015770000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line6: TfrxLineView
          Left = 128.504020000000000000
          Top = 29.456710000000000000
          Height = -30.236240000000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object Line7: TfrxLineView
          Left = 491.338900000000000000
          Top = 20.897650000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line8: TfrxLineView
          Left = 597.165740000000000000
          Top = 20.897650000000000000
          Height = -18.897650000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxRequisicaodescricao: TfrxMemoView
          Left = 132.283550000000000000
          Top = 4.000000000000000000
          Width = 355.275820000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRequisicao."p_descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line10: TfrxLineView
          ShiftMode = smDontShift
          Left = 718.110700000000000000
          Top = 30.236240000000000000
          Width = -718.110700000000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 43.354360000000000000
          Height = 30.236225350000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object Line11: TfrxLineView
          Left = 491.338900000000000000
          Top = 30.236240000000000000
          Height = -30.236240000000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object Line12: TfrxLineView
          Left = 597.165740000000000000
          Top = 30.236240000000000000
          Height = -30.236240000000000000
          Color = clBlack
          Frame.Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Diagonal = True
        end
        object frxRequisicaoum_descricao: TfrxMemoView
          Left = 495.118430000000000000
          Top = 3.779530000000000000
          Width = 98.267780000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataField = 'um_descricao'
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRequisicao."um_descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxRequisicaoquantidade: TfrxMemoView
          Left = 600.945270000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataSet = frxRequisicao
          DataSetName = 'frxRequisicao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRequisicao."quantidade"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
