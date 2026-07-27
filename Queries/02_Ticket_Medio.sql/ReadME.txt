# 02 - Ticket Médio

## Objetivo

Calcular o valor médio gasto pelos clientes por pedido concluído.

O ticket médio é um dos principais indicadores comerciais, utilizado para avaliar o comportamento de compra dos clientes e medir a eficiência das estratégias de vendas.

---

## Pergunta de Negócio

> Qual é o valor médio gasto pelos clientes em cada pedido concluído?

---

## Tabelas Utilizadas

| Tabela | Descrição |
|---------|-----------|
| `pedidos` | Armazena as informações dos pedidos realizados pelos clientes. |

---

## Estratégia

A consulta calcula a média dos valores da coluna `valor_total`, considerando apenas os pedidos com status **'concluido'**.

Ao excluir pedidos cancelados, devolvidos ou em processamento, o indicador representa apenas compras efetivamente realizadas.

---

## Consulta SQL

```sql
SELECT
    AVG(valor_total) AS ticket_medio
FROM pedidos
WHERE status = 'concluido';
```

---

## Resultado Esperado

| ticket_medio |
|-------------:|
| 352.87 |

*Valor meramente ilustrativo.*

---

## Explicação da Consulta

A função `AVG()` calcula a média dos valores presentes na coluna `valor_total`.

A cláusula `WHERE` filtra somente os pedidos concluídos, garantindo que o cálculo represente o valor médio das compras efetivamente finalizadas.

O resultado da consulta é uma única linha contendo o ticket médio da empresa.

---

## Conceitos SQL Utilizados

- `SELECT`
- `AVG()`
- `WHERE`
- Funções de agregação

---

## Possíveis Insights

- Valor médio gasto por compra.
- Comparação do ticket médio entre períodos.
- Avaliação do impacto de promoções e descontos.
- Identificação de oportunidades para aumentar o valor médio dos pedidos.
- Apoio na definição de estratégias de vendas e marketing.

---

## Aplicação no Negócio

O ticket médio é um indicador amplamente utilizado para acompanhar o comportamento de compra dos clientes. Seu monitoramento permite avaliar a efetividade de campanhas promocionais, estratégias de cross-selling e up-selling, além de identificar oportunidades para aumentar a receita sem a necessidade de adquirir novos clientes.

---

## Arquivo

```
queries/02_ticket_medio.sql
```

---

## Próxima Consulta

**03 - Top 10 Produtos por Receita**

Identifica os produtos que mais contribuíram para o faturamento da empresa, permitindo reconhecer os itens de maior desempenho e apoiar decisões relacionadas ao estoque, marketing e mix de produtos.