-- Criação das tabelas principais

CREATE TABLE REMETENTE (
    id_remetente INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE DESTINATARIO (
    id_destinatario INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE ENTREGADOR (
    id_entregador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    placa_veiculo VARCHAR(7) NOT NULL,
    tipo_veiculo VARCHAR(20) NOT NULL
);

CREATE TABLE PACOTE (
    numero_rastreamento VARCHAR(20) PRIMARY KEY,
    conteudo VARCHAR(255) NOT NULL,
    destino VARCHAR(255) NOT NULL,
    status_da_entrega VARCHAR(20) NOT NULL,
    data_de_envio DATE NOT NULL,
    data_prevista_de_entrega DATE NOT NULL,
    id_entregador INTEGER NOT NULL,
    id_remetente INTEGER NOT NULL,
    id_destinatario INTEGER NOT NULL,
    FOREIGN KEY (id_entregador) REFERENCES ENTREGADOR(id_entregador),
    FOREIGN KEY (id_remetente) REFERENCES REMETENTE(id_remetente),
    FOREIGN KEY (id_destinatario) REFERENCES DESTINATARIO(id_destinatario),
    CONSTRAINT chk_status CHECK (status_da_entrega IN ('PENDENTE', 'EM_TRANSITO', 'ENTREGUE', 'CANCELADO'))
);

-- Criação de índices

CREATE INDEX idx_pacote_status ON PACOTE(status_da_entrega);
CREATE INDEX idx_pacote_data_envio ON PACOTE(data_de_envio);
CREATE INDEX idx_pacote_entregador ON PACOTE(id_entregador);
CREATE INDEX idx_pacote_remetente ON PACOTE(id_remetente);
CREATE INDEX idx_pacote_destinatario ON PACOTE(id_destinatario);

-- Inserção de dados de exemplo

INSERT INTO REMETENTE (nome, endereco, telefone, email) VALUES
('João Silva', 'Rua A, 123', '(11) 9999-9999', 'joao@email.com');

INSERT INTO DESTINATARIO (nome, endereco, telefone, email) VALUES
('Maria Santos', 'Rua B, 456', '(11) 8888-8888', 'maria@email.com');

INSERT INTO ENTREGADOR (nome, cpf, telefone, placa_veiculo, tipo_veiculo) VALUES
('Pedro Oliveira', '12345678901', '(11) 7777-7777', 'ABC1234', 'Moto');

INSERT INTO PACOTE (numero_rastreamento, conteudo, destino, status_da_entrega, data_de_envio, data_prevista_de_entrega, id_entregador, id_remetente, id_destinatario) VALUES
('BR123456789', 'Livros', 'São Paulo', 'PENDENTE', '2024-03-20', '2024-03-25', 1, 1, 1); 