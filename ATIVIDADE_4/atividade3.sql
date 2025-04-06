-- Criação da tabela pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Inserção de pedidos
INSERT INTO pedidos (id, id_cliente, data_pedido, valor_total) VALUES
    (1, 1, '2024-01-10', 2000.00),
    (2, 2, '2024-01-11', 1500.00),
    (3, 3, '2024-01-12', 3000.00),
    (4, 4, '2024-01-13', 800.00),
    (5, 5, '2024-01-14', 1200.00);

-- Exclusão de pedidos de clientes inativos usando subconsulta
DELETE FROM pedidos 
WHERE id_cliente IN (
    SELECT id 
    FROM clientes 
    WHERE ativo = false
);

-- Verificação dos pedidos restantes
SELECT p.*, c.nome as nome_cliente
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id; 