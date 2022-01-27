-- Revert idlerpg:updateCharEqu from pg

BEGIN;

DROP FUNCTION updateEquipment(id_item INT, id_inventory INT, id_character INT);

COMMIT;
