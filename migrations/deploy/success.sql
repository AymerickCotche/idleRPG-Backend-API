-- Deploy idlerpg:success to pg

BEGIN;

CREATE TABLE "success" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" TEXT NOT NULL UNIQUE,
    "desc" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE "character_success" (
  "character_id" INT NOT NULL REFERENCES "character"(id),
  "success_id" INT NOT NULL REFERENCES "success"(id),
  CONSTRAINT character_success_pkey PRIMARY KEY (character_id, success_id)
);
ALTER TABLE CHARACTER
RENAME COLUMN "last_entity_fought" TO "nb_entity";
ALTER TABLE CHARACTER
ADD COLUMN nb_mineral INT NOT NULL DEFAULT 0,
ADD COLUMN nb_fish INT NOT NULL DEFAULT 0,
ADD COLUMN nb_purchase INT NOT NULL DEFAULT 0,
ADD COLUMN nb_craft INT NOT NULL DEFAULT 0,
ADD COLUMN max_fought INT NOT NULL DEFAULT 0;


DROP FUNCTION getCharacter(INT);
CREATE OR REPLACE FUNCTION getCharacter(id_user INT)
	RETURNS TABLE (
		id INT,
		name TEXT,
		gold INT,
		exp INT,
		nb_entity INT,
		user_id INT,
		img_path TEXT,
		created_at TIMESTAMPTZ,
		updated_at TIMESTAMPTZ,
		nb_mineral INT,
		nb_fish INT,
		nb_purchase INT,
		nb_craft INT,
		max_fought INT,
		level INT,
		exp_floor INT,
		exp_up INT,
		attributes JSONB,
		equipments JSONB,
		inventory JSONB,
    success JSONB,
		jobs JSONB
		)
		AS $$
		WITH char_att AS
			(SELECT character_attribute.id, character_attribute.value, character_attribute.character_id, attribute.name FROM character_attribute
			JOIN attribute ON attribute.id = character_attribute.attribute_id
			),
			char_equ AS
			(WITH item_att AS
				(SELECT item_attribute.id, item_attribute.value, item_attribute.item_id, attribute.name FROM item_attribute
					LEFT JOIN attribute ON attribute.id = item_attribute.attribute_id 
				)
			SELECT character_equipment.id, character_equipment.character_id, equipment_slot.id AS slot_id, equipment_slot.name AS slot_name, character_equipment.item_id, item.name AS item_name, item.desc AS item_desc,
			jsonb_agg(DISTINCT to_jsonb(item_att) - 'item_id') AS attributes
			FROM character_equipment
			LEFT JOIN equipment_slot ON equipment_slot.id = character_equipment.equipment_slot_id
			LEFT JOIN item ON item.id = character_equipment.item_id
			LEFT JOIN item_att  ON item_att.item_id = item.id
			GROUP BY character_equipment.id, equipment_slot.id, item.name, item.desc
			),
			char_inv AS
			(WITH item_att AS
				(SELECT item_attribute.id, item_attribute.value, item_attribute.item_id, attribute.name FROM item_attribute
					JOIN attribute ON attribute.id = item_attribute.attribute_id 
				)
			SELECT inventory.character_id, inventory.item_id, item.name, item.item_type_id AS type_id, item_type.name AS type_name, inventory.quantity, item.desc AS item_desc,
			jsonb_agg(DISTINCT to_jsonb(item_att) - 'item_id') AS attributes
			FROM inventory
			LEFT JOIN item ON item.id = inventory.item_id
			JOIN item_type ON item_type.id = item.item_type_id
			JOIN item_att  ON item_att.item_id = item.id
			GROUP BY inventory.character_id, inventory.item_id, item.name, item.item_type_id, item_type.name, item.desc
			),
      		char_success AS
			(SELECT success.id, success.title, success.desc, character_success.character_id
			 FROM character_success
			 LEFT JOIN success ON success.id = character_success.success_id
			),
			char_job AS
			(SELECT job.id, job.name, character_job.character_id, character_job.exp,
				(select min (level_job.level) AS level
				from level_job
				where level_job.exp_req >= character_job.exp)
			 FROM character_job
			 LEFT JOIN job ON job.id = character_job.job_id
			)
		SELECT character.*,
			(select min (level_character.level) AS level
			from level_character
			where level_character.exp_req >= character.exp),
			(select max (level_character.exp_req) AS exp_floor
			from level_character
			where level_character.exp_req < character.exp),
			(select min (level_character.exp_req) AS exp_up
			from level_character
			where level_character.exp_req >= character.exp),
			jsonb_agg(DISTINCT to_jsonb(char_att) - 'character_id') AS attributes,
			jsonb_agg(DISTINCT to_jsonb(char_equ) - 'character_id') AS equipments,
			jsonb_agg(DISTINCT to_jsonb(char_inv) - 'character_id') AS inventory,
      		jsonb_agg(DISTINCT to_jsonb(char_success) - 'character_id') AS success,
			jsonb_agg(DISTINCT to_jsonb(char_job) - 'character_id') AS jobs
		FROM character
		LEFT JOIN char_att  ON char_att .character_id = character.id
		LEFT JOIN char_equ ON char_equ.character_id = character.id
		LEFT JOIN char_inv ON char_inv.character_id = character.id
    	LEFT JOIN char_success ON char_success.character_id = character.id
		LEFT JOIN char_job ON char_job.character_id = character.id
		WHERE character.user_id = id_user
		GROUP BY character.id
	$$
LANGUAGE sql;

DROP FUNCTION createCharacter(name TEXT, user_id INT, img_path TEXT);

CREATE OR REPLACE FUNCTION createCharacter(name TEXT, user_id INT, img_path TEXT) RETURNS 
	void
AS
$$
	WITH inserted_character AS (
    INSERT INTO "character" ("name", "user_id", "img_path", "gold", "exp", "nb_entity", "nb_mineral", "nb_fish", "nb_purchase", "nb_craft", "max_fought") VALUES
        (name, user_id, img_path, 0, 1, 0, 0, 0, 0, 0, 0)
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
			(0, 1, 
			 (SELECT id
			 FROM inserted_character
			)),
			(0, 2, 
			 (SELECT id
			 FROM inserted_character
			)),
			(0, 3,
			 (SELECT id
			 FROM inserted_character
			)),
			(0, 4, 
			 (SELECT id
			 FROM inserted_character
			)),
			(0, 8, 
			 (SELECT id
			 FROM inserted_character
			)),
			(100, 11, 
			 (SELECT id
			 FROM inserted_character
			))
	)
	INSERT INTO "character_job" ("character_id", "job_id") VALUES
		((SELECT id
			FROM inserted_character
		), 1),
		((SELECT id
			FROM inserted_character
		), 2)
	
$$
LANGUAGE sql;

COMMIT;
