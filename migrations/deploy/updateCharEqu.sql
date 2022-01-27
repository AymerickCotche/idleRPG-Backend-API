-- Deploy idlerpg:updateCharEqu to pg

BEGIN;

CREATE OR REPLACE FUNCTION updateEquipment(id_item INT, id_inventory INT, id_character INT)
	RETURNS void AS
		$$
		INSERT INTO inventory (character_id, item_id) VALUES
			(2, (SELECT character_equipment.item_id FROM character_equipment
		WHERE character_equipment.character_id = id_character
		AND character_equipment.equipment_slot_id = (
			select equipment_slot.id from equipment_slot, item_type, item
				WHERE equipment_slot.name = item_type.name
				AND item.item_type_id = item_type.id
		 		AND item.id = id_item)));
				
		UPDATE "character_equipment"
			SET item_id = id_item
		WHERE character_id = id_character 
		AND equipment_slot_id = (
			select equipment_slot.id from equipment_slot, item_type, item
				WHERE equipment_slot.name = item_type.name
				AND item.item_type_id = item_type.id
				AND item.id = id_item);
				
		DELETE FROM inventory WHERE inventory.id = id_inventory
		
		$$
LANGUAGE sql;

COMMIT;
