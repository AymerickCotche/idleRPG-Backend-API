-- Revert idlerpg:characterWithAll from pg

BEGIN;

DROP VIEW character_with_all;

COMMIT;
