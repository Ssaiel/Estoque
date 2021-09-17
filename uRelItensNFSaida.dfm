object frmRelItensNFSaida: TfrmRelItensNFSaida
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsSingle
  Caption = 'Lista de Requisi'#231#245'es de Compra'
  ClientHeight = 447
  ClientWidth = 681
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
    KeyField = 'requisicaocompraID'
    ListField = 'requisicaocompraID;LocalArmazenamento'
    ListFieldIndex = 1
    ListSource = dmComprasEstoque.dsqryListaReqCompraEntrada
    TabOrder = 0
    OnClick = DBLookupComboBox1Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 58
    Width = 681
    Height = 389
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
    object Label4: TLabel
      Left = 352
      Top = 30
      Width = 64
      Height = 13
      Caption = 'Fornecedor'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 8
      Top = 80
      Width = 121
      Height = 13
      Caption = 'Forma de Pagamento'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 352
      Top = 80
      Width = 130
      Height = 13
      Caption = 'Situa'#231#227'o da Requisi'#231#227'o'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 8
      Top = 136
      Width = 139
      Height = 13
      Caption = 'Observa'#231#227'o Justificativa'
      FocusControl = DBEdit6
    end
    object Label8: TLabel
      Left = 352
      Top = 130
      Width = 50
      Height = 13
      Caption = 'Licita'#231#227'o'
      FocusControl = DBEdit7
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 184
      Width = 677
      Height = 203
      Align = alBottom
      DataSource = DataSource2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnColExit = DBGrid1ColExit
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricaoproduto'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o Produto'
          Width = 345
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorunitario'
          Title.Caption = 'Valor Unit'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          Title.Caption = 'Total'
          Visible = True
        end>
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 43
      Width = 321
      Height = 21
      DataField = 'CentroConsumo'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 352
      Top = 43
      Width = 320
      Height = 21
      DataField = 'nomefantasia'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 96
      Width = 321
      Height = 21
      DataField = 'formapagamento'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 352
      Top = 96
      Width = 201
      Height = 21
      DataField = 'situacaorequisicao'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 149
      Width = 321
      Height = 21
      DataField = 'observacaojustificativa'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 352
      Top = 149
      Width = 272
      Height = 21
      DataField = 'licitacao'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 6
    end
  end
  object BitBtn1: TBitBtn
    Left = 566
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
      
        'SELECT requisicaocompraID, req.datarequisicao, ordemcompraID, cc' +
        '.descricao as CentroConsumo, f.nomefantasia, '
      
        'fp.descricao as formapagamento, sr.descricao as situacaorequisic' +
        'ao, req.observacaojustificativa, req.licitacao,'
      
        'irc.idproduto as codigoproduto , p.descricao as nomeproduto, irc' +
        '.quantidade , irc.valorunitario, REQ.*'
      'FROM requisicaocompra as req  '
      
        'join itensrequisicaocompra as irc on irc.idrequisicaocompra = re' +
        'q.requisicaocompraid '
      
        'join centroconsumo as cc on cc.centroconsumoID = req.idcentrocon' +
        'sumo  '
      
        'join fornecedor as f on f.cpfcnpj = req.idfornecedor  or f.codig' +
        'o = req.idfornecedor'
      'join produto as p on p.produtoid = irc.idproduto  '
      
        'join formapagamento as fp on fp.idformapagamento = req.idformapa' +
        'gamento  '
      
        'join situacaorequisicao as sr on sr.situacaorequisicaoid = req.i' +
        'dsituacao  '
      
        'join almoxarifado as alm on alm.almoxarifadoID = req.idalmoxarif' +
        'ado'
      
        'join pessoas as pes on pes.pessoasID = alm.idresponsavelautoriza' +
        'cao')
    Left = 248
    Top = 144
    object qryConsultaItensdatarequisicao: TDateField
      FieldName = 'datarequisicao'
    end
    object qryConsultaItensrequisicaocompraID: TAutoIncField
      FieldName = 'requisicaocompraID'
      ReadOnly = True
    end
    object qryConsultaItensordemcompraID: TIntegerField
      FieldName = 'ordemcompraID'
    end
    object qryConsultaItensCentroConsumo: TStringField
      FieldName = 'CentroConsumo'
      Size = 100
    end
    object qryConsultaItensnomefantasia: TStringField
      FieldName = 'nomefantasia'
      Size = 100
    end
    object qryConsultaItensformapagamento: TStringField
      FieldName = 'formapagamento'
      Size = 45
    end
    object qryConsultaItenssituacaorequisicao: TStringField
      FieldName = 'situacaorequisicao'
      Size = 45
    end
    object qryConsultaItensobservacaojustificativa: TStringField
      FieldName = 'observacaojustificativa'
      Size = 150
    end
    object qryConsultaItenslicitacao: TStringField
      FieldName = 'licitacao'
      Size = 100
    end
    object qryConsultaItenscodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
    end
    object qryConsultaItensnomeproduto: TStringField
      FieldName = 'nomeproduto'
      Size = 100
    end
    object qryConsultaItensvalorunitario: TBCDField
      FieldName = 'valorunitario'
      Precision = 10
      Size = 2
    end
    object qryConsultaItensidalmoxarifado: TIntegerField
      FieldName = 'idalmoxarifado'
    end
    object qryConsultaItensidcentroconsumo: TIntegerField
      FieldName = 'idcentroconsumo'
    end
    object qryConsultaItensidfornecedor: TStringField
      FieldName = 'idfornecedor'
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
  object DataSource2: TDataSource
    DataSet = ClientDataSet1TEMP
    Left = 504
    Top = 281
  end
  object ClientDataSet1TEMP: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'ordenarPorQuantidade'
        Fields = 'quantidade'
        Options = [ixCaseInsensitive]
      end>
    IndexFieldNames = 'quantidade'
    Params = <>
    StoreDefs = True
    Left = 592
    Top = 282
    object ClientDataSet1TEMPCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ClientDataSet1TEMPdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 150
    end
    object ClientDataSet1TEMPquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object ClientDataSet1TEMPvalorunitario: TFloatField
      FieldName = 'valorunitario'
    end
    object ClientDataSet1TEMPtotal: TFloatField
      FieldName = 'total'
    end
  end
end
