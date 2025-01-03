# FUNÇÕES DE AGREGAÇÃO
-- Processa um conjunto de valores contidos em uma unica coluna de uma tabela e retorna um único valor como resultado

# DDL - Data Definition Language
-- Criando a base de dados "agrgacao"
CREATE DATABASE agregacao;

-- Selecionando a base de dados 'operacao' para realizar operações
USE agregacao;

-- Criando a tabela 'categorias'
CREATE TABLE categorias(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
    );
    
-- Criando a tabela 'produtos'
CREATE TABLE produtos(
id INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(60) NOT NULL,
preco_venda DECIMAL(8,2) NOT NULL,
preco_custo DECIMAL(8,2) NOT NULL,
id_categoria INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

# DML - Data Manipulation Language
-- Populando a tabela 'categorias'
INSERT INTO categorias (nome) VALUES ("Materal Escolar");
INSERT INTO categorias (nome) VALUES ("Acessório Informática");
INSERT INTO categorias (nome) VALUES ("MAterial Escritório");
INSERT INTO categorias (nome) VALUES ("Game");

-- Populando a tabela 'produtos'
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ("Caderno", "5.45", "2.30", 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ("Caneta", "1.20", "0.45", 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ("Pendrive 32GB", "120.54", "32.55", 2);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ("Mouse", "17.00", "4.30", 2);

# DQL - Data Query Language
# Usando as funções de agregação
-- max
SELECT MAX(preco_venda) FROM produtos;		-- retorna o maior valor da tabela solicitada, nesse caso, o maior preço de venda da tabela 'produtos'
SELECT MAX(preco_custo) FROM produtos;		-- retorna o maior valor da tabela solicitada, nesse caso, o maior preço de custo da tabela 'produtos'

-- min
SELECT MIN(preco_venda) FROM produtos;		-- retorna o menor valor da tabela solicitada, nesse caso, o menor preço de venda da tabela 'produtos'
SELECT MIN(preco_custo) FROM produtos;		-- retorna o menor valor da tabela solicitada, nesse caso, o menor preço de custo da tabela 'produtos'

-- avg
SELECT AVG(preco_venda) FROM produtos;		-- retorna a média de valor da tabela solicitada, nesse caso, a média dos preços de venda da tabela 'produtos'
SELECT AVG(preco_custo) FROM produtos;		-- retorna a média de valor da tabela solicitada, nesse caso, a média dos preços de custo da tabela 'produtos'

-- round
SELECT ROUND(AVG(preco_venda), 2) FROM produtos;	-- retorna a média arredondada (round) de forma a formatar o valor para uma quantidade determinada de casas decimais
SELECT ROUND(AVG(preco_custo), 2) FROM produtos;	-- retorna a média arredondada (round) de forma a formatar o valor para uma quantidade determinada de casas decimais

-- count
SELECT COUNT(preco_venda) AS Quantidade FROM produtos WHERE id_categoria = 1;	-- retorna a quantidade de valores cadastrados, nesse caso, a quantidade de quantos produtos estão cadastrados na categoria 1
SELECT COUNT(preco_venda) AS Quantidade FROM produtos WHERE id_categoria = 2;	-- retorna a quantidade de valores cadastrados, nesse caso, a quantidade de quantos produtos estão cadastrados na categoria 2

-- group by
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria;		-- agrupa os elementos com base em um parâmetro, nesse caso, agrupa os preços máximos de venda por categoria

-- having
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria HAVING MAX(preco_venda) > 10;		-- agrupa os elementos usando um parâmetro, e outro como condição para integrar o agrupamento, nesse caso, serão agrupados todos os produtos cujos precos de venda sejam maior que 10