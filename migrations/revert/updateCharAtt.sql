-- Revert idlerpg:updateCharAtt from pg

BEGIN;

DROP FUNCTION updateAttribute(id_attribute INT, id_character INT, quantity INT);
DROP FUNCTION updateHp(id_character INT, new_hp INT);
DROP FUNCTION augmentHp(id_character INT, plus_hp INT);

COMMIT;
