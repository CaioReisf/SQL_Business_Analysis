
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
