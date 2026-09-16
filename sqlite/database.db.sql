BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS content (
	cnt_id INTEGER PRIMARY KEY,
	cnt_created_at TEXT NOT NULL,
	cnt_title TEXT NOT NULL,
	cnt_text TEXT,

	-- Chave estrangeira com o dono do conteúdo
	cnt_person_id INTEGER,
	
	-- Reservado para uso futuro
	cnt_metadata TEXT,
	
	-- Define o campo "cnt_person_id" como chave estrangeira para "person"
	FOREIGN KEY (cnt_person_id) REFERENCES person (per_id)
);
CREATE TABLE IF NOT EXISTS person (
	per_id INTEGER PRIMARY KEY,
	per_name TEXT NOT NULL,
	per_email TEXT NOT NULL,
	per_birth TEXT,
	per_photo TEXT,
	per_password TEXT NOT NULL,
	
	-- Reservado para uso futuro
	per_metadata TEXT
);
INSERT INTO "content" ("cnt_id","cnt_created_at","cnt_title","cnt_text","cnt_person_id","cnt_metadata") VALUES (1,'2026-09-07','Como plantar bananeira','Quisque a metus id enim dapibus fermentum.',1,NULL),
 (2,'2026-09-08','Como plantar melão','Quisque a metus id enim dapibus fermentum.',3,NULL),
 (3,'2026-09-09','Melhor época para plantar abacate','Quisque a metus id enim dapibus fermentum.',4,NULL),
 (4,'2026-09-10','Por que minha roseira não floresce','Quisque a metus id enim dapibus fermentum.',1,NULL);
INSERT INTO "person" ("per_id","per_name","per_email","per_birth","per_photo","per_password","per_metadata") VALUES (1,'Joca da Silva','jocasilva@gmail.com','2000-10-18','https://randomuser.me/api/portraits/lego/1.jpg','Senha@123',NULL),
 (2,'Marineuza Siriliano','mrisiri@gmail.com','2008-10-14','https://randomuser.me/api/portraits/women/28.jpg','Senha@123',NULL),
 (3,'Setembrino Trocatapas','setetapas@gmail.com','1984-08-21','https://randomuser.me/api/portraits/lego/6.jpg','Senha@123',NULL),
 (4,'Jocasta Severina','jocasevera@gmail.com','1988-02-07','https://randomuser.me/api/portraits/women/3.jpg','Senha@123',NULL),
 (5,'Merinelson Satíssimo','merisanto@gmail.com','2002-05-06','https://randomuser.me/api/portraits/men/7.jpg','Senha@123',NULL);
COMMIT;
