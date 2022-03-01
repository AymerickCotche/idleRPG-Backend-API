-- Deploy idlerpg:rebirthCompetence to pg

BEGIN;

CREATE TABLE "competence" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "desc" TEXT NOT NULL,
    "effect" INT NOT NULL,
    "increment_effect" INT NOT NULL,
    "effect_type" TEXT NOT NULL,
    "effect_stat" TEXT NOT NULL,
    "cost" INT NOT NULL,
    "increment_cost" INT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE "character_competence" (
  "character_id" INT NOT NULL REFERENCES "character"(id),
  "competence_id" INT NOT NULL REFERENCES "competence"(id),
  "level" INT NOT NULL DEFAULT 1,
  CONSTRAINT character_competence_pkey PRIMARY KEY (character_id, competence_id)
);

CREATE OR REPLACE FUNCTION learnCompetence(id_character INT, id_competence INT, nb_fruit INT)
	RETURNS void AS $$
		INSERT INTO "character_competence" ("character_id", "competence_id")
		VALUES
			(id_character, id_competence)
		ON CONFLICT (character_id, competence_id) DO UPDATE
		SET "level" = character_competence.level + 1;

		UPDATE "character"
		SET rebirth_fruit = rebirth_fruit - nb_fruit
		WHERE id = id_character
	$$
LANGUAGE sql;

DROP FUNCTION IF EXISTS getCharacter(INT);
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
    nb_rebirth INT,
    rebirth_fruit INT,
		level INT,
		exp_floor INT,
		exp_up INT,
		attributes JSONB,
		equipments JSONB,
		inventory JSONB,
    success JSONB,
		competences JSONB,
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
			char_competence AS
			(SELECT competence.id, competence.name, competence.desc, competence.effect, competence.increment_effect, competence.effect_type, competence.effect_stat, competence.cost, competence.increment_cost, character_competence.character_id, character_competence.level AS level_competence
			 FROM character_competence
			 LEFT JOIN competence ON competence.id = character_competence.competence_id
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
			jsonb_agg(DISTINCT to_jsonb(char_competence) - 'character_id') AS competences,
			jsonb_agg(DISTINCT to_jsonb(char_job) - 'character_id') AS jobs
		FROM character
		LEFT JOIN char_att  ON char_att .character_id = character.id
		LEFT JOIN char_equ ON char_equ.character_id = character.id
		LEFT JOIN char_inv ON char_inv.character_id = character.id
    LEFT JOIN char_success ON char_success.character_id = character.id
		LEFT JOIN char_competence ON char_competence.character_id = character.id
		LEFT JOIN char_job ON char_job.character_id = character.id
		WHERE character.user_id = id_user
		GROUP BY character.id
	$$
LANGUAGE sql;

COMMIT;
