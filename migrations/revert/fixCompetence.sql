-- Revert idlerpg:fixCompetence from pg

BEGIN;

ALTER TABLE "competence"
  ALTER COLUMN increment_effect
  TYPE INT;

COMMIT;
