-- Deploy idlerpg:inventoryFunctions to pg

BEGIN;

CREATE FUNCTION add_inventory(id_character INT, id_item INT, new_quantity INT) RETURNS inventory AS $$
	INSERT INTO inventory (character_id, item_id, quantity)
	VALUES (
		id_character, id_item, new_quantity
	)
	RETURNING *;
$$ LANGUAGE SQL STRICT;

CREATE FUNCTION update_inventory(id_character INT, id_item INT, new_quantity INT) RETURNS inventory AS $$
	UPDATE inventory SET
		quantity = quantity + new_quantity
	WHERE character_id = id_character AND item_id = id_item
	RETURNING *;
$$ LANGUAGE SQL STRICT;

COMMIT;
