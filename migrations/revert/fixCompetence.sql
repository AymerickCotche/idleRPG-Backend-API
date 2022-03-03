-- Revert idlerpg:fixCompetence from pg

BEGIN;

ALTER TABLE "competence"
  ALTER COLUMN increment_effect
  TYPE INT;

ALTER TABLE "competence"
  ALTER COLUMN increment_cost
  TYPE INT;

COMMIT;
