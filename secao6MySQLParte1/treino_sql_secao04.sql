FLUSH PRIVILEGES;
USE secao04;

CREATE TABLE tipos_produto(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR (45)
    );

CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(45),
    preco DECIMAL(8,2),
    id_tipo_produto INT,
    FOREIGN KEY (id_tipo_produto) REFERENCES tipos_produto(id)
    );
    
INSERT INTO tipos_produto VALUES (0,"Computadores"),
(0, "Impressoras"),
(0, 'Apple');

INSERT INTO produtos VALUES (0, "Desktop", '12000', 1),
(0, "Laptop", '1800', 1),
(0, "Impr. Jato de tinta", '300', 2),
(0, "Impr. Laser", "500", 2),
(0, "Notebook", "1200", 1),
(0, "Macbook Pro", "7200", 1),
(0, "MAcbook Air", "5200", 1); 



SELECT*FROM tipos_produto;
SELECT*FROM produtos;