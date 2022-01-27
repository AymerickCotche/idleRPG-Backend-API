-- Deploy idlerpg:functions to pg

BEGIN;

CREATE OR REPLACE FUNCTION createCharacter(name TEXT, user_id INT, img_path TEXT) RETURNS 
	void
AS
$$
	WITH inserted_character AS (
    INSERT INTO "character" (name, "user_id", img_path) VALUES
        (name, user_id, img_path)
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
			)),
			(0, 8, 
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
$$
LANGUAGE sql;


CREATE OR REPLACE FUNCTION getCharacter(id_user INT)
	RETURNS TABLE (
		id INT,
		name TEXT,
		gold INT,
		exp INT,
		user_id INT,
		img_path TEXT,
		created_at TIMESTAMPTZ,
		updated_at TIMESTAMPTZ,
		level INT,
		attributes JSONB,
		equipments JSONB,
		inventory JSONB,
		jobs JSONB
		)
		AS $$
		WITH char_att AS
			(SELECT character_attribute.id, character_attribute.value, character_attribute.character_id, attribute.name FROM character_attribute
			JOIN attribute ON attribute.id = character_attribute.attribute_id
			),
			char_equ AS
			(SELECT character_equipment.id, character_equipment.character_id, equipment_slot.name, character_equipment.item_id AS equipment, item.name AS item_name FROM character_equipment
			JOIN equipment_slot ON equipment_slot.id = character_equipment.equipment_slot_id
			LEFT JOIN item ON item.id = character_equipment.item_id
			),
			char_inv AS
			(SELECT inventory.id, inventory.character_id, inventory.item_id, item.name FROM inventory
			LEFT JOIN item ON item.id = inventory.item_id
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
			jsonb_agg(DISTINCT to_jsonb(char_att) - 'character_id') AS attributes,
			jsonb_agg(DISTINCT to_jsonb(char_equ) - 'character_id') AS equipments,
			jsonb_agg(DISTINCT to_jsonb(char_inv) - 'character_id') AS inventory,
			jsonb_agg(DISTINCT to_jsonb(char_job) - 'character_id') AS jobs
		FROM character
		JOIN char_att  ON char_att .character_id = character.id
		JOIN char_equ ON char_equ.character_id = character.id
		JOIN char_inv ON char_inv.character_id = character.id
		JOIN char_job ON char_job.character_id = character.id
		WHERE character.user_id = id_user
		GROUP BY character.id
	$$
LANGUAGE sql;

COMMIT;
