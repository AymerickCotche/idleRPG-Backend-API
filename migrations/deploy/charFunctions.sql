-- Deploy idlerpg:charFunctions to pg

BEGIN;
CREATE OR REPLACE FUNCTION getLevelCharacter(id_character INT)
	RETURNS INT
		AS $$
			SELECT min (level_character.level) AS level
                FROM level_character, character
                WHERE level_character.exp_req >= character.exp
                    AND character.id = id_character;
		$$
LANGUAGE sql;
COMMIT;
