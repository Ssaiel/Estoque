Select ent.logo, ent.nome as prefeitura, ent.nomeuf as estado, ent.cnpj,  entradaID as Entrada, idOrdemCompra as Pedido, EP.dataentrada as Data, empenhoprocesso as Empenho, 
 notafiscal, CAT.descricao as Descricao_Categoria , FORN.RazaoSocial as Fornecedor, PROD.produtoID, PROD.descricao, IEP.quantidade , IEP.valorunitario, (IEP.quantidade * IEP.valorunitario) as valortotal, ALM.DESCRICAO as Almoxarifado , ep.valoracrescimodesconto / (select count(*) from entradaproduto join itensentradaproduto on itensentradaproduto.identradaproduto = entradaproduto.entradaID where entradaID = ep.entradaID)
from entradaproduto as EP 
join itensentradaproduto as IEP on IEP.identradaproduto = EP.entradaID 
 join almoxarifado as ALM on ALM.almoxarifadoID = EP.CodAlmoxarifado 
join fornecedor as FORN on FORN.cpfcnpj = EP.codFornecedor OR FORN.codigo = EP.codFornecedor 
join produto as PROD on PROD.produtoID = IEP.idproduto 
join categoria as CAT on CAT.categoriaID = PROD.idcategoria 
join entidade as ent 
WHERE  EP.DATAENTRADA BETWEEN '2014-01-01' AND '2014-12-28'