-- Revert idlerpg:updateCharAtt from pg

BEGIN;

DROP FUNCTION updateAttribute(id_attribute INT, id_character INT, quantity INT);

COMMIT;
