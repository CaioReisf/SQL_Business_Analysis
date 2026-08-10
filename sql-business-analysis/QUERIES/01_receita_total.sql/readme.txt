01 - Top Cliente
Objetivo

Identificar os clientes que apresentaram o maior valor total gasto em pedidos concluídos.

---------------

Consulta:

SELECT
    c.cliente_id,
    c.nome,
    SUM(p.valor_total) AS valor_gasto
FROM clientes AS c
INNER JOIN pedidos AS p
    ON p.cliente_id = c.cliente_id
WHERE p.status = 'concluido'
GROUP BY
    c.cliente_id,
    c.nome
ORDER BY
    valor_gasto DESC;

------------------

Lógica da análise

A consulta relaciona os clientes aos seus respectivos pedidos e considera somente pedidos concluídos.

O valor gasto por cada cliente é calculado através da soma de pedidos.valor_total.

O resultado é ordenado de forma decrescente, colocando os clientes que mais gastaram no topo.

Conceitos utilizados
INNER JOIN
SUM()
GROUP BY
WHERE
ORDER BY
Agregação de dados
Regra de negócio

Somente pedidos com status concluido são considerados no cálculo do valor gasto.