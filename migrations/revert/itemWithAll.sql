-- Revert idlerpg:itemWithAll from pg

BEGIN;

DROP VIEW item_with_all;

COMMIT;
