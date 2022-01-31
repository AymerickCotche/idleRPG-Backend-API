INSERT INTO "attribute" ("name", "desc") VALUES
    ('endurance', 'Influe sur la vie'),
    ('force', 'Influe sur les dégats physiques'),
    ('dextérité', 'Influe sur la vitesse d''attaque'),
    ('intelligence', 'Influe sur les dégats magiques'),
    ('degat_min', 'Dégat minimum qu''infligera l''arme'),
    ('degat_max', 'Dégat maximum q''infligera une arme'),
    ('niveau', 'Niveau nécessaire pour intéragir avec l''objet'),
    ('points', 'Points de caractéristique disponible'),
    ('prix', 'Prix de l''objet'),
    ('soins', 'Quantité de vie rendue');

INSERT INTO "equipment_slot" ("name") VALUES
    ('casque'),
    ('armure'),
    ('bottes'),
    ('arme');

INSERT INTO "reward" ("name", "desc") VALUES
    ('reward mineur fer', 'NC'),
    ('reward mineur bronze', 'NC'),
    ('reward mineur or', 'NC'),
    ('reward mineur cobalte', 'NC'),
    ('reward pecheur grenouille', 'NC'),
    ('reward pecheur calamar', 'NC'),
    ('reward pecheur carpe dorée', 'NC'),
    ('reward mineur saumon', 'NC'),
    ('reward combat objet', 'NC'),
    ('reward combat exp', 'NC'),
    ('reward combat gold', 'NC');

INSERT INTO "level" ("name") VALUES
    ('niveau des personnages'),
    ('niveau des métiers');

INSERT INTO "level_character" ("level", "exp_req", "level_id") VALUES
    (1, 1, 1),
    (2, 5, 1),
    (3, 13, 1),
    (4, 25, 1),
    (5, 30, 1),
    (6, 35, 1),
    (7, 40, 1),
    (8, 45, 1),
    (9, 50, 1),
    (10, 55, 1);

INSERT INTO "level_job" ("level", "exp_req", "level_id") VALUES
    (1, 1, 2),
    (2, 5, 2),
    (3, 13, 2),
    (4, 25, 2),
    (5, 30, 2),
    (6, 35, 2),
    (7, 40, 2),
    (8, 45, 2),
    (9, 50, 2),
    (10, 55, 2);

INSERT INTO "item_type" ("name", "desc") VALUES
    ('consommable', 'objet utilisable et qui se détruit après consommation'),
    ('ressource', 'objet necessaire à la fabrication de d''autre objet'),
    ('arme', 'augmente les dégats du personnage'),
    ('casque', 'augmente la force du personnage'),
    ('armure', 'augmente l''endurance du personnage'),
    ('bottes', 'augmente la dextérité du personnage');

INSERT INTO "item" ("name", "item_type_id", "img_path") VALUES
    ('fer', 2, 'lien/de/limage'),
    ('bronze', 2, 'lien/de/limage'),
    ('or', 2, 'lien/de/limage'),
    ('cobalte', 2, 'lien/de/limage'),
    ('grenouille', 1, 'lien/de/limage'),
    ('calamar', 1, 'lien/de/limagee'),
    ('carpe dorée', 1, 'lien/de/limage'),
    ('saumon', 1, 'lien/de/limage'),
    ('épée de fer', 3, 'lien/de/limage'),
    ('casque de fer', 4, 'lien/de/limage'),
    ('armure de fer', 5, 'lien/de/limage'),
    ('bottes de fer', 6, 'lien/de/limage'),
    ('épée de bronze', 3, 'lien/de/limage'),
    ('casque de bronze', 4, 'lien/de/limage'),
    ('armure de bronze', 5, 'lien/de/limage'),
    ('bottes de bronze', 6, 'lien/de/limage'),
    ('épée d''or', 3, 'lien/de/limage'),
    ('casque d''or', 4, 'lien/de/limage'),
    ('armure d''or', 5, 'lien/de/limage'),
    ('bottes d''or', 6, 'lien/de/limage'),
    ('épée de cobalte', 3, 'lien/de/limage'),
    ('casque de cobalte', 4, 'lien/de/limage'),
    ('armure de cobalte', 5, 'lien/de/limage'),
    ('bottes de cobalte', 6, 'lien/de/limage');
    
INSERT INTO "craft_plan" ("quantity", "component_id") VALUES
    (1, 1),
    (2, 1),
    (12, 1),
    (10, 1),
    (1, 2),
    (2, 2),
    (12, 2),
    (10, 2),
    (1, 3),
    (2, 3),
    (12, 3),
    (10, 3),
    (1, 4),
    (2, 4),
    (12, 4),
    (10, 4);
    

INSERT INTO "craft_item" ("item_id", "craft_plan_id") VALUES
    (9, 1),
    (10, 2),
    (11, 3),
    (12, 4),
    (13, 5),
    (14, 6),
    (15, 7),
    (16, 8),
    (17, 9),
    (18, 10),
    (19, 11),
    (20, 12),
    (21, 13),
    (22, 14),
    (23, 15),
    (24, 16);

INSERT INTO "item_attribute" ("item_id", "value", "attribute_id") VALUES
    (1, 1, 7),
    (1, 1, 9),
    (2, 5, 7),
    (2, 3, 9),
    (3, 9, 7),
    (3, 6, 9),
    (4, 10, 7),
    (4, 10, 9),
    (5, 1, 7),
    (5, 1, 9),
    (5, 3, 10),
    (6, 5, 7),
    (6, 3, 9),
    (6, 6, 10),
    (7, 9, 7),
    (7, 6, 9),
    (7, 10, 10),
    (8, 10, 7),
    (8, 10, 9),
    (8, 15, 10),
    (9, 1, 7),
    (9, 5, 9),
    (9, 1, 5),
    (9, 2, 6),
    (10, 1, 7),
    (10, 5, 9),
    (10, 1, 2),
    (11, 1, 7),
    (11, 5, 9),
    (11, 1, 1),
    (12, 1, 7),
    (12, 5, 9),
    (12, 1, 3),
    (13, 5, 7),
    (13, 7, 9),
    (13, 5, 5),
    (13, 7, 6),
    (14, 5, 7),
    (14, 7, 9),
    (14, 5, 2),
    (15, 5, 7),
    (15, 7, 9),
    (15, 5, 1),
    (16, 5, 7),
    (16, 7, 9),
    (16, 5, 3),
    (17, 9, 7),
    (17, 10, 9),
    (17, 9, 5),
    (17, 12, 6),
    (18, 9, 7),
    (18, 10, 9),
    (18, 9, 2),
    (19, 9, 7),
    (19, 10, 9),
    (19, 9, 1),
    (20, 9, 7),
    (20, 10, 9),
    (20, 9, 3),
    (21, 10, 7),
    (21, 15, 9),
    (21, 10, 5),
    (21, 15, 6),
    (22, 10, 7),
    (22, 15, 9),
    (22, 10, 2),
    (23, 10, 7),
    (23, 15, 9),
    (23, 10, 1),
    (24, 10, 7),
    (24, 15, 9),
    (24, 10, 3);

INSERT INTO "job" ("name", "desc") VALUES
    ('mineur', 'Permet de récupérer des minerais servant de composant de craft'),
    ('pêcheur', 'Permet de récupérer des poissons servant de consommable pour récupérer de la vie');

INSERT INTO "job_reward" (value, reward_id, job_id) VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (1, 4, 1),
    (1, 5, 2),
    (1, 6, 2),
    (1, 7, 2),
    (1, 8, 2);
    

INSERT INTO "item_reward" ("drop_rate", "reward_id", "item_id") VALUES
    (1, 1, 1),
    (1, 2, 2),
    (1, 3, 3),
    (1, 4, 4),
    (1, 5, 5),
    (1, 6, 6),
    (1, 7, 7),
    (1, 8, 8);

INSERT INTO "entity" ("name", "level", "image_url", "reward_exp", "reward_gold") VALUES
    ("LeMonstreDu01", 1, 'monster1', 3, 50),
    ("LeMonstreDu02", 5, 'monster2', 5, 100),
    ("LeMonstreDu03", 9, 'monster3', 10, 200);

INSERT INTO "entity_attribute" ("value", "attribute_id", "entity_id") VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (5, 1, 2),
    (5, 2, 2),
    (5, 3, 2),
    (9, 1, 3),
    (9, 2, 3),
    (9, 3, 3);

INSERT INTO "entity_reward_item" ("entity_id", "quantity", "item_id", "drop_rate") VALUES
    (1, 5, 1, 1),
    (1, 8, 1, 0.8),
    (1, 1, 13, 0.4);
    (2, 5, 2, 1),
    (2, 8, 2, 0.8),
    (2, 1, 17, 0.4),
    (3, 5, 6, 1),
    (3, 8, 7, 0.8),
    (3, 1, 20, 0.4);


-- INSERT INTO "item_reward" ("drop_rate", "reward_id", "item_id") VALUES
--     (1, 10, 1),
--     (1, 11, 1),
--     (5, 10, 2),
--     (100, 11, 2),
--     (10, 10, 3),
--     (200, 11, 3);
-- WITH inserted_character AS (
--     INSERT INTO "character" (name, "user_id", img_path) VALUES
--         ('Kingzo', 1, '/unlien/dimage')
--         RETURNING id
-- ) 
-- , ins_char_equipement AS ( 
-- 	INSERT INTO "character_equipment" (character_id, equipment_slot_id) VALUES
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		),
-- 		1),
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		),
-- 		2),
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		),
-- 		3),
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		),
-- 		4)
-- )
-- , ins_char_attribute AS (
-- 	INSERT INTO "character_attribute" ("value", "attribute_id", "character_id") VALUES
-- 		(5, 1, 
-- 		 (SELECT id
-- 		 FROM inserted_character
-- 		)),
-- 		(5, 2, 
-- 		 (SELECT id
-- 		 FROM inserted_character
-- 		)),
-- 		(5, 3,
-- 		 (SELECT id
-- 		 FROM inserted_character
-- 		)),
-- 		(5, 4, 
-- 		 (SELECT id
-- 		 FROM inserted_character
-- 		)) 
-- )
-- , ins_char_job AS (
-- 	INSERT INTO "character_job" ("character_id", "job_id") VALUES
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		), 1),
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		), 2)
-- )
-- INSERT INTO inventory ("character_id")
-- 	SELECT id
-- 	FROM inserted_character;