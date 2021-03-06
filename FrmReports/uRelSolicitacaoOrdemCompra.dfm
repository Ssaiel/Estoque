object FrmRelOrdemCompra: TFrmRelOrdemCompra
  Left = 0
  Top = 0
  Caption = 'Ordem de Compra | Gerenciamento de Estoque'
  ClientHeight = 150
  ClientWidth = 220
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI Semilight'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 35
    Width = 194
    Height = 17
    Caption = 'Selecione a Requisi'#231#227'o de Compra'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 136
    Height = 21
    Caption = 'Ordem de Compra'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dblOrdemCompra: TDBLookupComboBox
    Left = 8
    Top = 58
    Width = 194
    Height = 25
    KeyField = 'ordemcompraID'
    ListField = 'ordemcompraID'
    ListSource = dsOrdemCompra
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 103
    Width = 194
    Height = 39
    Caption = 'Gerar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object rptSolOrdemCompra: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42633.442081539400000000
    ReportOptions.LastChange = 43543.673085636580000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 496
    Top = 24
    Datasets = <
      item
        DataSet = frxSolOrdemCompra
        DataSetName = 'frxSolOrdemCompra'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'calibri'
        Font.Style = []
        Height = 241.889920000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object frxRequisicaonome: TfrxMemoView
          Top = 11.338590000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frmRelRequisicaoEntrada.frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."nome"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 49.133890000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frmRelRequisicaoEntrada.frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Requisi'#231#227'o de Ordem de Compra')
          ParentFont = False
        end
        object frxRequisicaocnpj: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frmRelRequisicaoEntrada.frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."cnpj"]')
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
        object Shape1: TfrxShapeView
          Top = 120.944960000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
        end
        object Memo1: TfrxMemoView
          Top = 124.724490000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Top = 124.724490000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_razao"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 449.764070000000000000
          Top = 120.944960000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo3: TfrxMemoView
          Left = 529.134200000000000000
          Top = 124.724490000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_cic"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 449.764070000000000000
          Top = 124.724490000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'CPF/CNPJ')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Top = 147.401670000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
        end
        object Memo5: TfrxMemoView
          Top = 151.181200000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 79.370130000000000000
          Top = 151.181200000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_end"]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 449.764070000000000000
          Top = 147.401670000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          Left = 529.134200000000000000
          Top = 151.181200000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '__')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 449.764070000000000000
          Top = 151.181200000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Top = 173.858380000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
        end
        object Memo9: TfrxMemoView
          Top = 177.637910000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 79.370130000000000000
          Top = 177.637910000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '__')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 449.764070000000000000
          Top = 173.858380000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          Left = 529.134200000000000000
          Top = 177.637910000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_cep"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 449.764070000000000000
          Top = 177.637910000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
        end
        object Line10: TfrxLineView
          Left = 600.945270000000000000
          Top = 173.858380000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo13: TfrxMemoView
          Left = 661.417750000000000000
          Top = 177.637910000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_uf"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 604.724800000000000000
          Top = 177.637910000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Line12: TfrxLineView
          Left = 725.669760000000000000
          Top = 173.858380000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Shape10: TfrxShapeView
          Top = 215.433210000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
        end
        object Shape11: TfrxShapeView
          Top = 215.433210000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Fill.BackColor = cl3DLight
        end
        object Memo27: TfrxMemoView
          Top = 219.212740000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Line18: TfrxLineView
          Left = 34.015770000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo28: TfrxMemoView
          Left = 34.015770000000000000
          Top = 219.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Line19: TfrxLineView
          Left = 98.267780000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo29: TfrxMemoView
          Left = 98.267780000000000000
          Top = 219.212740000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Especifica'#231#227'o do Material ou Servi'#231'o')
          ParentFont = False
        end
        object Line20: TfrxLineView
          Left = 347.716760000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line21: TfrxLineView
          Left = 411.968770000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo30: TfrxMemoView
          Left = 347.716760000000000000
          Top = 219.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
        end
        object Line22: TfrxLineView
          Left = 476.220780000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo31: TfrxMemoView
          Left = 411.968770000000000000
          Top = 219.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quant.')
          ParentFont = False
        end
        object Line23: TfrxLineView
          Left = 551.811023622047000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo32: TfrxMemoView
          Left = 476.220780000000000000
          Top = 219.212740000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Un.')
          ParentFont = False
        end
        object Line24: TfrxLineView
          Left = 616.063390000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo33: TfrxMemoView
          Left = 551.811380000000000000
          Top = 219.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dto%')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 616.063390000000000000
          Top = 219.212740000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'calibri'
        Font.Style = []
        Height = 56.692950000000000000
        ParentFont = False
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        DataSet = frxSolOrdemCompra
        DataSetName = 'frxSolOrdemCompra'
        RowCount = 0
        Stretched = True
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Width = 34.015770000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 34.015770000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."produtoID"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 102.047310000000000000
          Top = 3.779530000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."p_desc"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 347.716760000000000000
          Top = 3.779530000000020000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."um_desc"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 411.968770000000000000
          Width = 64.252010000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."ie_qtd"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 480.000310000000000000
          Top = 3.779530000000020000
          Width = 68.606422780000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'R$ %2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxSolOrdemCompra."ie_val"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 551.811380000000000000
          Top = 3.779530000000020000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."ie_desc"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 619.842920000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'R$ %2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxSolOrdemCompra."ie_total"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          Left = 34.015770000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line14: TfrxLineView
          Left = 98.267780000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line15: TfrxLineView
          Left = 347.716760000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line16: TfrxLineView
          Left = 411.968770000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line17: TfrxLineView
          Left = 476.220780000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line26: TfrxLineView
          Left = 551.811380000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line27: TfrxLineView
          Left = 616.063390000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line28: TfrxLineView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line29: TfrxLineView
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line30: TfrxLineView
          Left = 718.110700000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'calibri'
        Font.Style = []
        Height = 294.803340000000000000
        ParentFont = False
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Shape12: TfrxShapeView
          Width = 718.110700000000000000
          Height = 83.149660000000000000
        end
        object Memo43: TfrxMemoView
          Width = 540.472790000000000000
          Height = 75.590600000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' Justificativa:')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 544.252320000000000000
          Top = 3.779530000000020000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 544.252320000000000000
          Top = 30.236240000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'R$ %2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxSolOrdemCompra."ie_total">)]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Top = 86.929190000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '     Ap'#243's consulta e aprova'#231#227'o junto a secretaria municipal de f' +
              'inan'#231'as, autoriza a(s) contrata'#231#227'o('#245'es) ou compra(s) do(s) objet' +
              'o(s) acima descrito(s)')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Top = 132.283550000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'SAAE DE URUCAR'#193', 31 de Janeiro de 2016   ')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 68.031540000000000000
          Top = 226.771800000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
          Highlight.Condition = '1 = 1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            'Secret'#225'rio de Finan'#231'as')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 68.031540000000000000
          Top = 256.669450000000000000
          Width = 253.228510000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."resp1_nome"]'
            '[frxSolOrdemCompra."resp1_cic"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 393.071120000000000000
          Top = 226.771800000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
          Highlight.Condition = '1 = 1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            'Prefeito Municipal')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 393.071120000000000000
          Top = 256.669450000000000000
          Width = 253.228510000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."resp2_nome"]'
            '[frxSolOrdemCompra."resp2_cic"]')
          ParentFont = False
        end
        object Line25: TfrxLineView
          Left = 540.472790000000000000
          Height = 83.149660000000000000
          Color = clBlack
          Diagonal = True
        end
      end
    end
  end
  object qrySolOrdemCompra: TADOQuery
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
      
        'select p.produtoID, p.descricao as '#39'p_desc'#39', um.descricao as '#39'um' +
        '_desc'#39', irc.quantidade as '#39'ie_qtd'#39','
      
        'irc.valorunitario as '#39'ie_val'#39', irc.valordesconto as '#39'ie_desc'#39', i' +
        'rc.valortotal as '#39'ie_total'#39','
      
        'f.razaosocial as '#39'f_razao'#39', f.cpfcnpj as '#39'f_cic'#39', f.endereco as ' +
        #39'f_end'#39', f.cep as '#39'f_cep'#39', c.descricao as '#39'f_cidade'#39', c.uf as '#39'f' +
        '_uf'#39','
      
        'e.nome, e.cnpj, e.logo, e.resp1_nome, e.resp1_cic, e.resp2_nome,' +
        ' e.resp2_cic'
      'from ordemcompra oc'
      
        'join requisicaocompra rc ON rc.requisicaocompraID = oc.idreqcomp' +
        'ra'
      
        'join itensrequisicaocompra irc ON irc.idrequisicaocompra = rc.re' +
        'quisicaocompraID'
      'left join produto p ON p.produtoID = irc.idproduto'
      'left join unidademedida um ON um.unidadeID = p.idunidade'
      'left join fornecedor f ON f.cpfcnpj = rc.idfornecedor'
      'left join cidade c ON f.idcidade = c.cidadeID'
      'join entidade e'
      'where oc.ordemcompraID = :id')
    Left = 384
    Top = 24
  end
  object frxSolOrdemCompra: TfrxDBDataset
    UserName = 'frxSolOrdemCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'produtoID=produtoID'
      'p_desc=p_desc'
      'um_desc=um_desc'
      'ie_qtd=ie_qtd'
      'ie_val=ie_val'
      'ie_desc=ie_desc'
      'ie_total=ie_total'
      'f_razao=f_razao'
      'f_cic=f_cic'
      'f_end=f_end'
      'f_cep=f_cep'
      'f_cidade=f_cidade'
      'f_uf=f_uf'
      'nome=nome'
      'cnpj=cnpj'
      'resp1_nome=resp1_nome'
      'resp1_cic=resp1_cic'
      'resp2_nome=resp2_nome'
      'resp2_cic=resp2_cic')
    DataSet = qrySolOrdemCompra
    BCDToCurrency = False
    Left = 272
    Top = 24
  end
  object qryOrdemCompra: TADOQuery
    Active = True
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from ordemcompra oc')
    Left = 272
    Top = 96
  end
  object dsOrdemCompra: TDataSource
    DataSet = qryOrdemCompra
    Left = 376
    Top = 96
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42633.442081539400000000
    ReportOptions.LastChange = 43600.614103969910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 512
    Top = 88
    Datasets = <
      item
        DataSet = frxSolOrdemCompra
        DataSetName = 'frxSolOrdemCompra'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'calibri'
        Font.Style = []
        Height = 241.889920000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object frxRequisicaonome: TfrxMemoView
          Top = 11.338590000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frmRelRequisicaoEntrada.frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."nome"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 49.133890000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frmRelRequisicaoEntrada.frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Requisi'#231#227'o de Ordem de Compra')
          ParentFont = False
        end
        object frxRequisicaocnpj: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frmRelRequisicaoEntrada.frxRequisicao
          DataSetName = 'frxRequisicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."cnpj"]')
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
        object Shape1: TfrxShapeView
          Top = 120.944960000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
        end
        object Memo1: TfrxMemoView
          Top = 124.724490000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Top = 124.724490000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_razao"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 449.764070000000000000
          Top = 120.944960000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo3: TfrxMemoView
          Left = 529.134200000000000000
          Top = 124.724490000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_cic"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 449.764070000000000000
          Top = 124.724490000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'CPF/CNPJ')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Top = 147.401670000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
        end
        object Memo5: TfrxMemoView
          Top = 151.181200000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 79.370130000000000000
          Top = 151.181200000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_end"]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 449.764070000000000000
          Top = 147.401670000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          Left = 529.134200000000000000
          Top = 151.181200000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '__')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 449.764070000000000000
          Top = 151.181200000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Top = 173.858380000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
        end
        object Memo9: TfrxMemoView
          Top = 177.637910000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 79.370130000000000000
          Top = 177.637910000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '__')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 449.764070000000000000
          Top = 173.858380000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          Left = 529.134200000000000000
          Top = 177.637910000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_cep"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 449.764070000000000000
          Top = 177.637910000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
        end
        object Line10: TfrxLineView
          Left = 600.945270000000000000
          Top = 173.858380000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo13: TfrxMemoView
          Left = 661.417750000000000000
          Top = 177.637910000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."f_uf"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 604.724800000000000000
          Top = 177.637910000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Line12: TfrxLineView
          Left = 725.669760000000000000
          Top = 173.858380000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Shape10: TfrxShapeView
          Top = 215.433210000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
        end
        object Shape11: TfrxShapeView
          Top = 215.433210000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Fill.BackColor = cl3DLight
        end
        object Memo27: TfrxMemoView
          Top = 219.212740000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Line18: TfrxLineView
          Left = 34.015770000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo28: TfrxMemoView
          Left = 34.015770000000000000
          Top = 219.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Line19: TfrxLineView
          Left = 98.267780000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo29: TfrxMemoView
          Left = 98.267780000000000000
          Top = 219.212740000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Especifica'#231#227'o do Material ou Servi'#231'o')
          ParentFont = False
        end
        object Line20: TfrxLineView
          Left = 347.716760000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line21: TfrxLineView
          Left = 411.968770000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo30: TfrxMemoView
          Left = 347.716760000000000000
          Top = 219.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid.')
          ParentFont = False
        end
        object Line22: TfrxLineView
          Left = 476.220780000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo31: TfrxMemoView
          Left = 411.968770000000000000
          Top = 219.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quant.')
          ParentFont = False
        end
        object Line23: TfrxLineView
          Left = 551.811023622047000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo32: TfrxMemoView
          Left = 476.220780000000000000
          Top = 219.212740000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Un.')
          ParentFont = False
        end
        object Line24: TfrxLineView
          Left = 616.063390000000000000
          Top = 215.433210000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo33: TfrxMemoView
          Left = 551.811380000000000000
          Top = 219.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dto%')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 616.063390000000000000
          Top = 219.212740000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'calibri'
        Font.Style = []
        Height = 56.692950000000000000
        ParentFont = False
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        DataSet = frxSolOrdemCompra
        DataSetName = 'frxSolOrdemCompra'
        RowCount = 0
        Stretched = True
        object Memo35: TfrxMemoView
          ShiftMode = smDontShift
          Width = 34.015770000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 34.015770000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."produtoID"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 102.047310000000000000
          Top = 3.779530000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxSolOrdemCompra."p_desc"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 347.716760000000000000
          Top = 3.779530000000020000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."um_desc"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 411.968770000000000000
          Width = 64.252010000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."ie_qtd"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 480.000310000000000000
          Top = 3.779530000000020000
          Width = 68.606422780000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'R$ %2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxSolOrdemCompra."ie_val"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 551.811380000000000000
          Top = 3.779530000000020000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."ie_desc"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 619.842920000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'R$ %2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxSolOrdemCompra."ie_total"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          Left = 34.015770000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line14: TfrxLineView
          Left = 98.267780000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line15: TfrxLineView
          Left = 347.716760000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line16: TfrxLineView
          Left = 411.968770000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line17: TfrxLineView
          Left = 476.220780000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line26: TfrxLineView
          Left = 551.811380000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line27: TfrxLineView
          Left = 616.063390000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line28: TfrxLineView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line29: TfrxLineView
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
        object Line30: TfrxLineView
          Left = 718.110700000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Diagonal = True
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'calibri'
        Font.Style = []
        Height = 294.803340000000000000
        ParentFont = False
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Shape12: TfrxShapeView
          Width = 718.110700000000000000
          Height = 83.149660000000000000
        end
        object Memo43: TfrxMemoView
          Width = 540.472790000000000000
          Height = 75.590600000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' Justificativa:')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 544.252320000000000000
          Top = 3.779530000000020000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 544.252320000000000000
          Top = 30.236240000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'R$ %2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxSolOrdemCompra."ie_total">)]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Top = 86.929190000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '     Ap'#243's consulta e aprova'#231#227'o junto a secretaria municipal de f' +
              'inan'#231'as, autoriza a(s) contrata'#231#227'o('#245'es) ou compra(s) do(s) objet' +
              'o(s) acima descrito(s)')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 3.779530000000000000
          Top = 124.724490000000000000
          Width = 714.331170000000000000
          Height = 37.795300000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxSolOrdemCompra."nome"], [Now]')
          ParentFont = False
          Formats = <
            item
            end
            item
              FormatStr = 'dd/mm/yyyy'
              Kind = fkDateTime
            end>
        end
        object Memo48: TfrxMemoView
          Left = 68.031540000000000000
          Top = 226.771800000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
          Highlight.Condition = '1 = 1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            'Secret'#225'rio de Finan'#231'as')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 68.031540000000000000
          Top = 256.669450000000000000
          Width = 253.228510000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."resp1_nome"]'
            '[frxSolOrdemCompra."resp1_cic"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 393.071120000000000000
          Top = 226.771800000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
          Highlight.Condition = '1 = 1'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = [ftTop]
          Memo.UTF8W = (
            'Prefeito Municipal')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 393.071120000000000000
          Top = 256.669450000000000000
          Width = 253.228510000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxSolOrdemCompra."resp2_nome"]'
            '[frxSolOrdemCompra."resp2_cic"]')
          ParentFont = False
        end
        object Line25: TfrxLineView
          Left = 540.472790000000000000
          Height = 83.149660000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          Left = 15.118120000000000000
          Top = 181.417440000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Visible = False
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Now]')
        end
      end
    end
  end
end
