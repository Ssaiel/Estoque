object frmListaReqSaida: TfrmListaReqSaida
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Lista de Requisi'#231#245'es de Sa'#237'da'
  ClientHeight = 379
  ClientWidth = 666
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
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 114
    Height = 13
    Caption = 'Lista de Requisi'#231#245'es'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 31
    Width = 497
    Height = 21
    KeyField = 'requisicaosaidaId'
    ListField = 'requisicaosaidaId;LocalArmazenamento'
    ListFieldIndex = 1
    ListSource = dmComprasEstoque.dsQryListaReqSaida
    TabOrder = 0
    OnClick = DBLookupComboBox1Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 65
    Width = 666
    Height = 314
    Align = alBottom
    Caption = '  Dados   '
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 110
      Height = 13
      Caption = 'Centro de Consumo'
      FocusControl = DBEdit2
    end
    object Label6: TLabel
      Left = 504
      Top = 77
      Width = 130
      Height = 13
      Caption = 'Situa'#231#227'o da Requisi'#231#227'o'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 8
      Top = 83
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit6
    end
    object Label4: TLabel
      Left = 352
      Top = 24
      Width = 84
      Height = 13
      Caption = 'datarequisicao'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 504
      Top = 24
      Width = 71
      Height = 13
      Caption = 'dataentrega'
      FocusControl = DBEdit3
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 133
      Width = 662
      Height = 179
      Align = alBottom
      DataSource = DataSource1
      Enabled = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'codigoproduto'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomeproduto'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o Produto'
          Width = 433
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Quantidade'
          Visible = True
        end>
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 43
      Width = 329
      Height = 21
      DataField = 'CentroConsumo'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 504
      Top = 96
      Width = 130
      Height = 21
      DataField = 'situacaorequisicao'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 99
      Width = 478
      Height = 21
      DataField = 'descricao'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 352
      Top = 43
      Width = 134
      Height = 21
      DataField = 'datarequisicao'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 4
    end
    object DBEdit3: TDBEdit
      Left = 504
      Top = 43
      Width = 134
      Height = 21
      DataField = 'dataentrega'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 5
    end
  end
  object BitBtn1: TBitBtn
    Left = 543
    Top = 12
    Width = 106
    Height = 40
    Caption = 'Selecionar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object qryConsultaItens: TADOQuery
    Connection = dmComprasEstoque.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT req.*, cc.descricao as CentroConsumo,'
      ' sr.descricao as situacaorequisicao,'
      
        'irc.idproduto as codigoproduto , p.descricao as nomeproduto, irc' +
        '.quantidade   '
      'FROM requisicaosaida as req  '
      
        'join itensrequisicaosaida as irc on irc.idreqsaida = req.requisi' +
        'caosaidaId'
      
        'join centroconsumo as cc on cc.centroconsumoID = req.idcentrocon' +
        'sumo  '
      'join produto as p on p.produtoid = irc.idproduto  '
      
        'join situacaorequisicao as sr on sr.situacaorequisicaoid = req.i' +
        'dsituacao  '
      'Where idsituacao = 1'
      'AND requisicaosaidaid = 32')
    Left = 248
    Top = 144
    object qryConsultaItensrequisicaosaidaId: TAutoIncField
      FieldName = 'requisicaosaidaId'
      ReadOnly = True
    end
    object qryConsultaItensdatarequisicao: TDateField
      FieldName = 'datarequisicao'
    end
    object qryConsultaItensdataentrega: TDateField
      FieldName = 'dataentrega'
    end
    object qryConsultaItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryConsultaItensidOrdemSaida: TIntegerField
      FieldName = 'idOrdemSaida'
    end
    object qryConsultaItensCentroConsumo: TStringField
      FieldName = 'CentroConsumo'
      Size = 100
    end
    object qryConsultaItenssituacaorequisicao: TStringField
      FieldName = 'situacaorequisicao'
      Size = 45
    end
    object qryConsultaItenscodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
    end
    object qryConsultaItensnomeproduto: TStringField
      FieldName = 'nomeproduto'
      Size = 100
    end
    object qryConsultaItensidalmoxarifado: TIntegerField
      FieldName = 'idalmoxarifado'
    end
    object qryConsultaItensidcentroconsumo: TIntegerField
      FieldName = 'idcentroconsumo'
    end
    object qryConsultaItensidsituacao: TIntegerField
      FieldName = 'idsituacao'
    end
    object qryConsultaItensdatabaixa: TDateField
      FieldName = 'databaixa'
    end
    object qryConsultaItensdescricaobaixa: TStringField
      FieldName = 'descricaobaixa'
      Size = 100
    end
    object qryConsultaItensnotafiscal: TStringField
      FieldName = 'notafiscal'
    end
    object qryConsultaItensquantidade: TBCDField
      FieldName = 'quantidade'
      Precision = 10
      Size = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = qryConsultaItens
    Left = 248
    Top = 96
  end
end
