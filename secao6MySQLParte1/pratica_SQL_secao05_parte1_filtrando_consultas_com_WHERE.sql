# FILTRANDO CONSULTAS COM WHERE
CREATE DATABASE secao05;

USE secao05;

-- DDL - Data Definition Language
CREATE TABLE  tipos_produtos(
codigo INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(30) NOT NULL,
PRIMARY KEY(codigo)
);

CREATE TABLE produtos(
codigo INT NOT NULL AUTO_INCREMENT,
decricao VARCHAR(30) NOT NULL,
preco DECIMAL(8,2) NOT NULL,
codigo_tipo INT NOT NULL,
PRIMARY KEY (codigo),
FOREIGN KEY (codigo_tipo) REFERENCES tipos_produtos(codigo)
);

-- DML - Data Manipulation Language
INSERT INTO tipos_produtos (descricao) VALUES ('Computador');
INSERT INTO tipos_produtos (descricao) VALUES ('Impressora');

INSERT INTO produtos (decricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (decricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (decricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', '300', 2);
INSERT INTO produtos (decricao, preco, codigo_tipo) VALUES ('Impr. Laser', "500", 2);

-- DQL - Data Query Language
-- select
SELECT*FROM tipos_produtos;

SELECT codigo, descricao FROM tipos_produto;

SELECT*FROM produtos;

SELECT codigo, descricao, codigo_tipo FROM pordutos;

-- filtrando consultas com where
SELECT*FROM produtos WHERE codigo_tipo = 2;		-- seleciona todos os produtos com codigo de tipo = 2 (Impressora)
SELECT*FROM produtos WHERE codigo_tipo = 2 AND preco > 300 ;		-- seleciona todos os produtos com codigo de tipo = 2 (Impressora) e preco maior que 300

-- Erro Select
SELECT cod, desc, pre, ctp, FROM produtos;

-- Alias 
SELECT p.codigo AS cod, p.descricao AS desc, p.preco AS pre, p.codigo as ctp FROM produtos AS p;