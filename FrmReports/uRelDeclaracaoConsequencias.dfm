object frmDeclaracao: TfrmDeclaracao
  Left = 0
  Top = 0
  Caption = 'frmDeclaracao'
  ClientHeight = 205
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 232
    Height = 19
    Caption = 'Declara'#231#227'o de Consequ'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 38
    Width = 69
    Height = 13
    Caption = 'Informe o M'#234's'
  end
  object dtMes: TDateTimePicker
    Left = 56
    Top = 57
    Width = 137
    Height = 24
    Date = 42632.466212280090000000
    Format = 'MM/yyyy'
    Time = 42632.466212280090000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnGerar: TButton
    Left = 82
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 1
    OnClick = btnGerarClick
  end
  object rptDeclaracao: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42632.471731828700000000
    ReportOptions.LastChange = 42779.679603391200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 53
    Top = 144
    Datasets = <
      item
        DataSet = frxDeclaracao
        DataSetName = 'frxDeclaracao'
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
        Height = 192.756030000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDeclaracaonome: TfrxMemoView
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'nome'
          DataSet = frxDeclaracao
          DataSetName = 'frxDeclaracao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDeclaracao."nome"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataSet = frxDeclaracao
          DataSetName = 'frxDeclaracao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CNPJ: [frxDeclaracao."cnpj"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 64.252010000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Exerc'#237'cio: [<frxDeclaracao."mes">]/[<frxDeclaracao."ano">]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Height = 532.913730000000000000
        ParentFont = False
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = frxDeclaracao
        DataSetName = 'frxDeclaracao'
        RowCount = 0
        object Memo1: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DECLARA'#199#195'O')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              '         Eu, [frxDeclaracao."resp1_nome"], encarregado(a) do Alm' +
              'oxarifado da [frxDeclaracao."nome"], CPF [frxDeclaracao."resp1_c' +
              'ic"] residente e domiciliado(a) em [frxDeclaracao."cidade"].')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo3: TfrxMemoView
          Top = 139.842610000000000000
          Width = 718.110700000000000000
          Height = 120.944960000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              '         DECLARO para os devidos fins que se fizerem necess'#225'rios' +
              ' e sob as penas da lei e em atendimento normativas do tribunal d' +
              'e contas que n'#227'o houve saldo de almoxarifado a ser demonstrado n' +
              'o final do exerc'#237'cio de [frxDeclaracao."ano"], sendo os materiai' +
              's distribu'#237'dos dentro do exerc'#237'cio e registrados as entradas e s' +
              'a'#237'das em programa espec'#237'fico para tal fim, tendo seus relat'#243'rios' +
              ' impressos e arquivados na sede desta [frxDeclaracao."nome"], e ' +
              'a disposi'#231#227'o de eventuais fiscaliza'#231#245'es  desta Corte de Contas.')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 143.622140000000000000
        Top = 827.717070000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo4: TfrxMemoView
          Top = 7.559060000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Por ser express'#227'o da verdade afirmo a presente'
            '[frxDeclaracao."nome"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CPF [frxDeclaracao."resp1_cic"]')
          ParentFont = False
        end
      end
    end
  end
  object qryDeclaracao: TADOQuery
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *, '#39'01'#39' as mes, '#39'2016'#39' as ano  FROM entidade')
    Left = 144
    Top = 144
  end
  object dsDeclaracao: TDataSource
    DataSet = qryDeclaracao
    Left = 56
    Top = 208
  end
  object frxDeclaracao: TfrxDBDataset
    UserName = 'frxDeclaracao'
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
      'resp3_cargo=resp3_cargo'
      'mes=mes'
      'ano=ano')
    DataSource = dsDeclaracao
    BCDToCurrency = False
    Left = 140
    Top = 208
  end
end
