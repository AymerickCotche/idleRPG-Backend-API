-- Deploy idlerpg:createTestCharacter to pg

BEGIN;

CREATE OR REPLACE FUNCTION createTestCharacter(name TEXT, user_id INT, img_path TEXT) RETURNS 
	void
AS
$$
	WITH inserted_character AS (
    INSERT INTO "character" ("name", "user_id", "img_path", "gold", "exp") VALUES
        (name, user_id, img_path, 50, 30)
        RETURNING id
	) 
	, ins_char_equipement AS ( 
		INSERT INTO "character_equipment" (character_id, equipment_slot_id, item_id) VALUES
			((SELECT id
			 FROM inserted_character
			),
			1, 10),
			((SELECT id
			 FROM inserted_character
			),
			2, 11),
			((SELECT id
			 FROM inserted_character
			),
			3, 12),
			((SELECT id
			 FROM inserted_character
			),
			4, 9)
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
			(20, 8, 
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
	INSERT INTO inventory ("character_id", "item_id", "quantity") VALUES
		((SELECT id
		FROM inserted_character
        ), 9, 0),
        ((SELECT id
		FROM inserted_character
        ), 10, 0),
        ((SELECT id
		FROM inserted_character
        ), 11, 0),
        ((SELECT id
		FROM inserted_character
        ), 12, 0),
        ((SELECT id
		FROM inserted_character
        ), 13, 1),
        ((SELECT id
		FROM inserted_character
        ), 14, 1),
        ((SELECT id
		FROM inserted_character
        ), 15, 1),
        ((SELECT id
		FROM inserted_character
        ), 16, 1),
        ((SELECT id
		FROM inserted_character
        ), 1, 10),
        ((SELECT id
		FROM inserted_character
        ), 2, 10),
        ((SELECT id
		FROM inserted_character
        ), 5, 10),
        ((SELECT id
		FROM inserted_character
        ), 6, 10);
$$
LANGUAGE sql;

COMMIT;
