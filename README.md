# SQL Business Analysis

Projeto desenvolvido com o objetivo de demonstrar habilidades em **SQL Server** por meio de consultas voltadas para problemas reais de negócio utilizando um banco de dados relacional de uma loja de varejo fictícia.

O projeto simula situações encontradas no dia a dia de analistas de dados, explorando métricas comerciais, comportamento de clientes, desempenho de produtos, retenção, ranking de vendas e indicadores estratégicos.

---

## Objetivo

Desenvolver consultas SQL que respondam perguntas de negócio utilizando boas práticas de modelagem, organização e documentação.

Além da construção das consultas, o projeto busca demonstrar conhecimento em:

- Modelagem Relacional
- SQL para Análise de Dados
- Joins
- CTE (Common Table Expressions)
- Window Functions
- Funções de Agregação
- Manipulação de Datas
- Organização de código SQL
- Documentação técnica

---

# Banco de Dados

O projeto utiliza o banco **LojaVarejoDB**, composto por **11 tabelas** divididas entre dimensões e fatos.

### Tabelas de Cadastro

- Clientes
- Produtos
- Categorias
- Fornecedores
- Funcionários
- Lojas

### Tabelas de Transação

- Pedidos
- Itens do Pedido
- Pagamentos
- Avaliações
- Devoluções

O modelo foi desenvolvido para permitir análises comerciais semelhantes às encontradas em empresas de e-commerce e varejo.

---

# 📁 Estrutura do Projeto

```
sql-business-analysis/

│
├── database/
│   ├── create_tables.sql
│   ├── inserts.sql
│
├── queries/
│   ├── 01_receita_total.sql
│   ├── 02_ticket_medio.sql
│   ├── 03_top_produtos.sql
│   ├── 04_top_clientes.sql
│   ├── 05_receita_categoria.sql
│   ├── 06_ticket_estado.sql
│   ├── 07_taxa_recompra.sql
│   ├── 08_ranking_categoria.sql
│   ├── 09_ranking_vendedores.sql
│   ├── 10_produtos_sem_venda.sql
│   ├── 11_estoque_critico.sql
│   ├── 12_produtos_devolvidos.sql
│   ├── 13_avaliacoes.sql
│   ├── 14_receita_mensal.sql
│   ├── 15_receita_canal.sql
|
└── README.md
```

#  Principais Habilidades Demonstradas

✔ SQL Server

✔ Modelagem Relacional

✔ INNER JOIN

✔ LEFT JOIN

✔ GROUP BY

✔ HAVING

✔ ORDER BY

✔ Common Table Expressions (CTE)

✔ Window Functions

✔ RANK()

✔ DENSE_RANK()

✔ ROW_NUMBER()

✔ SUM()

✔ AVG()

✔ COUNT()

✔ Manipulação de Datas

✔ Consultas Analíticas

✔ Organização de Código

✔ Documentação Técnica

---

#  Possíveis Insights

As consultas desenvolvidas permitem responder perguntas como:

- Qual é o faturamento da empresa?
- Quais produtos geram mais receita?
- Quais categorias possuem melhor desempenho?
- Quem são os clientes mais valiosos?
- Qual canal vende mais?
- Qual estado possui maior ticket médio?
- Como evoluíram as vendas ao longo do tempo?
- Qual a taxa de retenção dos clientes?
- Quais vendedores possuem melhor desempenho?
- Quais produtos apresentam maior índice de devolução?

---

#  Tecnologias Utilizadas

- SQL Server
- T-SQL
- Git
- GitHub

---
