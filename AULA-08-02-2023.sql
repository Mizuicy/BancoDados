CREATE VIEW view_soma_salarial AS (

SELECT 
	d.departamento,
	MAX(f.salario) AS max_salario,
	SUM(f.salario) AS soma_salario,
	COUNT(f.id) AS contagem
	FROM
	funcionario AS f
	INNER JOIN departamento AS d
	ON d.id = f.departamento_id
	GROUP BY d.departamento
	HAVING SUM(f.salario) > 13000
);

SELECT * FROM view_soma_salarial;

CREATE VIEW view_homem_mulher_media_salarial AS (

SELECT
	d.departamento,
	f.sexo,
	AVG(f.salario) AS media_salario
	FROM funcionario AS f
	INNER JOIN departamento AS d
	ON f.departamento_id = d.id 
	WHERE (f.sexo = 'M'AND MONTH(f.data_nascimento) = '5') OR (f.sexo = 'F' AND MONTH(f.data_nascimento) = '7')
	GROUP BY d.departamento, f.sexo
);

DROP VIEW view_homem_mulher_media_salarial;

SELECT * FROM view_homem_mulher_media_salarial;


WITH base_table AS(
SELECT 
	id_categoria,
	SUM(pre�o) AS soma_pre�o,
	AVG(pre�o) AS media_pre�o,
	MIN(pre�o) AS min_pre�o,
	MAX(pre�o) AS max_pre�o
FROM produtos
GROUP BY id_categoria)
SELECT

 bt.id_categoria,
 p.descri��o,
 p.pre�o

FROM base_table AS bt
INNER JOIN produtos p
ON bt.id_categoria = p.id_categoria
AND (bt.min_pre�o = p.pre�o OR bt.max_pre�o = p.pre�o);
