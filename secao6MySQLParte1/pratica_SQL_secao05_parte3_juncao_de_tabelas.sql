# JUNÇÃO DE TABELAS

# DDL - Data Definition Language - Criando a base de dados
CREATE DATABASE juncao;		-- Cria uma base de dados denominada 'juncao'

USE juncao;		-- Seleciona a base de dados 'juncao'

# DDL - Data Definition Language - Criando as tabelas da base de dados 'juncao'
CREATE TABLE profissoes(
	id INT NOT NULL AUTO_INCREMENT,
    cargo VARCHAR(60) NOT NULL,
    PRIMARY KEY(id)
    );

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(10) NOT NULL,
    id_profissao INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_profissao) REFERENCES profissoes (id)
    );
    
CREATE TABLE consumidor(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL
    );

    
# DML - Data Manipulation Language
-- Populando as tabelas criadas (profissoes, clientes e consumidor)

-- Populando a tabela 'profissoes'
INSERT INTO profissoes (cargo) VALUES ('Programador');
INSERT INTO profissoes (cargo) VALUES ('Analista de Sistemas');
INSERT INTO profissoes (cargo) VALUES ('Suporte');
INSERT INTO profissoes (cargo) VALUES ('Gerente');

-- Populando a tabela 'clientes'
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) values ("João Pereira", '1981-06-15', '1234-5678', 1);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) values ('Ricardo da Silva', '1973-10-10', '2234-5669', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) values ('Felipe Oliveira', '1987-08-01', '4234-5640', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) values ('Mário Pirez', '1991-02-05', '5234-5621', 1);

-- Populando a tabela 'consumidor'
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ("Alfredo Nunes", "Maria Nunes", "Rua da paz, 47", 'São Paulo', '123.456.87', "Brasil");
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ("Ana Trujillo", "Guilherme Souza", "Rua Dourada, 452", "Goiânia", '232.984-23', "Brasil");
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ("Leandro Veloz", "Pedro Siqueira", "Rua Vazia, 72", "São Paulo", "936.738-23", "Brasil");

# DQL - Data Query Language
SELECT*FROM profissoes;			-- Selecionando todos os itens da tabela 'profissoes'
SELECT*FROM clientes;			-- Selecionando todos os itens da tabela 'clientes'
SELECT*FROM consumidor;			-- Selecionando todos os itens da tabela 'consumidor

# FAZENDO A JUNÇÃO DE TABELAS
-- junção de plano cartesiano - reorna uma abela constituída por todos os elementos da primeira tabela combinados com todos os elementos da segunda
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo AS "Profissao"
	FROM clientes AS c, profissoes AS p
    WHERE c.id_profissao = p.id;

-- inner join - retorna apenas os dados que atendem às condições de junção
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c INNER JOIN profissoes AS p
	ON c.id_profissao = p.id;
    
-- left outer join - traz todos os dados da tabela à esquerda e compara com os da tabela à direita. Os campos da tabela à esquerda que não possuirem dados será preenchidos com NULL
SELECT*FROM clientes
	LEFT OUTER JOIN profissoes
    ON clientes.id_profissao = profissoes.id;
    
-- right outer join - traz todos os dados da tabela à direita e compara com os da tabela à esquerda. Os campos da tabela à direita que não possuirem dados será preenchidos com NULL
SELECT*FROM clientes
	RIGHT OUTER JOIN profissoes
    ON clientes.id_profissao = profissoes.id;
    
-- full outer join (versão MySQL) - retorna todos os dados de ambas as tabelas, mesmo que nem todos os dados possuam correspondência (estes são preenchidos com NULL)
SELECT*FROM clientes
	LEFT OUTER JOIN profissoes
    ON clientes.id_profissao = profissoes.id
    UNION
    SELECT * FROM clientes
    RIGHT OUTER JOIN profissoes
    ON clientes.id_profissao = profissoes.id;
    
-- cross join - junção por cruzamento. Para cada linha de uma tabela, obtem-setodos os dados da outra tabela
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c
    CROSS JOIN profissoes AS p;
    
-- self join - auto-junção de uma tabela à si mesma
SELECT a.nome AS Consumidor1, b.nome AS Consumidor2, a.cidade
	FROM consumidor AS a
    INNER JOIN consumidor AS b
    ON a.id <>b.id
    AND a.cidade = b.cidade
    ORDER BY a.cidade;
