-- Deploy idlerpg:updateCharAtt to pg

BEGIN;

CREATE OR REPLACE FUNCTION updateAttribute(id_attribute INT, id_character INT, quantity INT)
	RETURNS void AS
		$$
		UPDATE "character_attribute" 
			SET value = value + quantity
		WHERE character_attribute.attribute_id = id_attribute AND character_attribute.character_id = id_character;
		
		UPDATE "character_attribute" 
			SET value = value - quantity
		WHERE character_attribute.attribute_id = 8 AND character_attribute.character_id = id_character;
		$$
LANGUAGE sql;

-- CREATE OR REPLACE FUNCTION updateHp(id_character INT, new_hp INT)
-- 	RETURNS void AS
-- 		$$
-- 		UPDATE "character_attribute" 
-- 			SET value = new_hp
-- 		WHERE character_attribute.attribute_id = 11 AND character_attribute.character_id = id_character;
-- 		$$
-- LANGUAGE sql;

COMMIT;
