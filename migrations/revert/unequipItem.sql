-- Revert idlerpg:unequipItem from pg

BEGIN;

DROP FUNCTION unequipItem(id_item INT, id_character INT);

COMMIT;
