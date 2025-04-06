-- Criação da tabela clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_cadastro DATE,
    ativo BOOLEAN
);

-- Inserção de 5 clientes em um único comando
INSERT INTO clientes (id, nome, email, data_cadastro, ativo) VALUES 
    (1, 'João Silva', 'joao@email.com', '2024-01-01', true),
    (2, 'Maria Santos', 'maria@email.com', '2024-01-02', true),
    (3, 'Pedro Oliveira', 'pedro@email.com', '2024-01-03', false),
    (4, 'Ana Souza', 'ana@email.com', '2024-01-04', true),
    (5, 'Carlos Lima', 'carlos@email.com', '2024-01-05', false);

-- Verificação dos dados inseridos
SELECT * FROM clientes; 