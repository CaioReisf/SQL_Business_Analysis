# 📊 SQL Business Analysis

Projeto desenvolvido com o objetivo de demonstrar habilidades em **SQL Server** por meio de consultas voltadas para problemas reais de negócio utilizando um banco de dados relacional de uma loja de varejo fictícia.

O projeto simula situações encontradas no dia a dia de analistas de dados, explorando métricas comerciais, comportamento de clientes, desempenho de produtos, retenção, ranking de vendas e indicadores estratégicos.

---

## 🎯 Objetivo

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

# 🗂 Banco de Dados

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
│   └── constraints.sql
│
├── queries/
│   ├── 01_receita_total.sql
│   ├── 02_ticket_medio.sql
│   ├── 03_top_produtos.sql
│   ├── 04_top_clientes.sql
│   ├── 05_receita_categoria.sql
│   ├── 06_ticket_estado.sql
│   ├── 07_taxa_recompra.sql
│   ├── 08_cohort.sql
│   ├── 09_retencao.sql
│   ├── 10_ranking_categoria.sql
│   ├── 11_ranking_vendedores.sql
│   ├── 12_produtos_sem_venda.sql
│   ├── 13_estoque_critico.sql
│   ├── 14_produtos_devolvidos.sql
│   ├── 15_avaliacoes.sql
│   ├── 16_receita_mensal.sql
│   ├── 17_receita_canal.sql
│   ├── 18_clientes_vip.sql
│   ├── 19_fornecedores.sql
│   └── 20_dashboard.sql
│
├── docs/
│   ├── dicionario_dados.md
│   ├── modelo_relacional.png
│   └── insights.md
│
└── README.md
```

---

# 📌 Consultas Desenvolvidas

## 01 - Receita Total

Calcula o faturamento total da empresa considerando todos os pedidos concluídos.

**Conceitos utilizados**

- SUM()
- WHERE

---

## 02 - Ticket Médio

Calcula o valor médio gasto por pedido.

**Conceitos utilizados**

- AVG()
- Agregação

---

## 03 - Top 10 Produtos por Receita

Identifica os produtos que geraram maior faturamento.

**Conceitos utilizados**

- INNER JOIN
- GROUP BY
- SUM()
- TOP
- ORDER BY

---

## 04 - Top Clientes

Lista os clientes responsáveis pelo maior faturamento da empresa.

**Conceitos utilizados**

- JOIN
- SUM()
- GROUP BY

---

## 05 - Receita por Categoria

Calcula a receita gerada por cada categoria de produtos.

**Conceitos utilizados**

- JOIN
- GROUP BY
- SUM()

---

## 06 - Ticket Médio por Estado

Compara o ticket médio entre os estados dos clientes.

**Conceitos utilizados**

- AVG()
- GROUP BY

---

## 07 - Taxa de Recompra

Calcula quantos clientes realizaram uma nova compra após a primeira.

**Conceitos utilizados**

- CTE
- MIN()
- DATEADD()
- DATEDIFF()
- CASE

---

## 08 - Análise de Cohort

Agrupa clientes pelo mês da primeira compra e acompanha sua retenção ao longo do tempo.

**Conceitos utilizados**

- CTE
- DATEFROMPARTS()
- DATEDIFF()
- GROUP BY

---

## 09 - Retenção de Clientes

Mede o percentual de clientes que continuam comprando após determinado período.

**Conceitos utilizados**

- CTE
- COUNT()
- CASE

---

## 10 - Ranking Mensal por Categoria

Classifica as categorias de produtos por faturamento em cada mês.

**Conceitos utilizados**

- RANK()
- PARTITION BY
- SUM()

---

## 11 - Ranking de Vendedores

Compara o desempenho dos vendedores com base no faturamento gerado.

**Conceitos utilizados**

- JOIN
- SUM()
- RANK()

---

## 12 - Produtos sem Venda

Lista produtos que nunca foram vendidos.

**Conceitos utilizados**

- LEFT JOIN
- IS NULL

---

## 13 - Produtos com Estoque Crítico

Identifica produtos abaixo do estoque mínimo.

**Conceitos utilizados**

- WHERE
- Comparação entre colunas

---

## 14 - Produtos Mais Devolvidos

Mostra quais produtos apresentam maior quantidade de devoluções.

**Conceitos utilizados**

- JOIN
- COUNT()
- GROUP BY

---

## 15 - Avaliação Média dos Produtos

Calcula a nota média recebida por cada produto.

**Conceitos utilizados**

- AVG()
- GROUP BY

---

## 16 - Receita Mensal

Apresenta a evolução do faturamento ao longo do tempo.

**Conceitos utilizados**

- SUM()
- GROUP BY
- Funções de Data

---

## 17 - Receita por Canal

Compara o desempenho entre Site, App, Marketplace e Loja Física.

**Conceitos utilizados**

- SUM()
- GROUP BY

---

## 18 - Clientes VIP

Identifica os clientes com maior participação no faturamento.

**Conceitos utilizados**

- SUM()
- Window Functions
- RANK()

---

## 19 - Desempenho dos Fornecedores

Calcula a receita gerada pelos produtos de cada fornecedor.

**Conceitos utilizados**

- JOIN
- GROUP BY
- SUM()

---

## 20 - Queries para Dashboard

Consultas utilizadas para alimentar dashboards em ferramentas de BI.

KPIs:

- Receita Total
- Ticket Médio
- Pedidos
- Clientes Ativos
- Receita por Canal
- Receita por Categoria
- Receita Mensal
- Ranking de Produtos
- Ranking de Vendedores
- Taxa de Recompra

---

# 💡 Principais Habilidades Demonstradas

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

# 📈 Possíveis Insights

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

# 🚀 Tecnologias Utilizadas

- SQL Server
- T-SQL
- Git
- GitHub

---

# 👨‍💻 Autor

Projeto desenvolvido para fins de estudo e composição de portfólio em Análise de Dados, com foco na aplicação de SQL em cenários de negócio.
