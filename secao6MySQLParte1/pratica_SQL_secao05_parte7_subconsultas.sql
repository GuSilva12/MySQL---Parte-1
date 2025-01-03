# SUBCONSULTAS
-- Consultas dentro de consultas. Podem ser usadas para ajudar a filtrar a consulta principal
-- com base na(s) consulta(s) interna(s), são executada(s) as(s) consulta(s) externa(s)

# DDL - Data Definiton Language
-- Criando a base de dados 'subconsulta'
CREATE DATABASE subconsulta;
-- Selecionando a base de dados 'subconsulta' para realizar operações
USE subconsulta;

# Criando as tabelas do BD 'subconsulta'
-- Criando a tabela 'escritorios'
CREATE TABLE escritorios(
	id INT NOT NULL AUTO_INCREMENT,
    pais VARCHAR(30) NOT NULL,
	PRIMARY KEY(id)
    );
    
-- Criando a tabela 'funcionarios'
CREATE TABLE funcionarios(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL, 
    sobrenome VARCHAR(20) NOT NULL,
    id_escritorio INT NOT NULL,
	PRIMARY KEY(id),
    FOREIGN KEY(id_escritorio) REFERENCES escritorios(id)
    );
    
-- Criando a tabela 'pagamentos'
CREATE TABLE pagamentos(
	id INT NOT NULL AUTO_INCREMENT,
    id_funcionario INT NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    data DATE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_funcionario) references funcionarios(id)
    );
    
# DML - Data Manipulation Language
-- populando a tabela 'escritorios'
INSERT INTO escritorios (pais) VALUES ("Brasil");
INSERT INTO escritorios (pais) VALUES ("Estados Unidos");
INSERT INTO escritorios (pais) VALUES ("Alemanha");
INSERT INTO escritorios (pais) VALUES ("França");

-- populando a tabela 'funcionarios'
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ("Pedro", "Souza", 1);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ("Sandra", "Rubin", 2);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ("Mikail", "Schumer", 3);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ("Oliver", "Gloçan", 4);

-- populando a tabela 'pagamentos'
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (1, "5347.55", "2019-03-17");
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (2, "9458.46", "2019-03-17");
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (3, "4669.57", "2019-03-17");
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (4, "2770.32", "2019-03-17");


# EXEMPLO 1 - subconsulta 
SELECT nome, sobrenome FROM funcionarios WHERE id_escritorio IN (SELECT id FROM escritorios WHERE pais = 'Brasil');

-- sem subconsulta
SELECT nome, sobrenome FROM funcionarios, escritorios AS e WHERE id_escritorio = e.id AND e.pais = "Brasil";

# EXEMPLO 2 - subconsulta
SELECT f.nome, f.sobrenome, e.pais, p.salario
	FROM funcionarios AS f, escritorios AS e, pagamentos AS p
    WHERE f.id_escritorio = e.id
    AND f.id = id_funcionario
    AND salario = (SELECT MAX(salario) FROM pagamentos);
    
# EXEMPLO 3 - subconsulta
SELECT f.nome, f.sobrenome, e.pais, p.salario
	FROM funcionarios AS f, escritorios AS e, pagamentos AS p
    WHERE f.id_escritorio = e.id
    AND f.id = p.id_funcionario
    AND salario < (SELECT AVG(salario) FROM pagamentos);