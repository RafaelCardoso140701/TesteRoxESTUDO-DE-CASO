--Pergunta numero 1: o time de CRM da empresa precisa saber quais os clientes n�o fizeram compra alguma(inativos), para enviar email a eles. Quais s�o os clientes que n�o fizeram compras?

-- Esta consulta retorna os usu�rios que n�o t�m compras na tabela Vendas.
SELECT id_cliente, nome, sobrenome, email 
FROM testevendas.dbo.Usuarios 
WHERE id_cliente NOT IN (SELECT cliente_id FROM testevendas.dbo.Vendas);


--Pergunta numero 2: o time de Marketing e comercial precisa de dados para analise e cria��o de campanhas dos produtos sobre os lugares onde os produtos venderam melhor. Quais os endere�os que mais se repetem ?
SELECT U.endere�o, COUNT(*) AS quantidade
FROM [testevendas].dbo.Usuarios U
INNER JOIN [testevendas].dbo.Vendas V 
	ON U.id_cliente = V.cliente_id
GROUP BY U.endere�o
HAVING COUNT(*) > 2
ORDER BY quantidade DESC;