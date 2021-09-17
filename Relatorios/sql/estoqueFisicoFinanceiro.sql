SELECT e.nome as Prefeitura, e.nomeuf as Estado, e.cnpj, e.logo , p.produtoID, p.descricao as nomeproduto, 
(Coalesce(sum(ep.entrada),0) * 
	(SELECT avg(precomedio) 
		FROM precomedio 
	WHERE idproduto = p.produtoid AND MES BETWEEN '01' AND '12' )) 	
	as ENTRADA, 
(Coalesce(Sum(ep.saida),0) * 
	(SELECT avg(precomedio) 
	FROM precomedio  
  	WHERE idproduto = p.produtoid AND MES BETWEEN  '01' AND '12')  ) 
	as SAIDA, 
 (Coalesce(Sum(ep.saldo),0) * 
 	(SELECT avg(precomedio) 
	FROM precomedio 
	WHERE idproduto = p.produtoid AND MES BETWEEN '01' AND '12') ) 
	as SALDO
	FROM estoqueproduto as ep 
	join produto as p on p.produtoID =  ep.idproduto 

	join entidade as e 
	WHERE ep.mes BETWEEN '01' AND '12'
	AND ep.ANO = '2014'
	group by p.produtoID, p.descricao
	/*AND p.produtoID = ''*/
	
	select eep.valoracrescimodesconto 
from entradaproduto eep
join itensentradaproduto ie on ie.identradaproduto = eep.entradaID 
where eep.dataentrada between '2014-01-01' and '2014-12-28'
group by ie.identradaproduto
