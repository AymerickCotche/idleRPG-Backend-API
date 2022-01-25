INSERT INTO "attribute" ("name", "desc") VALUES
    ('endurance', 'Influe sur la vie'),
    ('force', 'Influe sur les dégats physiques'),
    ('dextérité', 'Influe sur la vitesse d''attaque'),
    ('intelligence', 'Influe sur les dégats magiques'),
    ('degat_min', 'Dégat minimum qu''infligera l''arme'),
    ('degat_max', 'Dégat maximum q''infligera une arme'),
    ('niveau', 'Niveau nécessaire pour intéragir avec l''objet');

INSERT INTO "equipment_slot" ("name") VALUES
    ('tête'),
    ('armure'),
    ('bottes'),
    ('arme');

INSERT INTO "reward" ("name", "desc") VALUES
    ('reward mineur fer', 'NC'),
    ('reward pecheur grenouille', 'NC'),
    ('reward combat objet', 'NC'),
    ('reward combat exp', 'NC'),
    ('reward combat gold', 'NC');

INSERT INTO "level" ("name") VALUES
    ('niveau des personnages'),
    ('niveau des métiers');

INSERT INTO "level_character" ("level", "exp_req", "level_id") VALUES
    (1, 5, 1),
    (2, 10, 1),
    (3, 18, 1),
    (4, 25, 1),
    (5, 30, 1),
    (6, 35, 1),
    (7, 40, 1),
    (8, 45, 1),
    (9, 50, 1),
    (10, 55, 1);

INSERT INTO "level_job" ("level", "exp_req", "level_id") VALUES
    (1, 5, 2),
    (2, 10, 2),
    (3, 18, 2),
    (4, 25, 2),
    (5, 30, 2),
    (6, 35, 2),
    (7, 40, 2),
    (8, 45, 2),
    (9, 50, 2),
    (10, 55, 2);

INSERT INTO "item_type" ("name", "desc") VALUES
    ('poisson', 'objet utilisable et qui se détruit après consommation'),
    ('equipement', 'objet equipable par les personnages'),
    ('minerai', 'objet necessaire à la fabrication de d''autre objet');

INSERT INTO "item" ("name", "item_type_id", "img_path") VALUES
    ('épée de fer', 2, 'un/lien'),
    ('hache de pierre', 2, 'un/lienautre'),
    ('casque d''écaille démonique', 2, 'un/url/haha'),
    ('grenouille', 1, 'un/liendeux'),
    ('calamar', 1, 'untrois/lienautre'),
    ('carpe dorée', 1, 'un/urldepopo/haha'),
    ('fer', 3, 'un/salien'),
    ('bois bleu', 3, 'uns/asda'),
    ('bronze', 3, 'uns/ursasl/haha');

INSERT INTO "craft_plan" ("quantity", "component_id") VALUES
    (3, 7),
    (20, 7),
    (20, 8),
    (15, 9);

INSERT INTO "craft_item" ("item_id", "craft_plan_id") VALUES
    (1, 1),
    (3, 2),
    (3, 3),
    (3, 4);

INSERT INTO "item_attribute" ("item_id", "value", "attribute_id") VALUES
    (1, 5, 5),
    (1, 7, 6),
    (1, 1, 2),
    (1, 5, 7),
    (3, 15, 1),
    (3, 15, 2),
    (3, 15, 3),
    (3, 10, 7),
    (7, 1, 7),
    (9, 5, 7);

INSERT INTO "job" ("name", "desc") VALUES
    ('mineur', 'Permet de récupérer des minerais servant de composant de craft'),
    ('pêcheur', 'Permet de récupérer des poissons servant de consommable pour récupérer de la vie');

INSERT INTO "job_reward" (value, reward_id, job_id) VALUES
    (5, 1, 1),
    (10, 1, 1),
    (5, 2, 2),
    (10, 2, 2);

INSERT INTO "item_reward" ("drop_rate", "reward_id", "item_id") VALUES
    (1, 1, 1),
    (1, 1, 1),
    (1, 2, 2),
    (1, 2, 2);

WITH inserted_character AS (
    INSERT INTO "character" (name, "user_id", img_path) VALUES
        ('Kingzo', 1, '/unlien/dimage')
        RETURNING id
) 
, ins_char_equipement AS ( 
	INSERT INTO "character_equipment" (character_id, equipment_slot_id) VALUES
		((SELECT id
		 FROM inserted_character
		),
		1),
		((SELECT id
		 FROM inserted_character
		),
		2),
		((SELECT id
		 FROM inserted_character
		),
		3),
		((SELECT id
		 FROM inserted_character
		),
		4)
)
, ins_char_attribute AS (
	INSERT INTO "character_attribute" ("value", "attribute_id", "character_id") VALUES
		(5, 1, 
		 (SELECT id
		 FROM inserted_character
		)),
		(5, 2, 
		 (SELECT id
		 FROM inserted_character
		)),
		(5, 3,
		 (SELECT id
		 FROM inserted_character
		)),
		(5, 4, 
		 (SELECT id
		 FROM inserted_character
		)) 
)
, ins_char_job AS (
	INSERT INTO "character_job" ("character_id", "job_id") VALUES
		((SELECT id
		 FROM inserted_character
		), 1),
		((SELECT id
		 FROM inserted_character
		), 2)
)
INSERT INTO inventory ("character_id")
	SELECT id
	FROM inserted_character;