object dmComprasEstoque: TdmComprasEstoque
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 573
  Width = 1353
  object conexao: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=estoque;Initial Catalog=db_comprasestoque;'
    DefaultDatabase = 'db_comprasestoque'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 16
    Top = 8
  end
  object qryAlmoxarifado: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Almoxarifado order by almoxarifadoid')
    Left = 264
    Top = 432
  end
  object comandos: TADOCommand
    Connection = conexao
    Parameters = <>
    Left = 144
    Top = 8
  end
  object dsQryAlmoxarifado: TDataSource
    DataSet = qryAlmoxarifado
    Left = 384
    Top = 424
  end
  object qryPessoas: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from pessoas')
    Left = 27
    Top = 136
    object qryPessoaspessoasID: TAutoIncField
      FieldName = 'pessoasID'
      ReadOnly = True
    end
    object qryPessoasnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object qryPessoasfuncao: TStringField
      FieldName = 'funcao'
      Size = 100
    end
    object qryPessoascpf: TStringField
      FieldName = 'cpf'
    end
  end
  object dsQryPessoas: TDataSource
    DataSet = qryPessoas
    Left = 139
    Top = 136
  end
  object qryResponsavelDespacho: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from pessoas')
    Left = 259
    Top = 368
  end
  object dsQryRespDespacho: TDataSource
    DataSet = qryResponsavelDespacho
    Left = 379
    Top = 368
  end
  object qryResponsavelAutorizacao: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from pessoas')
    Left = 259
    Top = 256
  end
  object dsQryRespAutorizacao: TDataSource
    DataSet = qryResponsavelAutorizacao
    Left = 384
    Top = 256
  end
  object qryEntidade: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from entidade')
    Left = 27
    Top = 192
    object qryEntidadenome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object qryEntidadelogradouro: TStringField
      FieldName = 'logradouro'
      Size = 150
    end
    object qryEntidadenumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object qryEntidadecomplemento: TStringField
      FieldName = 'complemento'
      Size = 45
    end
    object qryEntidadebairro: TStringField
      FieldName = 'bairro'
      Size = 45
    end
    object qryEntidadecidade: TStringField
      FieldName = 'cidade'
      Size = 45
    end
    object qryEntidadeuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryEntidadenomeuf: TStringField
      FieldName = 'nomeuf'
      Size = 45
    end
    object qryEntidadecep: TStringField
      FieldName = 'cep'
      Size = 15
    end
    object qryEntidadetelefone: TStringField
      FieldName = 'telefone'
      Size = 15
    end
    object qryEntidadefax: TStringField
      FieldName = 'fax'
      Size = 15
    end
    object qryEntidadecnpj: TStringField
      FieldName = 'cnpj'
    end
    object qryEntidadeslogan: TStringField
      FieldName = 'slogan'
      Size = 150
    end
    object qryEntidadefebraban: TStringField
      FieldName = 'febraban'
      Size = 10
    end
    object qryEntidadelogo: TStringField
      FieldName = 'logo'
      Size = 150
    end
    object qryEntidaderodape1: TStringField
      FieldName = 'rodape1'
      Size = 45
    end
    object qryEntidaderodape2: TStringField
      FieldName = 'rodape2'
      Size = 45
    end
    object qryEntidademestrabalho: TIntegerField
      FieldName = 'mestrabalho'
    end
    object qryEntidadeserialentidade: TStringField
      FieldName = 'serialentidade'
      Size = 45
    end
    object qryEntidadeserialvalidade: TStringField
      FieldName = 'serialvalidade'
      Size = 45
    end
    object qryEntidademesExercicio: TIntegerField
      FieldName = 'mesExercicio'
    end
    object qryEntidadeanoExercicio: TIntegerField
      FieldName = 'anoExercicio'
    end
    object qryEntidaderesp1_nome: TStringField
      FieldName = 'resp1_nome'
      Size = 50
    end
    object qryEntidaderesp1_cic: TStringField
      FieldName = 'resp1_cic'
      Size = 14
    end
    object qryEntidaderesp1_cargo: TStringField
      FieldName = 'resp1_cargo'
      Size = 50
    end
    object qryEntidaderesp2_nome: TStringField
      FieldName = 'resp2_nome'
      Size = 50
    end
    object qryEntidaderesp2_cic: TStringField
      FieldName = 'resp2_cic'
      Size = 14
    end
    object qryEntidaderesp2_cargo: TStringField
      FieldName = 'resp2_cargo'
      Size = 50
    end
    object qryEntidaderesp3_nome: TStringField
      FieldName = 'resp3_nome'
      Size = 50
    end
    object qryEntidaderesp3_cic: TStringField
      FieldName = 'resp3_cic'
      Size = 14
    end
    object qryEntidaderesp3_cargo: TStringField
      FieldName = 'resp3_cargo'
      Size = 50
    end
  end
  object dsQryEntidade: TDataSource
    DataSet = qryEntidade
    Left = 139
    Top = 192
  end
  object qryCategorias: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CATEGORIA')
    Left = 264
    Top = 80
  end
  object dsQryCategorias: TDataSource
    DataSet = qryCategorias
    Left = 384
    Top = 80
  end
  object qryCentroConsumo: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from centroConsumo')
    Left = 259
    Top = 192
  end
  object dsQryCentroConsumo: TDataSource
    DataSet = qryCentroConsumo
    Left = 384
    Top = 192
  end
  object qryFornecedor: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT * FROM FORNECEDOR WHERE CPFCNPJ <> '#39#39' ORDER BY razaosocia' +
        'l')
    Left = 27
    Top = 312
  end
  object dsQryFornecedor: TDataSource
    DataSet = qryFornecedor
    Left = 139
    Top = 312
  end
  object qryCidades: TADOQuery
    Connection = conexao
    Parameters = <>
    SQL.Strings = (
      'Select * from cidade')
    Left = 32
    Top = 480
  end
  object dsQryCidades: TDataSource
    DataSet = qryCidades
    Left = 144
    Top = 480
  end
  object qryProdutos: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'Select * , concat(produtoID, concat( '#39' '#39', p.descricao)) as '#39'cod_' +
        'descricao'#39' '
      ' from Produto p , categoria c , unidademedida u, tipoproduto tp'
      'where p.idcategoria = c.categoriaid'
      'and p.idunidade = u.unidadeid'
      'and p.idtipo = tp.tipoid'
      'order by p.descricao asc')
    Left = 27
    Top = 256
  end
  object dsQryProdutos: TDataSource
    DataSet = qryProdutos
    Left = 139
    Top = 256
  end
  object dsQryUnidadeMedida: TDataSource
    DataSet = qryUnidade
    Left = 384
    Top = 312
  end
  object dsQryTipoMaterial: TDataSource
    DataSet = qryTipoProduto
    Left = 392
    Top = 480
  end
  object qryUnidade: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM UNIDADEMEDIDA')
    Left = 259
    Top = 312
  end
  object qryTipoProduto: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TipoProduto')
    Left = 264
    Top = 480
  end
  object qryFormaPagamento: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from FormaPagamento')
    Left = 504
    Top = 256
  end
  object qrySituacaoRequisicao: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from situacaorequisicao')
    Left = 504
    Top = 136
  end
  object dsQryFormaPagamento: TDataSource
    DataSet = qryFormaPagamento
    Left = 624
    Top = 256
  end
  object dsQrySituacaoReq: TDataSource
    DataSet = qrySituacaoRequisicao
    Left = 616
    Top = 136
  end
  object dsQryProdRequisicao: TDataSource
    DataSet = qryProdutosRequisicao
    Left = 616
    Top = 200
  end
  object qryProdutosRequisicao: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Produto'
      ' order by descricao')
    Left = 504
    Top = 200
  end
  object qryAux: TADOQuery
    Connection = conexao
    Parameters = <>
    Left = 72
    Top = 8
  end
  object qryRequisicaoCompras: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT rc.*, alm.descricao as almoxarifado, sr.descricao as Situ' +
        'acaoRequisicao, '
      '       cc.descricao as CentroConsumo, f.razaosocial'
      'FROM requisicaocompra as rc '
      
        'join itensrequisicaocompra as irc on irc.idrequisicaocompra = rc' +
        '.requisicaocompraID'
      
        'join almoxarifado as alm on alm.almoxarifadoid = rc.idalmoxarifa' +
        'do  '
      
        'join situacaorequisicao as sr on sr.situacaorequisicaoid = rc.id' +
        'situacao  '
      
        'join centroconsumo as cc on cc.centroconsumoID = rc.idcentrocons' +
        'umo  '
      
        'join fornecedor as f on f.cpfcnpj = rc.idfornecedor OR f.codigo ' +
        '= rc.idfornecedor')
    Left = 496
    Top = 312
  end
  object dsQryRequisicaoCompras: TDataSource
    DataSet = qryRequisicaoCompras
    Left = 624
    Top = 312
  end
  object qryItensRequisicaoCompra: TADOQuery
    Connection = conexao
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM requisicaocompra as rc '
      
        'join itensrequisicaocompra as irc on irc.idrequisicaocompra = rc' +
        '.requisicaocompraID')
    Left = 504
    Top = 424
  end
  object qryOrdemCompra: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT rc.requisicaocompraID as Requisicao, rc.datarequisicao,si' +
        'tua.descricao as Situacao, cc.descricao as CentroConsumo, alm.de' +
        'scricao as Almoxarifado,'
      #9#9'forn.nomefantasia as Fornecedor'
      'FROM requisicaocompra as rc'
      
        'join almoxarifado as alm on alm.almoxarifadoID = rc.idalmoxarifa' +
        'do'
      
        'join centroconsumo as cc on cc.centroconsumoID = rc.idcentrocons' +
        'umo'
      'join fornecedor as forn on forn.cpfcnpj = rc.idfornecedor'
      
        'join situacaorequisicao as situa on situa.situacaorequisicaoId =' +
        ' rc.idsituacao'
      'where datarequisicao between '#39'2014-10-30'#39' and '#39'2015-01-06'#39)
    Left = 504
    Top = 80
  end
  object dsQryOrdemCompra: TDataSource
    DataSet = qryOrdemCompra
    Left = 616
    Top = 80
  end
  object dsQryDetalhesOrdemCompra: TDataSource
    DataSet = qryDetalhesOrdemCompra
    Left = 624
    Top = 24
  end
  object qryDetalhesOrdemCompra: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ir.itensrequisicaoID, ir.idproduto, p.descricao as nome'
      'FROM itensrequisicaocompra as ir'
      'join produto as p on p.produtoID = ir.idproduto'
      'Where ir.idrequisicaocompra = 11')
    Left = 504
    Top = 24
  end
  object qryEntradaProduto: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT e.entradaid, e.dataentrada, f.nomefantasia as Fornecedor,' +
        ' e.empenhoprocesso, e.notafiscal, alm.descricao as LocalArmazena' +
        'mento, e.valoracrescimodesconto, e.idOrdemCompra'
      'FROM entradaproduto as e '
      
        'join almoxarifado as alm on alm.almoxarifadoID = e.CodAlmoxarifa' +
        'do'
      
        'join fornecedor as f on f.cpfcnpj = e.codFornecedor or f.codigo ' +
        '= e.codFornecedor'
      '')
    Left = 32
    Top = 368
  end
  object dsQryEntradaProduto: TDataSource
    DataSet = qryEntradaProduto
    Left = 144
    Top = 368
  end
  object dsQryReqSaida: TDataSource
    DataSet = qryRequisicaoSaida
    Left = 624
    Top = 376
  end
  object qryRequisicaoSaida: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT rs.*, alm.descricao as LocalArmazenamento, cc.descricao a' +
        's CentroConsumo, sr.descricao as Situacao'
      'FROM requisicaosaida as rs'
      
        'join almoxarifado as alm on alm.almoxarifadoID = rs.idalmoxarifa' +
        'do'
      
        'join centroconsumo as cc on cc.centroconsumoID = rs.idcentrocons' +
        'umo'
      
        'join situacaorequisicao as sr on sr.situacaorequisicaoId = rs.id' +
        'situacao')
    Left = 496
    Top = 376
  end
  object dsQryNfSaldo: TDataSource
    DataSet = qryNFSaldo
    Left = 384
    Top = 16
  end
  object qryNFSaldo: TADOQuery
    Connection = conexao
    Parameters = <>
    SQL.Strings = (
      'SELECT NFS.*, P.DESCRICAO '
      'FROM NFSALDO AS NFS'
      'JOIN PRODUTO AS P ON P.PRODUTOID = NFS.PRODUTOID')
    Left = 264
    Top = 16
  end
  object qryOrdemSaidaEstoque: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT rs.*, alm.descricao as LocalArmazenamento, cc.descricao a' +
        's CentroConsumo '
      'FROM ORDEMSAIDAESTOQUE rs  '
      
        'join almoxarifado as alm on alm.almoxarifadoID = rs.idalmoxarifa' +
        'do  '
      
        'join centroconsumo as cc on cc.centroconsumoID = rs.idcentrocons' +
        'umo  '
      'WHERE 1    ')
    Left = 752
    Top = 152
  end
  object dsQryOrdemSaidaEstoque: TDataSource
    DataSet = qryOrdemSaidaEstoque
    Left = 880
    Top = 88
  end
  object dsQryItensOrdemSaida: TDataSource
    DataSet = qryItensOrdemSaida
    Left = 624
    Top = 480
  end
  object qryItensOrdemSaida: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT ir.itensrequisicaosaidaID, ir.idproduto, p.descricao as n' +
        'ome, quantidade '
      ' FROM itensrequisicaosaida as ir  '
      'join produto as p on p.produtoID = ir.idproduto  '
      'Where ir.idreqsaida = '#39'8'#39)
    Left = 504
    Top = 480
  end
  object qryBancos: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM BANCO')
    Left = 32
    Top = 424
  end
  object dsQryBancos: TDataSource
    DataSet = qryBancos
    Left = 144
    Top = 424
  end
  object qryListaRequisicaoCompraEntrada: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT requisicaocompraID, alm.almoxarifadoID, alm.descricao as ' +
        'LocalArmazenamento, ordemcompraID'
      'FROM requisicaocompra as req'
      
        'join almoxarifado as alm on alm.almoxarifadoID = req.idalmoxarif' +
        'ado'
      ' where idsituacao = 1'
      'AND  ordemcompraID IS NOT NULL')
    Left = 792
    Top = 432
  end
  object qryListaRequisicaoSaida: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT requisicaosaidaId, alm.descricao as LocalArmazenamento '
      'FROM requisicaosaida as rs'
      
        'join almoxarifado as alm on alm.almoxarifadoID =  rs.idalmoxarif' +
        'ado'
      'where idsituacao = 1')
    Left = 752
    Top = 88
  end
  object dsqryListaReqCompraEntrada: TDataSource
    DataSet = qryListaRequisicaoCompraEntrada
    Left = 624
    Top = 432
  end
  object dsQryListaReqSaida: TDataSource
    DataSet = qryListaRequisicaoSaida
    Left = 880
    Top = 152
  end
  object qryRelatorioCategoria: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select e.nome as Prefeitura, e.nomeuf as Estado, e.logo, e.cnpj,'
      'c.categoriaID as CodigoCategoria, c.descricao as CAtegoria'
      'from Categoria as c'
      'join entidade as e'
      'ORDER BY c.categoriaID')
    Left = 960
    Top = 472
  end
  object qryRelatorioCentroConsumo: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select e.nome as Prefeitura, e.nomeuf as Estado, e.logo, e.cnpj,'
      'c.centroconsumoID as Codigo, c.descricao as CentroConsumo'
      'from centroconsumo as c'
      'join entidade as e')
    Left = 960
    Top = 520
  end
  object qryRelatorioFornecedor: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select e.nome as Prefeitura, e.nomeuf as Estado, e.logo, e.cnpj,'
      
        'f.cpfcnpj , f.nomefantasia, f.razaosocial, f.telefone, f.nomecon' +
        'tato, f.email, f.site'
      'from fornecedor as f'
      'join entidade as e')
    Left = 960
    Top = 416
  end
  object qryRelatorioAlmoxarifado: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select e.nome as Prefeitura, e.nomeuf as Estado, e.logo, e.cnpj,'
      
        'a.almoxarifadoID, a.descricao, p.nome as RespAutorizacao, p1.nom' +
        'e as RespDespacho'
      'from almoxarifado as a'
      'join entidade as e'
      'join pessoas as p on p.pessoasID = a.idresponsavelautorizacao'
      'join pessoas as p1 on p1.pessoasID = a.idresponsaveldespacho')
    Left = 960
    Top = 360
  end
  object qryUsuariosSistema: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from usuario where status = 1')
    Left = 259
    Top = 136
  end
  object dsQryUsuariosSistema: TDataSource
    DataSet = qryUsuariosSistema
    Left = 384
    Top = 136
  end
  object qryExercicio: TADOQuery
    Connection = conexao
    Parameters = <>
    SQL.Strings = (
      'select * from aberturafechamentoanual')
    Left = 752
    Top = 24
  end
  object dsQryExercicio: TDataSource
    DataSet = qryExercicio
    Left = 880
    Top = 24
  end
  object qryAtivacao: TADOQuery
    Connection = conexao
    Parameters = <>
    SQL.Strings = (
      'select * from liberacao')
    Left = 752
    Top = 216
  end
  object dsQryAtivacao: TDataSource
    DataSet = qryAtivacao
    Left = 880
    Top = 216
  end
  object qryEmpresa: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from entidade')
    Left = 27
    Top = 80
  end
  object dsQryEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 139
    Top = 80
  end
end
