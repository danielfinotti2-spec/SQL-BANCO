-- ------------------------------------------------ --
-- Base de dados experimental para experimentar SQL --
-- ------------------------------------------------ --

-- Em desenvolivmento, apaga a as tabelas se existirem
-- ⚠ Não use isso em produção

DROP TABLE IF EXISTS content;
DROP TABLE IF EXISTS person;

-- Cria a tabela "person"

CREATE TABLE person (
	per_id INTEGER PRIMARY KEY,
	per_name TEXT NOT NULL,
	per_email TEXT NOT NULL UNIQUE,
	per_birth TEXT,
	per_photo TEXT,
	per_password TEXT NOT NULL,
	
	-- Reservado para uso futuro
	per_metadata TEXT
);

-- Cria a tabela "content"

CREATE TABLE content (
	cnt_id INTEGER PRIMARY KEY,
	cnt_created_at TEXT NOT NULL,
	cnt_title TEXT NOT NULL,
	cnt_text TEXT,

	-- Chave estrangeira com o dono do conteúdo
	cnt_person_id INTEGER,
	
	-- Reservado para uso futuro
	cnt_metadata TEXT,
	
	-- Especifica se o registro está diponível
	cnt_status INTEGER DEFAULT 1,
	
	-- Define o campo "cnt_person_id" como chave estrangeira para "person"
	FOREIGN KEY (cnt_person_id) REFERENCES person (per_id)
);

-- Insere um "fake" na tabela "person" para alguns testes

INSERT INTO person (
	per_name,
	per_email,
	per_birth,
	per_photo,
	per_password
) VALUES (
	"Joca da Silva",
	"jocasilva@gmail.com",
	"2000-10-18",
	"https://randomuser.me/api/portraits/lego/1.jpg",
	"Senha@123"
);

-- Lista os "person" cadastrados

SELECT * FROM person;

-- Insere váriso "fake" na tabela "person" para alguns testes

INSERT INTO person (
	per_name,
	per_email,
	per_birth,
	per_photo,
	per_password
) VALUES 
(
	"Marineuza Siriliano",
	"mrisiri@gmail.com",
	"2008-10-14",
	"https://randomuser.me/api/portraits/women/28.jpg",
	"Senha@123"
),(
	"Setembrino Trocatapas",
	"setetapas@gmail.com",
	"1984-08-21",
	"https://randomuser.me/api/portraits/lego/6.jpg",
	"Senha@123"
),(
	"Jocasta Severina",
	"jocasevera@gmail.com",
	"1988-02-07",
	"https://randomuser.me/api/portraits/women/3.jpg",
	"Senha@123"
),(
	"Merinelson Satíssimo",
	"merisanto@gmail.com",
	"2002-05-06",
	"https://randomuser.me/api/portraits/men/7.jpg",
	"Senha@123"
);

-- Insere alguns "content"

INSERT INTO content (
	cnt_created_at,
	cnt_title,
	cnt_text,
	cnt_person_id
) VALUES (
	"2026-09-07",
	"Como plantar bananeira",
	"Quisque a metus id enim dapibus fermentum.",
	"1"
), (
	"2026-09-08",
	"Como plantar melão",
	"Quisque a metus id enim dapibus fermentum.",
	"3"
), (
	"2026-09-09",
	"Melhor época para plantar abacate",
	"Quisque a metus id enim dapibus fermentum.",
	"4"
), (
	"2026-09-10",
	"Por que minha roseira não floresce",
	"Quisque a metus id enim dapibus fermentum.",
	"1"
);	

-- Lista os "content"

SELECT * FROM content;

-- Lista somente os campos determinados

SELECT per_email, per_name FROM person;

SELECT per_id, per_name, per_email FROM person ORDER BY per_name, per_email ASC;

-- Limita os registro retornados

SELECT per_id, per_name, per_email FROM person ORDER BY per_name, per_email ASC LIMIT 4, 2; 

-- Filtros

SELECT * FROM content WHERE cnt_person_id != "1" ORDER BY cnt_created_at DESC;

SELECT * FROM content WHERE cnt_person_id = "1" OR cnt_created_at = "2026-09-20";

SELECT * FROM content WHERE cnt_person_id = "1";


-- Usando LIKE para pesquisas

SELECT * FROM person;
SELECT * FROM person WHERE per_name LIKE "%si%";

-- Lista os content

SELECT * FROM content;

-- Usando INNER JOIN

SELECT * FROM content
INNER JOIN person ON cnt_person_id = per_id
WHERE cnt_person_id = "1";

SELECT * FROM content
INNER JOIN person ON cnt_person_id = per_id;

-- Atualizar a data de nascimento do "Joca da Silva"

SELECT * FROM ----   person;

UPDATE person SET per_birth = "2000-10-27", per_password = "senha@ABC", per_email = "jocasilva@gmail.com" WHERE per_id = "1";

-- Apaga registros

SELECT * FROM content WHERE cnt_status = "0";
-- DELETE FROM content WHERE cnt_id = "2";


-- Apaga registro sem apagar
UPDATE content SET cnt_status = 0 WHERE cnt_id = "2";


DELETE FROM content WHERE cnt_person_id = "1";
DELETE FROM person WHERE per_id = "1";

SELECT * FROM content;
SELECT * FROM person;

DELETE FROM person WHERE per_email = "merisanto@gmail.com";
