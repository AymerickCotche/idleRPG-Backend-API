-- Revert idlerpg:updateCharEqu from pg

BEGIN;

DROP FUNCTION checkEquipment(id_item INT, id_character INT);

DROP FUNCTION equipItem(id_item INT, id_character INT);

DROP FUNCTION getOldItemId(id_item INT, id_character INT);

COMMIT;
