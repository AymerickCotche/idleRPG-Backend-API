-- Verify idlerpg:characterWithAll on pg

BEGIN;

SELECT * FROM character_with_all WHERE false;

ROLLBACK;
