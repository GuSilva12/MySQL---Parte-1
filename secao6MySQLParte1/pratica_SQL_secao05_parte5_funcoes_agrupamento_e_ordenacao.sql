# FUNÇÕES DE AGRUPAMENTO E ORDENAÇÃO

# DDL - Data Definition Language
CREATE DATABASE agrupamento;				-- criando a base de dados 'agrupamento'
USE agrupamento;							-- selecionando a base de dados 'agrupamento' para realizar operações

CREATE TABLE tipos(							-- criando a tabela 'tipos'
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
    );
    
CREATE TABLE fabricantes(					-- criando a tabela 'fabricantes'
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) not null,
    PRIMARY KEY(id)
    );
    
CREATE TABLE produtos(						-- criando a tabela 'produtos'
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    id_fabricante INT NOT NULL,
    quantidade INT NOT NULL,
    id_tipo INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_fabricante) REFERENCES fabricantes(id),
    FOREIGN KEY(id_tipo) REFERENCES tipos(id)
    );

    
# DML - Data Manipulaiton Language
-- populando a tabela 'tipos'
INSERT INTO tipos (nome) VALUES ("Console");
INSERT INTO tipos (nome) VALUES ("Notebook");
INSERT INTO tipos (nome) VALUES ("Celular");
INSERT INTO tipos (nome) VALUES ("Smartphone");
INSERT INTO tipos (nome) VALUES ("Sofá");
INSERT INTO tipos (nome) VALUES ("Armário");
INSERT INTO tipos (nome) VALUES ("Refrigerador");

-- populando a tabela 'fabricantes'
INSERT INTO fabricantes (nome) VALUES ("Sony");
INSERT INTO fabricantes (nome) VALUES ("Dell");
INSERT INTO fabricantes (nome) VALUES ("Microsoft");
INSERT INTO fabricantes (nome) VALUES ("Samsung");
INSERT INTO fabricantes (nome) VALUES ("Apple");
INSERT INTO fabricantes (nome) VALUES ("Beline");
INSERT INTO fabricantes (nome) VALUES ("Magno");
INSERT INTO fabricantes (nome) VALUES ("CCE");
INSERT INTO fabricantes (nome) VALUES ("Nintendo");

-- populando a tabela 'produtos'
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("Playstatiom 3", 1, 100, 1);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("Core 2 Duo 4GB RAM 500GB HD", 2, 200, 2);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("Xbox 360 120GB", 3, 350, 1);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("GT-I6220 Quad band", 4, 300, 3);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("iPhone 4 32GB", 5, 50, 4);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("Playstation 2", 1, 100, 1);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("Sofá Estofado", 6, 200, 5);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("Armário de Serviço", 7, 50, 6);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("Refrigerador 420L", 8, 200, 7);
INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ("Wii 120GB", 8, 250, 1); 

--  GROUP BY
SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS 'Quantidade em Estoque'		-- selecionando os elementos que vão compor a tabela final, nomeando esta como "Quantidade em Estoque"
	FROM tipos AS t, fabricantes AS f, produtos AS p											-- determinando as tabelas-origem dos elementos selecionados e inserindo um Alias para cada uma
		WHERE t.id = p.id_tipo AND f.id = p.id_fabricante										-- filtrando os elementos selecionados com base no relacionamento que possuem por meio das id's de produto, tipo e fabricante
        GROUP BY t.nome, f.nome;																-- agrupando os elementos elegidos com base no nome do tipo e nome do fabricante


-- HAVING 
SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS 'Quantidade em Estoque'		-- selecionando os elementos que vão compor a tabela final, nomeando esta como "Quantidade em Estoque"
	FROM tipos AS t, fabricantes AS f, produtos AS p											-- determinando as tabelas-origem dos elementos selecionados e inserindo um Alias para cada uma
		WHERE 	t.id = p.id_tipo AND f.id = p.id_fabricante										-- filtrando os elementos selecionados com base no relacionamento que possuem por meio das id's de produto, tipo e fabricante
        GROUP BY t.nome, f.nome 																-- agrupando os elementos elegidos com base no tipo e no fabricante
        HAVING SUM(p.quantidade) > 200;															-- são elegidos para compor a tabela os elementos cuja soma 
        
        
-- SELECT (padrão)
SELECT*FROM produtos;	-- selecionando todos os elementos que compõem a tabela 'produtos'

-- ORDER BY ASC
SELECT id, nome, id_tipo, id_fabricante, quantidade FROM produtos ORDER BY id ASC;	-- selecionando todos os elementos que compõem a tabela 'produtos', ordenando de forma ascendente com base na id do elemento na tabela 'produtos'
SELECT id, nome, id_tipo, id_fabricante, quantidade FROM produtos ORDER BY id_fabricante ASC;	-- selecionando todos os elementos que compõem a tabela 'produtos', ordenando de forma ascendente com base na id do fabricante
SELECT id, nome, id_tipo, id_fabricante, quantidade FROM produtos ORDER BY quantidade ASC;	-- selecionando todos os elementos que compõem a tabela 'produtos', ordenando de forma ascendente com base na quantidade

-- ORDER BY desc
SELECT id, nome, id_tipo, id_fabricante, quantidade FROM produtos ORDER by quantidade DESC;
SELECT id, nome, id_tipo, id_fabricante, quantidade FROM produtos ORDER BY id_fabricante DESC;	-- selecionando todos os elementos que compõem a tabela 'produtos', ordenando de forma descendente com base na id do fabricante
SELECT id, nome, id_tipo, id_fabricante, quantidade FROM produtos ORDER BY quantidade DESC;	-- selecionando todos os elementos que compõem a tabela 'produtos', ordenando de forma descendente com base na quantidade