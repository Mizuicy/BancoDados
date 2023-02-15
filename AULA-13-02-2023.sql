SELECT * FROM categorias;

CREATE PROCEDURE [BUSCA_CATEGORIA]
@nome_categoria VARCHAR(20)
AS
SET @nome_categoria = '%' + @nome_categoria + '%'

SELECT * FROM categorias
WHERE nome LIKe @nome_categoria;

EXEC [BUSCA_CATEGORIA] 'TI'


CREATE PROCEDURE [BUSCA_CONTAGEM_PRODUTOS]
	@nome_categoria VARCHAR(20)

	AS
	SET @nome_categoria = '%' + @nome_categoria + '%'

	SELECT 
	COUNT(p.id) AS contagem_produtos

	FROM produtos AS p
	JOIN categorias AS c
	ON p.id_categoria = c.id
	WHERE C.NOME LIKE @nome_categoria
	GROUP BY c.nome;

	
