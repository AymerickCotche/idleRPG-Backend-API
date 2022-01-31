-- Revert idlerpg:inventoryFunctions from pg

BEGIN;

DROP FUNCTION add_inventory(id_character INT, id_item INT, new_quantity INT);

DROP FUNCTION update_inventory(id_character INT, id_item INT, new_quantity INT);

COMMIT;
