# CONSULTAS EM MÚLTIPLAS TABELAS
# trata-se da consulta que une dados de várias tabelas

# Fazendo uma consulta que retorne os seguintes dados: código do produto, descrição do produto, preço do produto e descrição do tipo de produto
USE secao05;

SELECT*FROM tipos_produtos;		-- selecionando todos os campos da tabela 'tipos_produtos'
SELECT*FROM produtos;			-- selecionando todos os campos da tabela 'produtos'



# Consulta em multiplas tabelas para exibir os campos 'codigo', 'descricao' e 'preco' da tabela 'produtos' e 'descricao' da tabela 'tipos_produto'
SELECT p.codigo AS 'Codigo', p.descricao AS 'Descricao', p.preco AS 'Preco', tp.descricao AS 'Tipo Produto'		-- elegendo os campos de cada tabela para serem exibidos
	FROM produtos AS p, tipos_produtos AS tp			-- usando Alias para apelidar as tabelas
    WHERE p.codigo_tipo = tp.codigo;					-- filtro que determina a referencia entre as tabelas para retornar corretamente a informacao
  
  
  
# Exemplo de retorno incorreto de query, provocado pela falta da cláusula WHERE para filtro
SELECT p.codigo AS 'Codigo', p.descricao AS 'Descricao', p.preco AS 'Preco', tp.descricao AS 'Tipo Produto'		-- elegendo os campos de cada tabela para serem exibidos
	FROM produtos AS p, tipos_produtos AS tp			-- usando Alias para apelidar as tabelas
    
    /* 
		NOTE QUE A FUNÇÃO DO FILTRO É JUSTAMENTE VINCULAR O PRODUTO COM O CÓDIGO DO SEU TIPO.
    SEM ESSA CLÁUSULA, O MESMO PRODUTO APARECERÁ COM TODOS OS TIPOS DE PRODUTO.
    */