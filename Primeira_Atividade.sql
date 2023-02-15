CREATE DATABASE [VendaCursos];

USE [VendaCursos];

CREATE TABLE [CURSOS](
 [ID] [CHAR](5) NOT NULL,
 [NOME] [VARCHAR](100) NOT NULL,
 [MENSALIDADE] [VARCHAR](100) NOT NULL,
 CONSTRAINT [ID] PRIMARY KEY ([ID])
);

DROP TABLE [CURSOS]

CREATE TABLE [ALUNOS](
[NOME] [VARCHAR](100) NOT NULL,
[CPF] [CHAR](11) NOT NULL,
[DATANASCIMENTO] [DATE],
[CIDADE] [VARCHAR](30),
[RUA] [VARCHAR](30),
[ENDERECOCOMPLEMENTO] [VARCHAR](20),
CONSTRAINT [CPF] PRIMARY KEY ([CPF])
);

DROP TABLE [ALUNOS];

CREATE TABLE [MODULOS](
[CPFALUNO] [CHAR](11) NOT NULL,
[IDCURSO] [VARCHAR](30) NOT NULL,
[EMAIL] [VARCHAR](50) NOT NULL,
CONSTRAINT [CPFALUNO] PRIMARY KEY ([CPFALUNO])
);

DROP TABLE [MODULOS];

INSERT INTO [ALUNOS]
VALUES
('Guilherme Morais sousa', '12321348321','1997-12-09', 'Fortaleza', 'Rua Jacey Estate Suite', 'CASA'),
('Miguel Davi sousa', '52339431581','1997-11-18', 'Delaware', 'Rua Rynaldo Borgianni','CASA'),
('Arthur Silva', '27687025369','2005-10-04', 'Maryland', '47903 Luis Fall Apt. 863', 'APARTAMENTO'),
('Jennifer Alvarez', '50531173305','2007-12-20','Delaware', '9428 Benton Underpass Apt. 857',  'CASA'),
('Miguel Miller', '52958068471','1997-10-21', 'Maryland', '119 Ava Plain Apt. 639', 'CASA'),
('Patrick Reed', '04938355809','2011-01-25', 'North Carolina', '73395 Rogahn Center Suite 659', 'APARTAMENTO'),
('Michael Day', '66379692657','2001-06-26', 'Rhode Island', '259 Dakota Walk Apt. 113', 'APARTAMENTO'),
('Dana Ortiz', '98238781370','2001-08-19', 'New York', '767 Jacques Corners Suite 432',  'CASA'),
('Edward Ryan', '25995341430','2005-09-07', 'Maryland', '88328 Upton Mission Apt. 019', 'APARTAMENTO'),
('Steven Lyons', '37576102535','1993-10-19', 'Massachusetts', '099 Parisian Lights Suite 524',  'CASA'),
('Robert King', '57343711903','2011-10-26', 'Montana', '142 MacGyver Passage Suite 458',  'CASA'),
('Jill Johnson', '59266395145','2007-06-16', 'New Hampshire', '46225 Upton Street Suite 928',  'APARTAMENTO'),
('Walter Adkins', '36008306198','1999-10-11', 'Massachusetts', '3646 Nicolas Light Suite 504', 'CASA'),
('Debra Mendoza', '31779841310','1995-07-27', 'Iowa', '7590 Tromp Pines Suite 452',  'CASA'),
('Adam Yu', '64811666836','2007-05-30', 'Virginia', '96812 Abigayle Loaf Suite 319', 'APARTAMENTO'),
('Sabrina Golden', '64359010230','2004-06-19', 'Iowa', '69803 Tatum Wall Suite 414', 'APARTAMENTO'),
('Leslie Taylor', '71105007723','1998-08-31', 'Oklahoma', '94919 Hermann Lodge Suite 448', 'APARTAMENTO');


INSERT INTO[CURSOS]
VALUES
('01', 'JAVA', '1441.00'),
('02', 'ANGULA', '679.00'),
('03', 'HTML E CSS', '50.00'),
('04', 'FRAMEWORK', '250.00'),
('05', 'MANUTEÇÃO', '500.00');

SELECT * FROM [CURSOS];

SELECT * FROM [ALUNOS]
ORDER BY [NOME] ASC;

SELECT * FROM [ALUNOS]
WHERE [CPF] LIKE '%4%' AND cpf LIKE '%5%' AND cpf LIKE '%6%';
