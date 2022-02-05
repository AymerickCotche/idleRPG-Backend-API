-- Revert idlerpg:entityWithAll from pg

BEGIN;

DROP VIEW entity_wit_all;

COMMIT;
