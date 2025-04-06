-- Criação da tabela produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
    categoria VARCHAR(50)
);

-- Inserção de produtos
INSERT INTO produtos (id, nome, preco, estoque, categoria) VALUES
    (1, 'Smartphone', 1500.00, 20, 'Eletrônicos'),
    (2, 'Notebook', 3500.00, 15, 'Eletrônicos'),
    (3, 'Mesa', 800.00, 30, 'Móveis'),
    (4, 'Cadeira', 400.00, 40, 'Móveis'),
    (5, 'Tablet', 1200.00, 25, 'Eletrônicos');

-- Atualização de preços com aumento de 10% apenas para produtos da categoria Eletrônicos
UPDATE produtos 
SET preco = preco * 1.10 
WHERE categoria = 'Eletrônicos';

-- Verificação das alterações
SELECT * FROM produtos; 