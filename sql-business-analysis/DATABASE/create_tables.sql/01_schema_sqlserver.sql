/* =====================================================================
   BANCO DE DADOS: LojaVarejoDB
   Loja de varejo ficticia (e-commerce + fisico) - Script T-SQL (SQL Server)
   Compativel com SQL Server 2016+ e Azure SQL Database
   ===================================================================== */

IF DB_ID('LojaVarejoDB') IS NULL
BEGIN
    CREATE DATABASE LojaVarejoDB;
END
GO

USE LojaVarejoDB;
GO

/* ---------------------------------------------------------------------
   Limpeza (permite reexecutar o script do zero)
   --------------------------------------------------------------------- */
IF OBJECT_ID('dbo.devolucoes', 'U') IS NOT NULL DROP TABLE dbo.devolucoes;
IF OBJECT_ID('dbo.avaliacoes', 'U') IS NOT NULL DROP TABLE dbo.avaliacoes;
IF OBJECT_ID('dbo.pagamentos', 'U') IS NOT NULL DROP TABLE dbo.pagamentos;
IF OBJECT_ID('dbo.itens_pedido', 'U') IS NOT NULL DROP TABLE dbo.itens_pedido;
IF OBJECT_ID('dbo.pedidos', 'U') IS NOT NULL DROP TABLE dbo.pedidos;
IF OBJECT_ID('dbo.clientes', 'U') IS NOT NULL DROP TABLE dbo.clientes;
IF OBJECT_ID('dbo.funcionarios', 'U') IS NOT NULL DROP TABLE dbo.funcionarios;
IF OBJECT_ID('dbo.lojas', 'U') IS NOT NULL DROP TABLE dbo.lojas;
IF OBJECT_ID('dbo.produtos', 'U') IS NOT NULL DROP TABLE dbo.produtos;
IF OBJECT_ID('dbo.fornecedores', 'U') IS NOT NULL DROP TABLE dbo.fornecedores;
IF OBJECT_ID('dbo.categorias', 'U') IS NOT NULL DROP TABLE dbo.categorias;
GO

/* ---------------------------------------------------------------------
   DIMENSOES
   --------------------------------------------------------------------- */

CREATE TABLE dbo.categorias (
    categoria_id     INT             IDENTITY(1,1) NOT NULL,
    nome             NVARCHAR(80)    NOT NULL,
    departamento     NVARCHAR(50)    NOT NULL,
    CONSTRAINT PK_categorias PRIMARY KEY CLUSTERED (categoria_id)
);
GO

CREATE TABLE dbo.fornecedores (
    fornecedor_id       INT             IDENTITY(1,1) NOT NULL,
    razao_social        NVARCHAR(150)   NOT NULL,
    cnpj                VARCHAR(20)     NOT NULL,
    cidade              NVARCHAR(80)    NOT NULL,
    estado              CHAR(2)         NOT NULL,
    telefone            VARCHAR(30)     NULL,
    email               NVARCHAR(120)   NULL,
    prazo_entrega_dias  SMALLINT        NOT NULL,
    CONSTRAINT PK_fornecedores PRIMARY KEY CLUSTERED (fornecedor_id),
    CONSTRAINT UQ_fornecedores_cnpj UNIQUE (cnpj)
);
GO

CREATE TABLE dbo.produtos (
    produto_id       INT             IDENTITY(1,1) NOT NULL,
    sku              VARCHAR(20)     NOT NULL,
    nome             NVARCHAR(150)   NOT NULL,
    categoria_id     INT             NOT NULL,
    fornecedor_id    INT             NOT NULL,
    preco_custo      DECIMAL(12,2)   NOT NULL,
    preco_venda      DECIMAL(12,2)   NOT NULL,
    estoque_atual    INT             NOT NULL,
    estoque_minimo   INT             NOT NULL,
    ativo            BIT             NOT NULL DEFAULT 1,
    data_cadastro    DATE            NOT NULL,
    CONSTRAINT PK_produtos PRIMARY KEY CLUSTERED (produto_id),
    CONSTRAINT UQ_produtos_sku UNIQUE (sku),
    CONSTRAINT FK_produtos_categoria FOREIGN KEY (categoria_id)
        REFERENCES dbo.categorias(categoria_id),
    CONSTRAINT FK_produtos_fornecedor FOREIGN KEY (fornecedor_id)
        REFERENCES dbo.fornecedores(fornecedor_id),
    CONSTRAINT CK_produtos_precos CHECK (preco_venda >= 0 AND preco_custo >= 0)
);
GO

CREATE TABLE dbo.lojas (
    loja_id          INT             IDENTITY(1,1) NOT NULL,
    nome             NVARCHAR(100)   NOT NULL,
    tipo             VARCHAR(20)     NOT NULL,
    cidade           NVARCHAR(80)    NULL,
    estado           CHAR(2)         NULL,
    data_abertura    DATE            NOT NULL,
    CONSTRAINT PK_lojas PRIMARY KEY CLUSTERED (loja_id),
    CONSTRAINT CK_lojas_tipo CHECK (tipo IN ('fisica','site','marketplace','app'))
);
GO

CREATE TABLE dbo.funcionarios (
    funcionario_id   INT             IDENTITY(1,1) NOT NULL,
    nome             NVARCHAR(120)   NOT NULL,
    cargo            NVARCHAR(60)    NOT NULL,
    loja_id          INT             NOT NULL,
    data_contratacao DATE            NOT NULL,
    ativo            BIT             NOT NULL DEFAULT 1,
    CONSTRAINT PK_funcionarios PRIMARY KEY CLUSTERED (funcionario_id),
    CONSTRAINT FK_funcionarios_loja FOREIGN KEY (loja_id)
        REFERENCES dbo.lojas(loja_id)
);
GO

CREATE TABLE dbo.clientes (
    cliente_id       INT             IDENTITY(1,1) NOT NULL,
    nome             NVARCHAR(120)   NOT NULL,
    email            NVARCHAR(150)   NOT NULL,
    telefone         VARCHAR(30)     NULL,
    genero           CHAR(1)         NULL,
    data_nascimento  DATE            NULL,
    cidade           NVARCHAR(80)    NOT NULL,
    estado           CHAR(2)         NOT NULL,
    data_cadastro    DATE            NOT NULL,
    segmento         VARCHAR(15)     NOT NULL,
    CONSTRAINT PK_clientes PRIMARY KEY CLUSTERED (cliente_id),
    CONSTRAINT UQ_clientes_email UNIQUE (email),
    CONSTRAINT CK_clientes_segmento CHECK (segmento IN ('novo','recorrente','vip','inativo'))
);
GO

/* ---------------------------------------------------------------------
   TRANSACOES (FATOS)
   --------------------------------------------------------------------- */

CREATE TABLE dbo.pedidos (
    pedido_id        INT             IDENTITY(1,1) NOT NULL,
    cliente_id       INT             NOT NULL,
    loja_id          INT             NOT NULL,
    funcionario_id   INT             NULL,
    data_pedido      DATETIME2(0)    NOT NULL,
    canal            VARCHAR(15)     NOT NULL,
    status           VARCHAR(15)     NOT NULL,
    forma_pagamento  VARCHAR(20)     NOT NULL,
    valor_frete      DECIMAL(10,2)   NOT NULL DEFAULT 0,
    valor_desconto   DECIMAL(10,2)   NOT NULL DEFAULT 0,
    valor_total      DECIMAL(12,2)   NOT NULL,
    CONSTRAINT PK_pedidos PRIMARY KEY CLUSTERED (pedido_id),
    CONSTRAINT FK_pedidos_cliente FOREIGN KEY (cliente_id)
        REFERENCES dbo.clientes(cliente_id),
    CONSTRAINT FK_pedidos_loja FOREIGN KEY (loja_id)
        REFERENCES dbo.lojas(loja_id),
    CONSTRAINT FK_pedidos_funcionario FOREIGN KEY (funcionario_id)
        REFERENCES dbo.funcionarios(funcionario_id),
    CONSTRAINT CK_pedidos_canal CHECK (canal IN ('site','app','marketplace','loja_fisica')),
    CONSTRAINT CK_pedidos_status CHECK (status IN ('concluido','cancelado','devolvido','processando'))
);
GO

CREATE TABLE dbo.itens_pedido (
    item_id          INT             IDENTITY(1,1) NOT NULL,
    pedido_id        INT             NOT NULL,
    produto_id       INT             NOT NULL,
    quantidade       INT             NOT NULL,
    preco_unitario   DECIMAL(12,2)   NOT NULL,
    desconto_item    DECIMAL(10,2)   NOT NULL DEFAULT 0,
    CONSTRAINT PK_itens_pedido PRIMARY KEY CLUSTERED (item_id),
    CONSTRAINT FK_itens_pedido_pedido FOREIGN KEY (pedido_id)
        REFERENCES dbo.pedidos(pedido_id),
    CONSTRAINT FK_itens_pedido_produto FOREIGN KEY (produto_id)
        REFERENCES dbo.produtos(produto_id),
    CONSTRAINT CK_itens_pedido_qtd CHECK (quantidade > 0)
);
GO

CREATE TABLE dbo.pagamentos (
    pagamento_id     INT             IDENTITY(1,1) NOT NULL,
    pedido_id        INT             NOT NULL,
    forma_pagamento  VARCHAR(20)     NOT NULL,
    valor            DECIMAL(12,2)   NOT NULL,
    parcelas         SMALLINT        NOT NULL DEFAULT 1,
    status           VARCHAR(15)     NOT NULL,
    data_pagamento   DATETIME2(0)    NOT NULL,
    CONSTRAINT PK_pagamentos PRIMARY KEY CLUSTERED (pagamento_id),
    CONSTRAINT FK_pagamentos_pedido FOREIGN KEY (pedido_id)
        REFERENCES dbo.pedidos(pedido_id),
    CONSTRAINT CK_pagamentos_status CHECK (status IN ('aprovado','recusado','estornado'))
);
GO

CREATE TABLE dbo.avaliacoes (
    avaliacao_id     INT             IDENTITY(1,1) NOT NULL,
    produto_id       INT             NOT NULL,
    cliente_id       INT             NOT NULL,
    pedido_id        INT             NOT NULL,
    nota             TINYINT         NOT NULL,
    comentario       NVARCHAR(500)   NULL,
    data_avaliacao   DATE            NOT NULL,
    CONSTRAINT PK_avaliacoes PRIMARY KEY CLUSTERED (avaliacao_id),
    CONSTRAINT FK_avaliacoes_produto FOREIGN KEY (produto_id)
        REFERENCES dbo.produtos(produto_id),
    CONSTRAINT FK_avaliacoes_cliente FOREIGN KEY (cliente_id)
        REFERENCES dbo.clientes(cliente_id),
    CONSTRAINT FK_avaliacoes_pedido FOREIGN KEY (pedido_id)
        REFERENCES dbo.pedidos(pedido_id),
    CONSTRAINT CK_avaliacoes_nota CHECK (nota BETWEEN 1 AND 5)
);
GO

CREATE TABLE dbo.devolucoes (
    devolucao_id     INT             IDENTITY(1,1) NOT NULL,
    pedido_id        INT             NOT NULL,
    item_id          INT             NOT NULL,
    motivo           NVARCHAR(200)   NOT NULL,
    data_devolucao   DATE            NOT NULL,
    valor_devolvido  DECIMAL(12,2)   NOT NULL,
    CONSTRAINT PK_devolucoes PRIMARY KEY CLUSTERED (devolucao_id),
    CONSTRAINT FK_devolucoes_pedido FOREIGN KEY (pedido_id)
        REFERENCES dbo.pedidos(pedido_id),
    CONSTRAINT FK_devolucoes_item FOREIGN KEY (item_id)
        REFERENCES dbo.itens_pedido(item_id)
);
GO

/* ---------------------------------------------------------------------
   INDICES (performance de consulta analitica)
   --------------------------------------------------------------------- */
CREATE INDEX IX_pedidos_data ON dbo.pedidos(data_pedido);
CREATE INDEX IX_pedidos_cliente ON dbo.pedidos(cliente_id);
CREATE INDEX IX_pedidos_canal_status ON dbo.pedidos(canal, status);
CREATE INDEX IX_itens_pedido_pedido ON dbo.itens_pedido(pedido_id);
CREATE INDEX IX_itens_pedido_produto ON dbo.itens_pedido(produto_id);
CREATE INDEX IX_produtos_categoria ON dbo.produtos(categoria_id);
CREATE INDEX IX_avaliacoes_produto ON dbo.avaliacoes(produto_id);
GO
