-- Deploy idlerpg:updateCharEqu to pg

BEGIN;

CREATE OR REPLACE FUNCTION checkEquipment(id_item INT, id_character INT)
	RETURNS boolean AS
		$$
		SELECT EXISTS(SELECT 1 FROM character_equipment WHERE item_id IS NOT NULL AND character_id = id_character AND equipment_slot_id = 
			 (
			select equipment_slot.id from equipment_slot, item_type, item
				WHERE equipment_slot.name = item_type.name
				AND item.item_type_id = item_type.id
		 		AND item.id = id_item))
		$$
LANGUAGE sql;

CREATE OR REPLACE FUNCTION equipItem(id_item INT, id_character INT)
	RETURNS void AS
		$$
		UPDATE "character_equipment"
			SET item_id = id_item
		WHERE character_id = id_character 
		AND equipment_slot_id = (
			select equipment_slot.id from equipment_slot, item_type, item
				WHERE equipment_slot.name = item_type.name
				AND item.item_type_id = item_type.id
				AND item.id = id_item);
		
		$$
LANGUAGE sql;

CREATE OR REPLACE FUNCTION getOldItemId(id_item INT, id_character INT)
	RETURNS INT AS
		$$
		SELECT character_equipment.item_id FROM character_equipment
		WHERE character_equipment.character_id = id_character
		 AND character_equipment.equipment_slot_id = (
			select equipment_slot.id from equipment_slot, item_type, item
				WHERE equipment_slot.name = item_type.name
				AND item.item_type_id = item_type.id
		 		AND item.id = id_item)
		
		$$
LANGUAGE sql;


COMMIT;
