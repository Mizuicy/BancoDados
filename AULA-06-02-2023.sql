

CREATE TABLE categorias(
	id INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(30),
	ativa CHAR(3),
	PRIMARY KEY (id)
);

insert into categorias (nome, ativa) Values
	('Informatica','[v]'),
	('Telefonia','[v]'),
	('Games','[v]'),
	('TV, Audio e Video','[v]'),
	('Impress�o e imagem','[v]');

SELECT * FROM categorias;


CREATE TABLE produtos(
	id INT NOT NULL IDENTITY(1,1),
	id_categoria INT,
	descri��o VARCHAR(50),
	pre�o INT,
	url_imagem VARCHAR(100),
);

insert into produtos (id_categoria, descri��o, pre�o) values
(1,'SSD 128GB', 300),
(1,'SSD 256GB', 500),
(1,'KIT TECLADO E MOUSE', 600),
(3,'PLAYSTATION 3', 1500),
(2,'SAMSUNG A51', 2500),
(4,'TELEVIS�O LG 55"', 3000),
(3,'PLAYSTATION 3 1TB', 1500),
(2,'SAMSUNG S9', 2500),
(2,'IPHONE 8', 2500),
(2,'IPHONE 9', 3000),
(2,'IPHONE X', 4000),
(4,'TELEVIS�O SAMSUNG 32"', 1000),
(4,'TELEVIS�O SAMSUNG 48"', 3000),
(3,'PLAYSTATION 4 1TB', 2800),
(3,'PLAYSTATION 5 1TB', 5000),
(1,'Teclado Razer Gamer', 250),
(1,'Fone de ouvido Hyperx',170),
(1,'Mouse Gamer Razer', 90),
(1,'Mouse Gamer Razer 2400', 200)

insert into produtos (descri��o, pre�o) values
('Mouse Gamer', 280),
('Teclado Gamer', 390);

SELECT * FROM produtos;

--TRAZER APENAS PRODUTOS QUE TENHA CATEGORIA: INNER JOIN

SELECT * FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TODOS OS PRODUTOS MESMO OS QUE N�O TEM CATEGORIA E AINDA  ASSIM TRAZER A LISTAGEN DE CATEGORIAS: LEFT JOIN

SELECT * FROM produtos p
LEFT JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TUDO DA TABELA DIREITA INCLUSIVE AS CATEGORIA QUE N�O TEM PRODUTOS:RIGHT JOIN

SELECT * FROM produtos p
RIGHT JOIN categorias c
ON p.id_categoria = c.id;


--TRAZER TUDO DE TODOS:FULL JOIN

SELECT * FROM produtos p
FULL JOIN categorias c
ON p.id_categoria = c.id;

--MAIOR PRE�O POR CATEGORIA, TRAZENDO QUAL CATEGORIA O PRODUTOS �, APENAS PRODUTOS CATEGORIZADOS

SELECT c.nome, MAX(p.pre�o) AS max_pre�o 
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id
GROUP BY c.nome;

--MENOR E MAIOR PRE�O DO PRODUTOS DA CATEGORIA GAME E TELEFONIA

SELECT c.nome, MAX(p.pre�o) AS max_pre�o ,MIN(p.pre�o) AS menor_pre�o
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id
WHERE c.nome = 'Games' OR c.nome = 'Telefonia'
GROUP BY c.nome;

--QUANTO CUSTA O MAIOR PRODUTO N�O CATALOGADO

SELECT MAX(pre�o) AS Maior FROM produtos p
LEFT JOIN categorias c
ON p.id_categoria = c.id
WHERE c.nome IS NULL;


--MEDIA DE PRE�O DE TODOS OS PRODUTOS POR CATEGORIA

SELECT c.nome, AVG(p.pre�o) AS PRE�O_MEDIO
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id
GROUP BY c.nome;

WITH aux_table AS (SELECT YEAR(data_nascimento) AS ano,
	CASE 
		WHEN YEAR(data_nascimento) >= 1993 THEN 'True'
		ELSE 'False'
	END AS 'is_millenium',
	id
FROM funcionario)

SELECT is_millenium, COUNT(id) AS contagem
FROM aux_table
GROUP BY is_millenium;


CREATE VIEW view_mediasalario_sexo AS(
	SELECT sexo, AVG(salario) AS media_salario
	FROM funcionario
	WHERE YEAR(data_nascimento) >= '1990'
	GROUP BY sexo
);

SELECT * FROM view_mediasalario_sexo;

--crie uma view que traga o nome do departamento, sexo dos funcionarios
--e a contagem dos funcionarios
--Contudo, apneas os departamentos que tenham a letra 'd' e seus respectivos funcionarios
--sejam mulheres que usam gmail e homens que usam hotmail
--