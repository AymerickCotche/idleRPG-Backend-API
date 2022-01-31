-- Revert idlerpg:entityfunctions from pg

BEGIN;

DROP FUNCTION getAllEntities;

COMMIT;
