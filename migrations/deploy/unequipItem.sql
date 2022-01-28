-- Deploy idlerpg:unequipItem to pg

BEGIN;

CREATE OR REPLACE FUNCTION unequipItem(id_item INT, id_character INT)
	RETURNS void AS
		$$
		INSERT INTO inventory (character_id, item_id) VALUES
			(1, (SELECT character_equipment.item_id FROM character_equipment
		WHERE character_equipment.character_id = id_character
		AND character_equipment.equipment_slot_id = (
			select equipment_slot.id from equipment_slot, item_type, item
				WHERE equipment_slot.name = item_type.name
				AND item.item_type_id = item_type.id
		 		AND item.id = id_item)));
				
		UPDATE "character_equipment"
			SET item_id = NULL
		WHERE character_id = id_character
		AND equipment_slot_id = (
			select equipment_slot.id from equipment_slot, item_type, item
				WHERE equipment_slot.name = item_type.name
				AND item.item_type_id = item_type.id
				AND item.id = id_item);
		
		$$
LANGUAGE sql;

COMMIT;
