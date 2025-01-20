-- Criação das tabelas do banco de dados

CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    tipo_cliente ENUM('PF', 'PJ') NOT NULL
);

CREATE TABLE Produto (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE Fornecedor (
    fornecedor_id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Estoque (
    estoque_id INT PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    data DATE,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Pagamento (
    pagamento_id INT PRIMARY KEY,
    pedido_id INT,
    metodo_pagamento VARCHAR(50),
    valor DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

CREATE TABLE Entrega (
    entrega_id INT PRIMARY KEY,
    pedido_id INT,
    status VARCHAR(50),
    codigo_rastreio VARCHAR(100),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

CREATE TABLE Produto_Fornecedor (
    produto_id INT,
    fornecedor_id INT,
    PRIMARY KEY (produto_id, fornecedor_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

-- Inserção de dados

-- Inserir clientes
INSERT INTO Cliente (cliente_id, nome, tipo_cliente) VALUES
(1, 'João Silva', 'PF'),
(2, 'Empresa XYZ', 'PJ');

-- Inserir produtos
INSERT INTO Produto (produto_id, nome, preco) VALUES
(1, 'Produto A', 10.50),
(2, 'Produto B', 15.00);

-- Inserir fornecedores
INSERT INTO Fornecedor (fornecedor_id, nome) VALUES
(1, 'Fornecedor A'),
(2, 'Fornecedor B');

-- Inserir estoque
INSERT INTO Estoque (estoque_id, produto_id, quantidade) VALUES
(1, 1, 100),
(2, 2, 200);

-- Inserir pedidos
INSERT INTO Pedido (pedido_id, cliente_id, data) VALUES
(1, 1, '2025-01-20'),
(2, 2, '2025-01-21');

-- Inserir pagamentos
INSERT INTO Pagamento (pagamento_id, pedido_id, metodo_pagamento, valor) VALUES
(1, 1, 'Cartão de Crédito', 50.00),
(2, 2, 'Boleto', 30.00);

-- Inserir entregas
INSERT INTO Entrega (entrega_id, pedido_id, status, codigo_rastreio) VALUES
(1, 1, 'Enviado', 'ABC123'),
(2, 2, 'Em Processamento', 'XYZ456');

-- Consultas SQL

-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT c.nome, COUNT(p.pedido_id) AS total_pedidos
FROM Cliente c
JOIN Pedido p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id;

-- 2. Algum vendedor também é fornecedor?
SELECT DISTINCT f.nome
FROM Fornecedor f
JOIN Produto_Fornecedor pf ON f.fornecedor_id = pf.fornecedor_id
JOIN Produto p ON pf.produto_id = p.produto_id
WHERE EXISTS (SELECT 1 FROM Vendedor v WHERE v.fornecedor_id = f.fornecedor_id);

-- 3. Relação de produtos fornecedores e estoques
SELECT p.nome AS produto, f.nome AS fornecedor, e.quantidade
FROM Produto p
JOIN Produto_Fornecedor pf ON p.produto_id = pf.produto_id
JOIN Fornecedor f ON pf.fornecedor_id = f.fornecedor_id
JOIN Estoque e ON p.produto_id = e.produto_id;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.nome AS fornecedor, p.nome AS produto
FROM Produto p
JOIN Produto_Fornecedor pf ON p.produto_id = pf.produto_id
JOIN Fornecedor f ON pf.fornecedor_id = f.fornecedor_id;

-- 5. Status das entregas e total de pagamentos por pedido
SELECT e.status, SUM(pa.valor) AS total_pago
FROM Entrega e
JOIN Pagamento pa ON e.pedido_id = pa.pedido_id
GROUP BY e.status;
