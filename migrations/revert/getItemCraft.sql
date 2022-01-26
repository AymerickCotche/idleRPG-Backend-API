-- Revert idlerpg:get_item_craft from pg

BEGIN;

DROP FUNCTION getItemCraft(id_user INT);


COMMIT;
