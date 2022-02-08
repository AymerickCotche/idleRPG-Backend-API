-- Deploy idlerpg:charFunctions to pg

BEGIN;
CREATE OR REPLACE FUNCTION getLevelCharacter(id_character INT)
	RETURNS TABLE (
		level INT,
		exp_floor INT,
		exp_up INT
	)
		AS $$
			SELECT
				(SELECT min (level_character.level) AS level
					FROM level_character, character
					WHERE level_character.exp_req >= character.exp
						AND character.id = id_character),
				(select max (level_character.exp_req) AS exp_floor
					from level_character, character
					where level_character.exp_req < character.exp
						AND character.id = id_character),
				(select min (level_character.exp_req) AS exp_up
					from level_character, character
					where level_character.exp_req >= character.exp
						AND character.id = id_character);
		$$
LANGUAGE sql;
COMMIT;
