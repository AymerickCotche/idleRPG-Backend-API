-- Deploy idlerpg:updateCharAtt to pg

BEGIN;

CREATE OR REPLACE FUNCTION updateAttribute(id_attribute INT, id_character INT)
	RETURNS void AS
		$$
		UPDATE "character_attribute" 
			SET value = value + 1
		WHERE character_attribute.attribute_id = id_attribute AND character_attribute.character_id = id_character;
		
		UPDATE "character_attribute" 
			SET value = value - 1
		WHERE character_attribute.attribute_id = 8 AND character_attribute.character_id = id_character;
		$$
LANGUAGE sql;

COMMIT;
