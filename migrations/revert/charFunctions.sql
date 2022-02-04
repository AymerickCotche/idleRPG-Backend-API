-- Revert idlerpg:charFunctions from pg

BEGIN;

DROP FUNCTION getLevelCharacter(id_character INT);

COMMIT;
