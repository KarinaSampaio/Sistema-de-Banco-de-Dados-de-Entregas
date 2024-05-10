CREATE DATABASE sistema_entregas;

USE sistema_entregas;

-- Criando tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Criando tabela de locais
CREATE TABLE locais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

-- Criando tabela de veículos
CREATE TABLE veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(255) NOT NULL,
    placa VARCHAR(255) UNIQUE NOT NULL,
    disponivel BOOLEAN NOT NULL DEFAULT TRUE
);

-- Criando tabela de entregas
CREATE TABLE entregas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_local INT,
    id_veiculo INT,
    data_entrega DATETIME,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_local) REFERENCES locais(id),
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id)
);

-- Tabela de status de entrega para melhorar a normalização e controle de estados
CREATE TABLE status_entrega (
    status_type VARCHAR(255) PRIMARY KEY,
    descricao TEXT
);

